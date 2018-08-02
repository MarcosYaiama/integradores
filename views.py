from flask import render_template, redirect, session, url_for, flash, request
from app import app, db
from models import Usuario
from helpers import busca_usuario_por_nome, nivel_de_acesso
from daoMySQL import UsuarioDao

mySQL = True
usuario_dao = UsuarioDao(db)


def protege_rota(pagina):
    if(pagina in session['nivel_acesso']):
        return render_template(session['nivel_acesso'][session['nivel_acesso'].index(pagina)])
    else:
        redirect(url_for('index'))

@app.route('/')
def index():
    # session['usuario_logado'] = None
    if 'usuario_logado' not in session or session['usuario_logado'] == None:
        return render_template('login.html')
    else:
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
        print('Entrei')
        print(usuario.senha)
        print(usuario.nome_completo)
        if (senha == usuario.senha):
            print('LOGADO')
            print(usuario.cargo)
            session['usuario_logado'] = usuario.id
            session['usuario_nome'] = usuario.nome_completo
            session['usuario_cargo'] = usuario.cargo
            session['nivel_acesso'] = nivel_de_acesso(usuario.cargo)
            print(session['nivel_acesso'])
            return redirect(url_for('index'))
    flash('Não logado')
    return redirect(url_for('index'))
    
@app.route('/formCCO')
def cco_form():
    return protege_rota('formCCO.html')

@app.route('/reprovaCCO')
def cco_reprova():
    return protege_rota('reprovaCCO.html')


@app.route('/formAnalise')
def analise_form():
    return protege_rota('formAnalise.html')


@app.route('/chamados')
def chamado_guarda():
    return protege_rota('chamadoGuarda.html')


@app.route('/logout')
def logout():
    session['usuario_logado'] = None
    session['usuario_nome'] = None
    session['usuario_cargo'] = None
    session['nivel_acesso'] = None
    return redirect(url_for('index'))
