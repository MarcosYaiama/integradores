from flask_mysqldb import MySQL
from models import Usuario, Cargo, Logs
from datetime import datetime
from time import sleep
from random import randint
from pprint import pprint


class UsuarioDao:
    '''
        Abstrai toda a relacao de usuarios com o banco de dados
    '''
    def __init__(self, db):
        '''
            Recebe o objeto do banco de dados e permite
            que o mesmo interaja com os métodos da classe.
        '''
        self.__db = db
        
    def buscar_por_id(self, id:str) -> object:
        '''
            Verifica no banco se existe algum usuario com o nome recebido.
            Caso sim retorna um objeto Usuario que preenchera alguns atributos
             session, caso não retorna None
            Essa função é usada verificar se o Usuario está existe no banco
            na tela de registros de novos funcionarios na interface do CCO
            Arquivo HTML: registro.html
            View: /registro

                Tabela : usuarios
                Colunas: id
                Dado: str
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from usuarios where id = %s', (id,))
        dados = cursor.fetchone()
        usuario = traduz_usuario(dados) if dados else None
        # print(usuario)
        return usuario

    def listar(self,cargo:str = None, json:bool = False, online:bool = False, disponibilidade:bool = False) -> list:
        '''
            Retorna em uma lista com todos os usuarios do banco. 
            Essa função é usada para listar os usuarios e seu Status no
            controle de usuarios do CCO
            Arquivo HTML: controle_funcionariosCCO.html
            View: /controle_func

                Tabela : usuarios
                Colunas: *
        '''
        query = 'SELECT * from usuarios'
        if(cargo):
            if(cargo.lower == 'cco'):
                query += ' where cargo = "cco"' 
            elif(cargo.lower == 'analista'):
                query += ' where cargo = "analista"' 
            else:
                query += ' where cargo = "guarda"'
        if(online):
            query += ' and status_atual="Online"' 
        
        cursor = self.__db.connection.cursor()
        cursor.execute(query)
        usuarios = traduz_user(cursor.fetchall())   #Transforma a tupla de tuplas em uma lista de objetos   
        # print(type(usuarios))
        if(json):

            dicionario_resposta = []
            for user in usuarios:
                # print(user.nome)
                if(disponibilidade):
                    ...
                else:
                    dicionario_resposta.append({'id':user.id,
                                            'cargo':user.cargo,
                                            'nome': user.nome,
                                            'status':user.status})
            return dicionario_resposta        
        return usuarios

    def listar_logs(self) -> list:
        '''
            Retorna em uma lista com todos os logs registrados de usuarios do banco.
            Essa função é usada para listar os logs no controle de usuarios do CCO.
            Arquivo HTML: controle_funcionariosCCO.html
            View: /controle_func

                Tabela : logs_func
                Colunas: *
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from logs_func order by id desc LIMIT 6')  #Seleciona as 6 ultimas colunas
        logs = traduz_logs(cursor.fetchall())   #Transforma a tupla de tuplas em uma lista de objetos
        # print(logs[0].id_usuario)
        return logs

    def novo_usuario(self, usuario:object) -> None:
        '''
            Registra um novo usuario no banco de dados
            View: /autenticar_novo_usuario

                Tabela : usuarios
                Colunas: id, nome_completo, senha, cargo
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('INSERT into usuarios(id, nome_completo, senha, cargo) values (%s, %s, %s, %s)', (usuario.id,
                                          usuario.nome, 
                                          usuario.senha, 
                                          usuario.cargo))

        #self.__db.connect.commit()     #MALDITO ERRO, JAMAIS TE ESQUECEREI!
        self.__db.connection.commit()

    def cargos(self) -> list:
        '''
            Retorna uma lista com todos os cargos.
            Essa função é usada para preencher os options na tela de 
            registros de novos funcionarios na interface do CCO e tambem
            para fazer verificacoes no controle do funcionario do CCO
            Arquivo HTML: registro.html
            View: /registro , /controle_func
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from cargos')
        cargos_bd = cursor.fetchall()
        cargos = []
        for i in cargos_bd:
            cargos.append(i[0])
        # print(cargos)
        return cargos


    def atualiza_status(self, estado:str, id:str) -> None:
        '''
            Atualiza o status do Funcionario.
            Interage com o banco de dados:

                Tabela : usuario
                Coluna: status_atual
                Alterar para bool-->  Dado str: Offline ou Online

                Views: /autenticar e /logout
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('UPDATE usuarios set status_atual=%s where id=%s', (estado,
                                                     id))
        self.__db.connection.commit()

    def atualiza_log(self, id_usuario:str, status:bool, cargo:str) -> None:
        '''
            Registra os logs do Funcionario, tornando possivel saber o horario, data
            de entrada e saida do sistema
            Interage com o banco de dados:

                Tabela : logs_func
                Colunas: id_usuario, Status, hora, data, cargo
                Dado: str e bool

                Views: /autenticar e /logout
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('INSERT into logs_func(id_usuario, Status, hora, data, cargo) values (%s, %s, %s, %s, %s)',
                                                 (id_usuario,
                                                  status,
                                                  '{}:{}:{}'.format(
                                                      datetime.now().hour, datetime.now().minute, datetime.now().second),
                                                  str(datetime.now().date()),
                                                  cargo))
        self.__db.connection.commit()

def traduz_user(usuarios:tuple) -> list:
    '''
        Recebe uma tupla do banco de dados e retorna uma lista de
        objetos.
    '''
    def cria_user_com_tupla(tupla):
        return Usuario(tupla[0], tupla[1], tupla[2],tupla[3], tupla[4])
    return list(map(cria_user_com_tupla, usuarios))

def traduz_logs(logs:tuple) -> list:
    '''
        Recebe uma tupla do banco de dados e retorna uma lista de
        objetos.
    '''
    def cria_user_com_tupla(tupla):
        return Logs(tupla[1], tupla[2], tupla[3],tupla[4], tupla[5])
    return list(map(cria_user_com_tupla, logs))

def traduz_usuario(tupla:tuple) -> object:
    '''
        Recebe uma tupla do banco de dados e retorna um objeto Usuario
    '''
    return Usuario(tupla[0], tupla[1], tupla[2], tupla[3], tupla[4])






class Analise():
    '''
        Abstrai toda a relacao com as analises do banco de dados
    '''
    def __init__(self, db):
        '''
            Recebe o objeto do banco de dados e permite
            que o mesmo interaja com os métodos da classe.
        '''
        self.__db = db

    #POSSIVEL REFATORACAO
    def __busca(self, tabela:str, composta=False) -> list:
        '''
            Método interno da classe e usado por métodos do próprio objeto.
            Extrai dados de tabelas inteiras e os retorna em listas compostas ou simples 
        
            Metodos da classe utilizando:
                sorteia, insere_info_cargas, busca_info_cargas_sem_analise
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from ' + tabela)
        resultado_bd = cursor.fetchall()
        # print('RESULTADO BD: {}'.format(resultado_bd))

        if composta:
            resultado = []
            for i in resultado_bd:
                lista = []
                for itens in i:
                    lista.append(str(itens))
                resultado.append(lista)
            # print('RESULTADO : {}'.format(resultado))
            return resultado

        else:
            resultado = []
            for i in resultado_bd:
                resultado.append(i[0])
            # print('RESULTADO : {}'.format(resultado))
            return resultado
    
    #CONTINUAR
    #Feita para ser usada somente na Analise Form
    def busca_por_analise_por_id(self, coluna:str, valor:int, tabela:str) -> list:
        '''
            Retorna os dados da tabela analise referente ao id_carga_fk especifico,
            esses dados dessa tabela referentes a analise foram preenchidos automaticamente.

            View: /formAnalise
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT grao_fk,umidade,temperatura,hora_fim_analise_m,data from {} where {} = {}'.format(
            tabela, coluna, valor))
        dado = cursor.fetchall()
        # print(dado)
        return dado

    def sorteia(self) -> dict:
        '''
            Retorna um dicionario com valores que sao escolhidos de forma aleatoria 
            baseado em valores pre-definidos para depois serem inseridos atraves de 
            outro metodo na tabela info_cargas;
            
            Simula o OCR e o preenchimento de dados referentes a carga que seriam em teoria 
            preenchidos aleatoriamente.

            Metodos da classe utilizando: cria_analise
              
        '''
        destinos = ["Guaruja", "Santos", "São Vicente","São Paulo", "Japão", "Taiwan"]
        fornecedores = ["MM Grãos", "Granolandia", "Fazenda dos Grãos","Fazendeiros Tabajara", "Moinho Paulista"]
        graos = self.__busca("graos")
        # estados = self.__busca("estado_analise")
        letras = ["JAN", 'SWA', "SKL", "ASD", "AOS", "FOA", "FWH", "EJN", "0WA",
                  "YQ8", "RSA", "SQI", "OSJ", "IQG", "DFI", "JUI", "NWE", "RSD", "FYM", "OIJ"]
        umidade = randint(0,10)
        temperatura = randint(10,22)
        return {'destino' : destinos[randint(0, len(destinos) - 1)],
                'fornecedor' : fornecedores[randint(0, len(fornecedores) - 1)],
                'grao' : graos[randint(0, len(graos) - 1)],
                'estado': 'Analista',
                'resultado': 'Indisponivel',
                'umidade': str(umidade),
                'temperatura': str(temperatura),
                'placa': "{}-{}".format(letras[randint(0,len(letras)-1)],randint(1000, 9999))}

    def insere_info_cargas(self, grao:str, fornecedor:str, destino:str, placa:str):
        '''
            Insere dados na tabela info_cargas

            Métodos internos da classe utilizando: cria_analise

        '''
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour, datetime.now().minute, datetime.now().second)
        cursor.execute("INSERT into info_cargas(grao, fornecedor, destino, placa, data_chegada, hora_chegada) values (%s, %s, %s, %s, %s, %s)", 
                                               (grao,
                                                fornecedor,
                                                destino,
                                                placa,
                                                datetime.now().date(),
                                                hora))
        self.__db.connection.commit()
        # id_carga = self.__busca("info_cargas")
        # return id_carga[-1]

        #BUSCAR O ID DO PEDIDO DE ANALISE INSERIDO PARA RETORNAR O MESMO PARA SER INSERIDO NA
        #FUNÇÃO insere_analise_maquina

    def insere_analise_maquina(self, id_carga_fk:int, umidade:int, temperatura:int, grao_fk:str, estado_fk:str, resultado:str):
        '''
            Insere os dados do dicionario gerado pelo metodo sorteia na tabela analise.
            Simulando assim os dados jogados pela maquina .

            Metodos internos da classe usando: cria_analise
        '''
        
        cursor = self.__db.connection.cursor()
        tempo_inicio = [datetime.now().hour, datetime.now().minute, datetime.now().second]
        sleep(1)
        cursor.execute("INSERT into analise(id_carga_fk, umidade, temperatura, grao_fk,data,hora_fim_analise_m) values (%s, %s, %s, %s, %s, %s)",
                                          (id_carga_fk,
                                           umidade,
                                           temperatura,
                                           grao_fk,
                                           str(datetime.now().date()),
                                           '{}:{}:{}'.format(tempo_inicio[0], tempo_inicio[1], tempo_inicio[2]),
                                           ))

        self.__db.connection.commit()

    def busca_info_cargas_sem_analise(self):
        '''
            Pega os dados das tabelas info_cargas e analise, e retorna uma lista com os itens
            da tabela info_cargas que nao possuem uma analise

            Tabelas: info_cargas, analise
            Colunas: *

            Metodos internos da classe utilizando: cria_analise
        '''
        registros_info_carga = self.__busca("info_cargas",composta=True)
        registros_analise = self.__busca('analise', composta=True)
        

        lista_itens_nao_existentes = []
        for item in registros_info_carga:
            lista_itens_nao_existentes.append(item)
            # dados = self.sorteia()
            # print('Item : {}'.format(item))
            for registros in registros_analise:
                # print('Registros : {}'.format(registros[0]))
                # print('{} : {}'.format(item[0], registros[0]))
                # print(item[0] in registros[0])
                if(item[0] in registros[0]):    #Verifica se o primeiro item(id de Info_cargas) existe no primeiro
                                                # item(id_carga_fk de analsie)
                    lista_itens_nao_existentes.remove(item)
                    break
        # print(lista_itens_nao_existentes)
        return lista_itens_nao_existentes

            # if(item[0] not in registros_analise[0]):
                # self.insere_analise_maquina(item[0], dados['umidade'], dados['temperatura'], dados['grao'], dados['estado'], dados['resultado'] )
    

    def cria_analise(self):
        '''
            Pega os dados do dicionario passado pelo metodo sorteia e os insere na tabela info_cargas.
            Depois busca todas as colunas de info_cargas que nao possuem analise e cria um registro para
            cada uma delas na tabela analise

            Tabelas info_cargas, analise

            View: /gera_analise

        '''
        dados = self.sorteia()
        self.insere_info_cargas(dados['grao'], dados['fornecedor'], dados['destino'], dados['placa'])
        resultado_busca = self.busca_info_cargas_sem_analise()
        # print('Cria analise')
        # print(resultado_busca)
        self.insere_analise_maquina(resultado_busca[0][0], dados['umidade'], dados['temperatura'], dados['grao'], dados['estado'], dados['resultado'])
        self.__atualiza_status_analise_info_cargas(
            "Maquina", resultado_busca[0][0])

    def registros_maquina(self) -> dict:
        '''
            Busca todos os registros na tabela info_cargas que tenham o estado_fk = Maquina.
            Caso tenha, retorna apenas o grao e o id_carga de cada item em uma tupla de tuplas.

            Caso exista esses dados sao exibidos para o analista no seu index, caso nao
            a tabela referente ao retorno da maquina de analise nao e exibida

            View: /
            Arquivo HTML: indexAnalise.html
            Tabela: analise

        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT id_carga, grao,estado_fk from info_cargas where estado_fk = "Maquina" or estado_fk = "Analista"')
        resultados = cursor.fetchall()
        return resultados

    #CONTINUAR
    def inicia_analise_manual(self, grao:str, id_carga:int, analista:str) -> bool:
        '''
        É chamada sempre que o analista clica em iniciar analise em algum retorno da maquina que
        aparece no index. Essa função registra a hora em que o Analista deu esse clique e cria
        na tabela analise do GRAO uma linha, apenas com os valores que não precisam ser passado pelo
        analista, os outros valores referentes são jogados no formulario na pagina formAnalise.html
        para ficar a cargo do analista preencher.
        '''
        consulta = self.__verifica_se_existe_analise_manual_da_carga(id_carga)
        colunas = self.__busca_colunas_analise_grao(grao)
        # print("CONSULTA")
        # print(consulta)
        if(not consulta):
            self.__inicia_analise_manual_bd(analista, id_carga, grao)
            self.__atualiza_status_analise_info_cargas("Analista", id_carga)
            # consulta = self.__busca_dados_analise_grao(grao, id_carga, colunas)
        return colunas

    #CONTINUAR
    def __atualiza_status_analise_info_cargas(self,estado:str, id_carga:int):
        '''
        Atualiza o valor da coluna estado_fk da tabela info_cargas
        Essa coluna diz se a analise já está em andamento ou não.

        Esse valor é responsavel por alterar a cor do botão no IndexAnalise.html
        '''
        cursor = self.__db.connection.cursor()
        # print('update info_cargas set estado_fk={} where id_carga = {}'.format(
            # estado, id_carga))
        cursor.execute('update info_cargas set estado_fk="{}" where id_carga = {}'.format(
            estado, id_carga))
        self.__db.connection.commit()

    def __verifica_analise_manual_mesmos_id(self, id_carga:int) -> int:
        '''
            Retorna o número de analises com o id_carga existentes na tabela analise_manual.
        
            Métodos usando: __inicia_analise_manual_bd
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from analise_manual where id={}'.format(id_carga))
        resultado = cursor.fetchall()
        self.__db.connection.commit()
        if(resultado):
            # print(len(resultado))
            return len(resultado)
        else:
            return 0

    #CONTINUAR
    def __inicia_analise_manual_bd(self, analista:str, id_carga:int, grao:str):
        '''
        Cria uma linha no banco de dados que será usada para a analise, inserindo a data atual, horario atual, analista
        E deixa como NULL os valores que serão preenchidos pelo analista no form e a hora_termino que será inserida
        quando o analista clicar em enviar.
        '''
        n_analises = self.__verifica_analise_manual_mesmos_id(id_carga)
        carac_graos = self.__retorna_carac_graos(grao)
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour,
                                    datetime.now().minute,
                                    datetime.now().second)
        data = str(datetime.now().date())
        for dado in carac_graos:
            cursor.execute('INSERT INTO analise_manual(analista, dado_analisado, hora_inicio_a, data, n_analise,id_carga_fk) values (%s,%s,%s,%s,%s,%s)',
            (analista,dado,hora,data,(n_analises),id_carga))
        self.__db.connection.commit()
    

    #CONTINUAR
    def __verifica_se_existe_analise_manual_da_carga(self, id_carga:int):
        '''
        Verifica se o id_carga tem alguma analise iniciada que não foi terminada.

        Esse true ou False retornado pelo método, serve para saber se é preciso criar
        uma nova analise na tabela analise_manual.

        Métodos usando: inicia_analise_manual
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from analise_manual where id_carga_fk = "{}" and irregular is NULL'.format(id_carga))

        retorno_bd = cursor.fetchall()
        # print(retorno_bd)
        if(retorno_bd):
            return True
        else:
            return False
        
    def __busca_colunas_analise_grao(self, grao:str):
        '''
        Retorna todas as tabelas em uma tupla de tuplas com o nome e grao.
        Esse valor é usado para fazer os campos que o usuario tem que preencher.

        Métodos usando : inicia_analise_manual
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT nome, grao_fk from carac_graos where grao_fk = "{}" order by nome'.format(grao))

        retorno_bd = cursor.fetchall()
        # print(retorno_bd)
        if(retorno_bd):
            return retorno_bd
        else:
            return False

    def __retorna_carac_graos(self, grao):
        '''
            Temporaria, apenas para retornar todas as caracteristicas do grao,
            para ser executado um for para criar uma linha para cada caracteristica na
            tabela analise.

            Metodos usando: __inicia_analise_manual_bd
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute("SELECT nome from carac_graos where grao_fk = '{}'".format(grao))
        retorno_bd = cursor.fetchall()
        return retorno_bd

    def finaliza_analise_manual(self):
        pass
    
    def caracteristicas_grao_analise(self,grao:str) -> tuple:
        '''
            Retorna todas as caracteristicas do grao junto com os dados para que o
            software verifique se o mesmo esta irregular ou nao
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT nome ,taxa_minima, total from carac_graos where grao_fk="{}" order by nome'.format(grao))
        retorno_bd = cursor.fetchall()
        return retorno_bd

    #ESTA DESPREZANDO UMIDADE E TEMPERATURA
    def analisar_graos(self, caracteristicas: tuple, dados_analisados:dict, id_carga:int, redir:str, grao:str):
        '''
            Analisa os graos, publica os dados na tabela ultimas analises, atualiza
            o estado de acordo com o resultado;

            Tabelas: analise_manual, info_cargas, log_analise,

            Views: /enviaAnalise
        '''
        total_permitido, total_analisado = 0, 0
        ids_analise = self.__busca_ids_analise_manual_incompleta(id_carga)
        indice = 0
        for c in caracteristicas:
            irregular = False
            #c[0] - Nome caracteristica direto do banco
            #c[1] - Valor maximo permitido direto do banco
            #request.form[c[0]] - A caracteristica sendo pega do request
            valor_analisado = dados_analisados[c[0]]
            maximo_permitido = int(c[1])
            total_analisado += valor_analisado          # Soma todos os valores analisados
            total_permitido = int(c[2])                 #Total é pego do banco e se refere a soma de todos
            
            # print('Carac: {}  Maximo: {}  de um Total:{}  Resposta: {}'.format(
            #     c[0],
            #     maximo_permitido,
            #     total_permitido,
            #     valor_analisado))
            if(not(maximo_permitido <= valor_analisado)):    #CCO é para quando o CCO mudar a decisão do Analista
                #BLOCO ONDE SERA INSERIDO NO BANCO OS DADOS DOS CARAC QUE ESTAO OK
                print('Regular'.format(c[0]))
            else:
                irregular = True
                print('Irregular'.format(c[0]))
            self.__posta_resultado_analise_manual(
                ids_analise[indice][0], id_carga, irregular, redir, valor_analisado)
            indice += 1
                #BLOCO ONDE SERA INSERIDO NO BANCO OS DADOS DAS CARAC QUE N ESTAO OK
        estado = ''
        irregular = False
        if(total_analisado >= total_permitido):
            # print("Total analisado: {}".format(total_analisado))
            # print("Irregular")
            irregular = True
            estado = 'CCO'
            #encaminha cco

            self.__atualiza_status_analise_info_cargas("CCO", id_carga)
        else:
            #aprovado
            
            self.__atualiza_status_analise_info_cargas("Finalizado", id_carga)
            self.__posta_resultado_final_info_cargas(id_carga, "Aprovado")

            estado = 'Finalizado'
        #Postagem da analise na tabela log_analise
        if(not irregular):
            self.__posta_log_analise(estado, id_carga, grao, n_analises=1 ,decisao_final = 'Analista', resultado='Aprovado', guarda=0)


    def __posta_resultado_analise_manual(self, id_analise:int, id_carga:int, irregular:bool, redir:str, valor_dado_analisado:int):
        '''
            Posta os dados relativos ao termino da analise e seus resultados.

            Tabelas: analise_manual

            Metodos usando: analisar_graos
        '''
        
        cursor = self.__db.connection.cursor()
        hora_termino = '{}:{}:{}'.format(datetime.now().hour,
                                         datetime.now().minute,
                                         datetime.now().second)
        cursor.execute('UPDATE analise_manual set irregular = %s, hora_termino_a = %s, redirecionamento = %s, analise = %s where id_carga_fk = %s and id = %s',
        (irregular,hora_termino, redir, valor_dado_analisado, id_carga, id_analise))
        self.__db.connection.commit()

    def __posta_resultado_final_info_cargas(self, id_carga:int, resultado:str):
        '''
            Atualiza a linha referente à analise da tabela quando a analise for finalizada.

            Tabelas: info_cargas

            Metodos usando: analisar_graos
        '''
        cursor = self.__db.connection.cursor()
        hora_termino = '{}:{}:{}'.format(datetime.now().hour,
                                         datetime.now().minute,
                                         datetime.now().second)
        cursor.execute('UPDATE info_cargas set resultado_analise = "{}", hora_termino = "{}"  where id_carga = {}'.format(
            resultado, hora_termino, id_carga))
        self.__db.connection.commit()

    def __busca_ids_analise_manual_incompleta(self, id_carga:int)->tuple:
        ''''
            Retorna do banco de dados todas os ID's das analises manuais incompletas.

            Metodos usando: 

            Tabelas: analisar_graos
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT id from analise_manual where id_carga_fk = {} and irregular is NULL order by dado_analisado'.format(id_carga))
        return cursor.fetchall()

    def __posta_log_analise(self, estado:str, id_carga:int, grao:str, n_analises:int = 0, decisao_final:str = "NULL", guarda:str = None, resultado:str = "NULL"):
        '''
            Posta o log da analise, para depois ser exibido na interface.

            Tabelas: log_analise
            Metodos usando: analisar_graos
        '''
        # print('INSERT INTO log_analise(n_analises, decisao_final, guarda, resultado,estado, id_carga_fk, grao) values ({}, "{}", "{}", "{}", "{}", {}, "{}")'.format(n_analises, decisao_final, guarda, resultado, estado, id_carga, grao))
        cursor = self.__db.connection.cursor()
        cursor.execute('INSERT INTO log_analise(n_analises, decisao_final, guarda, resultado,estado, id_carga_fk, grao) values ({}, "{}", "{}", "{}", "{}", {}, "{}")'.format(n_analises, decisao_final, guarda, resultado, estado, id_carga, grao))
        self.__db.connection.commit()

    def analises_finalizadas(self):
        '''
            Retorna todas as analises que tem o status Finalizada

            Views: /    
            Acesso: CCO e Analista

            Tabelas: log_analise
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from log_analise where estado = "Finalizado"')
        resultado = cursor.fetchall()
        return resultado

    def busca_chamados_cco(self):
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from info_cargas where estado_fk = "CCO"')
        return cursor.fetchall()

    def busca_info_cargas_por_id(self, id_carga:int):
        '''
            Busca todos os registro de info_cargas com o id_carga e retorna uma tupla com os resultados

            Tabelas: info_cargas
            Métodos usando: retorno_guarda
            Views Usando : /reprovaCCO
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from info_cargas where id_carga = {}'.format(id_carga))
        return cursor.fetchall()

    def busca_analise_manual_por_id(self, id_carga):
        cursor = self.__db.connection.cursor()
        cursor.execute(
            'SELECT * from analise_manual where id_carga_fk = {} order by dado_analisado'.format(id_carga))
        return cursor.fetchall()

    def busca_analise_maquina_por_id(self, id_carga):
        cursor = self.__db.connection.cursor()
        # print('SELECT * from analise_manual where id_carga_fk = {}'.format(id_carga))
        cursor.execute(
            'SELECT * from analise where id_carga_fk = {}'.format(id_carga))
        return cursor.fetchall()

    def __busca_grao_por_id_carga(self, id_carga):
        '''
            Recebe um id_carga e retorna o grao da tabela info_cargas, respectivo ao id inserido.

            Tabelas: info_cargas
            Métodos usando: decisao_cco
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT grao from info_cargas where id_carga = {}'.format(id_carga))
        return cursor.fetchall()[0][0]

    def cco_decisao_info_cargas_reprovado(self, id_carga):
            # Mudar o Resultado para reprovado info_cargas
            # Mudar o estado_fk para Guarda info_cargas
            # Coloca o horario termino para a carga no info_cargas
            cursor = self.__db.connection.cursor()
            hora_termino = '{}:{}:{}'.format(datetime.now().hour,
                                             datetime.now().minute,
                                             datetime.now().second)
            # print('UPDATE info_cargas set resultado_analise = "Reprovado", estado_fk = "Guarda", hora_termino="{}" where id_carga = {}'.format(
            #     hora_termino,id_carga))
            cursor.execute(
                'UPDATE info_cargas set resultado_analise = "Reprovado", estado_fk = "Guarda", hora_termino="{}" where id_carga = {}'.format(
                    hora_termino,id_carga))
            cursor.connection.commit()

    def decisao_cco(self, decisao:str,id_carga:int, guarda:str = None, cco:str = None):
        if(decisao == 'reprovado'):
            # Mudar o Resultado para reprovado info_cargas
            # Mudar o estado_fk para Guarda info_cargas
            # Coloca o horario termino para a carga no info_cargas
            self.cco_decisao_info_cargas_reprovado(id_carga)

            # Verifica quantas analises finalizadas tem no analise_manual
            n_analises = self.__verifica_analise_manual_mesmos_id(id_carga)
            # Criar linha log_analise decisao final CCO e nome do Guarda responsavel
            self.__posta_log_analise(
                'Finalizado', id_carga, self.__busca_grao_por_id_carga(id_carga), guarda=guarda, n_analises=n_analises, decisao_final="CCO",resultado="Reprovado")
            # Criar linha pedido_guarda especificando qual guarda será chamado
            cursor = self.__db.connection.cursor()
            cursor.execute('INSERT into pedido_guarda(nome, id_carga_fk, cco_responsavel, status) values ("{}",{},"{}","{}")'.format(guarda, id_carga, cco, "Aguardando"))
            # print('INSERT into pedido_guarda(nome, id_carga_fk, cco_responsavel, status) values ("{}",{},"{}","{}")'.format(guarda, id_carga, cco, "Aguardando"))

            cursor.connection.commit()
            

        elif(decisao == 'aprovado'):
            # Mudar o resultado para aprovado info_cargas
            # Postar hora de termino info_cargas
            # Mudar estado_fk para Finalizado info_cargas
            # Criar linha log_analise decisao final CCO e responsavel
            ...
        elif(decisao == 'Nova Analise'):
            # Mudar estado para nova analise info_cargas
            # Criar Pedido de Analise_manual para o Analista, especificando que é a segunda analise
            ...

    
    def __pesquisa_chamados_guarda(self, id_guarda:str)-> tuple:
        '''
            Todos os chamados relativos ao id do guarda.

            Métodos usando: retorno_guarda
        '''

        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from pedido_guarda where nome = "{}" and status != "Finalizado"'.format(id_guarda))
        resultado_busca = cursor.fetchall()
        if(resultado_busca):
            return resultado_busca
        else:
            return False


    def retorno_guarda(self, id_guarda:str)-> tuple:
        '''
            Recebe o id do Guarda e retorna uma tupla de tuplas com as informações da carga
            e dados do pedido.

            Tabelas: info_cargas, pedido_guarda
            Views: / , /chamado_guarda
            Tipo de Usuario: Guarda
        '''
        print(id_guarda)
        chamados = self.__pesquisa_chamados_guarda(id_guarda)
        info_cargas_retorno = []
        if(chamados):
            for chamado in chamados:
                #Busca info_cargas atraves do id_carga e adiciona a lista
                info_cargas_retorno.append(self.busca_info_cargas_por_id(chamado[2])) # O item 2 é o id da CARGA
        # A ideia é a tupla chamada ter o mesmo tamanho da lista resultado, assim posso usar o MESMO indice 
        #pois os itens vão ser relativos um ao outro através da ordem dos indices. 
            return (chamados, info_cargas_retorno)
        return False

    def atualiza_estado_pedido_guarda(self, id_pedido:int, estado:str):
        cursor = self.__db.connection.cursor()
        cursor.execute(
            'update pedido_guarda set status ="{}" where id={}'.format(estado, id_pedido))
        cursor.connection.commit()

    def guarda_finaliza_pedido(self, id_pedido:int, id_carga:int):
        self.atualiza_estado_pedido_guarda(id_pedido, "Finalizado")
        self.__atualiza_status_analise_info_cargas("Finalizado", id_carga)
        


    
