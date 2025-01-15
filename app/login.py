# Arquivo que contém a lógica de login da aplicação:

# Imports usados:
import flet as ft


class TelaDeLogin:

    """
    Classe que contém toda a lógica e métodos usados na tela de login da aplicação.
    """

    def exibirTelaDeLogin(page):

        print(page.route)

        # Função que exibe a tela de cadastro de usuários:
        page.controls.clear()
        page.title = "Tela de login"
        page.vertical_alignment = ft.MainAxisAlignment.CENTER
        page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

        texto = ft.Text("Tela de login")
        page.controls.append(
            ft.Container(
                content=ft.Column(
                    controls=[
                        texto
                    ]
                ),
                alignment=ft.alignment.center
            )

        )
        page.update()