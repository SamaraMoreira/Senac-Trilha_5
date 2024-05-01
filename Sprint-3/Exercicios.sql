/* Exercicio 1
Cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer o papel de Especialista de Negócios.

Informações sobre o colaborador
Possui o telefone celular (61) 9 9999-9999;
Possui o telefone residencial (61) 3030-4040;
Email pessoal é fulano@email.com;
Email de trabalho será é fulano.tal@brh.com;
Possui dois dependentes:
Filha Beltrana de Tal;
Esposa Cicrana de Tal.
*/ -- Exercicio Inserir novo colaborador 
INSERT INTO papel (id, nome) VALUES (8, 'Especialista de Negócios');
INSERT INTO endereco (cep, uf, cidade, bairro) VALUES ('33322-100', 'SP', 'São Paulo', 'Avenida');
INSERT INTO colaborador (matricula, nome, cpf, salario, departamento, cep, logradouro, complemento_endereco) VALUES ('A333', 'Fulano de Tal', 
'054.133.798-86', '4500', 'DIR', '33322-100', 'Avenida', 'AP 34');
INSERT INTO telefone_colaborador (colaborador, numero, tipo) VALUES ('A333', '(61) 9 9999-9999', 'M'); 
INSERT INTO telefone_colaborador (colaborador, numero, tipo) VALUES ('A333', '(61) 3030-4040', 'R');
INSERT INTO email_colaborador (colaborador, email, tipo) VALUES ('A333', 'fulano@email.com', 'P');
INSERT INTO email_colaborador (colaborador, email, tipo) VALUES ('A333', 'fulano.tal@brh.com', 'T');
INSERT INTO projeto (id, nome, responsavel, inicio, fim) VALUES (5, 'A333', 'T123', to_date('2024-05-01', 'yyyy-mm-dd'), null);
INSERT INTO dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('111.361.552-67', 'A333', 'Filha Beltrana de Tal', 'Filho(a)', to_date('2010-03-22', 'yyyy-mm-dd'));
INSERT INTO dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('111.803.531-19', 'A333', 'Esposa Cicrana de Tal', 'Cônjuge', to_date('1990-06-30', 'yyyy-mm-dd'));
INSERT INTO atribuicao (projeto, colaborador, papel) VALUES (5, 'A333', 8);

/*
Crie uma consulta que liste:
matricula do colaborador;
nome do dependente;
data de nascimento do dependente.
A consulta deve listar somente os dependentes que são Cônjuge.*/

-- Exercicio 2 Relatório de cônjuges
Select colaborador, nome, data_nascimento from dependente where parentesco = 'Cônjuge';

/*
Crie uma consulta que liste:
matricula do colaborador;
número de telefone.

A consulta deve listar somente telefones móveis ou comerciais;
O resultado deve ser ordenado pela matrícula do colaborador e pelo número do telefone.
*/

-- Exercicio 3 Relatório de contatos telefônicos
select colaborador, numero from telefone_colaborador where tipo = 'M' OR  tipo = 'C' ORDER BY colaborador, numero;

/*
Criar consulta que liste nome e o salário do colaborador com o maior salário;
A consulta deve ser flexível para continuar funcionando caso surja algum funcionário com salário maior que o do Zico.
*/
-- Exercicio 4 Listar colaborador com maior salário
select nome, salario from colaborador where salario = (select max(salario) from colaborador);

/*
A senioridade dos colaboradores é determinada pela faixa salarial:

Júnior: até R$ 3.000,00;
Pleno: R$ 3.000,01 a R$ 6.000,00;
Sênior: R$ 6.000,01 a R$ 20.000,00;
Corpo diretor: acima de R$ 20.000,00.
Tarefa
Criar uma consulta que liste a matrícula, nome, salário, e nível de senioridade do colaborador;
*/

/*Criar consulta que liste nome do colaborador e a quantidade de dependentes que ele possui
No relatório deve ter somente colaboradores com 2 ou mais dependentes.
Ordenar consulta pela quantidade de dependentes em ordem decrescente, e colaborador crescente.
*/ 

-- Exercicio 5 Relatório de senioridade - Questionar como realizar sem plsql


/*
Criar consulta que liste nome do colaborador e a quantidade de dependentes que ele possui;
No relatório deve ter somente colaboradores com 2 ou mais dependentes.
Ordenar consulta pela quantidade de dependentes em ordem decrescente, e colaborador crescente.
*/
-- Exercicio 6 Listar colaboradores com mais dependentes
SELECT 
    c.nome AS nome_colaborador,
    COUNT(d.nome) AS quantidade_dependentes
FROM 
    colaborador c
JOIN 
    dependente d ON c.matricula = d.colaborador
GROUP BY 
    c.matricula, c.nome
HAVING 
    COUNT(d.nome) >= 2
ORDER BY 
    quantidade_dependentes DESC, nome_colaborador;

/*

Crie uma consulta que liste:
a matrícula do colaborador;
o nome do dependente;
e a idade do dependente (não a data de nascimento)
*/
-- Exercicio 7 Relatório de dependentes menores de idade
SELECT 
    d.colaborador AS colaborador,
    d.nome AS nome_dependente,
    FLOOR(MONTHS_BETWEEN(SYSDATE, d.data_nascimento) / 12) AS idade
FROM 
    dependente d
WHERE 
    FLOOR(MONTHS_BETWEEN(SYSDATE, d.data_nascimento) / 12) < 18;



