CREATE DATABASE IFSP;

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

