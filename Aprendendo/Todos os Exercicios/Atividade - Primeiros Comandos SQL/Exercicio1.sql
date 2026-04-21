-------------------------------------------------------------------------------
-- Tarefa 1: Criar uma tabela Alunos com colunas IdAluno, Nome, Idade e Cidade.
-------------------------------------------------------------------------------

CREATE DATABASE Exercicios;

-- Adicionar as colunas/atributos IdAluno, Nome, Idade e Cidade.
CREATE TABLE Alunos (
IdAluno INT PRIMARY KEY,
Nome NVARCHAR (100),
Idade INT,
Cidade NVARCHAR (100)
);

-----------------------------------------------------------------
-- Tarefa 2: Inserir pelo menos 5 registros de alunos diferentes.
-----------------------------------------------------------------

INSERT INTO Alunos (IdAluno, Nome, Idade, Cidade)
VALUES
(1, 'Adilson Junior', 16, 'Sao Paulo'),
(2, 'Bento Inacio', 15, 'Sao Paulo'),
(3, 'Cassio Souza', 16, 'Sao Paulo'),
(4, 'Douglas Vinicios', 16, 'Sao Paulo'),
(5, 'Eduardo Silas', 17, 'Sao Paulo')

------------------------
--Tarefa 3: Consultar:
------------------------

-- Todos os alunos
SELECT * FROM Alunos

-- Apenas os alunos com mais de 20 anos.
SELECT * FROM Alunos
WHERE Idade > 16

-- Os alunos que moram em uma cidade específica (ex: "São Paulo").
SELECT * FROM Alunos
WHERE Cidade = 'Sao Paulo'