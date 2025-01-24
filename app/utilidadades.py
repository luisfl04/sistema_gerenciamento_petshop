# Arquivo que contém todas as funções que realizam alguma validação de valores de dados na aplicação. Todas
# as funções de validação estão na classe 'Utilidades'.

# Libs usadas:
from flet import SnackBar, Text
from gerenciador_banco_de_dados import GerenciadorDeBancoDeDados
from datetime import datetime

class Utilidades:

    """
    Classe com funções utilitárias para a aplicação.
    """

    def __init__(self):
        self.gerenciador_banco_de_dados = GerenciadorDeBancoDeDados()

    def verificarCampoVazioParaFormulario(self, page, valor_do_campo, nome_do_campo):
        """
        Função que verifica se o campo passado está vazio.
        """
        if not valor_do_campo:
            page.snack_bar = SnackBar(
                content= Text(f"Informe um valor para o {nome_do_campo}!"),
                bgcolor="red",
                duration=3000, 
            )
            page.snack_bar.open = True
            page.update()
            return False
    
    def verificarNumeroDeCaracteresDeCampoParaFormulario(self, page, valor_do_campo, nome_do_campo, caracteres_minimo, caracteres_maximo):
        """
        Função que verifica o número de caracteres de um campo de acordo com o nome do campo passado.
        """
        if len(valor_do_campo) < caracteres_minimo or len(valor_do_campo) > caracteres_maximo:
            page.snack_bar = SnackBar(
                content= Text(f"O {nome_do_campo} deve ter entre {caracteres_minimo} e {caracteres_maximo} caracteres!"),
                bgcolor="red",
                duration=3000, 
            )
            page.snack_bar.open = True
            page.update()
            return False


    def validarNomeESobrenomeNoCadastroDeUsuario(self, page, nome_passado, sobrenome_passado):
        """
        Função que valida o nome e sobrenome passados no cadastro em relação ao seu valor e número de caracteres.
        """
        self.verificarCampoVazioParaFormulario(page, nome_passado, "nome")
        self.verificarCampoVazioParaFormulario(page, sobrenome_passado, "sobrenome")
        self.verificarNumeroDeCaracteresDeCampoParaFormulario(page, nome_passado, "nome", 2, 30)
        self.verificarNumeroDeCaracteresDeCampoParaFormulario(page, sobrenome_passado, "sobrenome", 2, 30)

    
    def validarUsernameNoCadastroDeUsuario(self, page, username_passado):
        """
        Função que valida o username passado no cadastro. A validação é feita para verificar se o username já foi cadastrado 
        no banco de dados e se ele foi deixado vazio no momento do cadastro.
        """
        
        self.verificarCampoVazioNoCadastroDeUsuario(page, username_passado, "username")

        
        try:
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
        except:
            return False
            
    def validarEmailNoCadastroDeUsuario(self, page, email_passado):
        """
        Função que valida o email passado no cadastro. A validação é feita para verificar se o email já foi cadastrado 
        no banco de dados e se ele foi deixado vazio no momento do cadastro.
        """
        if not email_passado:
            page.snack_bar = SnackBar(
                content= Text("Informe um email!"),
                bgcolor="red",
                duration=3000, 
            )
            page.snack_bar.open = True
            page.update()
            return False
        else:
            consulta = f"SELECT * FROM USUARIO WHERE EMAIL = '{email_passado}'"
            resultado_da_consulta = self.gerenciador_banco_de_dados.executarConsulta(consulta)
            if resultado_da_consulta is not None:
                page.snack_bar = SnackBar(
                    content= Text("Email já cadastrado! Informe outro."),
                    bgcolor="red",
                    duration=3000, 
                )
                page.snack_bar.open = True
                page.update()
                return False
            
    def validarDataDeNascimentoNoCadastroDeUsuario(self, page, data_de_nascimento_passada):
        """
        Função que valida a data de nascimento passada no cadastro. A validação é feita para verificar se a data de nascimento 
        foi deixada vazia no momento do cadastro ou se a data informada é maior do que data equivalente a 16 anos atrás, de acordo
        com a data atual no momento da validação.
        """
        if not data_de_nascimento_passada:
            page.snack_bar = SnackBar(
                content= Text("Informe a data de nascimento!"),
                bgcolor="red",
                duration=3000, 
            )
            page.snack_bar.open = True
            page.update()
            return False
        else:
            data_atual = datetime.now()
            data_de_nascimento = datetime.strptime(data_de_nascimento_passada, "%Y-%m-%d")
            idade = data_atual.year - data_de_nascimento.year - ((data_atual.month, data_atual.day) < (data_de_nascimento.month, data_de_nascimento.day))
            print("idade passada -> ", idade)
            if idade < 16:
                page.snack_bar = SnackBar(
                    content= Text("Você deve ter mais de 16 anos para se cadastrar!"),
                    bgcolor="red",
                    duration=3000, 
                )
                page.snack_bar.open = True
                page.update()
                return False
            
    def formatarDataEmAnoMesDia(self, data_passada):
        """
        Função que formata a data no formato 'ano-mes-dia'.
        """
        try:
            return data_passada.strftime("%Y-%m-%d")
        except:
            return None
        
           
