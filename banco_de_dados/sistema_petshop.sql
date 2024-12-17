-- ******** SCRIPT DE CRIAÇÃO DO BANCO DE DADOS DE UM SISTEMA QUE FAZ O GERENCIAMENTO DE UM PETSHOP ******************

-- ******* TABELA GERENTE *******
CREATE TABLE GERENTE(
ID_GERENTE INT NOT NULL AUTO_INCREMENT,
CODIGO_GERENTE CHAR(3) NOT NULL,
NOME VARCHAR(30) NOT NULL,
SOBRENOME VARCHAR(30) NOT NULL,
NOME_COMPLETO VARCHAR(100) ,
DATA_DE_NASCIMENTO DATE NOT NULL,
IDADE INT,
-- CHAVES:
PRIMARY KEY(ID_GERENTE)
);

-- CRIANDO TRIGGER QUE POPULA A COLUNA 'NOME_COMPLETO' DE ACORDO COM O VALOR DE 'NOME' E 'SOBRENOME' INSERIDOS:
DELIMITER $$ 

CREATE TRIGGER POPULAR_NOME_COMPLETO_GERENTE
BEFORE INSERT ON GERENTE 
FOR EACH ROW 
BEGIN 
	SET NEW.NOME_COMPLETO = CONCAT(NEW.NOME, ' ', NEW.SOBRENOME);
END $$

DELIMITER ;

-- CRIANDO TRIGGER QUE POPULA O CAMPO 'IDADE' DE ACORDO COM O VALOR PASSADO EM 'DATA_DE_NASCIMENTO':
DELIMITER $$
CREATE TRIGGER POPULAR_IDADE_GERENTE
BEFORE INSERT ON GERENTE
FOR EACH ROW

BEGIN
	SET NEW.IDADE = TIMESTAMPDIFF(YEAR, NEW.DATA_DE_NASCIMENTO, CURDATE());
END $$

DELIMITER ;

-- POPULANDO A TABELA:
INSERT INTO GERENTE(CODIGO_GERENTE, NOME, SOBRENOME, DATA_DE_NASCIMENTO)
VALUES
('G45', 'SERGIO', 'BARROS', '1980-02-12'),
('G63', 'ARTEMÁRIA', 'SANTOS', '1975-06-06');

-- ******** TABELA VETERINARIO *******************
CREATE TABLE VETERINARIO(
ID_VETERINARIO INT NOT NULL AUTO_INCREMENT,
CODIGO_VETERINARIO CHAR(3) NOT NULL,
NOME VARCHAR(30) NOT NULL,
SOBRENOME VARCHAR(30) NOT NULL,
NOME_COMPLETO VARCHAR(100) ,
DATA_DE_NASCIMENTO DATE NOT NULL,
IDADE INT,
SEXO CHAR(1) NOT NULL,
CODIGO_CFMV CHAR(5) NOT NULL,
ESPECIALIZACAO VARCHAR(30),
DATA_DE_ADMISSAO DATE NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_VETERINARIO)
);

-- TRIGGER PARA NOME COMPLETO:
DELIMITER $$ 

CREATE TRIGGER POPULAR_NOME_COMPLETO_VETERINARIO
BEFORE INSERT ON VETERINARIO 
FOR EACH ROW 
BEGIN 
	SET NEW.NOME_COMPLETO = CONCAT(NEW.NOME, ' ', NEW.SOBRENOME);
END $$

DELIMITER ;

-- TRIGGER PARA IDADE:
DELIMITER $$

CREATE TRIGGER POPULAR_IDADE_VETERINARIO
BEFORE INSERT ON VETERINARIO
FOR EACH ROW
BEGIN
	SET NEW.IDADE = TIMESTAMPDIFF(YEAR, NEW.DATA_DE_NASCIMENTO, CURDATE());
END $$

DELIMITER ;

-- POPULANDO VALORES:
INSERT INTO VETERINARIO 
(CODIGO_VETERINARIO, NOME, SOBRENOME, DATA_DE_NASCIMENTO, SEXO, CODIGO_CFMV, ESPECIALIZACAO, DATA_DE_ADMISSAO)
VALUES
('V01', 'Marcos', 'Silva', '1985-07-12', 'M', '12345', 'Dermatologia', '2022-01-15'),
('V27', 'Ana', 'Souza', '1990-03-22', 'F', '98765', NULL, '2023-02-10'),
('V43', 'Pedro', 'Almeida', '1982-11-05', 'M', '54321', 'Cirurgia', '2021-12-01'),
('V09', 'Carla', 'Ferreira', '1987-05-19', 'F', '11111', 'Cardiologia', '2022-04-25'),
('V56', 'João', 'Pereira', '1992-08-30', 'M', '22222', NULL, '2023-05-10'),
('V78', 'Fernanda', 'Lima', '1980-01-10', 'F', '33333', 'Neurologia', '2021-09-14'),
('V65', 'Ricardo', 'Rodrigues', '1988-10-07', 'M', '44444', 'Oftalmologia', '2022-11-30'),
('V34', 'Mariana', 'Costa', '1991-12-25', 'F', '55555', NULL, '2023-06-20'),
('V02', 'Felipe', 'Gomes', '1983-09-11', 'M', '66666', 'Ortopedia', '2021-07-07'),
('V99', 'Paula', 'Mendes', '1989-02-28', 'F', '77777', NULL, '2022-10-15');
 
-- ********** TABELA FUNCIONARIO *******************
CREATE TABLE FUNCIONARIO(
ID_FUNCIONARIO INT NOT NULL AUTO_INCREMENT,
CODIGO_FUNCIONARIO CHAR(5) NOT NULL,
NOME VARCHAR(30) NOT NULL,
SOBRENOME VARCHAR(30) NOT NULL,
NOME_COMPLETO VARCHAR(100) ,
DATA_DE_NASCIMENTO DATE NOT NULL,
IDADE INT,
SEXO CHAR(1) NOT NULL,
DATA_DE_ADMISSAO DATE NOT NULL,
CARGO VARCHAR(20) NOT NULL,
TURNO VARCHAR(20) NOT NULL,
ESCALA_DE_TRABALHO CHAR(4) NOT NULL, 
TEMPO_NA_EMPRESA INT NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_FUNCIONARIO)
);

-- TRIGGER QUE DÁ O VALOR DE 'TEMPO_NA_EMPRESA' DE ACORDO COM O VALOR DA 'DATA_DE_ADMISSAO':
DELIMITER $$

CREATE TRIGGER POPULAR_TEMPO_NA_EMPRESA_FUNCIONARIO
BEFORE INSERT ON FUNCIONARIO
FOR EACH ROW

BEGIN 
	SET NEW.TEMPO_NA_EMPRESA = TIMESTAMPDIFF(YEAR, NEW.DATA_DE_ADMISSAO, CURDATE());
END $$
DELIMITER ;

-- TRIGGER PARA NOME COMPLETO:
DELIMITER $$ 

CREATE TRIGGER POPULAR_NOME_COMPLETO_FUNCIONARIO
BEFORE INSERT ON FUNCIONARIO
FOR EACH ROW 
BEGIN 
	SET NEW.NOME_COMPLETO = CONCAT(NEW.NOME, ' ', NEW.SOBRENOME);
END $$

DELIMITER ;

-- TRIGGER PARA IDADE:
DELIMITER $$

CREATE TRIGGER POPULAR_IDADE_FUNCIONARIO
BEFORE INSERT ON FUNCIONARIO
FOR EACH ROW

BEGIN
	SET NEW.IDADE = TIMESTAMPDIFF(YEAR, NEW.DATA_DE_NASCIMENTO, CURDATE());
END $$

DELIMITER ;

-- POPULANDO TABELA:
INSERT INTO FUNCIONARIO 
(CODIGO_FUNCIONARIO, NOME, SOBRENOME, DATA_DE_NASCIMENTO, SEXO, DATA_DE_ADMISSAO, CARGO, TURNO, ESCALA_DE_TRABALHO)
VALUES
('F4823', 'Marcos', 'Silva', '1985-07-12', 'M', '2022-01-15', 'ATENDENTE', 'MANHA', '5X1'),
('F9361', 'Ana', 'Santos', '1990-03-22', 'F', '2023-02-10', 'VENDEDOR', 'TARDE', '5X2'),
('F1237', 'Pedro', 'Oliveira', '1982-11-05', 'M', '2021-12-01', 'ENTREGADOR', 'INTEGRAL', '6X1'),
('F7450', 'Carla', 'Ferreira', '1987-05-19', 'F', '2022-04-25', 'SERVIÇOS GERAIS', 'MANHA', '4X2'),
('F9999', 'João', 'Costa', '1992-08-30', 'M', '2023-05-10', 'SUPORTE TI', 'TARDE', '4X3'),
('F1001', 'Fernanda', 'Rodrigues', '1980-01-10', 'F', '2021-09-14', 'SEGURANÇA', 'INTEGRAL', '24X48'),
('F5512', 'Ricardo', 'Gomes', '1988-10-07', 'M', '2022-11-30', 'ATENDENTE', 'MANHA', '16X32'),
('F3204', 'Mariana', 'Martins', '1991-12-25', 'F', '2023-06-20', 'VENDEDOR', 'TARDE', '5X1'),
('F4508', 'Felipe', 'Almeida', '1983-09-11', 'M', '2021-07-07', 'ENTREGADOR', 'INTEGRAL', '5X2'),
('F8722', 'Paula', 'Pereira', '1989-02-28', 'F', '2022-10-15', 'SERVIÇOS GERAIS', 'MANHA', '6X1'),
('F6143', 'Renato', 'Silva', '1981-03-10', 'M', '2023-03-01', 'SUPORTE TI', 'TARDE', '4X2'),
('F4875', 'Roberta', 'Santos', '1986-06-18', 'F', '2021-11-12', 'SEGURANÇA', 'INTEGRAL', '4X3'),
('F2094', 'Gustavo', 'Oliveira', '1984-12-30', 'M', '2022-05-25', 'ATENDENTE', 'MANHA', '24X48'),
('F7720', 'Luciana', 'Ferreira', '1985-10-23', 'F', '2023-01-10', 'VENDEDOR', 'TARDE', '16X32'),
('F3456', 'André', 'Costa', '1990-04-05', 'M', '2021-08-15', 'ENTREGADOR', 'INTEGRAL', '5X1'),
('F9821', 'Patrícia', 'Rodrigues', '1983-11-29', 'F', '2022-12-05', 'SERVIÇOS GERAIS', 'MANHA', '5X2'),
('F1104', 'Sérgio', 'Gomes', '1979-07-07', 'M', '2023-07-20', 'SUPORTE TI', 'TARDE', '6X1'),
('F5627', 'Adriana', 'Martins', '1981-01-31', 'F', '2021-10-27', 'SEGURANÇA', 'INTEGRAL', '4X2'),
('F6741', 'Fábio', 'Almeida', '1987-02-15', 'M', '2022-09-03', 'ATENDENTE', 'MANHA', '4X3'),
('F9932', 'Isabela', 'Pereira', '1990-09-09', 'F', '2023-04-11', 'VENDEDOR', 'TARDE', '24X48'),
('F2105', 'Tiago', 'Silva', '1982-08-12', 'M', '2021-06-22', 'ENTREGADOR', 'INTEGRAL', '16X32'),
('F3349', 'Flávia', 'Santos', '1991-05-02', 'F', '2022-03-19', 'SERVIÇOS GERAIS', 'MANHA', '5X1'),
('F4120', 'Leandro', 'Oliveira', '1983-06-21', 'M', '2023-08-05', 'SUPORTE TI', 'TARDE', '5X2'),
('F5278', 'Camila', 'Ferreira', '1985-03-08', 'F', '2021-09-25', 'SEGURANÇA', 'INTEGRAL', '6X1'),
('F1684', 'Rafael', 'Costa', '1989-12-11', 'M', '2022-07-30', 'ATENDENTE', 'MANHA', '4X2'),
('F9457', 'Juliana', 'Rodrigues', '1988-11-17', 'F', '2023-03-28', 'VENDEDOR', 'TARDE', '4X3'),
('F3033', 'Bruno', 'Gomes', '1979-10-05', 'M', '2021-12-10', 'ENTREGADOR', 'INTEGRAL', '24X48'),
('F7771', 'Larissa', 'Martins', '1986-01-25', 'F', '2022-01-29', 'SERVIÇOS GERAIS', 'MANHA', '16X32'),
('F1239', 'Vitor', 'Almeida', '1990-11-04', 'M', '2023-02-14', 'SUPORTE TI', 'TARDE', '5X1'),
('F8882', 'Gabriela', 'Pereira', '1984-04-30', 'F', '2021-07-18', 'SEGURANÇA', 'INTEGRAL', '5X2'),
('F4567', 'César', 'Silva', '1987-09-15', 'M', '2022-10-07', 'ATENDENTE', 'MANHA', '6X1'),
('F6543', 'Aline', 'Santos', '1978-02-27', 'F', '2023-05-22', 'VENDEDOR', 'TARDE', '4X2'),
('F2222', 'Hugo', 'Oliveira', '1985-08-19', 'M', '2021-11-30', 'ENTREGADOR', 'INTEGRAL', '4X3'),
('F1010', 'Tatiana', 'Ferreira', '1992-07-01', 'F', '2022-04-08', 'SERVIÇOS GERAIS', 'MANHA', '24X48'),
('F3698', 'Daniel', 'Costa', '1981-06-16', 'M', '2023-01-28', 'SUPORTE TI', 'TARDE', '16X32'),
('F4781', 'Vanessa', 'Rodrigues', '1989-03-03', 'F', '2021-08-20', 'SEGURANÇA', 'INTEGRAL', '5X1'),
('F5690', 'Rodrigo', 'Gomes', '1983-02-22', 'M', '2022-06-06', 'ATENDENTE', 'MANHA', '5X2'),
('F6743', 'Beatriz', 'Martins', '1988-12-18', 'F', '2023-09-14', 'VENDEDOR', 'TARDE', '6X1'),
('F9802', 'Alexandre', 'Almeida', '1991-01-07', 'M', '2021-10-03', 'ENTREGADOR', 'INTEGRAL', '4X2'),
('F4571', 'Paulo', 'Pereira', '1984-05-26', 'M', '2022-05-17', 'SERVIÇOS GERAIS', 'MANHA', '4X3'),
('F3199', 'Mara', 'Silva', '1986-10-29', 'F', '2023-03-13', 'SUPORTE TI', 'TARDE', '24X48'),
('F2345', 'Gilson', 'Santos', '1979-09-20', 'M', '2021-12-22', 'SEGURANÇA', 'INTEGRAL', '16X32'),
('F8890', 'Nathalia', 'Oliveira', '1992-04-14', 'F', '2022-02-11', 'ATENDENTE', 'MANHA', '5X1'),
('F1009', 'Marisol', 'Ferreira', '1980-03-27', 'F', '2023-07-15', 'VENDEDOR', 'TARDE', '5X2'),
('F5566', 'Vinícius', 'Costa', '1982-11-11', 'M', '2021-09-05', 'ENTREGADOR', 'INTEGRAL', '6X1'),
('F3131', 'Sandra', 'Rodrigues', '1989-08-07', 'F', '2022-11-23', 'SERVIÇOS GERAIS', 'MANHA', '4X2'),
('F2233', 'Cláudio', 'Gomes', '1985-02-13', 'M', '2023-06-30', 'SUPORTE TI', 'TARDE', '4X3'),
('F9575', 'Elaine', 'Martins', '1987-05-06', 'F', '2021-08-02', 'SEGURANÇA', 'INTEGRAL', '24X48'),
('F4466', 'Renata', 'Almeida', '1990-10-02', 'F', '2022-09-29', 'ATENDENTE', 'MANHA', '16X32'),
('F7284', 'Julio', 'Pereira', '1984-01-21', 'M', '2023-04-05', 'VENDEDOR', 'TARDE', '5X1'),
('F9901', 'Mirela', 'Silva', '1988-03-15', 'F', '2021-07-27', 'ENTREGADOR', 'INTEGRAL', '5X2'),
('F3002', 'Leila', 'Santos', '1979-11-25', 'F', '2022-03-15', 'SERVIÇOS GERAIS', 'MANHA', '6X1'),
('F1111', 'Fábia', 'Oliveira', '1983-09-29', 'F', '2023-05-09', 'SUPORTE TI', 'TARDE', '4X2'),
('F7777', 'Sandro', 'Ferreira', '1985-12-13', 'M', '2021-10-18', 'SEGURANÇA', 'INTEGRAL', '4X3');

-- ************* TABELA CLIENTE *****************
CREATE TABLE CLIENTE(
ID_CLIENTE INT NOT NULL AUTO_INCREMENT,
CODIGO_CLIENTE CHAR(5) NOT NULL,
CPF CHAR(11) NOT NULL,
NOME VARCHAR(30) NOT NULL,
SOBRENOME VARCHAR(30) NOT NULL,
NOME_COMPLETO VARCHAR(100) ,
DATA_DE_NASCIMENTO DATE NOT NULL,
IDADE INT,
SEXO CHAR(1) NOT NULL,
TELEFONE CHAR(11) NOT NULL,
EMAIL VARCHAR(40) NOT NULL,
CIDADE_ATUAL VARCHAR(30) NOT NULL,
ESTADO_ATUAL VARCHAR(30) NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_CLIENTE)
);

-- TRIGGER PARA NOME COMPLETO:
DELIMITER $$ 

CREATE TRIGGER POPULAR_NOME_COMPLETO_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW 
BEGIN 
	SET NEW.NOME_COMPLETO = CONCAT(NEW.NOME, ' ', NEW.SOBRENOME);
END $$

DELIMITER ;

-- TRIGGER PARA IDADE:
DELIMITER $$

CREATE TRIGGER POPULAR_IDADE_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW

BEGIN
	SET NEW.IDADE = TIMESTAMPDIFF(YEAR, NEW.DATA_DE_NASCIMENTO, CURDATE());
END $$

DELIMITER ;

-- POPULANDO A TABELA:
-- A INSERÇÃO DE VALORES FICOU EM UM ARQUIVO SEPARADO 'insercao_clientes.sql'. VISTO A QUANTIDADE DE VALORES.

-- ************ TABELA TIPO_DE_USUARIO ----------------
CREATE TABLE TIPO_DE_USUARIO(
NUMERO_DO_TIPO INT NOT NULL,
NOME_DO_TIPO VARCHAR(20) NOT NULL
);

-- POPULANDO OS VALORES:
INSERT INTO TIPO_DE_USUARIO(NUMERO_DO_TIPO, NOME_DO_TIPO)
VALUES
(1, 'GERENTE'),
(2, 'MÉDICO VETERINÁRIO'),
(3, 'FUNCIONARIO'),
(4, 'CLIENTE');

-- ****************** TABELA SERVICO_OFERECIDO ********************
CREATE TABLE SERVICO_OFERECIDO(
ID_SERVICO_OFERECIDO INT NOT NULL AUTO_INCREMENT,
NOME_DO_SERVICO VARCHAR(30) NOT NULL,
TIPO_DE_SERVICO VARCHAR(10) NOT NULL, 
VALOR_DO_SERVICO DECIMAL(10,2) NOT NULL,
-- CHAVES:
PRIMARY KEY(ID_SERVICO_OFERECIDO)
);

-- POPULANDO A TABELA:
INSERT INTO SERVICO_OFERECIDO (NOME_DO_SERVICO, TIPO_DE_SERVICO, VALOR_DO_SERVICO) VALUES
('Banho e Tosa', 'PRESENCIAL', 80.00),
('Consulta Veterinária', 'PRESENCIAL', 150.00),
('Vacinação', 'PRESENCIAL', 120.00),
('Adoção Online', 'ONLINE', 0.00),
('Pet Shop Virtual', 'ONLINE', 50.00),
('Adestramento Básico', 'PRESENCIAL', 300.00),
('Hotel para Pets (diária)', 'PRESENCIAL', 200.00),
('Transporte para Pets', 'PRESENCIAL', 60.00),
('Corte de Unhas', 'PRESENCIAL', 40.00),
('Hidratação de Pelos', 'PRESENCIAL', 90.00),
('Consulta Online', 'ONLINE', 100.00),
('Planejamento Nutricional', 'ONLINE', 180.00),
('Banho Aromático', 'PRESENCIAL', 100.00),
('Day Care para Pets', 'PRESENCIAL', 250.00),
('Aplicação de Medicamentos', 'PRESENCIAL', 70.00),
('Loja de Acessórios Online', 'ONLINE', 40.00),
('Passeio Monitorado', 'PRESENCIAL', 120.00),
('Sessão de Fisioterapia', 'PRESENCIAL', 220.00),
('Banho Medicamentoso', 'PRESENCIAL', 110.00),
('Check-up Veterinário Online', 'ONLINE', 130.00);

-- ************* TABELA PRODUTO *********************
-- CRIANDO TABELA:
CREATE TABLE PRODUTO(
ID_PRODUTO INT NOT NULL AUTO_INCREMENT,
NOME_DO_PRODUTO VARCHAR(50) NOT NULL,
CODIGO_DO_PRODUTO CHAR(6) NOT NULL,
PRECO_DO_PRODUTO DECIMAL(10,2) NOT NULL,
DATA_DE_CADASTRO DATE,
DATA_DE_VENCIMENTO DATE,
-- CHAVES:
PRIMARY KEY(ID_PRODUTO, CODIGO_DO_PRODUTO)
);

-- CRIANDO TRIGGER QUE POPULA O VALOR DE 'DATA_DE_CADASTRO' DE ACORDO COM A DATA ATUAL NO MOMENTO DO CADASTRO:
DELIMITER $$
CREATE TRIGGER POPULAR_DATA_DE_CADASTRO_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW

BEGIN
	SET NEW.DATA_DE_CADASTRO = NOW();
END $$

DELIMITER ;

-- POPULANDO A TABELA COM UM VALOR:
INSERT INTO PRODUTO(NOME_DO_PRODUTO, CODIGO_DO_PRODUTO, PRECO_DO_PRODUTO, DATA_DE_VENCIMENTO)
VALUES
('VESTIDO VERMELHO', 'P67891', 200.10, '2004-05-13');

-- ******************* TABELA ESTOQUE **********************
-- CRIANDO TABELA:
CREATE TABLE ESTOQUE(
NUMERO_DO_PRODUTO INT NOT NULL,
CODIGO_DO_PRODUTO CHAR(6) NOT NULL,
QUANTIDADE_EM_ESTOQUE INT NOT NULL,
VALOR_EM_MERCADORIA DECIMAL(10,2),

-- CHAVES:
CONSTRAINT CHAVE_PARA_ID_DO_PRODUTO_NO_ESTOQUE FOREIGN KEY(NUMERO_DO_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO),
CONSTRAINT CHAVE_PARA_CODIGO_DO_PRODUTO_NO_ESTOQUE FOREIGN KEY(CODIGO_DO_PRODUTO) REFERENCES PRODUTO(CODIGO_DO_PODUTO)
);

/* TRIGGER QUE POPULA O VALOR DE 'VALOR_EM_MERCADORIA' A PARTIR DO PREÇO UNITÁRIO DO PRODUTO 
E DA QUANTIDADE ARMAZENADA EM ESTOQUE */
DELIMITER $$
CREATE TRIGGER POPULAR_VALOR_EM_MERCADORIA
BEFORE INSERT ON ESTOQUE
FOR EACH ROW

BEGIN 
	SET NEW.VALOR_EM_MERCADORIA = (SELECT PRECO_DO_PRODUTO FROM PRODUTO WHERE ID_PRODUTO = NEW.NUMERO_DO_PRODUTO) 
    * NEW.QUANTIDADE_EM_ESTOQUE;
END $$

DELIMITER ;

-- POPULANDO A TABELA COM UM VALOR:
INSERT INTO ESTOQUE(NUMERO_DO_PRODUTO, CODIGO_DO_PRODUTO, QUANTIDADE_EM_ESTOQUE)
VALUES
(69, 'P67891', 10);


--  ************** TABELA VENDA_FEITA *******************
CREATE TABLE VENDA_FEITA(
ID_VENDA INT NOT NULL AUTO_INCREMENT,
NUMERO_DO_PRODUTO INT NOT NULL,
QUANTIDADE_VENDIDA INT NOT NULL,
DATA_DA_VENDA DATE NOT NULL,
CLIENTE_COMPRADOR INT NOT NULL,
TIPO_DE_VENDA VARCHAR(15) NOT NULL,
VALOR_DA_VENDA DECIMAL(10,2) NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_VENDA),
CONSTRAINT CHAVE_PARA_O_PRODUTO_NA_VENDA FOREIGN KEY(NUMERO_DO_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO),
CONSTRAINT CHAVE_PARA_O_CLIENTE FOREIGN KEY(CLIENTE_COMPRADOR) REFERENCES CLIENTE(ID_CLIENTE)
);

-- TRIGGER QUE POPULA O VALOR DA COLUNA 'VALOR_DA_VENDA' DE ACORDO COM O PREÇO E QUANTIDADE DO PRODUTO:
DELIMITER $$
CREATE TRIGGER POPULAR_VALOR_DA_VENDA
BEFORE INSERT ON VENDA_FEITA 
FOR EACH ROW 

BEGIN
	SET NEW.VALOR_DA_VENDA = (SELECT PRECO_DO_PRODUTO FROM PRODUTO WHERE ID_PRODUTO = NEW.NUMERO_DO_PRODUTO) * 
	NEW.QUANTIDADE_VENDIDA;
END $$

DELIMITER ; 

-- POPULANDO A TABELA:
/* O SCRIPT DE INSERÇÃO DE VALORES ESTÁ NO ARQUIVO SEPARADO 'INSERIR_VENDAS.SQL', VISTO A QUANTIDADE DE VALORES
QUE É 7000 */

-- ****************** TABELA SERVICO_FEITO ****************
CREATE TABLE SERVICO_FEITO(
ID_SERVICO_FEITO INT NOT NULL AUTO_INCREMENT,
NUMERO_DO_SERVICO INT NOT NULL,
CLIENTE_CORRESPONDENTE INT NOT NULL,
DATA_DE_REALIZACAO DATE,

-- CHAVES:
PRIMARY KEY(ID_SERVICO_FEITO),
CONSTRAINT CHAVE_PARA_O_NUMERO_DO_SERVICO FOREIGN KEY(NUMERO_DO_SERVICO) REFERENCES SERVICO_OFERECIDO(ID_SERVICO_OFERECIDO),
CONSTRAINT CHAVE_PARA_O_CLIENTE_CORRESPONDENTE FOREIGN KEY(CLIENTE_CORRESPONDENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

-- POPULANDO A TABELA:
-- a inserção de valores nesta tabela é feita no arquivo 'insercao_servico_feito.sql' que foi disponibilizado separadamente.

-- ********************* TABELA SERVICO_AGENDADO ***************************
CREATE TABLE SERVICO_AGENDADO(
ID_SERVICO_AGENDADO INT NOT NULL AUTO_INCREMENT,
NUMERO_DO_SERVICO INT NOT NULL,
CLIENTE_CORRESPONDENTE INT NOT NULL,
DATA_DE_AGENDAMENTO DATE,

-- CHAVES:
PRIMARY KEY(ID_SERVICO_AGENDADO),
CONSTRAINT CHAVE_PARA_O_NUMERO_DO_SERVICO_AGENDADO FOREIGN KEY(NUMERO_DO_SERVICO) REFERENCES SERVICO_OFERECIDO(ID_SERVICO_OFERECIDO),
CONSTRAINT CHAVE_PARA_O_CLIENTE_DO_SERVICO_AGENDADO FOREIGN KEY(CLIENTE_CORRESPONDENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

-- POPULANDO A TABELA:
-- O SCRIPT DE INSERÇÃO DA TABELA ESTÁ DISPONIBILIZADO EM UM ARQUIVO SEPARADO.alter

-- ************** TABELA ENTRADA_SAIDA_FUNCIONARIO **************
-- CRIANDO TABELA:
CREATE TABLE ENTREDA_SAIDA_FUNCIONARIO(
ID_DO_REGISTRO INT NOT NULL AUTO_INCREMENT,
NUMERO_DO_FUNCIONARIO INT NOT NULL,
DATA_DO_REGISTRO DATE NOT NULL, 
HORARIO_DA_ENTRADA CHAR(6) NOT NULL,
HORARIO_DA_SAIDA CHAR(6) NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_DO_REGISTRO),
CONSTRAINT CHAVE_PARA_O_NUMERO_DO_FUNCIONARIO FOREIGN KEY(NUMERO_DO_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO)
);

-- POPULANDO TABELA:
-- O SCRIPT DE POPULAÇÃO DESSA TABELA TAMBÉM FICOU EM UM ARQUIVO SEPARADO POR CONTA DA QUANTIDADE DE VALORES.

-- ************************* RECEITA_MENSAL **********************
-- CRIANDO TABELA:
CREATE TABLE RECEITA_MENSAL(
DATA_DO_BALANCO_FINANCEIRO CHAR(4) NOT NULL,
GANHO_OBTIDO DECIMAL(10,2) NOT NULL,
GASTO_OBTIDO DECIMAL(10, 2) NOT NULL,
SALDO_GERAL DECIMAL(10,2)
);

-- TRIGGER QUE POPULA O VALOR DE 'SALDO_GERAL' DE ACORDO COM OS VALORES PASSADOS EM 'GANHO' E 'GASTO':
DELIMITER $$
CREATE TRIGGER POPULAR_SALDO_GERAL_RECEITA
BEFORE INSERT ON RECEITA_MENSAL 
FOR EACH ROW

BEGIN
	SET NEW.SALDO_GERAL = NEW.GANHO_OBTIDO - NEW.GASTO_OBTIDO;
END $$

DELIMITER ;

-- POPULANDO A TABELA:
INSERT INTO RECEITA_MENSAL (DATA_DO_BALANCO_FINANCEIRO, GANHO_OBTIDO, GASTO_OBTIDO)
VALUES
('2022-01', 15000.00,  9000.00),
('2022-02', 16000.00, 10000.50),
('2022-03', 14000.00,  8500.75),
('2022-04', 15500.00,  9500.25),
('2022-05', 16500.00, 11000.00),
('2022-06', 17500.00, 12000.25),
('2022-07', 18000.00, 12500.50),
('2022-08', 19000.00, 13500.75),
('2022-09', 20000.00, 14500.25),
('2022-10', 21000.00, 15000.50),
('2022-11', 22000.00, 15500.75),
('2022-12', 23000.00, 16000.00),

('2023-01', 17000.00,  9500.25),
('2023-02', 18000.00, 10000.50),
('2023-03', 16000.00,  8500.75),
('2023-04', 17500.00,  9500.25),
('2023-05', 18500.00, 11000.00),
('2023-06', 19500.00, 12000.25),
('2023-07', 20000.00, 12500.50),
('2023-08', 21000.00, 13500.75),
('2023-09', 22000.00, 14500.25),
('2023-10', 23000.00, 15000.50),
('2023-11', 24000.00, 15500.75),
('2023-12', 25000.00, 16000.00),

('2024-01', 18000.00,  9500.25),
('2024-02', 19000.00, 10000.50),
('2024-03', 17000.00,  8500.75),
('2024-04', 18500.00,  9500.25),
('2024-05', 19500.00, 11000.00),
('2024-06', 20500.00, 12000.25),
('2024-07', 21000.00, 12500.50),
('2024-08', 22000.00, 13500.75),
('2024-09', 23000.00, 14500.25),
('2024-10', 24000.00, 15000.50),
('2024-11', 25000.00, 15500.75),
('2024-12', 26000.00, 16000.00);

-- **************** TABELA TIPO_DE_PET ****************
CREATE TABLE TIPO_DE_PET(
ID_DO_TIPO_DE_PET INT NOT NULL AUTO_INCREMENT,
NOME_DO_TIPO VARCHAR(30) NOT NULL,
DESCRICAO_DO_TIPO VARCHAR(200),
-- CHAVES:
PRIMARY KEY(ID_DO_TIPO_DE_PET) 
);

-- POPULANDO TABELA:
INSERT INTO TIPO_DE_PET (NOME_DO_TIPO, DESCRICAO_DO_TIPO)
VALUES
('Mamíferos', 'Animais de sangue quente'),
('Aves', 'Animais com penas e bico'),
('Répteis', 'Animais de sangue frio'),
('Anfíbios', 'Vivem em água e terra'),
('Peixes', 'Vivem em ambiente aquático'),
('Invertebrados', 'Sem coluna vertebral'),
('Marsupiais', 'Bolsa marsupial'),
('Roedores', 'Dentes incisivos grandes'),
('Lagartos', 'Réptil de quatro patas'),
('Serpentes', 'Cobras não peçonhentas'),
('Aracnídeos', 'Aranhas e escorpiões'),
('Insetos', 'Insetos variados'),
('Crustáceos', 'Caranguejos e afins'),
('Moluscos', 'Caracóis e polvos'),
('Exóticos', 'Pets não convencionais'),
('Domésticos', 'Pets comuns de casa'),
('Aquáticos', 'Pets de aquário'),
('Roedores Pequenos', 'Hamsters e ratos'),
('Lagartos Grandes', 'Iguanas e dragões'),
('Aves Exóticas', 'Araras e cacatuas'),
('Peixes Salgados', 'Peixes marinhos'),
('Peixes Doces', 'Peixes de rio'),
('Insetos Úteis', 'Joaninhas e grilos'),
('Artrópodes', 'Tarântulas e afins'),
('Bichos-Paus', 'Insetos camuflados'),
('Ouriços', 'Pequenos espinhentos'),
('Guaxinins', 'Pequenos selvagens'),
('Petauros', 'Pequenos planadores'),
('Cavalos', 'Grandes mamíferos'),
('Mini Porcos', 'Porcos miniatura'),
('Aves de Fazenda', 'Galinhas e patos'),
('Formigas', 'Formigueiros caseiros'),
('Bichos Selvagens', 'Silvestres dóceis'),
('Salamandras', 'Amfíbios como axolote'),
('Rãs e Sapos', 'Sapos coloridos');

-- *************** TABELA PET *************
-- CRIANDO TABELA:
CREATE TABLE PET(
ID_DO_PET INT NOT NULL AUTO_INCREMENT,
NOME_DO_PET VARCHAR(40) NOT NULL,
APELIDO VARCHAR(40) NOT NULL,
TIPO_DO_PET INT NOT NULL,
DONO_DO_PET INT NOT NULL,

-- CHAVES:
PRIMARY KEY(ID_DO_PET),
CONSTRAINT CHAVE_PARA_O_TIPO_DO_PET FOREIGN KEY(TIPO_DO_PET) REFERENCES TIPO_DE_PET(ID_DO_TIPO_DE_PET),
CONSTRAINT CHAVE_PARA_O_DONO_RESPONSAVEL FOREIGN KEY(DONO_DO_PET) REFERENCES CLIENTE(ID_CLIENTE)
);

-- POPULANDO A TABELA:
INSERT INTO PET (NOME_DO_PET, APELIDO, TIPO_DO_PET, DONO_DO_PET) VALUES
('Zeus', 'Leitinho', 1, 793),
('Rubi', 'Estrelinha', 1, 584),
('Tom', 'Caramelo', 1, 492),
('Zeus', 'Bolota', 2, 144),
('Nick', 'Bebê', 2, 429),
('Billy', 'Docinho', 2, 282),
('Leo', 'Doguinho', 3, 521),
('Fred', 'Diva', 3, 903),
('Milo', 'Bolinha', 3, 490),
('Chico', 'Coração', 4, 174),
('Zara', 'Totó', 4, 548),
('Luna', 'Rabinho', 4, 80),
('Simba', 'Caramelo', 5, 255),
('Chico', 'Caramelo', 5, 1000),
('Zeus', 'Totó', 5, 546),
('Rubi', 'Batata', 6, 765),
('Fiona', 'Miau', 6, 710),
('Charlie', 'Estrelinha', 6, 239),
('Nina', 'Fofo', 7, 927),
('Bolt', 'Gigante', 7, 758),
('Zeus', 'Estrelinha', 7, 521),
('Neguinho', 'Panda', 8, 99),
('Thor', 'Estrelinha', 8, 274),
('Amora', 'Fofo', 8, 851),
('Simba', 'Caramelo', 9, 440),
('Mel', 'Pipoca', 9, 811),
('Neguinho', 'Pretinho', 9, 516),
('Thor', 'Biscoito', 10, 758),
('Zara', 'Biscoito', 10, 775),
('Charlie', 'Churros', 10, 714),
('Bobby', 'Coração', 11, 726),
('Rubi', 'Panqueca', 11, 795),
('Rex', 'Estrelinha', 11, 716),
('Zara', 'Leitinho', 12, 275),
('Milo', 'Estrelinha', 12, 154),
('Neguinho', 'Mordomo', 12, 270),
('Simba', 'Bigode', 13, 901),
('Princesa', 'Tigrinho', 13, 910),
('Chico', 'Biscoito', 13, 430),
('Max', 'Melzinho', 14, 221),
('Nina', 'Bichinho', 14, 222),
('Charlie', 'Leitinho', 14, 420),
('Nina', 'Caramelo', 15, 672),
('Sofia', 'Estrelinha', 15, 292),
('Chico', 'Fofura', 15, 92),
('Bobby', 'Mordomo', 16, 84),
('Leo', 'Mordomo', 16, 617),
('Luna', 'Leitinho', 16, 866),
('Pipoca', 'Xodó', 17, 585),
('Bella', 'Diva', 17, 64),
('Neguinho', 'Pipoca', 17, 677),
('Charlie', 'Doguinho', 18, 169),
('Tom', 'Miau', 18, 322),
('Simba', 'Bebê', 18, 409),
('Nick', 'Tigrinho', 19, 561),
('Nina', 'Panda', 19, 628),
('Thor', 'Diva', 19, 31),
('Mel', 'Fofura', 20, 280),
('Milo', 'Doguinho', 20, 511),
('Rubi', 'Gigante', 20, 946),
('Zeus', 'Mimi', 21, 959),
('Fiona', 'Mimi', 21, 251),
('Max', 'Miau', 21, 874),
('Pipoca', 'Fofo', 22, 520),
('Rubi', 'Bebê', 22, 557),
('Bella', 'Doguinho', 22, 169),
('Neguinho', 'Peludo', 23, 981),
('Rex', 'Doguinho', 23, 860),
('Thor', 'Leitinho', 23, 176),
('Amora', 'Lindinho', 24, 731),
('Amora', 'Fofura', 24, 620),
('Zara', 'Pipoca', 24, 43),
('Pingo', 'Estrelinha', 25, 568),
('Rocky', 'Gigante', 25, 139),
('Sofia', 'Xodó', 25, 6),
('Bolt', 'Coração', 26, 989),
('Pipoca', 'Lindinho', 26, 895),
('Mel', 'Miau', 26, 226),
('Mingau', 'Nuvem', 27, 260),
('Neguinho', 'Bichinho', 27, 64),
('Princesa', 'Lindinho', 27, 758),
('Thor', 'Xodó', 28, 440),
('Zara', 'Fofo', 28, 702),
('Estrela', 'Nuvem', 28, 261),
('Neguinho', 'Pipoca', 29, 883),
('Thor', 'Xodó', 29, 219),
('Neguinho', 'Bolinha', 29, 569),
('Pandora', 'Lindinho', 30, 272),
('Pingo', 'Bebê', 30, 19),
('Nick', 'Diva', 30, 252),
('Thor', 'Batata', 31, 660),
('Zara', 'Melzinho', 31, 769),
('Bolt', 'Bolinha', 31, 700),
('Thor', 'Totó', 32, 412),
('Sofia', 'Peludo', 32, 932),
('Pingo', 'Fofura', 32, 519),
('Bobby', 'Estrelinha', 33, 393),
('Nina', 'Mordomo', 33, 982),
('Bobby', 'Miau', 33, 647),
('Pipoca', 'Rabinho', 34, 606),
('Neguinho', 'Fofo', 34, 597),
('Bobby', 'Totó', 34, 284),
('Estrela', 'Leitinho', 35, 788),
('Thor', 'Totó', 35, 197),
('Rex', 'Totó', 35, 185),
('Bobby', 'Miau', 36, 17),
('Cacau', 'Biscoito', 36, 65),
('Rocky', 'Pretinho', 36, 54);




















