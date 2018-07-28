class Usuario:
    def __init__(self, id, senha, cargo, nome):
        self.nome_completo = nome
        self.senha = senha
        self.id = id 
        self.cargo = cargo