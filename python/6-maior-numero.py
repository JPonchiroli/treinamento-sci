numeros = []
maiorNumero = 0
posicao = 0

while True:
    numeros.append(input("> Digite um número: "))
    
    if "sair" in numeros or "Sair" in numeros:
        break
    
    if int(numeros[posicao]) > maiorNumero:
        maiorNumero = int(numeros[posicao])
    
    posicao += 1

print(f"O maior número informado foi {maiorNumero}")