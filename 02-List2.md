# Lista 02

Fatec Rubens Lara **`Ciência de Dados`**

> *Banco de Dados Não Relacional*

## Funções de Grupos


### Pergunta 1

Exiba os salários maior, médio, menor e a soma de todos os salários de todos os funcionários. Coloque um label[1] nas colunas Máximo, Mínimo, Soma e Média, respectivamente. Arredonde os resultados para o número inteiro mais próximo.

```sql
SELECT MAX(SALARY) "Máximo",
       MIN(SALARY) "Minímo",
       SUM(SALARY) "Soma",
       ROUND(AVG(SALARY)) "Média"
FROM EMPLOYEES
```

### Pergunta 2

Exibir o salário maior, médio, menor e a soma de todos os salários para cada tipo de cargo.

```sql
SELECT JOB_ID "Cargo",
       MAX(SALARY) "Máximo",
       MIN(SALARY) "Minímo",
       SUM(SALARY) "Soma",
       ROUND(AVG(SALARY)) "Média"
FROM EMPLOYEES
GROUP BY JOB_ID
```

### Pergunta 3

Crie uma consulta para exibir o número de pessoas com o mesmo cargo.

```sql
SELECT JOB_ID "Cargos", COUNT(EMPLOYEE_ID) "QNTD. de Pessoas"
FROM EMPLOYEES
GROUP BY JOB_ID
```

### Pergunta 4

Determine o número de gerentes sem listá-los. Coloque um label na coluna Número de Gerentes.

```sql
SELECT COUNT(MANAGER_ID) "Número de Gerentes"
FROM EMPLOYEES
```

### Pergunta 5

Crie uma consulta para exibir a diferença entre os maiores e menores salários; coloque um label na coluna DIFERENCA.

```sql
SELECT MAX(SALARY) - MIN(SALARY) "DIFERENCA"
FROM EMPLOYEES
```

### Pergunta 6

Exiba o número do gerente e o salário do funcionário com menor pagamento sob a supervisão desse gerente. Exclua todos cujo gerente não seja conhecido. Exclua todos os grupos em que o salário mínimo seja menor do que 1000. Classifique a saída em ordem decrescente de salário.

```sql
SELECT MANAGER_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE (SALARY >= 1000) AND (MANAGER_ID IS NOT NULL)
GROUP BY MANAGER_ID
ORDER BY MIN(SALARY) DESC
```
