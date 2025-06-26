funcionario  = {}

"""
funcionario["nome"] = "João"
funcionario["idade"] = 19
funcionario["endereco"] = "R. Herman Hering, 799"
"""

endereco = "Rua tal"

funcionario = {
    "nome": "Joao",
    "idade": 19,
    "endereco": {
        "rua": endereco,
        "numero": 1676
    }
}

print(len(funcionario))
print(funcionario)
print(funcionario["nome"])