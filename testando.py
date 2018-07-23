from dao import UsuarioDao
from tabelas import user_table, engine

usuario_dao = UsuarioDao(engine, user_table)
# usuario_dao.novo_usuario('Nicholas', 'mestra', 'CCO')
# usuario_dao.novo_usuario('André', 'mestra', 'Analista de Grãos')
# usuario_dao.novo_usuario('Mauricio', 'mestra', 'Guarda')

# usuario_dao.deletar_usuario(4)
# usuario_dao.deletar_usuario(5)
# usuario_dao.deletar_usuario(6)
teste = usuario_dao.listar()

print(teste)
print(type(teste))

for d in teste:
    if('Caruara' in d['nome']):
        print('O id do {} é {}'.format(d['nome'], d['id']))