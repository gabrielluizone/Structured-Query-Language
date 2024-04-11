DESC keyspace;
USE default_keyspace;

CREATE TABLE mercadoria (
	categoria TEXT,
	id_mercadoria UUID,
	nome TEXT,
	valor DECIMAL,
	PRIMARY KEY (categoria, ID_MERCADORIA));
)

INSERT INTO mercadoria (categoria, nome, valor, id_mercadoria)
VALUES ('ALIMENTO','Presunto',15, now());

INSERT INTO mercadoria (categoria, nome, valor, id_mercadoria)
VALUES ('LIMPEZA','Desinfetante',5.5, now()); -- 2x

INSERT INTO mercadoria (categoria, nome, valor, id_mercadoria)
VALUES ('LIMPEZA','Pudim',5.5, now());
