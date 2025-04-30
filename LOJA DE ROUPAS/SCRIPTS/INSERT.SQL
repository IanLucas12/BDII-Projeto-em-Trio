
INSERT INTO CategoriaProduto (NomeCategoria) VALUES 
('Camisetas'),
('Calças Jeans'),
('Vestidos'),
('Bermudas'),
('Blusas'),
('Casacos'),
('Shorts'),
('Saias'),
('Moletons'),
('Acessórios');


INSERT INTO Fornecedor (NomeFornecedor, Endereco, Telefone, Email, CNPJ, DataCadastro) VALUES 
('Confecções Estilo Livre', 'Rua das Malhas, 100 - Recife/PE', '(81) 9876-5432', 'contato@estilolivre.com', '12345678000190', '2020-01-15'),
('Malhas Premium', 'Av. dos Tecidos, 200 - Paulista/PE', '(81) 9988-7766', 'vendas@malhaspremium.com', '23456789000180', '2020-03-10'),
('Moda Jeans Ltda', 'Rua do Algodão, 300 - Olinda/PE', '(81) 9876-1234', 'compras@modajeans.com', '34567890000170', '2020-05-20'),
('Luxo Têxtil', 'Av. das Confecções, 400 - Jaboatão/PE', '(81) 9988-1234', 'atendimento@luxotextil.com', '45678901000160', '2020-07-15'),
('Esportiva Confecções', 'Rua dos Atletas, 500 - Cabo/PE', '(81) 9876-5678', 'sac@esportivaconf.com', '56789012000150', '2020-09-01'),
('Fio Nobre Malhas', 'Rua da Costura, 600 - Recife/PE', '(81) 9988-5678', 'vendas@fionobre.com', '67890123000140', '2021-01-10'),
('Estilo Casual', 'Av. das Roupas, 700 - Olinda/PE', '(81) 9876-9876', 'contato@estilocasual.com', '78901234000130', '2021-03-05'),
('Tecidos Finos', 'Rua das Linhas, 800 - Paulista/PE', '(81) 9988-9876', 'compras@tecidosfinos.com', '89012345000120', '2021-05-15'),
('Moda Intima', 'Av. das Malharias, 900 - Recife/PE', '(81) 9876-5433', 'sac@modaintima.com', '90123456000110', '2021-07-20'),
('Jeans Premium', 'Rua do Denim, 1000 - Jaboatão/PE', '(81) 9988-5433', 'vendas@jeanspremium.com', '01234567000100', '2021-09-10');


INSERT INTO Produto (Nome, Descricao, Preco, Tamanho, Cor, Marca, Material, EstoqueMinimo, IDCategoria, IDFornecedor) VALUES 
('Camiseta Básica Branca','Camiseta 100% algodão', 39.90, 'P,M,G,GG', 'Branca', 'BasicWear', 'Algodão', 20, 1, 1),
('Jeans Skinny Preto', 'Calça jeans slim fit', 129.90, '36,38,40,42', 'Preto', 'Denim&Co', 'Jeans', 15, 2, 3),
('Vestido Midi Floral', 'Vestido midi com estampa floral', 159.90, 'P,M,G', 'Multicolor', 'FloraStyle', 'Viscose', 10, 3, 4),
('Blusa de Moletom', 'Blusa de frio com capuz', 89.90, 'P,M,G,GG', 'Cinza', 'WinterComfort', 'Algodão', 12, 5, 1),
('Jaqueta Jeans', 'Jaqueta jeans clássica', 199.90, '38,40,42,44', 'Azul', 'Denim&Co', 'Jeans', 8, 6, 3),
('Bermuda Sarja', 'Bermuda cargo masculina', 79.90, '38,40,42,44', 'Bege', 'UrbanMan', 'Sarja', 15, 4, 2),
('Saia Plissada', 'Saia midi plissada', 109.90, '36,38,40', 'Preto', 'Elegance', 'Poliéster', 10, 8, 4),
('Kit 5 Pares Meias', 'Meias cano médio algodão', 49.90, 'Único', 'Branco', 'BasicWear', 'Algodão', 30, 10, 1),
('Moletom Capuz', 'Moletom com capuz e bolso', 119.90, 'P,M,G,GG', 'Preto', 'UrbanMan', 'Algodão', 10, 9, 5),
('Cinto Couro Legítimo', 'Cinto masculino em couro', 89.90, '100,105,110,115', 'Marrom', 'LeatherStyle', 'Couro', 10, 10, 4);