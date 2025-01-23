# Arquivo encarregado de se conectar ao banco de dados e manipulá-lo:

# Libs usadas:
import mysql.connector
from mysql.connector import Error


class GerenciadorDeBancoDeDados:

    """
    Classe com a lógica de manipulação do banco de dados da aplicação
    """

    def __init__(self):
        self.conexao = self.conectarBanco()


    def obterParametrosBancoDeDados(self):
        """
        Função que retorna os parâmetros de conexão ao banco de dados
        """
        return {
            "host": "luisfl-NCL60-61",
            "usuario": "root",
            "senha": "34512897",
            "nome_do_banco": "DADOS_PETSHOP"
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
                return conexao
        except Error as e:
            print(f"Erro ao conectar ao banco de dados: {e}")
            self.desconectarBanco(conexao)
            return None
    
    def desconectarBanco(self, conexao):
        """
        Função que desconecta do banco de dados
        """
        
        try:
            conexao.close()
            print("Desconectado do banco de dados!")
        except Error as e:
            print(f"Erro ao desconectar do banco de dados: {e}")
            return None
        
    def executarConsulta(self, consulta):
        """
        Função que executa uma consulta no banco de dados.
        Retorna uma lista de valores se houver resultados ou None se não houver.
        """

        conexao_banco_de_dados = self.conexao
        cursor = conexao_banco_de_dados.cursor()

        try:
            cursor.execute(consulta)
            resultados_da_consulta = cursor.fetchall()

            if resultados_da_consulta:
                return [linha for linha in resultados_da_consulta] 
            else:
                return None  
        except Error as e:
            return "Erro ao executar a consulta: " + str(e)
        finally:
            cursor.close()

        
    
