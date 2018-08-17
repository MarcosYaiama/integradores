class Usuario:
    def __init__(self, id, senha, cargo, nome, status="Offline"):
        self.nome = nome
        self.senha = senha
        self.id = id 
        self.cargo = cargo
        self.status = status

class Logs():
    def __init__(self, id_usuario, status, hora, data, cargo):
        self.id_usuario = id_usuario
        self.status = status
        self.hora = hora
        self.data = data
        self.cargo = cargo
        

class Cargo:
    def __init__(self, cargo):
        self.cargo = cargo
