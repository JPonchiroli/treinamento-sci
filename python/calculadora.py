from funcoes.somar import somar
from funcoes.dividir import dividir
from funcoes.multiplicar import multiplicar
from funcoes.subtrair import subtrair

decisao_operacao = input("> Digite uma operação (+, -, *, /): ")
numero_1 = float(input("> Digite o 1° número: "))
numero_2 = float(input("> Digite o 2° número: "))

if decisao_operacao == "+":
    print(somar(numero_1, numero_2))
elif decisao_operacao == "-":
    print(subtrair(numero_1, numero_2))
elif decisao_operacao == "*":
    print(multiplicar(numero_1, numero_2))
elif decisao_operacao == "/":
    if numero_2 == 0:
        print("Número inválido, informe outro número")
        numero_2 = float(input("> Digite o 2° número: "))
    print(dividir(numero_1, numero_2))
else:
    print("Operação Inválida")