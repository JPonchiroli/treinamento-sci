numeros = []

numeros.append(5)
numeros.append(10)
numeros.append(2)

print(numeros)
print(numeros[1])

numeros.pop() # remove ultimo elemento - pop(1) remove na posicao especifica
print(numeros)

if 5 in numeros:
    print("Tem o número 5 na lista")