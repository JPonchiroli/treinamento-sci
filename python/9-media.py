lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def media_numeros(lista_numeros):
    soma_numeros = 0
    for numero in lista_numeros:
        soma_numeros += numero
    return round(soma_numeros / len(lista_numeros), 2)

print(media_numeros(lista))