# Projeto de Personalização de Acessos, Visualizações e Automatização de ações no MySQL

O presente projeto tem como objetivo a personalização de de acessos, visualizações e automatização de ações no MySQL.

O projeto usado como base trata-se de um cenário fictício de uma empresa.

### Visualizações

Para as visualizações foram consideradas as seguintes hipóteses de consultas:

- Lista de empregados por departamento e localidade.
- Número de empregados por departamento e localidade.
- Lista de departamentos e seus gerentes. 
- Projetos com maior número de empregados. 
- Lista de projetos, departamentos e gerentes. 
- Quais empregados possuem dependentes e se são gerentes. 

### Acessos

Para os acessos foram criados dois usuários: 

- Gerente.
- Funcionário.

Também foram considerados os seguintes princípios:

- Gerentes terâo acessos a todos as visualizações.
- Funcionários terão restrição de acesso e não poderão 

### Automatização

Para as automatizações foram consideradas duas hipóteses:

- Sempre que um funcionário for desligado, deve-se armazenar suas informações em uma tabela específica para possíveis consultas futuras.
- Não deve ser possível que um funcionário tenha o seu salário reduzido.

