from dao import UsuarioDao
from tabelas import user_table, engine
from models import Usuario



usuario_dao = UsuarioDao(engine, user_table)

def busca_usuario_por_nome(nome):
    user_list = usuario_dao.listar()
    for row in user_list:
        if(nome in row['nome']):
            # print('O id do {} é {}'.format(row['nome'], row['id']))
            return Usuario(row['nome'], row['senha'], row['id'], row['cargo'])
    return False

def nivel_de_acesso(cargo):
    if(cargo == 'CCO'):
        return ('indexCCO.html', 'formCCO.html', 'reprovaCCO.html')
    elif(cargo == 'Analista de Grãos'):
        return ('indexAnalise.html', 'formAnalise.html')
    elif(cargo == 'Guarda'):
        return ('indexGuarda.html', 'chamadoGuarda.html')
    else:
        return False


