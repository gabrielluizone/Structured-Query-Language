DECLARE
-- Declara as variáveis de entrada (: variável de substituição)
v_id INTEGER := 123;
v_sal NUMBER(10,2) := 15000;
v_data DATE := SYSDATE;

BEGIN
-- Enserção na tabela de folhas
INSERT INTO folha_pagamento (employee_id, data, salbruto) VALUES (v_id, v_data, v_sal);

-- Confirmar transação
COMMIT;	
END;

---------------------------------------------------------------------------------------------------------

-- Atualização (Update)
DECLARE
v_id INTEGER := :numero;
BEGIN

-- ATUALIZAÇÃO
UPDATE folha_pagamento SET salbruto = salbruto * 1.20 WHERE employee_id = v_id;

-- CONFIRMAÇAO
COMMIT;
END;

SELECT * FROM folha_pagamento

---------------------------------------------------------------------------------------------------------

--  Visualização das Tables
SELECT TABLE_NAME FROM USER_TABLES

-- Outras Teblas
SELECT * FROM EMPLOYEES

-- Estrutura das Tabelas
DESC EMPLOYEES

/* ==================================================== */
CREATE TABLE folha_pagamento (
		employee_id     INTEGER,
		data            DATE,
		salbruto        NUMBER(10, 2),
		inss            NUMBER(10, 2),
		valetransp      NUMBER(10, 2),
		comissao        NUMBER(10, 2),
		salliq          NUMBER(10, 2),
        CONSTRAINT folha_pk PRIMARY KEY (employee_id, data),
        CONSTRAINT folha_FK FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
)

DESC folha_pagamento

---------------------------------------------------------------------------
DECLARE
-- Declara as variáveis de entrada (: variável de substituição)
v_id INTEGER := 123;
v_sal NUMBER(10,2) := 15000;
v_data DATE := SYSDATE;
BEGIN
-- Enserção na tabela de folhas
INSERT INTO folha_pagamento (employee_id, data, salbruto) VALUES (v_id, v_data, v_sal);
-- Confirmar transação
COMMIT;	
END;

/* ==================================================== */
-- Atualização (Update)
DECLARE
v_id INTEGER := :numero;
BEGIN

-- ATUALIZAÇÃO
UPDATE folha_pagamento SET salbruto = salbruto * 1.20 WHERE employee_id = v_id;

-- CONFIRMAÇAO
COMMIT;
END;

-- Visualização
SELECT * FROM folha_pagamento

/* ==================================================== */
DECLARE
v_id INTEGER := 123;
v_sal NUMBER(10, 2);
v_data DATE;
BEGIN
    SELECT salbruto, data INTO v_sal, v_data
        FROM folha_pagamento
    WHERE employee_id = v_id;
DBMS_OUTPUT.PUT_LINE(v_id||' receba '||v_sal);
END;

/* ==================================================== */
DECLARE
-- Declarar as variáveis dse entrada (: variável de substituição)
id_id INTEGER := 100;
BEGIN
DELETE FROM folha_pagamento WHERE employee_id = v_id;
END;

-- Excluir todos os registrosd
TRUNCATE TABLE folha_pagamento

/* ==================================== */
DECLARE
v_depto INTEGER := 50;
v_nome VARCHAR(30);
v_cargo jobs.job_title%TYPE; -- Mesmo tipo de dadp e qtde de caracteres que a coluna da tabela referencia

CURSOR calor IS
    SELECT e.first_name, j.job_title
        FROM employees e, jobs j
    WHERE e.job_id = j.job_id
        AND e.department_id = v_depto;
BEGIN
-- Abrir o cursor declarado
OPEN calor;
-- Iniciar lasso
LOOP
-- Extrair os dados de cursos aberto e armazenar nas variaveis de saida
FETCH calor INTO v_nome, v_cargo;
-- Condição de saida de lasso
EXIT WHEN calor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_nome||' trabalha como: '||v_cargo);
-- Finalização do lasso
END LOOP;
-- Fechar cursos
CLOSE calor;
END;

/* ======================================================================== */
DECLARE
v_id INTEGER;
v_perc NUMBER(10, 2);
v_salbruto NUMBER(10, 2);
v_comissao NUMBER(10, 2);
v_liq NUMBER(10, 2);

CURSOR cursor1 IS
    SELECT employee_id, salary, NVL(comMission_pct, 0)
        FROM EMPLOYEES;
BEGIN
OPEN cursor1; -- Ordem do Fetch é na mesma ordem do Select
LOOP FETCH cursor1 INTO v_id, v_salbruto, v_perc;
EXIT WHEN cursor1%NOTFOUND;

-- Calcular a comissão do salário liquido
v_comissao := v_salbruto * v_comissao;
v_liq := v_salbruto + v_comissao;
-- Inserir na tabela
INSERT INTO folha_pagamento
    (employee_id, salbruto, comissao, salliq, data)
    VALUES (v_id, v_salbruto, v_comissao, v_liq, SYSDATE);
END LOOP;
COMMIT;
CLOSE cursor1;
END;
