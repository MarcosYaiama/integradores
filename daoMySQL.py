from flask_mysqldb import MySQL
from models import Usuario, Cargo, Logs
from datetime import datetime
from time import sleep
from random import randint
from pprint import pprint
# SQL_DELETA_JOGO = 'delete from jogo where id = %s'
# SQL_JOGO_POR_ID = 'SELECT id, nome, categoria, console from jogo where id = %s'
# SQL_ATUALIZA_JOGO = 'UPDATE jogo SET nome=%s, categoria=%s, console=%s where id = %s'
# SQL_BUSCA_JOGOS = 'SELECT id, nome, categoria, console from jogo'
# SQL_CRIA_JOGO = 'INSERT into jogo (nome, categoria, console) values (%s, %s, %s)'
SQL_USUARIO_POR_ID = 'SELECT * from usuarios where id = %s'
SQL_BUSCA_USUARIOS = 'SELECT * from usuarios'
SQL_BUSCA_CARGOS = 'SELECT * from cargos'
SQL_LISTAR_LOGS = 'SELECT * from logs_func order by data, hora desc'
SQL_CRIA_USUARIO = 'INSERT into usuarios(id, nome_completo, senha, cargo) values (%s, %s, %s, %s)'
SQL_ATUALIZA_STATUS_USUARIO = 'UPDATE usuarios set status_atual=%s where id=%s'
SQL_ATUALIZA_LOGS_USUARIO = 'INSERT into logs_func(id_usuario, Status, hora, data, cargo) values (%s, %s, %s, %s, %s)'

SQL_INSERE_INFO_CARGAS = "INSERT into info_cargas(grao, fornecedor, destino, data_chegada, hora_chegada) values (%s, %s, %s, %s, %s)"
SQL_INSERE_ANALISE = "INSERT into analise values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
SQL_BUSCA = 'SELECT * from '


class UsuarioDao:
    def __init__(self, db):
        self.__db = db
        
    def buscar_por_id(self, id):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_USUARIO_POR_ID, (id,))
        dados = cursor.fetchone()
        usuario = traduz_usuario(dados) if dados else None
        # print(usuario)
        return usuario

    def listar(self):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_BUSCA_USUARIOS)
        usuarios = traduz_user(cursor.fetchall())
        # print(usuarios)
        return usuarios

    def listar_logs(self):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_LISTAR_LOGS)
        logs = traduz_logs(cursor.fetchall())
        print(logs[0].id_usuario)
        return logs

    def novo_usuario(self, usuario):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_CRIA_USUARIO, (usuario.id,
                                          usuario.nome, 
                                          usuario.senha, 
                                          usuario.cargo))

        #self.__db.connect.commit()     #MALDITO ERRO, JAMAIS TE ESQUECEREI!
        self.__db.connection.commit()

    def cargos(self):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_BUSCA_CARGOS)
        cargos_bd = cursor.fetchall()
        cargos = []
        for i in cargos_bd:
            cargos.append(i[0])
        # print(cargos)
        return cargos

    def atualiza_status(self, estado, id):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_ATUALIZA_STATUS_USUARIO, (estado,
                                                     id))
        self.__db.connection.commit()

    def atualiza_log(self, id_usuario, status, cargo):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_ATUALIZA_LOGS_USUARIO,(id_usuario,
                                                  status,
                                                  '{}:{}:{}'.format(
                                                      datetime.now().hour, datetime.now().minute, datetime.now().second),
                                                  str(datetime.now().date()),
                                                  cargo))
        self.__db.connection.commit()

def traduz_user(usuarios):
    def cria_user_com_tupla(tupla):
        return Usuario(tupla[0], tupla[1], tupla[2],tupla[3], tupla[4])
    return list(map(cria_user_com_tupla, usuarios))

def traduz_logs(logs):
    def cria_user_com_tupla(tupla):
        return Logs(tupla[1], tupla[2], tupla[3],tupla[4], tupla[5])
    return list(map(cria_user_com_tupla, logs))

def traduz_usuario(tupla):
    return Usuario(tupla[0], tupla[1], tupla[2], tupla[3], tupla[4])


class Analise():
    def __init__(self, db):
        self.__db = db

    def busca(self, tabela, composta=False):
        cursor = self.__db.connection.cursor()
        cursor.execute(SQL_BUSCA + tabela)
        resultado_bd = cursor.fetchall()
        # print(resultado_bd)
        if composta:
            resultado = []
            for i in resultado_bd:
                lista = []
                for itens in i:
                    lista.append(str(itens))
                resultado.append(lista)
            return resultado

        else:
            resultado = []
            for i in resultado_bd:
                resultado.append(i[0])
            return resultado
    
    def busca_por_id_tabela(self, coluna, valor, tabela):
        cursor = self.__db.connection.cursor()
        cursor.execute('SELECT * from {} where {} = {}'.format(tabela,coluna, valor))
        dado = list(cursor.fetchall())
        for i in range(len(dado)):
            dado = list(dado[i])
            for a in range(len(dado)):
                dado[a] = str(dado[a])
        return dado

    def sorteia(self):
        destinos = ["Guaruja", "Santos", "São Vicente","São Paulo", "Japão", "Taiwan"]
        fornecedores = ["MM Grãos", "Granolandia", "Fazenda dos Grãos","Fazendeiros Tabajara", "Moinho Paulista"]
        graos = self.busca("graos")
        estados = self.busca("estado_analise")
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

    def insere_info_cargas(self, grao, fornecedor, destino):
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour, datetime.now().minute, datetime.now().second)
        cursor.execute(SQL_INSERE_INFO_CARGAS, (grao,
                                                fornecedor,
                                                destino,
                                                datetime.now().date(),
                                                hora))
        self.__db.connection.commit()
        id_carga = self.busca("info_cargas")
        return id_carga[-1]

        #BUSCAR O ID DO PEDIDO DE ANALISE INSERIDO PARA RETORNAR O MESMO PARA SER INSERIDO NA
        #FUNÇÃO insere_analise_maquina

    def insere_analise_maquina(self, id_carga_fk, umidade, temperatura, grao_fk, estado_fk, resultado):
        cursor = self.__db.connection.cursor()
        tempo_inicio = [datetime.now().hour, datetime.now().minute, datetime.now().second]
        sleep(1)
        tempo_final = [abs(datetime.now().hour - tempo_inicio[0]),
                       abs(datetime.now().minute - tempo_inicio[1]),
                       abs(datetime.now().second - tempo_inicio[2])]
        print(tempo_inicio)
        print(tempo_final)
        cursor.execute(SQL_INSERE_ANALISE,(id_carga_fk,
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
        registros_info_carga = self.busca("info_cargas",composta=True)
        registros_analise = self.busca('analise', composta=True)
        

        lista_itens_nao_existentes = []
        for item in registros_info_carga:
            lista_itens_nao_existentes.append(item)
            # dados = self.sorteia()
            print('Item : {}'.format(item))
            for registros in registros_analise:
                # print('Registros : {}'.format(registros[0]))
                # print('{} : {}'.format(item[0], registros[0]))
                # print(item[0] in registros[0])
                if(item[0] in registros[0]):
                    lista_itens_nao_existentes.remove(item)
                    break
        print(lista_itens_nao_existentes)
        return lista_itens_nao_existentes

            # if(item[0] not in registros_analise[0]):
                # self.insere_analise_maquina(item[0], dados['umidade'], dados['temperatura'], dados['grao'], dados['estado'], dados['resultado'] )
    

    def cria_analise(self):
        self.busca_info_cargas_sem_analise()
        dados = self.sorteia()
        self.insere_info_cargas(dados['grao'], dados['fornecedor'], dados['destino'])
        # print(id_carga)
        resultado_busca = self.busca_info_cargas_sem_analise()
        print(resultado_busca)
        for i in range(len(resultado_busca)):
            dados = self.sorteia()
            print(resultado_busca[i][0])
            self.insere_analise_maquina(resultado_busca[i][0], dados['umidade'], dados['temperatura'], dados['grao'], dados['estado'], dados['resultado'])

    def registros_maquina(self):
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

    # É chamada sempre que o analista clica em iniciar analise em algum retorno da maquina que
    # aparece no index. Essa função registra a hora em que o Analista deu esse clique e cria
    # na tabela analise do GRAO uma linha, apenas com os valores que não precisam ser passado pelo
    # analista, os outros valores referentes são jogados no formulario na pagina formAnalise.html
    # para ficar a cargo do analista preencher.
    def inicia_analise_manual(self, id_carga, grao, analista):
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

    #Atualiza o valor da coluna analise_iniciada da tabela analise
    #Essa coluna diz se a analise já está em andamento ou não
    #Esse valor é responsavel por alterar a cor do botão no IndexAnalise.html
    def __atualiza_status_analise_iniciada(self,iniciada, id_carga):
        cursor = self.__db.connection.cursor()
        print('update analise set analise_iniciada={} where id_carga_fk = {}'.format(iniciada, id_carga))
        cursor.execute('update analise set analise_iniciada={} where id_carga_fk = {}'.format(iniciada, id_carga))
        self.__db.connection.commit()

    #Cria linha no banco de dados que será usada para a analise, inserindo a data atual, horario atual, analista
    # E deixa como NULL os valores que serão preenchidos pelo analista no form e a hora_termino que será inserida
    # quando o analista clickar em enviar.
    def __inicia_analise_manual_bd(self, grao, analista, id_carga):
        cursor = self.__db.connection.cursor()
        hora = '{}:{}:{}'.format(datetime.now().hour,
                                    datetime.now().minute,
                                    datetime.now().second)
        data = str(datetime.now().date())
        print('INSERT INTO {}(id_carga_fk, data, hora_inicio, Analista) values (%s,%s,%s,%s)'.format(grao), (id_carga, data, hora, analista))
        cursor.execute('INSERT INTO {}(id_carga_fk, data, hora_inicio, Analista) values (%s,%s,%s,%s)'.format(grao), (
            id_carga, data, hora, analista))
        self.__db.connection.commit()
    
    # Retorna todas as tabelas em uma lista de dicionarios com o id da CARGA, em ordem da ultima inserida até a ultima
    # Esse valor é usado depois fora do método para verificar se precisa-se fazer uma nova inserção
    def __busca_dados_analise_grao(self, grao, valor_id_carga_fk, colunas):
        cursor = self.__db.connection.cursor()
        print('SELECT * from {} where id_carga_fk = {} order by id desc'.format(grao.lower(), valor_id_carga_fk))
        cursor.execute('SELECT * from {} where id_carga_fk = {} order by id desc'.format(grao.lower(), valor_id_carga_fk))

        retorno_bd = list(cursor.fetchall())
        print(retorno_bd)
        if(retorno_bd):
            print(retorno_bd[0])
            print(len(colunas))
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
    
