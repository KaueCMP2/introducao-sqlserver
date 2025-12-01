--- Funções de Texto

--1. Concatene o nome e o sobrenome do cliente em uma coluna chamada NomeCompleto.
select Concat(c.Nome, c.Sobrenome) NomeCompleto from Cliente c
go

-- 2. Converta o nome do produto para letras maiúsculas e exiba em uma coluna chamada NomeMaiusculo.
select UPPER(p.NomeProduto) NomeMaiusculo from Produto p
go

-- 3. Crie uma consulta que retorne os três primeiros caracteres do nome de cada cliente.
select Left(c.Nome, 3) from Cliente c
go

-- 4. Localize a posição do caractere @ no email de cada cliente. Exiba a posição como PosicaoArroba.
select CHARINDEX('@',c.Email) PosicaoArroba from Cliente c
go
---Funções Numéricas

-- 5. Calcule um desconto de 15% para todos os produtos e exiba o preço com desconto.
select p.CategoriaID, p.NomeProduto, (p.Preco * 0.85) ComDesconto from Produto p
go
-- 6. Arredonde os preços dos produtos para 2 casas decimais e exibacomo PrecoArredondado.
select round(p.Preco, 2) PrecoArredondado from Produto p
go
-- 7. Exiba o valor absoluto do estoque dos produtos (mesmo que o valorseja negativo).
select abs(p.QuantidadeEstoque) from Produto p
go
-- 8. Calcule o quadrado do preço de cada produto e exiba como PrecoAoQuadrado
select square(p.Preco) PrecoAoQuadrado from Produto p
go


--- Funções de Data e Hora

--9. Liste o ano e o mês em que cada pedido foi realizado.
select  Year(p.DataPedido) Ano, MONTH(p.DataPedido) Mês from Pedido p
go

-- 10.Calcule os anos de cadastro de cada cliente com base na data de cadastro.
select datediff(YEAR, c.DataCadastro, GETDATE()) AnosDeCadastro from Cliente c
go

--11.Adicione 30 dias à data do pedido e exiba como DataEntregaPrevista.
select p.PedidoID, dateadd(DAY, 30, p.DataPedido) DataEntregaPrevista from Pedido p
go

--12.Exiba o dia da semana em que cada pedido foi realizado (por exemplo,Segunda-feira).
set language 'Portuguese'
select datename(WEEKDAY, p.DataPedido) DiaDaSemana from Pedido p
go


---Funções de Agregação

-- 13.Calcule o total de produtos no estoque.
select sum(p.QuantidadeEstoque) from Produto p

--14.Encontre o preço médio dos produtos e exiba como PrecoMedio.
select AVG(p.Preco) PrecoMedio from Produto p
go

-- 15.Identifique o maior e o menor preço dos produtos e exiba ambos.
select p.ProdutoID, p.NomeProduto, max(p.Preco) MaiorPreco, min(p.Preco) MenorPreco from Produto p 
group by p.ProdutoID,  p.NomeProduto
go

--16.Conte quantos pedidos foram realizados no total.
select count(p.PedidoID) from Pedido p
go

--- Consultas com GROUP BY

-- 17.Liste o total de pedidos realizados por cada cliente.
select c.ClienteID, c.Nome , count(p.PedidoID) from Cliente c
join Pedido p on c.ClienteID = p.ClienteID
group by c.ClienteID, c.Nome
go

--18.Calcule o total de estoque por categoria de produto.
select c.CategoriaId, c.Nome, SUM(p.QuantidadeEstoque) from Categoria c
join Produto p on c.CategoriaId = p.CategoriaID
group by c.CategoriaId, c.Nome
go

--19.Exiba o número de produtos por categoria.
select c.CategoriaId, c.Nome, count(p.ProdutoID) from Categoria c
join Produto p on c.CategoriaId = p.CategoriaID
group by c.CategoriaId, c.Nome
go

--20.Liste a soma dos valores totais dos pedidos (ValorTotal) agrupados por status (Status).
select s.Nome StatusPedido, sum(p.ValorTotal) from Pedido p
join StatusPedido s on p.StatusID = s.StatusId
group by s.Nome,  p.StatusID