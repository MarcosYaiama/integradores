from flask import render_template, redirect, session, url_for, flash, request
from app import app, db
from models import Usuario
from helpers import busca_usuario_por_nome, nivel_de_acesso
from daoMySQL import UsuarioDao, Analise

mySQL = True
usuario_dao = UsuarioDao(db)
analise = Analise(db)


def protege_rota(pagina, arquivos=None):
    if(pagina in session['nivel_acesso']):
        return render_template(session['nivel_acesso'][session['nivel_acesso'].index(pagina)], arquivos=arquivos)
    else:
        redirect(url_for('index'))

@app.route('/')
def index():
    # session['usuario_logado'] = None
    if 'usuario_logado' not in session or session['usuario_logado'] == None:
        return render_template('login.html')
    else:
        if(session['usuario_cargo'] == "ANALISTA DE GRAOS"):
            analises = analise.registros_maquina()
            return render_template(session['nivel_acesso'][0], analises = analises)
        elif(session['usuario_cargo'] == "CCO"):
            pass
        elif(session['usuario_cargo'] == "GUARDA"):
            pass
            
        return render_template(session['nivel_acesso'][0])

@app.route('/autenticar', methods=['POST',])
def autenticar():
    nome = request.form['usuario']
    senha = request.form['senha']
    if(mySQL):
        usuario = usuario_dao.buscar_por_id(nome)
   #else:
   #    usuario = busca_usuario_por_nome(nome)
    print(usuario.id)
    if usuario:
        # print('Entrei')
        # print(usuario.senha)
        # print(usuario.nome)
        if (senha == usuario.senha):
            print('LOGADO')
            print(usuario.cargo)
            session['usuario_logado'] = usuario.id
            session['usuario_nome'] = usuario.nome
            session['usuario_cargo'] = usuario.cargo
            session['nivel_acesso'] = nivel_de_acesso(usuario.cargo)
            usuario_dao.atualiza_status("Online", usuario.id)
            usuario_dao.atualiza_log(usuario.id, 1, usuario.cargo)
            print(session['nivel_acesso'])
            return redirect(url_for('index'))
    flash('Não logado')
    return redirect(url_for('index'))
    

@app.route('/registro')
def registro():
    cargos = usuario_dao.cargos()
    return render_template('registro.html', cargos = cargos)

@app.route('/autenticar_novo_usuario', methods=['POST',])
def novo_usuario():
    if(request.form['senha'] == request.form['senha_conf']):
        novo_usuario = Usuario(request.form['id'],
                            request.form['senha'],
                            request.form['cargo'],
                            request.form['nome'])
        usuario_dao.novo_usuario(novo_usuario)
        return redirect(url_for('index'))
    else:
        flash('As senhas não correspondem')
        return redirect(url_for('registro'))

@app.route('/formCCO')
def cco_form():
    return protege_rota('formCCO.html')

@app.route('/reprovaCCO')
def cco_reprova():
    return protege_rota('reprovaCCO.html')


@app.route('/formAnalise', methods = ['POST',])
def analise_form():
    id_carga = request.form['id_carga_fk']
    dados_maquina = analise.busca_por_id_tabela('id_carga_fk', id_carga, 'analise')
    analise_manual = analise.inicia_analise_manual(id_carga, dados_maquina[3], session['usuario_nome'])
    print(analise_manual)
    # dados_manual = analise.busca_por_id_tabela('id_carga_fk', id_carga, 'analise')
    dados = [dados_maquina, analise_manual]
    return protege_rota('formAnalise.html', dados)


@app.route('/chamados')
def chamado_guarda():
    return protege_rota('chamadoGuarda.html')


@app.route('/logout')
def logout():
    usuario_dao.atualiza_status("Offline", session['usuario_logado'])
    usuario_dao.atualiza_log(session['usuario_logado'], 0, session['usuario_cargo'])
    session['usuario_logado'] = None
    session['usuario_nome'] = None
    session['usuario_cargo'] = None
    session['nivel_acesso'] = None
    return redirect(url_for('index'))

@app.route('/controle_func')
def controle_funcionarios():
    if(session['usuario_cargo'] == 'CCO'):
        usuarios = usuario_dao.listar()
        cargos = usuario_dao.cargos()
        logs = usuario_dao.listar_logs()
        dict_cargos = {}

        for user in usuarios:
            if user.cargo not in dict_cargos:
                dict_cargos.setdefault(user.cargo, False)
            for i in range(len(cargos)):
                if user.cargo == cargos[i] and user.status == "Online":
                    dict_cargos[cargos[i]] = True
        print(dict_cargos)            
        return render_template('controle_funcionariosCCO.html', usuarios = usuarios, cargos = dict_cargos, logs = logs[:6])
    else:
        flash('Não foi possivel acessar essa página')
        return redirect(url_for('index'))

@app.route('/gera_analise')
def gera_analise():
    analise.cria_analise()
    return "<h1>OI</h1>"

