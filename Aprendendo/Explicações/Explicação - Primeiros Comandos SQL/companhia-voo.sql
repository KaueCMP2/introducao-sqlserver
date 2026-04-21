---------------------------------------------------------------------------------------

-- 15) Companhia Aérea
-- Controle de voos e passageiros.

---------------------------------------------------------------------------------------

CREATE DATABASE Companhia_Voo; GO

USE Companhia_Voo; GO



---------------------------------------------------------------------------------------

-- Aeronave: id_aer (PK), prefixo (UNIQUE, NOT NULL)

---------------------------------------------------------------------------------------

-- CRIANDO TABELA: Aeronave
CREATE TABLE Aeronave(
id_aer INT PRIMARY KEY, 
prefixo VARCHAR(5) UNIQUE NOT NULL
);
GO

-- PUPOLANDO DADOS A TABELA: Aeronave
INSERT INTO Aeronave
VALUES
( 101, 'PP-111'),
( 102, 'PS-111'),
( 103, 'PS-112');
GO




---------------------------------------------------------------------------------------

-- Voo: id_voo (PK), código (UNIQUE, NOT NULL), id_aer (FK), partida (NOT NULL)

---------------------------------------------------------------------------------------

-- CRIANDO TABELA: Voo
CREATE TABLE Voo(
id_voo INT PRIMARY KEY,
codigo VARCHAR(7) UNIQUE NOT NULL,
);
GO

-- PUPOLANDO DADOS A TABELA: Voo
INSERT INTO Voo
VALUES
( 10, 'GL1234'),
( 11, 'LA5678'),
( 12, 'AA1234');
GO




---------------------------------------------------------------------------------------

-- Passageiro: id_pass (PK), nome (NOT NULL)

---------------------------------------------------------------------------------------

-- CRIANDO TABELA: Passageiro
CREATE TABLE Passageiro(
id_pass INT PRIMARY KEY IDENTITY,
nome NVARCHAR(40)
);
GO

-- PUPOLANDO DADOS A TABELA: Passageiro
INSERT INTO Passageiro
VAlUES
('Claudia'),
('Jefferson'),
('Paulo');
GO



---------------------------------------------------------------------------------------

-- Bilhete: id_bilh (PK), id_voo (FK), id_pass (FK), assento (NOT NULL)

---------------------------------------------------------------------------------------

-- CRIANDO TABELA: Bilhete
CREATE TABLE Bilhete(
id_bilh INT PRIMARY KEY IDENTITY(100,1),
id_voo INT FOREIGN KEY REFERENCES Voo(id_voo),
id_pass INT FOREIGN KEY REFERENCES Passageiro(id_pass),
assento VARCHAR(10) NOT NULL
);
GO

-- PUPOLANDO DADOS A TABELA: Bilhete
INSERT INTO Bilhete
VALUES 
('A100'),
('B100'),
('C100');
GO