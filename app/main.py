# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Imports usados:
import flet as ft
from banco_de_dados import GerenciadorDeBancoDeDados
from gerenciador_rotas import GerenciadorRotasAplicacao

class Main:

    def definirPaginaAplicacao(self, page: ft.Page, pagina_para_renderizar: str):
        """
        Função que define a pagina que vai ser renderizada na aplicação de acordo com a rota passada por parâmetro.
        """ 
        
        if pagina_para_renderizar == "/":
            page.route = "/"
            GerenciadorRotasAplicacao.definirRotaAplicacao(self, page, '/')
            print(page.route)
        elif pagina_para_renderizar == "/cadastro":
            page.route = "/cadastro"
            GerenciadorRotasAplicacao.definirRotaAplicacao(self, page, '/cadastro')
            print(page.route) 
        
    
    def main(self, page: ft.Page):

        """
        Função principal da aplicação
        """
        
        page.title = "Gerenciamento PetShop"
        self.definirPaginaAplicacao(page, '/cadastro')


# Inicia a execução da aplicação:
if __name__ == "__main__":
    aplicativo = Main()
    ft.app(target=aplicativo.main)