CREATE DATABASE BIBLIOTECA2;
GO

USE BIBLIOTECA2;
GO

CREATE TABLE Autor (
	id_Autor INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
	);
GO

CREATE TABLE Livro (
	id_Livro INT PRIMARY KEY,
	titulo VARCHAR(150) NOT NULL,
	ano INT,
	id_Autor INT NOT NULL,
	CONSTRAINT fk_livro_autor FOREIGN KEY (id_Autor) REFERENCES Autor(id_Autor) ON DELETE CASCADE
	);
GO

CREATE TABLE Leitor (
	id_Leitor INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR (120) UNIQUE
	);
GO

CREATE TABLE Emprestimo (
	id_Emprestimo INT PRIMARY KEY,
	id_Livro INT NOT NULL,
	id_Leitor INT NOT NULL,
	data_emprestimo DATE NOT NULL, 
	data_devolucao DATE,
	CONSTRAINT fk_empr_livro FOREIGN KEY (id_Livro) REFERENCES Livro(id_Livro) ON DELETE CASCADE,
	CONSTRAINT fk_empr_leitor FOREIGN KEY (id_Leitor) REFERENCES Leitor(id_Leitor) ON DELETE CASCADE
	);
GO

INSERT INTO Autor VALUES 
  (1,'Machado de Assis'),
  (2,'Clarice Lispector'),
  (3,'J. K. Rowling'),
  (4,'Shakespeare');
GO

INSERT INTO Livro VALUES 
	(1, 'Dom Casmurro', 1899, 1),
	(2, 'Memórias Póstumas de Brás Cubas', 1881, 1),
	(3, 'A hora da estrela', 1977, 2),
	(4, 'O sonho de uma noite de verão', 1600, 4),		
	(5, 'Harry Potter e o calice de fogo', 2000, 3);
GO

INSERT INTO Leitor VALUES
	(1, 'Thiago Oliveira' , 'thiago@gmail.com'),
	(2, 'Caique' , 'caique@gmail.com'),
	(3, 'Odirlei' , 'odi@gmail.com' ),
	(4, 'Kessia', 'kessia@gmail.com');
GO


INSERT INTO Emprestimo VALUES --id_emprestimo, id_livro, id_leitor, data_empr, data_dev
	(1, 5, 1, '2025-09-02', '2025-09-09'), -- Thiago pegou harry potter
	(2, 4, 4, '2025-08-27', '2025-09-05'), -- kessia pegou o sonho de uma noite
	(3, 1, 2, '2025-05-01', '2025-06-10'); --caique pegou Dom casmurro
GO

-- Inserir mais um livro para alguem ter mais que 1
INSERT INTO Emprestimo VALUES
(4, 3, 4, '2025-07-25', '2025-08-24'); -- Kessia pegou o A hora da estrela

-- Funções Agregadas


-- 1. Quantos **livros** existem cadastrados na biblioteca?
SELECT COUNT(*) FROM Livro;


-- 2. Qual é o **ano médio de publicação** dos livros?
SELECT AVG(ano) FROM Livro;


-- 3. Qual leitor fez o **maior número de empréstimos**?
SELECT TOP 1 l.nome, COUNT(e.id_Emprestimo) AS Top1Emprestimos
FROM Emprestimo e
JOIN Leitor l ON l.id_Leitor = e.id_Leitor
GROUP BY l.nome
ORDER BY Top1Emprestimos DESC

---

-- Funções de Texto


-- 1. Mostre os **3 primeiros caracteres** de todos os nomes de autores.
SELECT  LEFT(Nome, 3) FROM Autor;


-- 2. Exiba os títulos de livros com todas as letras em **minúsculo**.
SELECT LOWER(Titulo) FROM Livro;


-- 3. Mostre apenas os leitores cujo e-mail **termina com `.com`**.
SELECT nome, Email FROM Leitor
WHERE email LiKE  '%.com';


-- 4. Substitua a palavra **“estrela”** por **“sol”** no título do livro da Clarice Lispector.
SELECT * FROM Livro

SELECT REPLACE(Titulo, 'da estrela', 'do sol')
FROM Livro;
---

-- Funções de Data e Hora


-- 1. Mostre os empréstimos realizados **no mês de agosto de 2025** (mostrar número do mês).
SET LANGUAGE Portuguese;
SELECT id_emprestimo, id_Leitor, data_emprestimo,
	DATENAME(YEAR, data_emprestimo) Ano,
	DATENAME(MONTH, data_emprestimo) NomeMes,
	MONTH(data_emprestimo) AS Mes
FROM Emprestimo 
WHERE YEAR(data_emprestimo) = 2025 
	  AND MONTH(data_emprestimo) = 8;


-- 2. Calcule **quantos dias se passaram desde o primeiro empréstimo registrado até hoje**.
SELECT DATEDIFF(day, MIN(data_Emprestimo), GETDATE()) as maisAntigo
FROM Emprestimo;


-- 3. Mostre a **data do empréstimo e o nome do dia da semana** em que ele aconteceu.
SELECT data_emprestimo, DATENAME(WEEKDAY, data_emprestimo) FROM Emprestimo;

---

-- Operadores de Comparação e Lógicos


-- 1. Liste os livros publicados **entre 1950 e 2005**, mas que **não sejam** de J. K. Rowling.
SELECT * FROM Livro
WHERE ano BETWEEN  '1950' AND '2005';


-- 2. Mostre todos os leitores que têm **nome começando com a letra “C”**.
SELECT nome FROM Leitor
WHERE nome LIKE 'C%'


-- 3. Mostre os empréstimos que aconteceram **em 2025**, mas ainda **não foram devolvidos**.
INSERT INTO Emprestimo VALUES 
(5, 1, 2, '2025-05-01', '')

SELECT * FROM Emprestimo
WHERE data_devolucao = '';


-- 4. Liste os autores que **não** têm nenhum livro cadastrado no banco (dica: `LEFT JOIN`).
INSERT INTO Autor VALUES
(6, 'Kaue')

SELECT * FROM Autor a
LEFT JOIN Livro l 
ON a.id_Autor = l.id_Livro