# Exploração do Modelo de Entidade-Relacionamento

`Autor` Gabriel Luiz dos Santos Silva\
`Data` Ago, 21 2023

Afiliação: Ciência de Dados | Banco e Armazém de Dados

## Modelo de Entidade-Relacionamento

Em modelagem de dados, temos a modelagem Entidade-Relacionamento, onde é uma representação gráfica, utilizada como Diagrama Entidade-Relacionamento, facilitando a visão do Banco de Dados. Em Modelagem de Dados, temos o Modelo de Entidade-Relacionamento (MER), focado para descrever as entidades, com suas características (atributos) e como elas se relacionam entre si. O modelo é baseado na percepção da realidade, seu propósito geral é a abstração de como será a estrutura do banco de dados, facilitando o projeto de um banco de dados e a compreensão por parte do usuário.

> Entidade (Objeto):
O conceito de entidade está relacionada à realidade, sendo algo pertencente a ela, podendo ser classificado como físico ou lógico, de acordo com sua existência no mundo real. Em outras palavras, a entidade é a representação abstrata de um objeto da realidade.
> 
> - **Cachorro:** conceito físico e real, um animal doméstico
> - **Carteiro:** conceito físico e real, uma profissão
> - **Curso:** conceito abstrato e não deixa de ser uma entidade

> Atributo (Campo):
O conceito de atributo é definido como a propriedade de uma entidade, o elemento de dado que contém o valor de uma propriedade de uma entidade, em outras palavras, a característica dela.
> 
> - **Funcionário (Entidade):** Nome, Idade, Cargo e Salário (Atributos)
> - **Carro (Entidade):** Marca, Motor, Cor e Ano (Atributos)

## Classificações

Entidades e campos podem ser classificados conforme o motivo de sua existência e função.

### Classificações das Entidades

- **Entidades fracas:** são entidades que necessitam de outra entidade para o seu sentido. A entidade venda não fará sentido sem termos a entidade produto, não há como vender com a ausência de um produto.
- **Entidades fortes:** são entidades que não dependem de outra entidade para o seu sentido. A própria entidade não necessita de outra entidade para o sentido de existir.

### Classificação dos Atributos

- **Atributo simples:** básico e indivisível. CPF, Sexo, Idade
- **Atributo composto:** pode ser dividido. Nome (Sobrenome, Nome do meio)

Uma observação a ser feita é que a definição dos atributos pode variar, pois assim como uns podem considerar “nome” como um atributo simples, ele também pode ser considerado como um atributo composto, dependendo do usuário.

> Atributos Monovalorados: um único valor para a entidade. Exemplo, os Nome
Obs.: Isso significa que cada vez que você cria uma nova entrada ou registro para essa entidade, o atributo monovalorado terá apenas um valor associado a ele. Por exemplo, um atributo “Nome” de uma entidade “Cliente” seria monovalorado, pois cada cliente teria um único nome.
> 

> Atributos Multivalorados: mais de um valor para a entidade. Dependentes
Obs.: Podemos ter uma entidade com múltiplos valores associados a esse atributo. Por exemplo, se estivermos modelando uma entidade “Livro” e quisermos incluir os gêneros nos quais um livro se enquadra, o atributo “Gêneros” pode ser multivalorado, pois um livro pode pertencer a vários gêneros, como “Ficção Científica”, “Fantasia” e “Aventura”.
> 

> Atributos chave: Identidade única de um conjunto de entidades, elas servem para a identificação de maneira única. Exemplos IDs e Siglas
Atributo derivado: o valor derivado de outro atributo. A Idade é um atributo que pode ser derivado da data de nascimento do indivíduo
> 

## Classificações

Entendida o que são entidades e os seus atributos e seus tipos de classificação, partimos para entendermos como são os tipos de relacionamento, pois, como dito que os atributos são características das entidades.

### Um para Um ($1..1$)

Explicando com minhas palavras, ao termos o Relacionamento 1..1 (1 para 1), estamos nos referindo ao relacionamento de uma entidade, com a outra entidade, compartilhando um valor para outro valor distinto.

> Exemplo: Em um Banco de Dados de currículos, teremos que cada usuário cadastrado pode possuir apenas um currículo na base, ao mesmo tempo, em que cada currículo só pertence a um único usuário cadastrado.
> 

### Um para Muitos ($1..n$)

1 para Muitos, envolve uma entidade que referencia várias instâncias de outra entidade. Uma observação, cada uma das múltiplas instâncias referenciadas está vinculada apenas a uma instância da primeira entidade.

> Exemplo: Se tivermos um Banco de Dados de pacientes que tomam medicamentos, podemos ter um único paciente para muitos medicamentos.
> 

### Muitos para Muitos ($n..n$)

Neste tipo de relacionamento, cada entidade, de ambos os lados, podem referenciar múltiplas unidades da outra.

> Exemplo: Em um sistema de biblioteca, um título pode ser escrito por vários autores, ao mesmo tempo, em que um autor pode escrever vários títulos. Assim, um objeto do tipo autor pode estar relacionado a vários objetos do tipo título e vice-versa.
> 

## Referências Bibliográficas

- ILVA, I. R. **GBC043 – Sistemas de Banco de Dados Modelo de Entidade-Relacionamento (ER)**. UFU/FACOM - Faculdade de Computação, Universidade Federal de Uberlândia. 2013. [Link](https://www.facom.ufu.br/~ilmerio/sbd20141/sbd2modeloER.pdf)
- FILETO Renato. **O Modelo Entidade-Relacionamento**. INE/CTC/UFSC - Depto. de Informática e Estatística, Universidade Federal de Santa Catarina. 2006. [Link](https://www.inf.ufsc.br/~r.fileto/Disciplinas/INE5423-2010-1/Aulas/02-MER.pdf)
- JOEL. **MER e DER: Modelagem de Bancos de Dados**. DevMedia. 2014. [Link](https://www.devmedia.com.br/mer-e-der-modelagem-de-bancos-de-dados/14332)
