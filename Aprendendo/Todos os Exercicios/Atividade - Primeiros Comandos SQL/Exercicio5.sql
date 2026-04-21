--------------------------------------------------------------------------
--
-- Situação 5 – Sistema de Pedidos Simples
--
--------------------------------------------------------------------------

---------------------------------------------------------------------------------------------

-- Tarefa 1: Criar a tabela Pedidos com colunas IdPedido, Cliente, Produto e Quantidade.

---------------------------------------------------------------------------------------------
CREATE DATABASE Pedido;
USE Pedido;


CREATE TABLE Pedido(
IdPedido INT PRIMARY KEY,
Cliente NVARChAR(100),
Produto NVARCHAR(100),
Quantidade INT
);

---------------------------------------------------------------------------------------------

-- Tarefa 2: Inserir pelo menos 6 pedidos.

---------------------------------------------------------------------------------------------
INSERT INTO Pedido(IdPedido, Cliente, Produto, Quantidade)
VALUES
( 1, 'JuniorS', 'Bolinha Ping Pong', 1),
( 2, 'MatherP', 'Carrinho Hot Weels', 2),
( 3, 'ClaudiaN', 'Prato Vidro', 5),
( 4, 'MariaM', 'Peao', 3),
( 5, 'CaiqueP', 'Prato Porcelana', 8);

---------------------------------------------------------------------------------------------

-- Tarefa 3: Consultar:

---------------------------------------------------------------------------------------------
-- Todos os pedidos de um cliente específico.
SELECT IdPedido, Cliente, Produto,Quantidade FROM Pedido
WHERE Cliente = 'ClaudiaN'

-- Todos os pedidos de determinado produto (ex: "Pizza").
SELECT IdPedido, Cliente, Produto,Quantidade FROM Pedido
WHERE Produto = 'Peao'

-- Cliente e quantidade pedida de todos os pedidos.
SELECT Cliente, Quantidade FROM Pedido