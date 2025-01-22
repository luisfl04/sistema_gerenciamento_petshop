# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Imports usados:
import flet as ft
from tela_de_cadastro import TelaDeCadastro
from tela_de_login import TelaDeLogin
from gerenciador_banco_de_dados import GerenciadorDeBancoDeDados


class Main:

    """
    Classe com a lógica principal de incialização e configuração da aplicação.
    """


    def __init__(self):
        # Criando instâncias para todos os módulos implementados no app:
        self.tela_de_login = TelaDeLogin()  
        self.tela_de_cadastro = TelaDeCadastro()
        self.gerenciador_banco_de_dados = GerenciadorDeBancoDeDados()  

    def iniciarConexaoComBancoDeDados(self):
        """
        Função que inicia a conexão com o banco de dados ao iniciar a aplicação.
        """

        try:
            self.gerenciador_banco_de_dados.conectarBanco()
        except Exception as excessao:
            print(f"Erro ao iniciar conexão com o banco de dados: {excessao}")

    
    def route_change(self, page, route):
        """
        Função que define a rota atual da aplicação.
        """

        # Redirecionando com base na rota:
        if route == "/login":
            page.route = "/login"
            self.tela_de_login.exibirTelaDeLogin(page)        
        elif route == "/cadastro":
            page.route = "/cadastro"
            self.tela_de_cadastro.exibirTelaDeCadastro(page)
        

    def main(self, page: ft.Page):

        """
        Função principal da aplicação
        """
        
        page.title = "Gerenciamento PetShop"
        page.on_route_change = lambda event: self.route_change(page, page.route)
        self.iniciarConexaoComBancoDeDados() # Tendo conectar ao banco de dados.
        page.go('/cadastro')



# Inicia a execução da aplicação:
if __name__ == "__main__":
    aplicativo = Main()
    ft.app(target=aplicativo.main)