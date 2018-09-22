from flask import render_template, redirect,session, url_for, flash,request, jsonify
from app import app, db
from models import Usuario
from helpers import nivel_de_acesso, envia_pagina_arduino
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

@app.route('/', methods=['POST','GET',])
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
           
            envia_pagina_arduino(
                usuarios=session['usuario_logado'], cargo=session['usuario_cargo'], pagina='Index')
           
            analises = analise.registros_analise()
            nova_analise = analise.registros_analise(estado_fk=1)
            ultimas_analises = analise.analises_finalizadas()
            return render_template(session['nivel_acesso'][0], analises=analises, ultimas_analises=ultimas_analises, nova_analise=nova_analise)
        elif(session['usuario_cargo'] == "CCO"):
            if('decisao_cco' in request.form):
                # AQUI ENTRA OS METODOS DO CCO QUE ALTERAM A DECISAO DO ANALISTA
                print(request.form['decisao_cco'])
                print(request.form['id_carga'])
            chamadas_cco = analise.busca_chamados_cco()
            ultimas_analises = analise.analises_finalizadas()
            return render_template(session['nivel_acesso'][0], ultimas_analises=ultimas_analises, chamadas_cco = chamadas_cco)

        elif(session['usuario_cargo'] == "GUARDA"):
            
            resultado = analise.retorno_guarda(session['usuario_logado'])
            return render_template(session['nivel_acesso'][0], resultados=resultado)
            
            
        return render_template(session['nivel_acesso'][0])

@app.route('/autenticar', methods=['POST',])
def autenticar():
    '''
        Verifica se o usuario esta registrado no banco, caso sim 
        cria uma nova sessao, atualiza o status do usuario no banco 
        e cria um registro de log para o respectivo usuario
    '''
    
    envia_pagina_arduino('Autenticar')
    
    nome = request.form['usuario']
    senha = request.form['senha']
    if(mySQL):
        usuario = usuario_dao.buscar_por_id(nome)
    if usuario:
        if (senha == usuario.senha):
            session['usuario_logado'] = usuario.id
            session['usuario_nome'] = usuario.nome
            session['usuario_cargo'] = usuario.cargo
            session['nivel_acesso'] = nivel_de_acesso(usuario.cargo)
            usuario_dao.atualiza_status("Online", usuario.id)
            usuario_dao.atualiza_log(usuario.id, 1, usuario.cargo)
            return redirect(url_for('index'))
    flash('Não logado')
    return redirect(url_for('index'))
    

@app.route('/registro')
def registro():
    '''
        Renderiza a tela de registros de novos usuarios
    '''
    envia_pagina_arduino(usuarios=session['usuario_logado'],
                         cargo=session['usuario_cargo'], pagina='Registro')
    cargos = usuario_dao.cargos()   # Busca os cargos para popular os options
    return render_template('registro.html', cargos = cargos)

@app.route('/autenticar_novo_usuario', methods=['POST',])
def novo_usuario():
    '''
        Verifica se as senhas enviadas via POST correspondem 
        cria um objeto e registra um novo usuario no banco de dados.
    '''
    envia_pagina_arduino('Autenticação')
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

@app.route('/formCCO', methods=['POST',])
def cco_form():

    print(request.form['id_carga'])
    envia_pagina_arduino(
        usuarios=session['usuario_logado'], cargo=session['usuario_cargo'], pagina='Form CCO')
    dados = []
    dados.append(analise.busca_info_cargas_por_id(request.form['id_carga']))
    dados.append(analise.busca_analise_manual_por_id(request.form['id_carga']))
    dados.append(analise.busca_analise_maquina_por_id(request.form['id_carga']))
    dados.append(analise.caracteristicas_grao_analise(dados[0][0][1]))
    print("TAMANHO==>>",len(dados[1]))
    print("TAMANHO==>>",dados[1])

    return protege_rota('formCCO.html', arquivos = dados)

@app.route('/reprovaCCO', methods=['POST',])
def cco_reprova():
    '''
        Renderiza a tela de reprova do CCO
    '''
    # envia_pagina_arduino(usuarios=session['usuario_logado'],
    #                      cargo=session['usuario_cargo'], pagina='Tela de Reprova CCO')

    dados = []
    dados.append(analise.busca_info_cargas_por_id(request.form['id_carga']))
    dados.append(analise.busca_analise_manual_por_id(request.form['id_carga']))
    dados.append(analise.busca_analise_maquina_por_id(request.form['id_carga']))
    dados.append(usuario_dao.listar("GUARDA", online=True))


    return protege_rota('reprovaCCO.html', arquivos=dados)

#CONTINUAR
@app.route('/formAnalise', methods = ['POST',])
def analise_form():
    '''
        Redireciona para a tela de analise do analista, e preenche a tabela
        com as informacoes retornadas da maquina, alem de gerar os campos a serem 
        preenchidos pelo analista
    '''

    envia_pagina_arduino(usuarios=session['usuario_logado'],
                         cargo=session['usuario_cargo'], pagina='Form Analise')
    
    id_carga = int(request.form['id_carga_fk'])
    dados_maquina = analise.busca_por_analise_por_id('id_carga_fk', id_carga, 'analise')  # Retorna os dados da Tabela Analise com o ID passado
    analise_manual = analise.inicia_analise_manual(dados_maquina[0][0], id_carga, session['usuario_logado'], nova_analise = False if not request.form.get('nova_analise', False) else True)
    # ids_analise_manual = analise.busca_analise_manual_incompleta(id_carga)
    dados = [dados_maquina, analise_manual]
    return protege_rota('formAnalise.html', dados)

@app.route('/enviaAnalise', methods=['POST','GET',])
def verifica_analise():
    '''
        Faz a analise e redireciona para a pagina inicial
        Paginas que redirecionam para cá: formAnalise
    '''
    print(session['usuario_cargo'])
    envia_pagina_arduino(usuarios=session['usuario_logado'],
                         cargo=session['usuario_cargo'], pagina='Verificacao da Analise')
    if(session['usuario_cargo'] == 'CCO'):
        guarda = 0
        if(len(request.form['guarda']) > 1):
            guarda = request.form['guarda']
        analise.decisao_cco(request.form['decisao'],request.form['id_carga'], guarda = guarda, cco = session['usuario_logado'])
    elif(session['usuario_cargo'] == 'ANALISTA DE GRAOS'):
        caracteristicas = analise.caracteristicas_grao_analise(request.form['grao'])
        dados_analisados = {}
        for d in caracteristicas:
        
            print(d)
            print(int(request.form[d[0]]))
        
            dados_analisados[d[0]] = int(request.form[d[0]])
        print(dados_analisados)
        analise.analisar_graos(caracteristicas, dados_analisados, request.form['id_carga'], request.form['redirec'], request.form['grao'])
    else:
        flash('Não foi possivel realizar sua requisição!')

    return redirect(url_for('index'))

@app.route('/chamados', methods=['POST',])
def chamado_guarda():
    '''
        Vai para a tela de chamados do guarda
    '''

    if(request.form['situacao'] == 'Aguardando'):
        print('Entrei')
        analise.atualiza_estado_pedido_guarda(request.form['id'], "Em Andamento")
    
    return protege_rota('chamadoGuarda.html')


@app.route('/logout')
def logout():
    '''
        Desloga o funcionario
    '''
    
    envia_pagina_arduino(
        usuarios=session['usuario_logado'], cargo=session['usuario_cargo'], pagina='Logout')

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

    envia_pagina_arduino(usuarios=session['usuario_logado'],
                         cargo=session['usuario_cargo'], pagina='Controle Funcionarios')

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
        # print(status_dict_cargos)            
        return render_template('controle_funcionariosCCO.html', usuarios = usuarios, cargos = status_dict_cargos, logs = logs)
    else:
        flash('Não foi possivel acessar essa página')
        return redirect(url_for('index'))

@app.route('/gera_analise', methods=['POST','GET'])
def gera_analise():
    
    if(len(request.form)):
        try:
            if(request.form['nova_analise'] == 'True'):
                analise.cria_analise(
                        dados_inseridos = [
                            request.form['id_carga'],
                            request.form['grao'],
                            request.form['umidade'],
                            request.form['temperatura']])
            flash('Pedido de Nova analise enviado com Sucesso!')
        except:
            flash('Erro ao enviar pedido Nova Analise!!!! Gera Analise')
            return redirect(url_for('index'))

    else:
        analise.cria_analise()
        flash('OCR e Analise manual simuladas, criadas com sucesso')

    return redirect(url_for('index'))

#REFATORACAO EM BREVE
@app.route('/resposta_json/<dado>/<int:num>')
def jsonTeste(dado, num):
    '''
        Recebe oque deve ser retornado via GET e retorna um JSON com os dados do banco

        Dado - > Guarda
                    num - > 0 - Todos
                    num - > 1 - Apenas os Online
                    num - > 2 - Os que estão online e visão de disponibilidade a partir da tabela pedido_guarda
        
        Dado - > CCO
                    num - > 0 - Todos
                    num - > 1 - Apenas os Online

        Dado - > Analista
                    num - > 0 - Todos
                    num - > 1 - Apenas os Online
                    num - > 2 - Os que estão online e visão de disponibilidade a partir da tabela pedido_guarda
        
        Dado - > All
                    num - > 0 - Todos
                    num - > 1 - Apenas os Online
    '''
    if('usuario_logado' in session):
        print(dado)
        print(num)
        if(dado == 'guarda'):
            if(int(num) == 1):
                return jsonify(usuario_dao.listar(cargo='guarda', json=True, online=True))
            elif(int(num) == 2):
                ...
            else:
                return jsonify(usuario_dao.listar(cargo='guarda', json=True))
        # return jsonify({'key': [0,1,2,3,4,5]})
    else:
        return redirect(url_for('index'))

@app.route('/mapa_processo')
def mapa_processo():
    '''
        Retorna um Json para o Ajax do JS fazer o mapeamento do processo no desenho
    '''
    return jsonify({'key': [0,1,2,3,4,5]})

@app.route('/acao_guarda', methods=['POST',])
def acao_guarda():
    analise.guarda_finaliza_pedido(request.form['id'],request.form['id_carga'])
    flash(request.form['id'] + request.form['id_carga'])
    
    return redirect(url_for('index'))

