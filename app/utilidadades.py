# Arquivo que contém todas as funções que realizam alguma validação de valores de dados na aplicação. Todas
# as funções de validação estão na classe 'Utilidades'.

# Libs usadas:
import flet as ft


class Utilidades:

    """
    Classe com funções utilitárias para a aplicação.
    """


    if not nome or not sobrenome:
        page.snack_bar = SnackBar(
            content=Text("Informe os valores para nome e sobrenome!"),
            bgcolor="red",
            duration=3000,  # Duração em milissegundos
            action=TextButton("OK", on_click=lambda e: print("Usuário clicou em OK"))
        )
        page.snack_bar.open = True
        page.update()