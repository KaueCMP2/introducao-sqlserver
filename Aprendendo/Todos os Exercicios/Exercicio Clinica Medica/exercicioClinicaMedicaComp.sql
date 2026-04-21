------------------------------------------------------------------------------------- 

-- 7) Transporte por App -- Gerenciamento de corridas. 

------------------------------------------------------------------------------------- 


-- CRIANDO NOVO BANCO DE DADOS
CREATE DATABASE TRANSPORTE_APP;
GO

USE TRANSPORTE_APP; 
GO 


------------------------------------------------------------------------------------- 

-- Motorista: id_mot (PK), nome (NOT NULL), cnh (UNIQUE) 

------------------------------------------------------------------------------------- 


-- CRIANDO A TABELA MOTORISTA 
	CREATE TABLE Motorista(
	id_mot INT PRIMARY KEY,
	nome_mot VARCHAR(100) NOT NULL,
	cnh VARCHAR(10) UNIQUE 
);
GO 

DROP DATABASE Exercicios

-- POPULANDO DADOS 
INSERT INTO Motorista(id_mot, nome_mot, cnh) 
VALUES 
	(1, 'Carlos Mendes', '12345678901'),
	(2, 'Ana Souza', '23456789012'),
	(3, 'João Pereira', '34567890123'),
	(4, 'Fernanda Lima', '45678901234'),
	(5, 'Ricardo Santos', '56789012345'
);
GO 


------------------------------------------------------------------------------------- 

-- Passageiro: id_pass (PK), nome (NOT NULL) 

------------------------------------------------------------------------------------- 

-- CRIANDO A TABELA PASSAGEIRO
CREATE TABLE Passageiro( 
	id_pass INT PRIMARY KEY,
	nome_pass VARCHAR(100) NOT NULL
); 
GO 

-- POPULANDO DADOS 
INSERT INTO Passageiro(id_pass, nome_pass)
VALUES 
	(1, 'Mariana Silva'),
	(2, 'Paulo Oliveira'),
	(3, 'Juliana Costa'),
	(4, 'Felipe Almeida'),
	(5, 'Camila Rodrigues'
);
GO 


------------------------------------------------------------------------------------- 

-- Corrida: id_corr (PK), id_mot (FK), id_pass (FK), data (NOT NULL)

------------------------------------------------------------------------------------- 

-- CRIANDO A TABELA Corrida 
CREATE TABLE Corrida(
	id_corr INT PRIMARY KEY,
	id_mot INT FOREIGN KEY REFERENCES Motorista(Id_mot),
	id_pass INT FOREIGN KEY REFERENCES Passageiro(Id_pass),
	data_corr DATE NOT NULL
);
GO 

-- POPULANDO DADOS 
INSERT INTO Corrida(id_corr, id_mot, id_pass, data_corr)
	VALUES (1, 1, 1, '2025-09-20 08:30:00'),
	(2, 2, 3, '2025-09-21 10:15:00'),
	(3, 3, 2, '2025-09-22 14:45:00'),
	(4, 4, 5, '2025-09-23 18:00:00'),
	(5, 5, 4, '2025-09-24 22:10:00'
);
GO 


------------------------------------------------------------------------------------- 

-- Pagamento: id_pag (PK), id_corr (FK), valor (NOT NULL), forma_pagto (NOT NULL) 

------------------------------------------------------------------------------------- 

CREATE TABLE Pagamento( 
	id_pag INT PRIMARY KEY,
	id_corr INT FOREIGN KEY REFERENCES Corrida(id_corr),
	valor DECIMAL NOT NULL,
	forma_pagto VARCHAR(50) NOT NULL 
); 
GO 

-- POPULANDO DADOS 
INSERT INTO Pagamento(id_pag, id_corr, valor, forma_pagto) 
VALUES 
	(1, 1, 25.50, 'Cartão de Crédito'),
	(2, 2, 18.75, 'Pix'),
	(3, 3, 32.00, 'Dinheiro'),
	(4, 4, 45.20, 'Cartão de Débito'),
	(5, 5, 27.80, 'Pix'
);
GO
