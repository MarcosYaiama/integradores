
from models import Usuario
import requests


def nivel_de_acesso(cargo):
    if(cargo == 'CCO'):
        return ('indexCCO.html', 'formCCO.html', 'reprovaCCO.html', 'controle_funcionariosCCO.html')
    elif(cargo == 'ANALISTA DE GRAOS' or cargo == 'ANALISE DE GRAOS'):
        return ('indexAnalise.html', 'formAnalise.html')
    elif(cargo == 'GUARDA'):
        return ('indexGuarda.html', 'chamadoGuarda.html')
    else:
        return False


def envia_pagina_arduino(usuarios=None, cargo=None, pagina=None):
    ...
    # ip = 'http://192.168.1.34'
    # try:
    #     p = {'Usuario': usuarios, 'Cargo': cargo, 'Pagina': pagina}
    #     #r = requests.post('http://192.168.0.6/pantilt', json=p)
    #     requests.post('{}/arduino'.format(ip), json=p)
    #     return True
    # except:
    #     return False
