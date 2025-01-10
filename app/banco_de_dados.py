# Arquivo encarregado de se conectar ao banco de dados e manipulá-lo:

# Libs usadas:
import mysql.connector
from mysql.connector import Error

class GerenciadorDeBancoDeDados:

    """
    Classe com a lógica de manipulação do banco de dados da aplicação
    """

    def obterParametrosBancoDeDados(self):
        """
        Função que retorna os parâmetros de conexão ao banco de dados
        """
        return {
            "host": "luisfl-NCL60-61",
            "usuario": "root",
            "senha": "34512897",
            "nome_do_banco": "SISTEMA_PETSHOP"
        }

    # Parâmetros gerais para a conexão:

    def conectarBanco(self):
        """
        Função que realiza a conexão ao banco de dados
        """

        parametros = self.obterParametrosBancoDeDados()
        try:
            # Cria a conexão:
            conexao = mysql.connector.connect(
                host=parametros["host"],        
                user=parametros["usuario"],      
                password=parametros["senha"],     
                database=parametros["nome_do_banco"]
            )
            
            # Verificando:
            if conexao.is_connected():
                print("Conexão bem-sucedida ao banco de dados!")
                return conexao
        except Error as e:
            print(f"Erro ao conectar ao banco de dados: {e}")
            return None
        
    
