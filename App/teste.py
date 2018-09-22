
arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
quantidade_carac = 6
tamanho_array = len(arr)
n_analises = tamanho_array // quantidade_carac

resultado = []

for i in range(n_analises):
    resultado.append([])

c = 0

for i in range(tamanho_array):
    resultado[c].append(arr[i])
    if(c == n_analises-1): 
        c = 0
    else:
        c+=1

print(resultado)
