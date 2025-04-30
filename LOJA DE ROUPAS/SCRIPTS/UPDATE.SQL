-- 1. Atualizar preço de um produto
UPDATE Produto SET Preco = 149.90 WHERE CodProduto = 3;

-- 2. Atualizar estoque mínimo para uma categoria
UPDATE Produto SET EstoqueMinimo = 25 WHERE IDCategoria = 1;

-- 3. Atualizar marca de vários produtos
UPDATE Produto SET Marca = 'PremiumBrand' WHERE IDFornecedor = 3;

-- 4. Aplicar desconto de 10% em produtos de uma categoria
UPDATE Produto SET Preco = Preco * 0.9 WHERE IDCategoria = 5;

-- 5. Atualizar temporada dos produtos
UPDATE Produto SET Temporada = 'Verão 2024' WHERE IDCategoria IN (1, 4, 7);

-- 6. Atualizar status de produtos sem estoque
UPDATE Produto SET Status = 'Esgotado' WHERE CodProduto IN (SELECT CodProduto FROM (SELECT CodProduto FROM Produto WHERE EstoqueMinimo = 0) AS temp);

-- 7. Atualizar descrição de produtos de um fornecedor
UPDATE Produto SET Descricao = CONCAT(Descricao, ' - Coleção Premium') WHERE IDFornecedor = 4;

-- 8. Corrigir tamanhos disponíveis
UPDATE Produto SET Tamanho = 'P,M,G,GG,XG' WHERE CodProduto = 1;

-- 9. Atualizar informações de um fornecedor
UPDATE Fornecedor SET Email = 'novoemail@fornecedor.com', Telefone = '(81) 9999-8888' WHERE IDFornecedor = 2;

-- 10. Atualizar nome de uma categoria
UPDATE CategoriaProduto SET NomeCategoria = 'Calças' WHERE IDCategoria = 2;
