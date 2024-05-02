# [Um corrrentista (cpf, nome, telefone) tem nenhum ou um cartão magnetico (codigo, data de expedição)](https://gabrielluizone.notion.site/Mongo-Collection-e-Crud-49eb5983a9394ff698f26d933ee4bc56)

## Create

```mjs
db.createCollection("correntista")

db.correntista.insertMany([
		{cpf: 1029384765001, nome: "Gabriel", telefone: 5513997832667,
		"cartao": [{codigo: 8729, dataExpedicao: "20/10/2033"}]},
		
		{cpf: 6574839201001, nome: "Samuel", telefone: 6736458743543}
])
```
## Insert

```mjs
db.cartao.insertMany([
	{codigo: 8729, dataExpedicao: "20/10/2033"},
	{codigo: 7643, dataExpedicao: "01/01/2024"},
	{codigo: 8750, dataExpedicao: "11/02/2004"},
	{codigo: 3345, dataExpedicao: "01/11/2014"},
])
```

### Update

```mjs
db.correntista.replaceOne(
	 {cpf: 1029384765001, nome: "Gabriel", telefone: 5513997832667,
		 "cartao.codigo": 8729},
		 
	 {cpf: 1029384765001, nome: "Gabriel Luiz", telefone: 5513997948338,
		 "cartao": [{codigo: 8729, dataExpedicao: "20/10/2024"}]}
)
```

### Delete

```mjs
db.correntista.drop()
```
