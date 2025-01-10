# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Libs usadas:
import flet as ft
from banco_de_dados import GerenciadorDeBancoDeDados

# Função principal da execução:
def main(page: ft.Page):
    page.title = "Aplicação Flet com MySQL"
    
    # Função para buscar dados do banco
    def buscar_dados(e):
        banco = GerenciadorDeBancoDeDados()
        conexao = banco.conectarBanco()
        if conexao:
            cursor = conexao.cursor()
            cursor.execute("SELECT * FROM VETERINARIO")  # Substitua por sua consulta
            resultados = cursor.fetchall()
            conexao.close()
            
            # Exibe os dados no Flet
            for linha in resultados:
                page.add(ft.Text(str(linha)))

    # Botão para buscar dados
    botao = ft.ElevatedButton("Buscar Dados", on_click=buscar_dados)
    page.add(botao)

if __name__ == "__main__":
    ft.app(main)