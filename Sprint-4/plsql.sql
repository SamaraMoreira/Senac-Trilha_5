SET SERVEROUTPUT ON;


-- Exercicio 1 

CREATE OR REPLACE PROCEDURE insere_projeto (p_id in Integer, p_nome in varchar2, p_responsavel in varchar2, p_inicio in date, p_fim in date) 
IS
BEGIN
    INSERT INTO projeto (id, nome, responsavel, inicio, fim) VALUES (p_id, p_nome, p_responsavel, p_inicio, p_fim);
END;

Select * from projeto;


BEGIN
    insere_projeto(6, 'BRH_PROCEDURE', 'D123',  to_date('2022-01-01', 'yyyy-mm-dd'), null);
    COMMIT;
END;

-- Exercicio 2
CREATE OR REPLACE FUNCTION calcula_idade (p_data IN DATE)
RETURN INTEGER IS
    v_idade INTEGER;
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, p_data) / 12) INTO v_idade FROM dual;
    RETURN v_idade;
END;

DECLARE
    v_data Date := TO_DATE('&nascimento', 'DD/MM/YYYY');
    v_idade INTEGER;
begin
    v_idade := calcula_idade(v_data);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || v_idade);
END;
    


-- Exercicio 3
CREATE OR REPLACE FUNCTION finaliza_projeto (p_id IN number)
RETURN DATE IS
    v_data Date;
BEGIN
    v_data := SYSDATE;
    UPDATE projeto SET fim = v_data WHERE id = p_id;
    DBMS_OUTPUT.PUT_LINE('Finalização: ' || v_data);
    RETURN v_data;
END;

Select * from projeto;

DECLARE
    id_projeto INTEGER := &id_projeto;
    v_data DATE;
begin
    v_data := finaliza_projeto(id_projeto);
    Commit;
END;

-- Exercicio 4
CREATE OR REPLACE PROCEDURE insere_projeto (p_id in Integer, p_nome in varchar2, p_responsavel in varchar2, p_inicio in date, p_fim in date) 
IS
BEGIN
    IF LENGTH(p_nome) < 2 OR p_nome IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nome de projeto inválido! Deve ter dois ou mais caracteres.');
    END IF;
    INSERT INTO projeto (id, nome, responsavel, inicio, fim) VALUES (p_id, p_nome, p_responsavel, p_inicio, p_fim);
END;    

BEGIN
    insere_projeto(7, 'B', 'D123',  to_date('2022-01-01', 'yyyy-mm-dd'), null);
    COMMIT;
END;

-- Exercicio 5 
CREATE OR REPLACE FUNCTION calcula_idade (p_data IN DATE)
RETURN INTEGER IS
    v_idade INTEGER;
BEGIN
    IF p_data > SYSDATE OR p_data IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Impossível calcular idade! Data inválida: ' || TO_CHAR(p_data, 'DD/MM/YYYY') || '.');
    END IF;
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, p_data) / 12) INTO v_idade FROM dual;
    RETURN v_idade;
END;

DECLARE
    v_data Date := TO_DATE('&nascimento', 'DD/MM/YYYY');
    v_idade INTEGER;
begin
    v_idade := calcula_idade(v_data);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || v_idade);
END;