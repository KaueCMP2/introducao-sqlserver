-- PROCEDURES

-- Procedure 1: Inserir Clientes
CREATE PROCEDURE InserirCliente
	@Nome VARCHAR(50),
	@Sobrenome VARCHAR(50),
	@Email VARCHAR(100),
	@Telefone VARCHAR(20),
	@DataCadastro DATE
AS
BEGIN
	SET NOCOUNT ON; -- não mostra informação de linhas afetadas.
	INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
	VALUES (@Nome, @Sobrenome, @Email, @Telefone, @DataCadastro)
END

-- TESTANDO PROCEDURE:
EXEC InserirCliente 
'Ana', 'Souza', 'ana@email.com', '11999999999', '2025-10-13'

SELECT * FROM Cliente;


-- Procedure 2: Inserir Pedido
CREATE PROCEDURE InserirPedido
	@ClienteId INT,
	@DataPedido DATE,
	@ValorTotal DECIMAL(10, 2),
	@StatusId INT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO Pedido (ClienteId, DataPedido, ValorTotal, StatusId)
	VALUES (@ClienteId, @DataPedido, @ValorTotal, @StatusId)
END

-- TESTANDO PROCEDURE:
EXEC InserirPedido 2, '2025-10-13', 250.00, 1;

SELECT * FROM Pedido;

-- Procedure 3: Atualizar preço de produto
CREATE PROCEDURE AtualizarPrecoProduto
	@ProdutoId INT,
	@PercentualAumento DECIMAL(5,2)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Produto
		SET Preco = Preco * (1 + @PercentualAumento / 100.0)
	WHERE ProdutoID = @ProdutoId;
END

-- TESTANDO PROCEDURE
SELECT * FROM Produto;
EXEC AtualizarPrecoProduto 2, 10;
SELECT * FROM Produto;