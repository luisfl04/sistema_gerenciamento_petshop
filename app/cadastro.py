# Arquivo que contém a lógica de cadastro de usuários na aplicação:

# Imports usados:
import flet as ft
from banco_de_dados import GerenciadorDeBancoDeDados


class TelaDeCadastro:

    """
    Classe com a lógica de cadastro de usuários na aplicação.
    """

    def __init__(self):
        # Instâncias usadas na classe:
        self.gerenciador_de_banco_de_dados = GerenciadorDeBancoDeDados()

    def exibirTelaDeCadastro(self, page):

        """
        Função que exibe os componentes pertencentes a tela de cadastro de usuários.
        """
        
        # Inicializações gerais:
        self.definirConfiguracoesGeraisCadastro(page) # Definindo configurações gerais da página.
        self.iniciarConexaoComBancoDeDados() # Criando conexão com o banco de dados
        

        


        botao_login = ft.ElevatedButton(
            text="Voltar para tela de login",
            on_click=lambda _: page.go("/")
        )

        texto = ft.Text("Tela de cadastro")
        page.controls.clear()
        page.controls.append(
            ft.Container(
                content=ft.Column(
                    controls=[
                        texto,
                        botao_login
                    ]
                ),
                alignment=ft.alignment.center
            )

        )
        page.update()

    def definirConfiguracoesGeraisCadastro(self, page):
        """
        Função que define as configurações gerais da tela de cadastro de usuários.
        """

        page.title = "Cadastro de usuário"
        page.vertical_alignment = ft.MainAxisAlignment.CENTER
        page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    def iniciarConexaoComBancoDeDados(self):
        """
        Função que inicia a conexão com o banco de dados.
        """

        self.gerenciador_de_banco_de_dados.conectarBanco()
        

