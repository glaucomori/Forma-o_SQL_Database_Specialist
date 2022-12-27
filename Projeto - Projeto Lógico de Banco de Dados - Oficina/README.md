# Projeto Lógico de Banco de Dados

## Autor: Glauco Issamu Pereira Mori

### Objetivo:

Esse é um projeto lógico de dados em um cenário fictício de uma oficina.

___
### Narrativa:

Considerações:

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas.
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
- O valor de cada peça também irá compor a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
- Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
- Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.

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

- Exibir todas as ordens de serviço com data de emissão em Setembro/2022.
- Calcular o valor total de cada ordem de serviço descriminando os valores das peças e da mão de obra.
- Exibir as ordens de serviço cujo valor total foi superior a R$ 1.000,00, começando pelas ordens de maior valor.
- Exibir relação dos clientes e seus veículos.
- Exibir quantidades de ordens canceladas emitidas em Outubro/2022.
- Exibir relação de quais veículos cada trabalhador atuou entre Setembro/2022 e Outubro/2022.
