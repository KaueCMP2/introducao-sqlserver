--------------------------------------------------------
--
-- Situação 3 – Biblioteca Virtual
--
--------------------------------------------------------

---------------------------------------------------------------------------------------

-- Tarefa 1: Criar a tabela Livros com colunas IdLivro, Titulo, Autor e AnoPublicacao.

---------------------------------------------------------------------------------------
CREATE DATABASE Livro;
USE Livro;

CREATE TABLE Livro(
IdLivro INT PRIMARY KEY,
Titulo NVARCHAR(100),
Autor NVARCHAR(100),
AnoPublicacao INT 
);

---------------------------------------------------------------------------------------

-- Tarefa 2: Inserir pelo menos 5 livros.

---------------------------------------------------------------------------------------
INSERT INTO Livro (IdLivro, Titulo, Autor, AnoPublicacao)
VALUES 
( 1, 'A arte da guerra', 'Sun Tzu', 2008),
( 2, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943),
( 3, 'Dom Quixote', 'Miguel de Cervantes', '1605'),
( 4, 'Um Conto de Duas Cidades', 'Charles Dickens', 1859),
( 5, 'O Senhor dos Anéis', 'J. R. R. Tolkien', 2002);

---------------------------------------------------------------------------------------

-- Tarefa 3: Consultar

---------------------------------------------------------------------------------------

-- Todos os livros publicados após o ano 2010 (Nesse caso 2000).
SELECT * FROM Livro
WHERE AnoPublicacao >= 2000

-- Os livros de um autor específico.
SELECT * FROM Livro
WHERE Autor = 'Sun Tzu'

-- Apenas os títulos dos livros.
SELECT Titulo FROM Livro
