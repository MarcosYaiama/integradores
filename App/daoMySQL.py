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

    def listar(self) -> list:
        '''
            Retorna em uma lista com todos os usuarios do banco. 
            Essa função é usada para listar os usuarios e seu Status no
            controle de usuarios do CCO
            Arquivo HTML: controle_funcionariosCCO.html
            View: /controle_func

                Tabela : usuarios
                Colunas: *
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from usuarios')
        usuarios = traduz_user(cursor.fetchall())   #Transforma a tupla de tuplas em uma lista de objetos   
        # print(usuarios)
        # print(type(usuarios))
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
    
    #Feita para ser usada somente na Analise Form
    def busca_por_analise_por_id(self, coluna:str, valor:int, tabela:str) -> list:
        '''
            Retorna os dados da tabela analise referente ao id_carga_fk especifico,
            esses dados dessa tabela referentes a analise foram preenchidos automaticamente.

            PS: Só é exibido no navegador Grao, Umidade, Temperatura, Data e hora. Porem e enviado
            todos os dados, FAZER REFATORACAO

            View: /formAnalise
        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT grao_fk,umidade,temperatura,hora_inicio_analise,data_inicio_analise from {} where {} = {}'.format(tabela,coluna, valor))
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
        estados = self.__busca("estado_analise")
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

    def insere_info_cargas(self, grao:str, fornecedor:str, destino:str):
        '''
            Insere dados na tabela info_cargas

            Métodos internos da classe utilizando: cria_analise

        '''
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour, datetime.now().minute, datetime.now().second)
        cursor.execute("INSERT into info_cargas(grao, fornecedor, destino, data_chegada, hora_chegada) values (%s, %s, %s, %s, %s)", 
                                               (grao,
                                                fornecedor,
                                                destino,
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
        tempo_final = [abs(datetime.now().hour - tempo_inicio[0]),
                       abs(datetime.now().minute - tempo_inicio[1]),
                       abs(datetime.now().second - tempo_inicio[2])]
        # print(tempo_inicio)
        # print(tempo_final)
        cursor.execute("INSERT into analise values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                          (id_carga_fk,
                                           umidade,
                                           temperatura,
                                           grao_fk,
                                           '{}:{}:{}'.format(tempo_inicio[0], tempo_inicio[1], tempo_inicio[2]),
                                           str(datetime.now().date()),
                                           estado_fk,
                                           resultado,
                                           '{}:{}:{}'.format(tempo_final[0], tempo_final[1], tempo_final[2]),
                                           0
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
                if(item[0] in registros[0]):
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
        # self.busca_info_cargas_sem_analise()
        dados = self.sorteia()
        self.insere_info_cargas(dados['grao'], dados['fornecedor'], dados['destino'])
        # print(id_carga)
        resultado_busca = self.busca_info_cargas_sem_analise()
        # print(resultado_busca)
        for i in range(len(resultado_busca)):
            dados = self.sorteia()
            # print(resultado_busca[i][0])
            self.insere_analise_maquina(resultado_busca[i][0], dados['umidade'], dados['temperatura'], dados['grao'], dados['estado'], dados['resultado'])


    def registros_maquina(self) -> dict:
        '''
            Busca todos os registros na tabela analise que tenham o estado_fk = a Analista.
            Caso tenha, cria uma lista com dicionarios, um para cada coluna retornada.

            Esses dados sao exibidos para o analista no seu index caso exista, caso nao
            a tabela referente a retorna da maquina de analise nao e exibida

            View: /
            Arquivo HTML: indexAnalise.html
            Tabela: analise

        '''
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from analise where estado_fk = "Analista"')
        resultados = list(cursor.fetchall())
        # print(resultados)
        tabela = ["id_carga_fk", 'umidade', 'temperatura',
                  'grao_fk', 'hora_inicio_analise', 'data_inicio_analise', 
                  'estado_fk', 'resultado', 'tempo_analise', "analise_iniciada"]
        analises = []
        if(len(resultados)):
            for lista in range(len(resultados)):
                # pprint(resultados[lista])
                resultados[lista] = list(resultados[lista])
                nova_lista = {} 
                for coluna in range(len(tabela)):
                    resultados[lista][coluna] = str(resultados[lista][coluna]) 
                    nova_lista[tabela[coluna]] = resultados[lista][coluna]
                analises.append(nova_lista)
        else:
            analises = False
        return analises



    def inicia_analise_manual(self, id_carga, grao:str, analista:str):
        '''
        É chamada sempre que o analista clica em iniciar analise em algum retorno da maquina que
        aparece no index. Essa função registra a hora em que o Analista deu esse clique e cria
        na tabela analise do GRAO uma linha, apenas com os valores que não precisam ser passado pelo
        analista, os outros valores referentes são jogados no formulario na pagina formAnalise.html
        para ficar a cargo do analista preencher.
        '''
        print(grao)
        #Inserir dado na tabela Relativa ao grao e retornar a tabela
        if(grao == 'Soja'):
            colunas = ['id_carga','Ardidos', 'Queimados', 'Mofados', 'Esverdeados', 'Partidos,Quebrados ou Amassados',
                       'Impurezas', 'Analista', 'Data', 'hora inicio', 'Hora Termino', 'id registro', 'estado_analise_manual']


        else:
            colunas = ['id_carga', 'Avariados e Ardidos', 'Quebrados', 'Impurezas', 'Carunchado', 'Data',
                       'hora inicio', 'Hora Termino', 'Analista', 'id registro', 'estado_analise_manual']

        consulta = self.__busca_dados_analise_grao(grao, id_carga, colunas)
        if(not consulta):
            self.__inicia_analise_manual_bd(grao, analista,id_carga)
            self.__atualiza_status_analise_iniciada(1, id_carga)
            consulta = self.__busca_dados_analise_grao(grao, id_carga, colunas)
        return consulta

    def __atualiza_status_analise_iniciada(self,iniciada:bool, id_carga):
        '''
        Atualiza o valor da coluna analise_iniciada da tabela analise
        Essa coluna diz se a analise já está em andamento ou não
        Esse valor é responsavel por alterar a cor do botão no IndexAnalise.html
        '''
        cursor = self.__db.connection.cursor()
        # print('update analise set analise_iniciada={} where id_carga_fk = {}'.format(iniciada, id_carga))
        cursor.execute('update analise set analise_iniciada={} where id_carga_fk = {}'.format(iniciada, id_carga))
        self.__db.connection.commit()

    def __inicia_analise_manual_bd(self, grao:str, analista:str, id_carga):
        '''
        Cria linha no banco de dados que será usada para a analise, inserindo a data atual, horario atual, analista
        E deixa como NULL os valores que serão preenchidos pelo analista no form e a hora_termino que será inserida
        quando o analista clickar em enviar.
        '''
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour,
                                    datetime.now().minute,
                                    datetime.now().second)
        data = str(datetime.now().date())
        # print('INSERT INTO {}(id_carga_fk, data, hora_inicio, Analista) values (%s,%s,%s,%s)'.format(grao), (id_carga, data, hora, analista))
        cursor.execute('INSERT INTO {}(id_carga_fk, data, hora_inicio, Analista) values (%s,%s,%s,%s)'.format(grao), (
            id_carga, data, hora, analista))
        self.__db.connection.commit()
    
    def __busca_dados_analise_grao(self, grao:str, valor_id_carga_fk, colunas):
        '''
        Retorna todas as tabelas em uma lista de dicionarios com o id da CARGA, em ordem da ultima inserida até a ultima
        Esse valor é usado depois fora do método para verificar se precisa-se fazer uma nova inserção
        '''
        cursor = self.__db.connection.cursor()
        print('SELECT * from {} where id_carga_fk = {} order by id desc'.format(grao, valor_id_carga_fk))
        cursor.execute('SELECT * from {} where id_carga_fk = {} order by id desc'.format(grao, valor_id_carga_fk))

        retorno_bd = list(cursor.fetchall())
        # print(retorno_bd)
        if(retorno_bd):
            # print(retorno_bd[0])
            # print(len(colunas))
            tabela_analise_manual = list(retorno_bd[0])
            tabela_final = {}
            for i in range(len(tabela_analise_manual)):
                tabela_final[colunas[i]] = str(tabela_analise_manual[i])
            del tabela_final['Analista']
            del tabela_final['Data']
            del tabela_final['Hora Termino']
            return tabela_final
        return False

    def finaliza_analise_manual(self):
        pass
    
