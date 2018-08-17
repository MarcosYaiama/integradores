from flask import render_template, redirect, session, url_for, flash, request
from app import app, db
from models import Usuario
from helpers import nivel_de_acesso
from daoMySQL import UsuarioDao, Analise

mySQL = True
usuario_dao = UsuarioDao(db)
analise = Analise(db)


def protege_rota(pagina:str, arquivos=None):
    ''' 
        Impede que alguem acesse a pagina sem ter o nivel de acesso
        requerido.
    '''
    if(pagina in session['nivel_acesso']):
        return render_template(session['nivel_acesso'][session['nivel_acesso'].index(pagina)], arquivos=arquivos)
    else:
        redirect(url_for('index'))

@app.route('/')
def index():
    '''
    Página inicial:
        Verifica se existe algum usuário logado, caso nao renderiza a pagina de login,
        caso sim, verifica o cargo do usuario e define o nivel de acesso do mesmo,
        renderizando o index para cada tipo de usuario especifico.

        As verificações elifs com pass, estão assim pois ainda não está sendo enviado nenhuma informação 
        do banco para o index do CCO e do Guarda, logo o comportamento padrão é carregar
        somenta o HTML estático para as mesmas , ja que nao foi implementado a interacao
        do index das mesmas com o banco

    '''
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
    '''
        Verifica se o usuario esta registrado no banco, caso sim 
        cria uma nova sessao, atualiza o status do usuario no banco 
        e cria um registro de log para o respectivo usuario
    '''
    nome = request.form['usuario']
    senha = request.form['senha']
    if(mySQL):
        usuario = usuario_dao.buscar_por_id(nome)
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
    '''
        Renderiza a tela de registros de novos usuarios
    '''
    cargos = usuario_dao.cargos()   # Busca os cargos para popular os options
    return render_template('registro.html', cargos = cargos)

@app.route('/autenticar_novo_usuario', methods=['POST',])
def novo_usuario():
    '''
        Verifica se as senhas enviadas via POST correspondem 
        cria um objeto e registra um novo usuario no banco de dados.
    '''
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
    '''
        Renderiza a tela de reprova do CCO
    '''
    return protege_rota('reprovaCCO.html')


@app.route('/formAnalise', methods = ['POST',])
def analise_form():
    '''
        Redireciona para a tela de analise do analista, e preenche a tabela
        com as informacoes retornadas da maquina, alem de gerar os campos a serem 
        preenchidos pelo analista
    '''
    id_carga = request.form['id_carga_fk']
    print(id_carga)
    dados_maquina = analise.busca_por_analise_por_id('id_carga_fk', id_carga, 'analise')  # Nao cumpre bem o proposito
    analise_manual = analise.inicia_analise_manual(id_carga, dados_maquina[3], session['usuario_nome'])
    print(analise_manual)
    # dados_manual = analise.busca_por_id_tabela('id_carga_fk', id_carga, 'analise')
    dados = [dados_maquina, analise_manual]
    return protege_rota('formAnalise.html', dados)


@app.route('/chamados')
def chamado_guarda():
    '''
        Vai para a tela de chamados do guarda
    '''
    return protege_rota('chamadoGuarda.html')


@app.route('/logout')
def logout():
    '''
        Desloga o funcionario
    '''
    usuario_dao.atualiza_status("Offline", session['usuario_logado'])
    usuario_dao.atualiza_log(session['usuario_logado'], 0, session['usuario_cargo'])
    session['usuario_logado'] = None
    session['usuario_nome'] = None
    session['usuario_cargo'] = None
    session['nivel_acesso'] = None
    return redirect(url_for('index'))

@app.route('/controle_func')
def controle_funcionarios():
    '''
        Faz a verificação para ver se o usuarios possui o nivel de acesso
        adequado e busca no banco de dados os logs e os usuarios, 
        e exibe informaçoes de forma organizada para o CCO,
        como os logs, quem está online e qual o cargo dos que estão online.

        Recebe duas listas de objetos de duas tabelas diferentes do banco de dados.
            logs_func e usuarios
    '''
    if(session['usuario_cargo'] == 'CCO'):  #Faz a verificação de nivel de acesso
        usuarios = usuario_dao.listar()
        cargos = usuario_dao.cargos()
        logs = usuario_dao.listar_logs()
        status_dict_cargos = {}    #Armazena os cargos que tem algum usuario online

        for user in usuarios:
            if user.cargo not in status_dict_cargos:
                status_dict_cargos.setdefault(user.cargo, False)   #Seta o valor da chave do cargo como False
            for i in range(len(cargos)):
                if user.cargo == cargos[i] and user.status == "Online":
                    status_dict_cargos[cargos[i]] = True   #Caso o status do usuario esteja online, seta o cargo como True
        print(status_dict_cargos)            
        return render_template('controle_funcionariosCCO.html', usuarios = usuarios, cargos = status_dict_cargos, logs = logs)
    else:
        flash('Não foi possivel acessar essa página')
        return redirect(url_for('index'))

@app.route('/gera_analise')
def gera_analise():
    analise.cria_analise()
    return "<h1>OI</h1>"

