numero1 = 5
numero2 = 5.5

# Comparativas
print('-------------Comparativas-------------')
varComparacao = numero1 == numero2
print(varComparacao)

varComparacao = numero1 != numero2
print(varComparacao)

varComparacao = numero1 >= numero2
print(varComparacao)

varComparacao = numero1 <= numero2
print(varComparacao)

# Logicas
print('-------------Logicas-------------')
varComparacao = numero1 > numero2 and numero2 > numero1
print(varComparacao)

varComparacao = numero1 > numero2 or numero2 > numero1
print(varComparacao)

varComparacao = not numero1 > numero2 
print(varComparacao)