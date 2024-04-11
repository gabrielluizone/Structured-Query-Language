DESC employees
SELECT * FROM employees

SELECT SYSDATE, CURRENT_DATE FROM DUAL

-- TO_CHAR(coluna ou funcao, 'mascara'): converte para caractere

SELECT TO_CHAR(SYSDATE,'HH:MI:SS'), TO_CHAR(CURRENT_DATE, 'Day') FROM DUAL
SELECT TO_CHAR(SYSDATE, 'DD-MONTH-YY'), TO_CHAR(SYSDATE, 'YEAR') FROM DUAL

-- A) Exibir o nome do empregado com apelido nas colunas, as duas primeiras letras do seu nome
-- e a quantidade de caracteres dos empregados, o id do depto. que trabalham no depto. com id
-- menor que 50. Ordenados pelo nome.
SELECT first_name "Nome", SUBSTR(first_name,1,2) AS "Substring", LENGTH(first_name) qtde, department_id
FROM employees
WHERE department_id < 50
ORDER BY first_name

-- B) Alterar para exibir também o salário, o percentual de comissão de quem ganha entre 5000
--    e 6000, ordenado de forma decrescente
SELECT first_name "Nome", SUBSTR(first_name,1,2) AS "Substring", LENGTH(first_name) qtde, department_id, salary, commission_pct
FROM employees
WHERE salary BETWEEN 5000 AND 6000
ORDER BY SALARY DESC

-- C) Exibir o nome concatenado com o sobrenome de quem tem o nome iniciado com letra A maiúscula 
SELECT CONCAT(first_name,last_name), first_name||' '|| last_name "Nome Completo"
    FROM employees
WHERE first_name LIKE 'A%'

-- D) Alterar para exibir TAMBÉM quem tem o nome iniciado com a letra C
SELECT CONCAT(first_name, last_name), first_name || ' ' || last_name "Nome Completo" 
    FROM employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'C%'

-- Letra 'a' minúsculo na segunda posição do nome
SELECT CONCAT(first_name, last_name), first_name ||' '|| last_name "Nome Completo"
    FROM employees
WHERE first_name LIKE '_a%'

-- E) Exibir o salário com as casas decimais (mascara)
-- NVL: Covewrte valores nulos para um, número, string ou data. NVL (coluna, 'o que deseja preencher caso NULO')
SELECT last_name, hire_date, TO_CHAR(salary, '99,999.99'), TO_CHAR(salary, '00,000.00'), 
       commission_PCT, (salary * commission_pct) + salary, (salary * NVL(commission_pct, 0)) + salary
    FROM employees

-- F) Alterar para exibir também a data de admissão de quem foi admitido em fevereiro.
-- Agrupamento
SELECT MIN(salary), MAX(salary), SUM(salary), ROUND(AVG(salary), 2), COUNT(*), COUNT(employee_id)
    FROM employees

SELECT MIN(salary), MAX(salary), SUM(salary), ROUND(AVG(salary), 2), COUNT(*), COUNT(employee_id)
    FROM employees
GROUP BY job_id

SELECT job_id, MIN(salary), MAX(salary), SUM(salary), ROUND(AVG(salary), 2), COUNT(*), COUNT(employee_id)
    FROM employees
GROUP BY job_id  

-- Repassa 01
-- Exibir o id do empregado e a data de admissão de quem foi admitido em fevereiro.
SELECT employee_id, hire_date
    FROM employees
WHERE hire_date LIKE '%Feb%'

-- Repassa 02
SELECT COUNT(*), SUM(salary), department_id
    FROM employees
GROUP BY department_id

-- Dica 01
SELECT COUNT(*), SUM(salary), department_id
    FROM employees
GROUP BY department_id
HAVING SUM(salary) > 25000
ORDER BY 3

DESC employees

-- JUNCAO DE TABELAS (JOIN)
-- Exibir o nome do empregado, o salario e o título do seu cargo de quem tem um salario
-- fora do intervalo de 10000 e 15000.
SELECT e.first_name, j.job_id, job_title, salary 
    FROM employees e, jobs j
WHERE e.job_id = j.job_id
    AND e.salary NOT BETWEEN 10000 AND 15000

-- Nutral Join (Use com certeza que as tabelas só tem 1 PK)
SELECT first_name, job_id, job_title, salary 
    FROM employees NATURAL JOIN jobs
WHERE e.salary NOT BETWEEN 10000 AND 15000

-- Join
SELECT e.first_name, j.job_id, job_title, salary 
    FROM employees e JOIN jobs j
        ON (e.job_id = j.job_id)
WHERE e.salary NOT BETWEEN 10000 AND 15000

-- Using (Nas duas tabelas tem o mesmo nome)
SELECT first_name, job_id, job_title, salary 
    FROM employees JOIN jobs
        USING (job_id)
WHERE salary NOT BETWEEN 10000 AND 15000
