create DATABASE Companhia_Aerea;
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
	id_aer INT REFERENCES Aeronave(id_aer) ON DELETE CASCADE,
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
	id_voo INT REFERENCES Voo(id_voo) ON DELETE CASCADE,
	id_pass INT REFERENCES Passageiro(id_pass) ON DELETE CASCADE,
	assento VARCHAR(6) NOT NULL
	);
	GO
		
		-- (id voo, id pass, assento)
		INSERT INTO Bilhete 
		VALUES 
			( 1, 109, 'B01'),
			( 1, 103, 'A03'),
			( 2, 102, 'A02'),
			( 2, 104, 'C10'), 
			( 3, 103, 'C04'),
			( 3, 106, 'E09');
		GO
	-- 1 mudando o codigo da aeronave e o assento e nome dos passageiros
	UPDATE Passageiro SET nome = 'J.Souza'
	Where nome LIKE '%Joã%'

	UPDATE Aeronave SET prefixo = 'PP-110'
	where prefixo like 'PP-101'

	UPDATE Bilhete SET assento = 'A10'
	where id_pass LIKE '101'

	
	-- 2 Exclusão de registros – usar DELETE respeitando as restrições de chave estrangeira.
	DELETE FROM Passageiro
	where id_pass = 102

	Delete FROM Aeronave
	where id_aer = 10001

	-- Alteração da estrutura da tabela – exemplo: 
	-- mudar nome da tabela ou de uma coluna (sp_rename), aumentar o tamanho de um campo, adicionar uma nova coluna.
	
	-- mudando nome de uma tabela 
	EXEC sp_rename 'Bilhete', 'Ticket';
	EXEC sp_rename 'Ticket.id_bilh', 'id_ticket';

	-- Mudaando config de tamanho
	ALTER TABLE Aeronave
	ALTER COLUMN prefixo VARCHAR(10);

	ALTER TABLE Passageiro
	ALTER COLUMN nome VARCHAR(20);

	-- adicionar uma nova coluna 
	ALTER TABLE Passageiro
	ADD CPF VARCHAR(14) null;

	ALTER TABLE Aeronave
	ADD NomePiloto NVARCHAR(40)

	-------------------------------------------------------------------------------------------
	--
	-- Manipulação de constraints – remover e recriar chaves primárias e chaves estrangeiras,
	-- testando o uso de ON DELETE CASCADE.
	--
	-------------------------------------------------------------------------------------------

	-----------------------------------------------

	-- PK
	EXEC sp_fkeys 'Aeronave';
	
	-- Removendo
	ALTER TABLE Aeronave
	DROP CONSTRAINT PK__Aeronave__6BE8C0A9B62C344C;

	-- Recriando e renomeando
	ALTER TABLE Aeronave
	ADD CONSTRAINT PK_Aeronave 
	PRIMARY KEY (id_aer);

	-----------------------------------------------
	
	-- FK
	EXEC sp_fkeys 'voo';
	
	-- Removendo
	ALTER TABLE Voo
	DROP CONSTRAINT FK__Bilhete__id_voo__2D27B809

	-- Recriando e renomeando
	ALTER TABLE Bilhete
	ADD CONSTRAINT FK_Bilhete_Voo
	FOREIGN KEY (id_voo)
	REFERENCES Voo(id_voo)
	ON DELETE CASCADE;

	-----------------------------------------------	

	-- SELECT NORMAL
    SELECT * FROM Aeronave;
	SELECT * FROM Voo;
	SELECT * FROM Passageiro;
	SELECT * FROM Ticket;

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
	ON p.id_pass = b.id_pass 

	-- CROSS JOIN: Multipica as chances
	SELECT * FROM Passageiro as p CROSS JOIN Voo as v


	
	
	