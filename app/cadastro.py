# Arquivo que contém a lógica de cadastro de usuários na aplicação:

# Imports usados:
import flet as ft

def exibirTelaDeCadastro(page: ft.Page):

    # Função que exibe a tela de cadastro de usuários:
    page.title = "Tela de cadastro"
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

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



