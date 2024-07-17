CREATE DATABASE IFSP
DEFAULT CHARSET = utf8
DEFAULT COLLATE = utf8_general_ci;

USE IFSP;

CREATE TABLE Cidade(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    estado varchar(002) NOT NULL
);

CREATE TABLE Cliente(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    endereco varchar(100),
    numero int,
    bairro varchar(100),
    dataNasc date,
    idCidade int,
    CONSTRAINT FK_Cidade FOREIGN KEY (idCidade) REFERENCES Cidade (id)
);

-- Inserir dados na tabela Cidade
INSERT INTO Cidade(id, nome, estado) VALUES (1, 'Birigui', 'SP');
INSERT INTO Cidade(id, nome, estado) VALUES (100, 'Aracatuba', 'SP');
INSERT INTO Cidade(nome, estado) VALUES ('Guararapes', 'SP');

--Inserir dados na tabela Cliente
INSERT INTO Cliente (nome, email, endereco, numero, bairro, dataNasc, idCidade) VALUES ('Alisson', 'alisson@gmail.com', 'Rua Antonia Chimenes Maffeis', 998, 'Portal do Parque 3', '2004/04/14', 1);

-- Mostra registros da tabela
SELECT * FROM cidade;

-- Atualiza tabela cidade
UPDATE cidade SET
    nome = 'Belo Horizonte',
    estado = 'MG'
WHERE id = 1;

-- Atualiza tabela cliente
UPDATE Cliente SET
    nome = 'Cocão',
    email = 'cocao@gmail.com',
WHERE id = 1;

-- DELETA REGISTRO CIDADE
DELETE FROM Cidade WHERE id = 1;