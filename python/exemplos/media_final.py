nota1 = float(input("> Informe sua 1° nota "))
nota2 = float(input("> Informe sua 2° nota "))
nota3 = float(input("> Informe sua 3° nota "))

media = (nota1 + nota2 + nota3) / 3

if media >= 7:
    print(f"Aprovado com média {round(media,2)}")
else:
    nota_recuperacao = float(input("> Informe a nota da prova de recuperação "))
    if nota_recuperacao == 0:
        print("Reprovado, sem recuperação")
    elif nota_recuperacao < 8:
        print("Reprovado, com recuperação")
    else:
        print("Aprovado, com recuperação")