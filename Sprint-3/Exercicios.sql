/* Exercicio 1
Cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer o papel de Especialista de Neg�cios.

Informa��es sobre o colaborador
Possui o telefone celular (61) 9 9999-9999;
Possui o telefone residencial (61) 3030-4040;
Email pessoal � fulano@email.com;
Email de trabalho ser� � fulano.tal@brh.com;
Possui dois dependentes:
Filha Beltrana de Tal;
Esposa Cicrana de Tal.
*/ -- Exercicio Inserir novo colaborador 
INSERT INTO papel (id, nome) VALUES (8, 'Especialista de Neg�cios');
INSERT INTO endereco (cep, uf, cidade, bairro) VALUES ('33322-100', 'SP', 'S�o Paulo', 'Avenida');
INSERT INTO colaborador (matricula, nome, cpf, salario, departamento, cep, logradouro, complemento_endereco) VALUES ('A333', 'Fulano de Tal', 
'054.133.798-86', '4500', 'DIR', '33322-100', 'Avenida', 'AP 34');
INSERT INTO telefone_colaborador (colaborador, numero, tipo) VALUES ('A333', '(61) 9 9999-9999', 'M'); 
INSERT INTO telefone_colaborador (colaborador, numero, tipo) VALUES ('A333', '(61) 3030-4040', 'R');
INSERT INTO email_colaborador (colaborador, email, tipo) VALUES ('A333', 'fulano@email.com', 'P');
INSERT INTO email_colaborador (colaborador, email, tipo) VALUES ('A333', 'fulano.tal@brh.com', 'T');
INSERT INTO projeto (id, nome, responsavel, inicio, fim) VALUES (5, 'A333', 'T123', to_date('2024-05-01', 'yyyy-mm-dd'), null);
INSERT INTO dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('111.361.552-67', 'A333', 'Filha Beltrana de Tal', 'Filho(a)', to_date('2010-03-22', 'yyyy-mm-dd'));
INSERT INTO dependente (cpf, colaborador, nome, parentesco, data_nascimento) VALUES ('111.803.531-19', 'A333', 'Esposa Cicrana de Tal', 'C�njuge', to_date('1990-06-30', 'yyyy-mm-dd'));
INSERT INTO atribuicao (projeto, colaborador, papel) VALUES (5, 'A333', 8);

/*
Crie uma consulta que liste:
matricula do colaborador;
nome do dependente;
data de nascimento do dependente.
A consulta deve listar somente os dependentes que s�o C�njuge.*/

-- Exercicio 2 Relat�rio de c�njuges
Select colaborador, nome, data_nascimento from dependente where parentesco = 'C�njuge';

/*
Crie uma consulta que liste:
matricula do colaborador;
n�mero de telefone.

A consulta deve listar somente telefones m�veis ou comerciais;
O resultado deve ser ordenado pela matr�cula do colaborador e pelo n�mero do telefone.
*/

-- Exercicio 3 Relat�rio de contatos telef�nicos
select colaborador, numero from telefone_colaborador where tipo = 'M' OR  tipo = 'C' ORDER BY colaborador, numero;

/*
Criar consulta que liste nome e o sal�rio do colaborador com o maior sal�rio;
A consulta deve ser flex�vel para continuar funcionando caso surja algum funcion�rio com sal�rio maior que o do Zico.
*/
-- Exercicio 4 Listar colaborador com maior sal�rio
select nome, salario from colaborador where salario = (select max(salario) from colaborador);

/*
A senioridade dos colaboradores � determinada pela faixa salarial:

J�nior: at� R$ 3.000,00;
Pleno: R$ 3.000,01 a R$ 6.000,00;
S�nior: R$ 6.000,01 a R$ 20.000,00;
Corpo diretor: acima de R$ 20.000,00.
Tarefa
Criar uma consulta que liste a matr�cula, nome, sal�rio, e n�vel de senioridade do colaborador;
*/

/*Criar consulta que liste nome do colaborador e a quantidade de dependentes que ele possui
No relat�rio deve ter somente colaboradores com 2 ou mais dependentes.
Ordenar consulta pela quantidade de dependentes em ordem decrescente, e colaborador crescente.
*/ 

-- Exercicio 5 Relat�rio de senioridade - Questionar como realizar sem plsql


/*
Criar consulta que liste nome do colaborador e a quantidade de dependentes que ele possui;
No relat�rio deve ter somente colaboradores com 2 ou mais dependentes.
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
a matr�cula do colaborador;
o nome do dependente;
e a idade do dependente (n�o a data de nascimento)
*/
-- Exercicio 7 Relat�rio de dependentes menores de idade
SELECT 
    d.colaborador AS colaborador,
    d.nome AS nome_dependente,
    FLOOR(MONTHS_BETWEEN(SYSDATE, d.data_nascimento) / 12) AS idade
FROM 
    dependente d
WHERE 
    FLOOR(MONTHS_BETWEEN(SYSDATE, d.data_nascimento) / 12) < 18;



