# Este é o arquivo principal da aplicação, no qual a execulção é iniciada a partir dele. Ele contém a regra geral do negócio.

# Libs usadas:
import flet as ft

# Função principal da execução:
def main(page: ft.Page):
    page.add(ft.Text(value="Hello, world!"))
ft.app(main)