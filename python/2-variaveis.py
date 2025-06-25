nome = ""
idade = 0

nome = input("> Informe seu nome ")
idade = int(input("> Informe sua idade "))
ano_de_nascimento = 2025 - idade

if idade < 18:
    print(f"{nome}, você tem {idade} anos e nasceu em {ano_de_nascimento}. E é menor de idade")
elif idade == 18:
    print(f"{nome}, você tem {idade} anos e nasceu em {ano_de_nascimento}.")
else:
    print(f"{nome}, você tem {idade} anos e nasceu em {ano_de_nascimento}. E é maior de idade")

