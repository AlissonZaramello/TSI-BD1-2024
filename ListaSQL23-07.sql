-- EXERCICIO 1

CREATE DATABASE Mercado_Alisson;

USE Mercado_Alisson;

CREATE TABLE Fornecedor(
    Codigo_fornec int NOT NULL,
    Nome varchar(40) NOT NULL,
    Fone varchar(20),
    Endereco varchar(40),
    Cidade varchar(30) DEFAULT 'Birigui',
    Estado varchar(2) DEFAULT 'SP',
    PRIMARY KEY(Codigo_fornec)
);

CREATE TABLE Produto(
    Cod_produto int NOT NULL AUTO_INCREMENT,
    Nome varchar(40) NOT NULL,
    Cod_fornecedor int NOT NULL,
    preco_unitario numeric(10,2),
    qtde int,
    PRIMARY KEY(Cod_produto),
    CONSTRAINT FK_Fornecedor FOREIGN KEY(Cod_fornecedor) REFERENCES Fornecedor (Codigo_fornec)
);

-- EXERCICIO 2

--Inserções para os Fornecedores
INSERT Fornecedor(Codigo_fornec, Nome, Fone, Endereco, Cidade) VALUE (344, 'Alimentos do Bem', 3345666, 'Rua Fundadores', 'Sao Paulo');

INSERT Fornecedor(Codigo_fornec, Nome, Fone, Endereco, Cidade) VALUE (78, 'Comidas', 8664545, 'Av dos Estados', 'Aracatuba');

INSERT Fornecedor(Codigo_fornec, Nome, Fone, Endereco) VALUE (952, 'Rango Quente', 1327790, 'Rua Aclimacao');

INSERT Fornecedor(Codigo_fornec, Nome, Fone, Endereco, Cidade, Estado) VALUE (111, 'Quentinhas', 5644234, 'Rua Teste', 'Belo Horizonte', 'MG');

--Inserções para os Produtos

INSERT Produto(Cod_produto, Nome, Cod_fornecedor, preco_unitario, qtde) VALUE (1, 'arroz', 344, 20, 55);

INSERT Produto(Cod_produto, Nome, Cod_fornecedor, preco_unitario, qtde) VALUE (2, 'feijao', 78, 16.5, 60);

INSERT Produto(Cod_produto, Nome, Cod_fornecedor, preco_unitario, qtde) VALUE (3, 'macarrao', 78, 5, 15);

INSERT Produto(Cod_produto, Nome, Cod_fornecedor, preco_unitario, qtde) VALUE (4, 'leite', 344, 3.5, 20);

INSERT Produto(Cod_produto, Nome, Cod_fornecedor, preco_unitario, qtde) VALUE (5, 'farinha', 952, 5, 8);

-- EXERCICIO 3

-- 1 Altere o nome do fornecedor Comidas para Foods:
UPDATE Fornecedor SET Nome = 'Foods' WHERE Nome = 'Comidas';

-- 2 Adicione o campo e-mail varchar(30) na tabela Fornecedor
ALTER TABLE Fornecedor ADD Email varchar(30);

-- 3 Inserir um valor no email para os fornecedores 344 e do 111
UPDATE Fornecedor SET Email = 'aabbcc@gmail.com' WHERE Codigo_fornec = 344;
UPDATE Fornecedor SET Email = 'ddeeff@gmail.com' WHERE Codigo_fornec = 111;

-- 4 Exclua o campo endereço da tabela Fornecedor
ALTER TABLE Fornecedor DROP Endereco;

-- 5 Alterar a quantidade do arroz para 15
UPDATE Produto SET qtde = 15 WHERE Nome = 'arroz';

-- EXERCICIO 4

-- 1 Buscar todas as informações dos fornecedores cadastrados
SELECT * FROM Fornecedor;

-- 2 Buscar o nome dos produtos onde o preço seja maior que 15 reais.
SELECT Nome FROM Produto WHERE preco_unitario > 15;

-- 3 Apresentar o nome e o código dos fornecedores que são do estado de SP.
SELECT Nome, Codigo_fornec FROM Fornecedor WHERE Estado = 'SP';

-- 4 Apresentar o nome dos produtos e o total de cada produto (preço x qtde) com o nome da coluna de total.
SELECT nome, preco_unitario * qtde as total FROM Produto;

-- 5 Apresentar o código do produto, o nome do produto do fornecedor de código 78.
SELECT Cod_produto, Nome FROM Produto WHERE Cod_fornecedor = 78;

-- 6 Apresentar o código e o nome dos fornecedores que possuem o código menor que 100 e que seja do estado de SP
SELECT Codigo_fornec, Nome FROM Fornecedor WHERE Codigo_fornec < 100 AND Estado = 'SP';

-- 7 Alterar na tabela produto o nome do leite para leite desnatado
UPDATE Produto SET Nome = 'leite desnatado' WHERE Nome = 'leite';

-- 8 Alterar a quantidade de todos os produtos subtraindo em uma unidade cada um
UPDATE Produto SET qtde = qtde - 1;

-- 9 Adicionar um campo na tabela fornecedor chamado país (varchar(30)).
ALTER TABLE Fornecedor ADD Pais varchar(30);

-- 10 Atribuir a este campo país o valor Brasil em todos os registros.
UPDATE Fornecedor SET Pais = 'Brasil';

-- 11 Cadastrar um fornecedor estrangeiro
INSERT Fornecedor(Codigo_fornec, Nome, Fone, Cidade, Estado, Pais) VALUE (444, 'Alimentinhos', 3345666, 'Madrid', 'ES' , 'Espanha');

-- 12 Excluir os fornecedores brasileiros que não são do estado de SP.
DELETE FROM Fornecedor WHERE Estado != 'SP' AND Pais = 'Brasil'; 

-- 13 Apresentar todos os fornecedores cadastrados (só devem aparecer os do estado de SP e o estrangeiro). 
SELECT * FROM Fornecedor;

-- EXERCICIO 4

CREATE DATABASE escritorio_Alisson;

USE escritorio_Alisson;

CREATE TABLE Departamento(
    Numero int,
    Nome varchar(100),
    Localizacao varchar(100)
);

CREATE TABLE Gerente (
    Codigo int AUTO_INCREMENT,
    Nome varchar(100),
    NumDepto int,
    PRIMARY KEY(Codigo),
    CONSTRAINT FK_Depto_Gerente FOREIGN KEY (NumDepto) REFERENCES Departamento (Numero);
);

CREATE TABLE Empregado(
    Codigo int AUTO_INCREMENT,
    Nome varchar(100),
    Endereco varchar(100),
    Telefone int,
    Data_Admissao date,
    NumDepto int,
    Salario numeric,
    PRIMARY KEY(Codigo),
    CONSTRAINT FK_Depto_Empregado FOREIGN KEY (NumDepto) REFERENCES Departamento (Numero)
);

CREATE TABLE Projeto(
    Numero int,
    Nome varchar(100),
    Localizacao varchar(100),
    PRIMARY KEY(Numero)
);

CREATE TABLE Trabalha_Em(
    EmpCod int,
    NumProj int,
    Total_Horas_Semanais int,
    PRIMARY KEY (EmpCod, NumProj),
    CONSTRAINT FK_Cod_Empregado (EmpCod) REFERENCES Empregado (Codigo),
    CONSTRAINT FK_Num_Projeto (NumProj) REFERENCES Projeto (Numero)
);







