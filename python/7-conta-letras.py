palavras = []

while len(palavras) != 3:
    palavras.append(input("> Digite uma palavra: "))

letra_desejada = input("> Digite uma letra: ")

for palavra in palavras:
    contador_letras = 0
    
    for letra in palavra:
        if letra_desejada == letra:
            contador_letras += 1
            
    if contador_letras == 1:
        print(f"{palavra} -> {contador_letras} vez")
    else:
        print(f"{palavra} -> {contador_letras} vezes")