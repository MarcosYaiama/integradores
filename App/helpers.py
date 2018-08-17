
from models import Usuario


def nivel_de_acesso(cargo):
    if(cargo == 'CCO'):
        return ('indexCCO.html', 'formCCO.html', 'reprovaCCO.html', 'controle_funcionariosCCO.html')
    elif(cargo == 'ANALISTA DE GRAOS' or cargo == 'ANALISE DE GRAOS'):
        return ('indexAnalise.html', 'formAnalise.html')
    elif(cargo == 'GUARDA'):
        return ('indexGuarda.html', 'chamadoGuarda.html')
    else:
        return False


