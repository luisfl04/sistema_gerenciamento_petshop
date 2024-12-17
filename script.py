import random

# Nome do arquivo SQL de saída
output_file = "populate_pet.sql"

# Lista de nomes de pets comuns
nomes_de_pets = [
    "Bobby", "Rex", "Milo", "Luna", "Bella", "Max", "Charlie", "Simba", "Nina", "Thor",
    "Mel", "Sofia", "Pandora", "Fred", "Romeu", "Rocky", "Billy", "Pitoco", "Zara", "Amora",
    "Toby", "Princesa", "Neguinho", "Snow", "Bob", "Tom", "Mingau", "Pipoca", "Estrela", "Rubi",
    "Leo", "Nick", "Zeus", "Thor", "Pingo", "Cacau", "Chico", "Nina", "Fiona", "Bolt"
]

apelidos_de_pets = [
    "Bichinho", "Fofura", "Lindinho", "Tigrinho", "Pretinho", "Branquinho", "Bolinha", "Peludo",
    "Bigode", "Miau", "Totó", "Fofo", "Amigão", "Docinho", "Rabinho", "Mordomo", "Biscoito", "Panda",
    "Doguinho", "Xodó", "Leitinho", "Panqueca", "Batata", "Churros", "Nuvem", "Coração", "Bebê",
    "Caramelo", "Melzinho", "Diva", "Estrelinha", "Mimi", "Pipoca", "Gigante", "Bolota"
]

# Lista de tipos de PETs (IDs da tabela TIPO_DE_PET)
tipo_pets = list(range(1, 37))  # Assumindo que existam 36 tipos de pets

total_pets_per_type = 3  # Quantidade de pets por tipo
total_clientes = 1000    # IDs de clientes variam de 1 a 1000

# Abrindo o arquivo para escrita
with open(output_file, "w") as file:
    file.write("-- Script para popular a tabela PET\n")
    file.write("INSERT INTO PET (NOME_DO_PET, APELIDO, TIPO_DO_PET, DONO_DO_PET) VALUES\n")

    registros = []
    for tipo_pet in tipo_pets:
        for _ in range(total_pets_per_type):
            nome_do_pet = random.choice(nomes_de_pets)
            apelido = random.choice(apelidos_de_pets)
            dono_do_pet = random.randint(1, total_clientes)
            registros.append(f"('{nome_do_pet}', '{apelido}', {tipo_pet}, {dono_do_pet})")

    # Escrevendo registros com formatação correta
    file.write(",\n".join(registros))
    file.write(";\n")

print(f"Arquivo SQL gerado com sucesso: {output_file}")
