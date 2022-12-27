# Projeto Lógico de Banco de Dados

## Autor: Glauco Issamu Pereira Mori
## Data: 29/10/2022
___
### Descrição

Esse é um projeto lógico de dados em um cenário fictício de um E-commerce.

___
### Narrativa do projeto

Considerações:

- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
- Cada produto possui um fornecedor.
- Um ou mais produtos podem compor um pedido.
- O cliente pode se cadastrar no site com seu CPF ou CNPJ, mas não pode ter as duas informações.
- O endereço do cliente irá determinar o valor do frete.
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.
- Os pedidos são criados por clientes e possuem informações de compra, endereço e status de entrega.
- Um produto ou mais compôem um pedido.
- O pedido pode ser cancelado.
- Pode ser cadastrado mais de uma forma de pagamento.
- A entrega deve possuir status e código de rastreio.

___
### Descrição do Projeto Lógico

Partindo do modelo conceitual elaborado com base na narrativa do projeto, e após um refinamento do mesmo, foi definido um modelo relacional.

Pontos considerados:

- Definição de chaves primárias e estrangeiras.
- Definição de constraints presentes no cenário modelado.
- Estabelecimento de relacionamentos presentes no modelo EER.
- Criação do Script SQL para criação do esquema do banco de dados.
- Realização da persistência de dados para realização de testes (todos os dados são fictícios e com objetivo apenas acadêmico).
- Estabelecimento de queries para diversas situações e questionamentos

Situações e Questionamentos abordados nas queries:

- Exibir identificação do produto e sua descrição, para os produtos das categorias: Informática e Eletrônicos.
- Exibir a quantidade de clientes por estado.
- Exibir os produtos que são disponibilizados pelo fornecedor em menos de 30 dias.
- Exibir a quantidade nos estoques dos produtos de cada categoria. Organizando do menor para o maior.
- Exibir os valores subtotais dos produtos nos pedidos.
- Exibir tabela com os seguintes dados: fornecedor, produtos atendidos, quantidade disponível, prazo para disponibilização.
- Exibir tabela com os seguintes dados: produto, local no estoque, quantidade no estoque, fornecedor, quantidade no fornecedor, vendedor, quantidade no vendedor.
- Exibir tabela com os seguintes dados: cliente, produto, preço unitário, quantidade, subtotal, frete e valor total.
- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos fornecedores e estoques;
- Relação de nomes dos fornecedores e nomes dos produtos;
