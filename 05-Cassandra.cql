CREATE TABLE receita (
		nome_receita TEXT,
		data DATE,
		revisor TEXT,
		avaliacao INT,
		comentario TEXT,
	PRIMARY KEY ((nome_receita), data, revisor)
)
WITH CLUSTERING ORDER BY (data DESC, revisor ASC)

INSERT INTO receita (nome_receita, data, revisor, avaliacao, comentario)
VALUES ('Pizza', '2024-04-01', 'João Pedro One', 10, 'Gostei da Pizza...');

INSERT INTO receita (nome_receita, data, revisor, avaliacao, comentario)
VALUES ('Pizza', '2024-04-01', 'João Pedro Two', 6, 'Poderia ser melhor...');

INSERT INTO receita (nome_receita, data, revisor, avaliacao, comentario)
VALUES ('Pastel', '2024-04-04', 'Gabriel One', 9, 'Poderia ser mais receado...') IF NOT EXISTS;

UPDATE receita SET avaliacao = 8
WHERE nome_receita = 'Pizza'
AND data = '2024-04-01'
AND revisor = 'João Pedro Two'
IF avaliacao = 6;

BEGIN BATCH
INSERT INTO receita (nome_receita, data, revisor, avaliacao, comentario)
VALUES ('Bolacha', '2024-04-02', 'Augusto', 7, 'Deliciosa');
INSERT INTO receita (nome_receita, data, revisor, avaliacao, comentario)
VALUES ('Café', '2024-04-03', 'Dioules', 0, 'Muito bom, odeie');
APPLY BATCH;

Begin Batch 
insert into receita (nome_receita, data, revisor, avaliacao, comentario) 
values ('Bolacha Maisena', '2024-04-04', 'Augusto', 10, 'Deliciosa'); 
Insert into receita (nome_receita, data, revisor, avaliacao, comentario) 
values ('Cafe', '2024-04-04', 'Jules', 7, 'Quente'); 
apply Batch;

CREATE INDEX idx_receita

CREATE TABLE aluno (
	matricula INT,
	nome TEXT,
	data DATE,
	email SET<TEXT>,
	curso LIST<TEXT>,
	PRIMARY KEY (matricula, nome)
);

INSERT INTO aluno (matricula, nome, data, email, curso)
VALUES (11, 'Shophia', '2024-04-04', {'shophia@zmail.com', 'shophia@rotimail.com'}, ['CD', 'CD'])

ALTER TABLE aluno
