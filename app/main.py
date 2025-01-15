# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Imports usados:
import flet as ft
from banco_de_dados import GerenciadorDeBancoDeDados
from cadastro import exibirTelaDeCadastro
from login import exibirTelaDeLogin


class Main:

    def route_change(self, page, route):
        """
        Função que define a rota atual da aplicação.
        """

        # Redirecionando com base na rota:
        if route == "/":
            exibirTelaDeLogin(page)
        elif route == "/cadastro":
            print('cai aqui')
            exibirTelaDeCadastro(page)
        
    
    def main(self, page: ft.Page):

        """
        Função principal da aplicação
        """
        
        page.title = "Gerenciamento PetShop"
        page.on_route_change = lambda event: self.route_change(page, page.route)
        page.route = "/cadastro"
        page.go(page.route)



# Inicia a execução da aplicação:
if __name__ == "__main__":
    aplicativo = Main()
    ft.app(target=aplicativo.main)