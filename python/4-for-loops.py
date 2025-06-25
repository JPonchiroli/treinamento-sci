mensagem = input("> Informe a mensagem: ").lower()

print("--------------For Each--------------")
for letra in mensagem:
    if letra == "a" or letra == "e" or letra == "i" or letra == "o" or letra == "u":
        continue
    elif letra == "0" or letra == "1" or letra == "2" or letra == "3" or letra == "4" or letra == "5" or letra == "6" or letra == "7" or letra == "8" or letra == "9":
        break
    print(letra)
    
print("--------------While--------------")
tamanho_mensagem = len(mensagem)
letra_atual = 0
while (letra_atual < tamanho_mensagem):
    print(mensagem[letra_atual])
    letra_atual += 1