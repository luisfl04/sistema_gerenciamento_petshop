# Arquivo que contém todas as funções que realizam alguma validação de valores de dados na aplicação. Todas
# as funções de validação estão na classe 'Utilidades'.

# Libs usadas:
from flet import SnackBar, Text


class Utilidades:

    """
    Classe com funções utilitárias para a aplicação.
    """

    def validarNomeESobrenomeNoCadastro(self, page, nome_passado, sobrenome_passado):
        """
        Função que valida o nome e sobrenome passados no cadastro.
        """
        if not nome_passado or not sobrenome_passado:
            page.snack_bar = SnackBar(
                content= Text("Informe os valores para nome e sobrenome!"),
                bgcolor="red",
                duration=3000,  # Duração em milissegundos
            )
            page.snack_bar.open = True
            page.update()
            return False
        
    def validar
