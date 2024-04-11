/*
|	Gabriel Luiz dos Santos SIlva
|	
|	Fatec Baixada Santista - Rubens Lara
|	• Ciência de Dados (5º Ciclo)
|	Banco de Dados Não Relacional (Manhã, 5º Feira)
|
*/

----------------------------------------------------------------------------------------------
-- 1) Mostre a estrutura da tabela EMPLOYEES.
DESC EMPLOYEES


----------------------------------------------------------------------------------------------
-- 2) Selecione todos os dados da tabela EMPLOYEES.
SELECT * FROM EMPLOYEES


----------------------------------------------------------------------------------------------
-- 3) Crie uma consulta para exibir o nome, o cargo e a data de admissão da tabela EMPLOYEES
SELECT first_name, job_id, hire_date
FROM EMPLOYEES


----------------------------------------------------------------------------------------------
-- 4) Exibir a estrutura da tabela DEPARTMENTS
DESC DEPARTMENTS


----------------------------------------------------------------------------------------------
-- 5) Cria uma consulta para exibir os cargos exclusivos a partir da tabela EMPLOYEES.
SELECT job_id
FROM EMPLOYEES
GROUP BY job_id


------------------------------------ TENHO MINHAS DUVIDAS ------------------------------------
-- 6) Carregue o arquivo EXERC0.sql no buffer do SQL. Nomeie os cabeçalhos das colunas como Nome, Cargo e Admissão respectivamente. Execute a consulta.
-- Busquei profundamente, mas não encontrei o arquivo em nenhum lugar, por isso usei EMPLOYEES
SELECT first_name "Nome", job_id "Cargo" , hire_date "Admissão"
FROM EMPLOYEES


----------------------------------------------------------------------------------------------
-- 7) Exiba o nome concatenado com o valor separado por uma vírgula e espaço e nomeie a coluna como “Nome e Profissão”.
SELECT first_name || ', ' || job_id "Nome e Profissão"
FROM EMPLOYEES


----------------------------------------------------------------------------------------------
-- 8) Crie uma consulta para exibir todos os dados a partir da tabela EMPLOYEES. Separa cada coluna com uma vírgula. Nomeie a coluna como “INFORMACAO DOS EMPREGADOS”.
SELECT employee_id || ', ' || first_name || ', ' || last_name || ', ' ||
        email || ', ' || phone_number || ', ' || hire_date || ', ' ||
        job_id || ', ' || salary || ', ' || commission_pct || ', ' ||
        manager_id || ', ' || department_id "INFORMAÇÃO DOS EMPREGADOS"
FROM EMPLOYEES


----------------------------------------------------------------------------------------------
-- 9) Crie uma consulta para exibir o nome e o salário dos funcionários que recebem mais de 2850.
SELECT first_name, salary
FROM EMPLOYEES
WHERE salary > 2850


----------------------------------------------------------------------------------------------
-- 10) Crie uma consulta para exibir o nome do funcionário e o número do departamento para o número do funcionário 132.
SELECT first_name, department_id
FROM EMPLOYEES
WHERE employee_id = 132


----------------------------------------------------------------------------------------------
-- 11) Exibir o nome e o salário de todos os funcionários cujos salários não estejam na faixa entre 1500 e 2850.
SELECT first_name, salary
FROM EMPLOYEES
WHERE salary NOT BETWEEN 1500 AND 2850


----------------------------------------------------------------------------------------------
-- 12) Exiba o nome do funcionário, o cargo e a data de admissão dos funcionários admitidos entre 01/01/2005 e 31/12/2006. Ordene a consulta de modo crescente pela data inicial.
SELECT first_name, job_id, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '01-Jan-2005' AND '31-Dec-2006'
ORDER BY hire_date


----------------------------------------------------------------------------------------------
-- 13) Exiba o nome do funcionário e o número do departamento de todos os funcionários entre os departamentos 10 e 30 por ordem alfabética de nome.
SELECT first_name, department_id
FROM EMPLOYEES
WHERE department_id BETWEEN 10 AND 30
ORDER BY first_name


----------------------------------------------------------------------------------------------
-- 14) Listar o nome e o salário dos funcionários que recebem mais de 1500 e que estão nos departamentos 10 ou 30. Nomeia as colunas para Empregado e Salário respectivamente.
SELECT first_name "Empregado", salary "Salário"
FROM EMPLOYEES
WHERE salary > 1500 AND department_id = 10 OR department_id = 30


----------------------------------------------------------------------------------------------
-- 15) Exiba o nome e a data de admissão de cada funcionário admitido em 2007.
SELECT first_name, hire_date
FROM EMPLOYEES
WHERE hire_date LIKE '%2007%'


----------------------------------------------------------------------------------------------
-- 16) Exiba o nome e o cargo de todos os funcionários que não possuem um gerente.
SELECT *
FROM EMPLOYEES
WHERE manager_id IS NULL


----------------------------------------------------------------------------------------------
-- 17) Exiba o nome, o salário e a comissão de todos os funcionários que recebem comissão. Classifique os dados em ordem decrescente de salários e comissões.
SELECT first_name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
ORDER BY salary, commission_pct DESC


----------------------------------------------------------------------------------------------
-- 18) Exiba os nomes de todos os funcionários que possuem um a na terceira letra de seus nomes.
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '__a%'


----------------------------------------------------------------------------------------------
-- 19) Exiba todos os funcionários que possuem duas letras L minúsculas em seus nomes e estão no departamento 50 ou seu gerente seja nº 124.
SELECT first_name, department_id, manager_id
FROM EMPLOYEES
WHERE first_name LIKE '%l%l%' AND department_id = 50 OR manager_id = 124


----------------------------------------------------------------------------------------------
-- 20) Exiba o nome, o cargo e o salário de todos os funcionários cujos cargos sejam ST_CLERK ou IT_PROG e que seus salários não sejam iguais a 2500, 3100 e 6000.
SELECT first_name, job_id, salary
FROM EMPLOYEES
WHERE (job_id = 'ST_CLERK' OR job_id = 'IT_PROG')
    AND (salary <> 2500 AND salary <> 3100 AND salary <> 6000)


----------------------------------------------------------------------------------------------
-- 21) Exibir o sobrenome, o salário e a comissão de todos os funcionários cuja comissão seja de 20%.
SELECT last_name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct = 0.2


