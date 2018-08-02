class Usuario:
    def __init__(self, id, senha, cargo, nome, status):
        self.nome = nome
        self.senha = senha
        self.id = id 
        self.cargo = cargo
        self.status = status

class Cargo:
    def __init__(self, cargo):
        self.cargo = cargo
