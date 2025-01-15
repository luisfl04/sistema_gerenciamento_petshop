# Arquivo que contém a lógica de cadastro de usuários na aplicação:

# Imports usados:
import flet as ft


class TelaDeCadastro:

    """
    Classe com a lógica de cadastro de usuários na aplicação.
    """

        
    def exibirTelaDeCadastro(self, page):

        """
        Função que exibe os componentes pertencentes a tela de cadastro de usuários.
        """
        
        self.definirConfiguracoesGeraisCadastro(page) # Definindo configurações gerais da página.


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

