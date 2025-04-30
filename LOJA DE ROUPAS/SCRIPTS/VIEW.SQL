-- 1. View de produtos com seus fornecedores
CREATE VIEW vw_produtos_fornecedores AS
SELECT p.Nome AS Produto, p.Preco, p.Material, f.NomeFornecedor, f.Telefone
FROM Produto p
JOIN Fornecedor f ON p.IDFornecedor = f.IDFornecedor;

-- 2. View de produtos por categoria
CREATE VIEW vw_produtos_por_categoria AS
SELECT c.NomeCategoria, COUNT(p.CodProduto) AS Quantidade, AVG(p.Preco) AS PrecoMedio
FROM CategoriaProduto c
LEFT JOIN Produto p ON c.IDCategoria = p.IDCategoria
GROUP BY c.IDCategoria;

-- 3. View de fornecedores e quantidade de produtos
CREATE VIEW vw_fornecedores_produtos AS
SELECT f.NomeFornecedor, COUNT(p.CodProduto) AS TotalProdutos
FROM Fornecedor f
LEFT JOIN Produto p ON f.IDFornecedor = p.IDFornecedor
GROUP BY f.IDFornecedor;

-- 4. View de produtos mais caros por categoria
CREATE VIEW vw_produtos_mais_caros AS
SELECT c.NomeCategoria, p.Nome, p.Preco
FROM Produto p
JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
WHERE p.Preco = (
    SELECT MAX(Preco) 
    FROM Produto 
    WHERE IDCategoria = p.IDCategoria
);

-- 5. View de produtos acima da média de preço
CREATE VIEW vw_produtos_acima_media AS
SELECT Nome, Preco
FROM Produto
WHERE Preco > (SELECT AVG(Preco) FROM Produto);

-- 6. View de materiais utilizados
CREATE VIEW vw_materiais_utilizados AS
SELECT Material, COUNT(*) AS QuantidadeProdutos
FROM Produto
WHERE Material IS NOT NULL
GROUP BY Material
ORDER BY QuantidadeProdutos DESC;

-- 7. View de produtos por faixa de preço
CREATE VIEW vw_produtos_por_faixa_preco AS
SELECT 
    CASE 
        WHEN Preco < 50 THEN 'Até R$50'
        WHEN Preco BETWEEN 50 AND 100 THEN 'R$50 a R$100'
        WHEN Preco BETWEEN 100 AND 200 THEN 'R$100 a R$200'
        ELSE 'Acima de R$200'
    END AS FaixaPreco,
    COUNT(*) AS Quantidade
FROM Produto
GROUP BY FaixaPreco;

-- 8. View de fornecedores por cidade (extraída do endereço)
CREATE VIEW vw_fornecedores_por_cidade AS
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(Endereco, '-', -1), '/', 1) AS Cidade,
    COUNT(*) AS QuantidadeFornecedores
FROM Fornecedor
GROUP BY Cidade;

-- 9. View de produtos agrupados por marca e categoria
CREATE VIEW vw_produtos_marca_categoria AS
SELECT 
    p.Marca, 
    c.NomeCategoria, 
    COUNT(*) AS Quantidade,
    AVG(p.Preco) AS PrecoMedio
FROM Produto p
JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
GROUP BY p.Marca, c.NomeCategoria;

-- 10. View completa de produtos com todas as informações
CREATE VIEW vw_produtos_completos AS
SELECT 
    p.CodProduto,
    p.Nome AS Produto,
    p.Descricao,
    p.Preco,
    p.Tamanho,
    p.Cor,
    p.Marca,
    p.Material,
    p.EstoqueMinimo,
    p.Temporada,
    c.NomeCategoria,
    f.NomeFornecedor,
    f.Telefone AS ContatoFornecedor
FROM 
    Produto p
    JOIN CategoriaProduto c ON p.IDCategoria = c.IDCategoria
    JOIN Fornecedor f ON p.IDFornecedor = f.IDFornecedor;