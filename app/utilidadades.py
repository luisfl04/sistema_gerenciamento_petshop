# Arquivo que contém todas as funções que realizam alguma validação de valores de dados na aplicação. Todas
# as funções de validação estão na classe 'Utilidades'.

# Libs usadas:
from flet import SnackBar, Text
from gerenciador_banco_de_dados import GerenciadorDeBancoDeDados

class Utilidades:

    """
    Classe com funções utilitárias para a aplicação.
    """

    def __init__(self):
        self.gerenciador_banco_de_dados = GerenciadorDeBancoDeDados()


    def validarNomeESobrenomeNoCadastroDeUsuario(self, page, nome_passado, sobrenome_passado):
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
    
    def validarUsernameNoCadastroDeUsuario(self, page, username_passado):
        """
        Função que valida o username passado no cadastro. A validação é feita para verificar se o username já foi cadastrado 
        no banco de dados e se ele foi deixado vazio no momento do cadastro.
        """
        if not username_passado:
            # Adicionando snackbar de erro na tela:
            page.snack_bar = SnackBar(
                content= Text("Informe um nome de usuário!"),
                bgcolor="red",
                duration=3000, 
            )
            page.snack_bar.open = True
            page.update()
            return False
        else:
            # Validando se o username já foi cadastrado no banco de dados:
            consulta = f"SELECT * FROM USUARIO WHERE USERNAME = '{username_passado}'"
            resultado_da_consulta = self.gerenciador_banco_de_dados.executarConsulta(consulta)
            if resultado_da_consulta is not None:
                page.snack_bar = SnackBar(
                    content= Text("Nome de usuário já cadastrado! Informe outro."),
                    bgcolor="red",
                    duration=3000, 
                )
                page.snack_bar.open = True
                page.update()
                return False


    

           
