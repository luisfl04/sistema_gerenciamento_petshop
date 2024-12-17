import random
from datetime import datetime, timedelta

# Nome do arquivo SQL de saída
output_file = "populate_agenda_veterinario.sql"

# Parâmetros
numero_veterinarios = list(range(1, 11))  # Veterinários de 1 a 10
pets = list(range(1, 103))  # Pets de 1 a 102
servicos = list(range(1, 21))  # Serviços de 1 a 20
status_servico = ["AGENDADO", "REALIZADO"]  # Status do serviço

data_inicio = datetime(2024, 4, 1)  # Data de início
numero_de_dias = 60  # Dias até 2024-05-30
numero_registros = 300  # Total de registros

# Gerar datas entre data_inicio e data_inicio + numero_de_dias
def generate_random_date():
    random_days = random.randint(0, numero_de_dias - 1)
    return (data_inicio + timedelta(days=random_days)).strftime('%Y-%m-%d')

# Abrindo o arquivo para escrita
with open(output_file, "w") as file:
    file.write("-- Script para popular a tabela AGENDA_DO_VETERINARIO\n")
    file.write("INSERT INTO AGENDA_DO_VETERINARIO (NUMERO_DO_VETERINARIO, DATA_DO_REGISTRO, STATUS_DO_SERVICO, PET_RELACIONADO, SERVICO) VALUES\n")

    registros = []
    for _ in range(numero_registros):
        numero_veterinario = random.choice(numero_veterinarios)
        data_do_registro = generate_random_date()
        status = random.choice(status_servico)
        pet_relacionado = random.choice(pets)
        servico = random.choice(servicos)
        registros.append(f"({numero_veterinario}, '{data_do_registro}', '{status}', {pet_relacionado}, {servico})")

    # Escrevendo registros com formatação correta
    file.write(",\n".join(registros))
    file.write(";\n")

print(f"Arquivo SQL gerado com sucesso: {output_file}")
