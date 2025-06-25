count = 0

numero_maximo = int(input("> Informe o número máximo "))

while (count <= numero_maximo):
    if count % 2 == 0 or count % 5 == 0:
        print(count)
    count = count + 1
