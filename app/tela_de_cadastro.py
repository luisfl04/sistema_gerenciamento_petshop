# Arquivo que contém a lógica de cadastro de usuários na aplicação:

# Imports usados:
import flet as ft
from gerenciador_banco_de_dados import GerenciadorDeBancoDeDados
from flet import Page, Text, TextField, Dropdown, dropdown, ElevatedButton, Column, Container, alignment, SnackBar, TextButton
from utilidadades import Utilidades

class TelaDeCadastro:

    """
    Classe com a lógica de cadastro de usuários na aplicação.
    """

    def __init__(self):
        # Instâncias usadas na classe:
        self.gerenciador_de_banco_de_dados = GerenciadorDeBancoDeDados()
        self.utilidades = Utilidades()


    def exibirTelaDeCadastro(self, page: Page):
        
        """
        Função que exibe os componentes pertencentes à tela de cadastro de usuários.
        """

        # Configurações gerais da página
        self.definirConfiguracoesGeraisCadastro(page)

        # Criando todos os componentes do formulário:
        componentes_da_tela = self.criarComponentesTelaDeCadastro(page) 
        
        # Estrutura do formulário
        formulario = Column(
            controls=[
                self.nome,
                self.sobrenome,
                self.username,
                self.email,
                self.data_nascimento,
                self.sexo,
                self.tipo_usuario,
                self.criar_senha,
                self.confirmar_senha,
                componentes_da_tela["botao_cadastrar"],
                componentes_da_tela["botao_login"]
            ],
            horizontal_alignment="center"
        )
        
        # Container principal
        container_principal_da_tela = Container(
            content=Column(
                controls=[componentes_da_tela["titulo"], formulario],
                alignment="center"
            ),
            alignment=alignment.center
        )
        
        # Adicionando o conteúdo à página
        page.add(container_principal_da_tela)

        
    def definirConfiguracoesGeraisCadastro(self, page):
        """
        Função que define as configurações gerais da tela de cadastro de usuários.
        """

        page.title = "Cadastro de usuário"
        page.vertical_alignment = ft.MainAxisAlignment.CENTER
        page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    def criarComponentesTelaDeCadastro(self, page):
        """
        Cria e retorna os componentes da tela de cadastro.
        """

        self.nome = TextField(label="Nome", hint_text="Digite o seu nome")
        self.sobrenome = TextField(label="Sobrenome", hint_text="Digite o seu sobrenome")
        self.username = TextField(label="Username", hint_text="Digite o seu username")
        self.email = TextField(label="Email", hint_text="Digite o seu email")
        self.data_nascimento = TextField(label="Data de Nascimento", hint_text="DD/MM/AAAA")
        self.sexo = Dropdown(
            label="Sexo",
            options=[
                dropdown.Option(key="masculino", text="Masculino"),
                dropdown.Option(key="feminino", text="Feminino"),
                dropdown.Option(key="nao_declarar", text="Prefiro não declarar")
            ]
        )
        self.tipo_usuario = Dropdown(
            label="Tipo de Usuário",
            options=[
                dropdown.Option(key="GERENTE", text="Gerente"),
                dropdown.Option(key="VETERINARIO", text="Veterinário"),
                dropdown.Option(key="FUNCIONARIO", text="Funcionário"),
                dropdown.Option(key="CLIENTE", text="Cliente")
            ]
        )
        self.criar_senha = TextField(label="Criar Senha", password=True, max_length=14)
        self.confirmar_senha = TextField(label="Confirmar Senha", password=True, max_length=14)

        return {
            "titulo": Text(
                value="Cadastro de Usuários",
                size=24,
                weight="bold",
                text_align="center"
            ),
            "botao_cadastrar": ElevatedButton(
                text="Cadastrar",
                on_click=lambda e: self.validarValoresFormulario(page)
            ),
            "botao_login": ElevatedButton(
                text="Fazer login",
                on_click=lambda e: page.go('/login')
            )
        }

        
    def validarValoresFormulario(self, page):
        """
        Função que valida os valores do formulário de cadastro antes da de cadastrar no banco de dados.
        """
        nome = self.nome.value
        sobrenome = self.sobrenome.value
        senha = self.criar_senha.value
        confirmar_senha = self.confirmar_senha.value

        # Validações dos valores do formulário:
        self.utilidades.validarNomeESobrenomeNoCadastroDeUsuario(page, nome, sobrenome) # Validando nome e sobrenome
        self.utilidades.validarUsernameNoCadastroDeUsuario(page, self.username.value) # Validando username
    
        # Validando se senhas coincidem:
        if senha != confirmar_senha:
            page.snack_bar = SnackBar(
                content=Text("As senhas não coincidem! Informe novamente"),
                bgcolor="red",
                duration=3000,  # Duração em milissegundos
            )
            page.snack_bar.open = True
            page.update()
            return

        # Validando se a senha tem entre 8 e 14 caracteres:
        if len(senha) < 8 or len(senha) > 14:
            page.snack_bar = SnackBar(
                content=Text("A senha deve ter entre 8 e 14 caracteres!"),
                bgcolor="red",
                duration=3000,  # Duração em milissegundos
            )
            page.snack_bar.open = True
            page.update()
            return

        # Caso todas as validações passem
        print("Formulário validado com sucesso!")


    def processarCadastroNoBancoDeDados(self):
        pass



        

