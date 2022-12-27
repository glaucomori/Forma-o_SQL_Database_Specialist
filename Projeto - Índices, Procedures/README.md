# Projeto de Personalização de um Bando de Dados com Índices e Procedimentos

O presente projeto tem como objetivo a personalização de um bando de dados através da aplicação de índices e procedimentos.

O projeto usado como base trata-se de um cenário fictício de e-commerce cujo esquema conceitual e projeto lógico estão situados em suas respectivas pastas dentro do meu repositório.

### Índices

Para os índices foram priorizadas as tabelas: 'product', 'clients', 'orders' e 'address'.

A priorização considerou essas tabelas como as que possuem os dados mais relevantes e que receberiam mais consultas.

Em todas essas tabelas foram criados índices para os argumentos que seriam mais acessados, sendo escolhidos os seguintes atributos em cada tabela?

product -->> descrição do produto
clients -->> nome do cliente
orders  -->> identificação da ordem
address -->> nome da rua

Para todos esses argumentos acima a estrutura determinada para os índices foi o tipo 'btree', por se tratarem de argumentos que possuem elevada quantidade de elementos.


### Procedimentos

Para os procedimentos foi usada a tabela 'clients', por se tratar de dados que seriam manipulados com frequência.

Os procedimentos criados contemplam o cadastro de novos clientes, atualização de clientes previamente cadastrados e a exclusão de clientes.

Foi criado um procedimento que engloba todas as funções acima sitadas, devendo passar como primeiro atributo uma variável de controle na seguinte condição:
1 --> inserção | 2 --> exclusão | 3 --> atualização

Também foram criados procedimentos individuais que realizam a sua respectiva função sem a necessidade de um atributo de controle.
