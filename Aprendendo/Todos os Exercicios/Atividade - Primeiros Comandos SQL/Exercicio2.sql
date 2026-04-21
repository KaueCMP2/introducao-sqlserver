--------------------------------------------------------------------------------
--
-- Tarefa 1: Criar uma tabela Jogos com colunas IdJogo, Titulo, Genero e Preco.
--
--------------------------------------------------------------------------------

-- 1 Criar uma base de dados
CREATE DATABASE Jogo;

-- 2 Cria a tabela e define os atributos 
CREATE TABLE Jogo(
IdJogo INT PRIMARY KEY,
Titulo NVARCHAR (100),
Genero NVARCHAR (100),
Preço INT
);

--------------------------------------------------------------------------------
--
-- Tarefa 2: Inserir pelo menos 6 jogos de gêneros diferentes.
--
--------------------------------------------------------------------------------

INSERT INTO Jogo(IdJogo,Titulo, Genero, Preço)
VALUES
( 1, 'Free Fire', 'Battle royale', 0),
( 2, 'Clash Royale', 'Estrategia', 0),
( 3, 'Grand Theft Auto', 'Açao', 200),
( 4, 'Call of duty B.O.2','Açao' , 80),
( 5, 'Need for Speed 7', 'Corrida', 90),
( 6, 'God of War 2018', 'Açao', 70);

--------------------------------------------------------------------------------
--
-- Tarefa 3: Consultar:
--
--------------------------------------------------------------------------------

-- Todos os jogos de um gênero específico (ex: "Ação").
SELECT * FROM Jogo
WHERE Genero = 'Açao'

-- Os jogos com preço acima de R$ 200 (No caso foi 80).
SELECT * FROM Jogo
WHERE Preço >= 80

-- Nome e preço de todos os jogos.
SELECT Titulo, Preço FROM Jogo
