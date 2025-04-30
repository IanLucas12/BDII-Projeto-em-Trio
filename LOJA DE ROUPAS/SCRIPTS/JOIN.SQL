-- 1. Produtos com seus fornecedores
SELECT p.Nome, p.Preco, f.NomeFornecedor, f.Telefone
FROM Produto p
JOIN Fornecedor f ON p.IDFornecedor = f.IDFornecedor;

-- 2. Produtos por categoria
SELECT c.NomeCategoria, COUNT(p.CodProduto) AS QuantidadeProdutos
FROM CategoriaProduto c
LEFT JOIN Produto p ON c.IDCategoria = p.IDCategoria
GROUP BY c.IDCategoria;

-- 3. Fornecedores com quantidade de produtos
SELECT f.NomeFornecedor, COUNT(p.CodProduto) AS TotalProdutos
FROM Fornecedor f
LEFT JOIN Produto p ON f.IDFornecedor = p.IDFornecedor
GROUP BY f.IDFornecedor
ORDER BY TotalProdutos DESC;

-- 4. Produtos mais caros por categoria
SELECT c.NomeCategoria, p.Nome, p.Preco
FROM Produto p
JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
WHERE p.Preco = (
    SELECT MAX(Preco) 
    FROM Produto 
    WHERE IDCategoria = p.IDCategoria
);

-- 5. Produtos com preço acima da média
SELECT Nome, Preco
FROM Produto
WHERE Preco > (SELECT AVG(Preco) FROM Produto);

-- 6. Fornecedores que fornecem produtos de uma categoria específica
SELECT DISTINCT f.NomeFornecedor
FROM Fornecedor f
JOIN Produto p ON f.IDFornecedor = p.IDFornecedor
WHERE p.IDCategoria = 2;

-- 7. Categorias com produtos de um determinado material
SELECT DISTINCT c.NomeCategoria
FROM CategoriaProduto c
JOIN Produto p ON c.IDCategoria = p.IDCategoria
WHERE p.Material = 'Algodão';

-- 8. Produtos que não têm um tamanho específico
SELECT Nome, Tamanho
FROM Produto
WHERE Tamanho NOT LIKE '%G%';

-- 9. Média de preço por categoria
SELECT c.NomeCategoria, AVG(p.Preco) AS MediaPreco
FROM CategoriaProduto c
JOIN Produto p ON c.IDCategoria = p.IDCategoria
GROUP BY c.IDCategoria;

-- 10. Produtos com preço entre 50 e 150 reais
SELECT Nome, Preco
FROM Produto
WHERE Preco BETWEEN 50.00 AND 150.00;

-- 11. Fornecedores que fornecem produtos acima da média de preço
SELECT DISTINCT f.NomeFornecedor
FROM Fornecedor f
JOIN Produto p ON f.IDFornecedor = p.IDFornecedor
WHERE p.Preco > (SELECT AVG(Preco) FROM Produto);

-- 12. Produtos da marca mais comum
SELECT Nome, Marca
FROM Produto
WHERE Marca = (
    SELECT Marca
    FROM Produto
    GROUP BY Marca
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 13. Categorias com produtos de múltiplas cores
SELECT c.NomeCategoria
FROM CategoriaProduto c
JOIN Produto p ON c.IDCategoria = p.IDCategoria
GROUP BY c.IDCategoria
HAVING COUNT(DISTINCT p.Cor) > 1;

-- 14. Produtos com descrição mais longa
SELECT Nome, LENGTH(Descricao) AS TamanhoDescricao
FROM Produto
ORDER BY TamanhoDescricao DESC
LIMIT 3;

-- 15. Fornecedores com produtos em mais categorias
SELECT f.NomeFornecedor, COUNT(DISTINCT p.IDCategoria) AS CategoriasDistintas
FROM Fornecedor f
JOIN Produto p ON f.IDFornecedor = p.IDFornecedor
GROUP BY f.IDFornecedor
ORDER BY CategoriasDistintas DESC;

-- 16. Produtos que são os únicos em sua categoria
SELECT p.Nome, c.NomeCategoria
FROM Produto p
JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
WHERE (
    SELECT COUNT(*) 
    FROM Produto 
    WHERE IDCategoria = p.IDCategoria
) = 1;

-- 17. Cores mais populares (que aparecem em mais produtos)
SELECT Cor, COUNT(*) AS QuantidadeProdutos
FROM Produto
WHERE Cor IS NOT NULL
GROUP BY Cor
ORDER BY QuantidadeProdutos DESC;

-- 18. Produtos com nomes similares
SELECT p1.Nome, p2.Nome
FROM Produto p1, Produto p2
WHERE p1.CodProduto < p2.CodProduto
AND p1.Nome LIKE CONCAT('%', SUBSTRING(p2.Nome, 1, 5), '%');

-- 19. Categorias sem produtos de um determinado material
SELECT c.NomeCategoria
FROM CategoriaProduto c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Produto p 
    WHERE p.IDCategoria = c.IDCategoria 
    AND p.Material = 'Jeans'
);

-- 20. Relação de produtos com suas categorias e fornecedores
SELECT 
    p.Nome AS Produto, 
    p.Preco, 
    c.NomeCategoria, 
    f.NomeFornecedor, 
    f.Telefone AS ContatoFornecedor
FROM 
    Produto p
    JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
    JOIN Fornecedor f ON p.IDFornecedor = f.IDFornecedor
ORDER BY 
    c.NomeCategoria, p.Preco DESC;