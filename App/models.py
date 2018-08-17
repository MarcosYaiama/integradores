class Usuario:
    def __init__(self, id:str, senha:str, cargo:str, nome:str, status="Offline"):
        self.nome = nome
        self.senha = senha
        self.id = id 
        self.cargo = cargo
        self.status = status

class Logs():
    def __init__(self, id_usuario:str, status, hora, data, cargo:str):
        self.id_usuario = id_usuario
        self.status = status
        self.hora = hora
        self.data = data
        self.cargo = cargo
        

class Cargo:
    def __init__(self, cargo:str):
        self.cargo = cargo
