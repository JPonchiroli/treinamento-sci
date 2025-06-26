frase1 = "Seco de raiva coloco no colo caviar e doces"
frase2 = "Luz azul"
frase3 = "Ame o poema"

def is_palindromo(frase):
    frase = frase.replace(" ", "").lower()
    frase_formatada = "".join(reversed(frase.lower()))
    
    if frase_formatada == frase:
        return print("Frase é um palindromo")
    else:
        return print("Frase não é um palindromo")

is_palindromo(frase1)
is_palindromo(frase2)
is_palindromo(frase3)