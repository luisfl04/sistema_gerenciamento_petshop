# Arquivo que contém a lógica relacionada ao gereciamento de rotas(páginas) que a aplicação implementa.

# libs usadas:
import flet as ft
from cadastro import exibirTelaDeCadastro
from login import exibirTelaDeLogin

class GerenciadorRotasAplicacao:

    """
    classe que gerencia as páginas que gerencia todas a lógica das páginas exibidas na aplicação.
    """

    def obterRotaAtual(self, page: ft.Page):
       # Função que retorna a rota atual em que a aplicação está:
        return page.route

    def definirRotaAplicacao(self, page: ft.Page, rota_passada: str):
        # Função que define a rota atual da aplicação

        # Redirecionando para a rota:
        if rota_passada == "/":
            exibirTelaDeLogin(page)
        elif rota_passada == "/cadastro":
            exibirTelaDeCadastro(page)