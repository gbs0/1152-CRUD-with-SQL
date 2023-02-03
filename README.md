### CRUD em SQL
Vamos revisar os conceitos de CRUD. O que é o CRUD?
```
Create
Read
Update
Destroy
```


### Exemplo
Vamos criar uma tabela de Doutores com nome, idade e especialidade:

```

CREATE TABLE `doctors`(
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT,
  `age` INTEGER,
  `specialty` TEXT
);
  
```


#### Read 
SQL keyword: **SELECT**


Para ler todos os registros:

```

SELECT * FROM doctors;

```


Para selecionar um registro especifico

```

SELECT * FROM doctors WHERE id = 2;

```


#### Create
SQL keyword: **INSERT INTO**

Para inserir alguns doutores na tabela:

```
  INSERT INTO doctors (name, age, specialty)
VALUES ('Dr. Dolladille', 45, 'Dentist');
```


#### Update 
SQL Keyword: **UPDATE SET**

Para atualizar um registro especifico:

```

UPDATE doctors SET age = 40, name = 'John Smith' WHERE id = 3

```


#### Delete
> SQL Keyword: DELETE

Para deletar um registro especifico:

```

DELETE FROM doctors WHERE id = 32;

```


Deletar **TODOS** os registros de uma única vez:

```


DELETE FROM doctors;

```

