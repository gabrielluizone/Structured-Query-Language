# Crud com Cassandra

Fatec Rubens Lara **`Ciência de Dados`**

> *Banco de Dados Não Relacional*

- **[Lista 4 Online | Nption](https://gabrielluizone.notion.site/Crud-com-Cassandra-b7ad66fe39ad46af93c2dacdf1c874f1)**

---
    
1. Criar CLIENTE com id UUID, nome TEXT, cidade TEXT. A chave será cidade

```sql
USE default_keyspace;

CREATE TABLE cliente (
	nome TEXT,
	id_cliente UUID,
	cidade TEXT,
	PRIMARY KEY (id_cliente, cidade)
);

CREATE TABLE mercadoria (
	categoria TEXT,
	id_mercadoria UUID,
	nome TEXT,
	valor DECIMAL,
	PRIMARY KEY (categoria, ID_MERCADORIA));
)
```

![Untitled](Output/Untitled.png)

1. Consultar a estrutura da tabela

```sql
DESCRIBE cliente;
-- Ou
DESC TABLE cliente;
```

![Untitled](Output/Untitled%201.png)

Consultar todas as tabelas criadas

```sql
DESCRIBE TABLES;
```

![Untitled](Output/Untitled%202.png)

Inserir 3 registros em CLIENTE

```sql
INSERT INTO cliente (nome, cidade, id_cliente) VALUES ('Gabriel Luiz', 'Guarujá', NOW());
	
INSERT INTO cliente (nome, cidade, id_cliente) VALUES ('Abner', 'São Paulo', NOW());

INSERT INTO cliente (nome, cidade, id_cliente) VALUES ('Jerry', 'Florida', NOW());
```

![Untitled](Output/Untitled%203.png)

Exibir todos os registros

```sql
SELECT * FROM cliente;
```

![Untitled](Output/Untitled%204.png)

Atualizar 1 dos registros

```sql
UPDATE cliente SET nome = 'Gabriel'
WHERE cidade = 'Guarujá' AND id_cliente = 6143e020-e78c-11ee-a60f-55aa4bdf4168;
```

![Untitled](Output/Untitled%205.png)

Excluir este registro

```sql
DELETE FROM cliente
WHERE cidade = 'Guarujá' AND id_cliente = 6143e020-e78c-11ee-a60f-55aa4bdf4168;
```

![Untitled](Output/Untitled%206.png)

- [x]  Obs. enviar o print das telas.

[Crud com Cassandra | Notion](https://gabrielluizone.notion.site/Crud-com-Cassandra-b7ad66fe39ad46af93c2dacdf1c874f1?pvs=4)
