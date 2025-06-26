try:
    resultado = 10 / 0
except ZeroDivisionError:
    print("Erro ao dividir valor por 0")
except Exception as e:
    print(f"Ocorreu um erro inesperado. Erro {e}")