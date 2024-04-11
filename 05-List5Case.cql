/*
  Um armazém precisa gerenciar seus produtos, entradas e saídas, além de fornecer informações sobre o estoque disponível.
  Keyspace: estoque
  • produtos: Armazena informações sobre os produtos (ID, nome, descrição, preço, quantidade).
  • entradas: Armazena as entradas de produtos no estoque (ID_produto, data, quantidade, valor_unitario).
  • saidas: Armazena as saídas de produtos do estoque (ID_produto, data, quantidade, valor_unitario).
*/

-- Selecionando a KeySpace
USE estoque;

-- Criando tabela de Produtos
CREATE TABLE produtos (
		id UUID,
		nome TEXT,
		descricao TEXT,
		preco DECIMAL,
		quantidade INT,
	PRIMARY KEY (id)	
);

-- Criando tabela de Entradas
CREATE TABLE entradas (
		id_produto UUID,
		data DATE,
		quantidade INT,
		valor_unitario DECIMAL,
	PRIMARY KEY (id_produto, data)
);

-- Criando as Saidas
CREATE TABLE saidas (
		id_produto UUID,
		data DATE,
		quantidade INT,
		valor_unitario DECIMAL,
	PRIMARY KEY (id_produto, data)
);

INSERT INTO produtos (id, nome, descricao, preco, quantidade)
		VALUES (NOW(),'Computador Pichau Gamer', 'AMD RYZEN 5 4600G, 16GB DDR4, NVME 256GB', 2359.99, 941); 
