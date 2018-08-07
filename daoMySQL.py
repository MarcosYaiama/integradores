from flask_mysqldb import MySQL
from models import Usuario, Cargo, Logs
from datetime import datetime
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


class UsuarioDao:
    def __init__(self, db):
        self.__db = db
        self.nome = "Nick"
        
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
