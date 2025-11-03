CREATE DATABASE Companhia_Aerea;
GO

USE Companhia_Aerea;
GO



	CREATE TABLE Aeronave (
	id_aer INT PRIMARY KEY IDENTITY(10001, 1),
	prefixo VARCHAR(8) UNIQUE NOT NULL
	);
	GO

		INSERT INTO Aeronave 
		VALUES 
		('PP-101'),
		('PS-402'),
		('PS-336'),
		('PS-599'),
		('PS-801');
		GO




	CREATE TABLE Voo (
	id_voo INT PRIMARY KEY IDENTITY,
	codigo VARCHAR(6) UNIQUE NOT NULL,
	id_aer INT FOREIGN KEY REFERENCES Aeronave(id_aer),
	partida VARCHAR(15) NOT NULL
	);
	GO
	
		INSERT INTO Voo 
		VALUES 
			('WL101', 10001, '20-01-2026'),
			('GL101', 10002, '18-01-2026'),
			('RL101',  10003,'21-01-2026');
		GO





	CREATE TABLE Passageiro(
	id_pass INT PRIMARY KEY IDENTITY(101, 1),
	nome VARCHAR(40)
	);
	GO

		INSERT INTO Passageiro 
		VALUES 
			('João Souza'),
			('Pedro Silva'),
			('Carlos Cassios'),
			('Maria Couto'),
			('Erica Milena'),
			('Felicia Arantes');
		GO

		INSERT INTO Passageiro
		VALUES 
			('Matheus Carvalho'),
			('Patricia Condes');
		GO


	CREATE TABLE Bilhete(
	id_bilh INT PRIMARY KEY IDENTITY(8002, 2),
	id_voo INT FOREIGN KEY REFERENCES Voo(id_voo),
	id_pass INT FOREIGN KEY REFERENCES Passageiro(id_pass),
	assento VARCHAR(6) NOT NULL
	);
	GO
		
		-- (id voo, id pass, assento)
		INSERT INTO Bilhete 
		VALUES 
			( 1, 101, 'B01'),
			( 1, 103, 'A03'),
			( 2, 102, 'A02'),
			( 2, 104, 'C10'), 
			( 3, 103, 'C04'),
			( 3, 106, 'E09');
		GO

	

	-- SELECT NORMAL
	SELECT * FROM Aeronave;
	SELECT * FROM Voo;
	SELECT * FROM Passageiro;
	SELECT * FROM Bilhete;


	-- INNER JOIN = Somente onde existe a conexão
	SELECT * FROM Bilhete as b INNER JOIN Voo as v
	ON b.id_voo = v.id_voo  INNER JOIN Passageiro as p
	ON b.id_pass = p.id_pass;

	-- LEFT JOIN = Todos os da esquerda aparecem no caso Passageiro/p
	SELECT * FROM Passageiro as p LEFT JOIN Bilhete as b
	ON p.id_pass = b.id_pass

	-- RIGHT JOIN Todos os da Direita aparecem no caso Passageiro/p
	SELECT * FROM Voo as v RIGHT JOIN Aeronave as a
	ON v.id_aer = a.id_aer

	-- FULL JOIN: TUDO mesmo que a comparacao nao fassa sentido
	SELECT * FROM Passageiro as p FULL JOIN  Bilhete as b
	ON p.id_pass = id_voo

	-- CROSS JOIN: Multipica as chances
	SELECT * FROM Passageiro as p CROSS JOIN Voo as v