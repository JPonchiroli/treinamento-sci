ano_de_nascimento = int(input("> Informe seu ano de nascimento "))

if ano_de_nascimento >= 1946 and ano_de_nascimento <= 1964:
    print("Geração Boomer")
elif ano_de_nascimento >= 1965 and ano_de_nascimento <= 1980:
    print("Geração X")
elif ano_de_nascimento >= 1981 and ano_de_nascimento <= 1996:
    print("Geração Millennial")
elif ano_de_nascimento >= 1997 and ano_de_nascimento <= 2012:
    print("Geração Z")
elif ano_de_nascimento > 2012:
    print("Geração Alpha")
else:
    print("N/A")