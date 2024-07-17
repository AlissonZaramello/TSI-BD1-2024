-- CRIAÇÃO DO BANCO DE DADOS

CREATE DATABASE Exemplo
DEFAULT CHARSET = utf8
DEFAULT COLLATE = utf8_general_ci;

USE Exemplo;

-- CRIAÇÃO DA TABELA CAIXA_POSTAL 

CREATE TABLE caixa_postal(
    codigo_postal varchar(8) NOT NULL,
    localidade varchar(45) NOT NULL,
    PRIMARY KEY (codigo_postal)
);

-- INSERÇÕES NA TABELA CAIXA_POSTAL

INSERT INTO caixa_postal (codigo_postal, localidade)
VALUES
(17830000, 'Adamantina'),
(16204278, 'Birigui'),
(17800000, 'Flórida Paulista');

-- CRIAÇÃO DA TABELA PESSOA

CREATE TABLE pessoa(
    codigo int NOT NULL AUTO_INCREMENT,
    cpf varchar(11) NOT NULL UNIQUE,
    nome varchar(60) NOT NULL,
    idade int CHECK (idade > 0),
    codigo_postal varchar(8) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_postal) REFERENCES caixa_postal (codigo_postal)
);

-- INSERÇÕES NA TABELA PESSOA

INSERT INTO pessoa (nome, cpf, idade, codigo_postal)
VALUES
('José Benedito da Silva', 10044455500, 39, 17830000),
('Maria Helena de Souza', 20044455500, 35, 17800000),
('Cristiane Pereira', 30044455500, 25, 16204278);


-- CRIAÇÃO DA TABELA TELEFONE

CREATE TABLE telefone(
    codigo int NOT NULL,
    tel_residencial varchar(15),
    tel_celular varchar(15),
    tel_comercial varchar(15),
    tel_recado varchar(15) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo) REFERENCES pessoa (codigo)
);

-- INSERÇÕES NA TABELA TELEFONE



-- CRIAÇÃO DA TABELA ALUNO

CREATE TABLE aluno(
    matricula int NOT NULL AUTO_INCREMENT,
    nome varchar(40),
    dt_nascimento date,
    cidade varchar(30) default 'Birigui',
    PRIMARY KEY (matricula)
);