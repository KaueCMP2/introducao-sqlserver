-- DROP TABLE (Apaga tabela)
DROP DATABASE 

-- Criar base de dados
CREATE DATABASE Empresa;

-- Acessar a base de dados criada
USE Empresa;

-- Criar tabela funcionario
CREATE TABLE Funcionario(
	codigo INT PRIMARY KEY,
	Nome NVARCHAR (100)
);

-- Inserir valores em uma tabela
INSERT INTO Funcionario (codigo, Nome)
VALUES
(1,'Kaue'),
(2, 'Thiago')

INSERT INTO Funcionario VALUES
(3, 'Odirley')

-- Listar todos os dados inseiridos
SELECT * FROM Funcionario;

-- Buscar somente atributos selecionados
SELECT nome,codigo FROM Funcionario;

-- Listar funcionario codigo > 2.
SELECT * FROM Funcionario
WHERE codigo > 2;

-- Listar funcionarios que comecem com a letra T
SELECT * FROM Funcionario
WHERE nome LIKE 'T%';

-- Listar Funcioanrios pela ultima letra A
SELECT * FROM Funcionario
WHERE nome LIKE '%A';

-- Listar Funcionarios pelo texto do centro
SELECT * FROM Funcionario
WHERE nome LIKE '%A%';

-- Ordenar valores (decrescente)
SELECT * FROM Funcionario
ORDER BY Codigo DESC

-- Ordenar por Letra (Ordem Alfabetica)
SELECT * FROM Funcionario
ORDER BY Nome ASC

-- DESC (Descrescente)

-- ASC (Crescente)


-- Atualização de registros
UPDATE Funcionario SET Nome = 'Kaue Sergio'
WHERE Nome = 'Kaue'

SELECT * FROM Funcionario

-- Atualizacao sem update	
-- Sem o WHERE muda todos os dados
UPDATE Funcionario SET Nome = 'Thiago'

-- Exclusao de dados
-- Não esquecer de usar o Where
DELETE FROM Funcionario
WHERE codigo = 1


