# Arquivo que contém a lógica de cadastro de usuários na aplicação:

# Imports usados:
import flet as ft
from gerenciador_banco_de_dados import GerenciadorDeBancoDeDados


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

        try:
            self.gerenciador_de_banco_de_dados.conectarBanco()
        except Exception as excessao:
            print(f"Erro ao iniciar conexão com o banco de dados: {excessao}")
        

