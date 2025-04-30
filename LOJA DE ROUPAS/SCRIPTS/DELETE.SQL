SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;






-- 1. Remover produtos de uma categoria específica
DELETE FROM Produto WHERE IDCategoria = 10;



DELETE FROM Fornecedor WHERE IDFornecedor > 0 AND IDFornecedor NOT IN (SELECT DISTINCT IDFornecedor FROM Produto);


-- 3. Remover categoria sem produtos
DELETE FROM CategoriaProduto WHERE IDCategoria NOT IN (SELECT DISTINCT IDCategoria FROM Produto);

-- 4. Apagar produtos com preço acima de um valor
DELETE FROM Produto WHERE Preco > 200.00;

-- 5. Remover produtos de um material específico
DELETE FROM Produto WHERE Material = 'Poliéster';

-- 6. Excluir fornecedores inativos (exemplo fictício)
DELETE FROM Fornecedor WHERE IDFornecedor IN (6, 8);

-- 7. Remover produtos de uma temporada antiga
DELETE FROM Produto WHERE Temporada = 'Verão 2022';

-- 8. Apagar produtos com estoque mínimo zero
DELETE FROM Produto WHERE EstoqueMinimo = 0;

-- 9. Remover categorias específicas
DELETE FROM CategoriaProduto WHERE NomeCategoria IN ('Shorts', 'Acessórios');

-- 10. Excluir produto específico
DELETE FROM Produto WHERE CodProduto = 7;