# Lista 03

Fatec Rubens Lara **`Ciência de Dados`**

> *Banco de Dados Não Relacional*

- **[Notion Online | Lista 03](https://gabrielluizone.notion.site/Lista-03-537ec62c531b487cbb1843bc1637f51c)**

---

### Fazer cada exercício com no mínimo dois tipos de join.

1. Crie uma consulta para exibir o sobrenome do funcionário, sua matrícula e o nome do departamento que ele está alocado.

```sql
SELECT e.last_name, d.department_id, d.department_name
FROM EMPLOYEES e JOIN DEPARTMENTS d
    ON e.department_id = d.department_id
```

- **Resultado da consulta `1a`**
    
    ![Untitled](Output/Untitled.png)
    

```sql
SELECT e.last_name, d.department_id, d.department_name
FROM EMPLOYEES e INNER JOIN DEPARTMENTS d
    ON e.department_id = d.department_id
```

- **Resultado da consulta `1b`**

---

1. Crie uma lista única de todos os cargos existentes no departamento 80. Inclua a localização deste departamento.

```sql
SELECT DISTINCT j.job_title, l.street_address
FROM EMPLOYEES e
    JOIN JOBS j
        ON j.job_id = e.job_id
    JOIN DEPARTMENTS d
        ON d.department_id = e.department_id
    JOIN LOCATIONS l
        ON l.location_id = d.location_id
WHERE d.department_id = 80
```

- **Resultado da consulta `2a`**
    
    ![Untitled](Output/Untitled%201.png)
    

```sql
SELECT DISTINCT j.job_title, l.street_address
FROM EMPLOYEES e,
     JOBS j,
     DEPARTMENTS d,
     LOCATIONS l
WHERE (j.job_id = e.job_id) AND
      (d.department_id = e.department_id) AND
      (l.location_id = d.location_id) AND
      d.department_id = 80
```

- **Resultado da consulta `2b`**
    
    ![Untitled](Output/Untitled%202.png)
    

---

3. Crie uma consulta para exibir o sobrenome do funcionário, o nome do departamento, a localização e a cidade de todos os funcionários que recebem comissão.

```sql
SELECT e.last_name, d.department_name, l.street_address, l.city
FROM EMPLOYEES e
    JOIN DEPARTMENTS d
        ON d.department_id = e.department_id
    JOIN LOCATIONS l
        ON l.location_id = d.location_id
WHERE e.commission_pct IS NOT NULL
```

- **Resultado da consulta `3a`**
    
    ![Untitled](Output/Untitled%203.png)
    

```sql
SELECT e.last_name, d.department_name, l.street_address, l.city
FROM EMPLOYEES e
    LEFT JOIN DEPARTMENTS d
        ON d.department_id = e.department_id
    LEFT JOIN LOCATIONS l
        ON l.location_id = d.location_id
WHERE e.commission_pct IS NOT NULL
```

- **Resultado da consulta `3b`**
    
    ![Untitled](Output/Untitled%204.png)
    

---

4. Exiba o sobrenome do funcionário e o nome do departamento para todos os funcionários que possuem um a em seus sobrenomes.

```sql
SELECT e.last_name, d.department_name
FROM EMPLOYEES e JOIN DEPARTMENTS d
    ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%'
```

- **Resultado da consulta `4a`**
    
    ![Untitled](Output/Untitled%205.png)
    

```sql
SELECT e.last_name, d.department_name
FROM EMPLOYEES e RIGHT JOIN DEPARTMENTS d
    ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%'
```

- **Resultado da consulta `4b`**
    
    ![Untitled](Output/Untitled%206.png)
    

---

5. Crie uma consulta para exibir o sobrenome, o cargo, o número e o nome do departamento para todos os funcionários que trabalham em Toronto.

```sql
SELECT e.last_name, j.job_title, d.department_id, d.department_name
FROM EMPLOYEES e
    JOIN JOBS j
        ON j.job_id = e.job_id
    JOIN DEPARTMENTS d
        ON d.department_id = e.department_id
    JOIN LOCATIONS l
        ON l.location_id = d.location_id
WHERE l.city = 'Toronto'
```

- **Resultado da consulta `5a`**
    
    ![Untitled](Output/Untitled%207.png)
    

```sql
SELECT e.last_name, j.job_title, d.department_id, d.department_name
FROM EMPLOYEES e, JOBS j, DEPARTMENTS d, LOCATIONS l
WHERE (e.job_id = j.job_id) AND
      (e.department_id = d.department_id) AND
      (l.location_id = d.location_id) AND
      l.city = 'Toronto'
```

- **Resultado da consulta `5b`**
    
    ![Untitled](Output/Untitled%208.png)
