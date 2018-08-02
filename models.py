class Usuario:
    def __init__(self, id, senha, cargo, nome):
        self.nome_completo = nome
        self.senha = senha
        self.id = id 
        self.cargo = cargo

class Cargo:
    def __init__(self, cargo):
        self.cargo = cargo