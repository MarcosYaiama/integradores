from sqlalchemy import (delete,
                       select,
                       update)



class UsuarioDao:
    def __init__(self, engine, table):
        self.db = engine
        self.table = table
        self.conexao = self.db.connect()
        
    def novo_usuario(self, nome, senha, cargo):
        ins = self.table.insert()
        add = ins.values(nome=nome,senha = senha,cargo = cargo)
        self.conexao.execute(add)

    def listar(self):
        selecionar = select([self.table])
        lista = []
        for row in selecionar.execute():
            # print(row)
            lista.append(dict(row))
        return lista


    def buscar_usuario(self):
        pass

    def deletar_usuario(self, id):
        remover = delete(self.table).where(self.table.c.id==id)
        resultado = self.conexao.execute(remover)
        if(resultado.rowcount):
            return True
        else:
            return False
        # print(remover)
