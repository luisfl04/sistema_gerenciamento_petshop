# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Imports usados:
import flet as ft
from banco_de_dados import GerenciadorDeBancoDeDados
from cadastro import exibirTelaDeCadastro
from  login import exibirTelaDeLogin

class GerenciadorRotasAplicacao:

    """
    Função que gerencia o fluxo de rotas da aplicação.
    """

    # Obtendo instância da página:
    pagina = ft.Page

    def obterRotaAtual(self):
       # Função que retorna a rota atual em que a aplicação está:
        return self.pagina.route

    def definirRotaAplicacao(self, rota_passada):
        # Função que define a rota atual da aplicação

        # Obtendo rota:
        self.pagina.route = rota_passada
        
        # Redirecionando para a rota:
        if rota_passada == "/":
            exibirTelaDeLogin()
        elif rota_passada == "/cadastro":
            exibirTelaDeCadastro()

# Função principal da execução:
def main(page: ft.Page):

    # Configurações gerais da aplicação:
    page.scroll = "auto"
    page.title = "Gerenciamento Petshop"
    
    # Rotas da aplicação:
    rotas = GerenciadorRotasAplicacao()
    rotas.definirRotaAplicacao("/cadastro")
    
    print("rota atual -> ", rotas.obterRotaAtual())




if __name__ == "__main__":
    ft.app(main)