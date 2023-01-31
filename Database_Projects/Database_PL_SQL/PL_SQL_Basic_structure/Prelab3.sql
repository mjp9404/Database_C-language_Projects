
-- #1 CREATE PL/SQL BLOCK --
DECLARE
v_hiredate DATE := '10-JAN-2013';
v_surname VARCHAR2(30); 
v_firstname VARCHAR2(30); 
k_salary NUMBER(5,2); 

BEGIN
v_surname := 'Park'; 
v_firstname := 'Minjong'; 
k_salary := 100.25; 

DBMS_OUPUT.PUT_LINE (v_hiredate);
DBMS_OUPUT.PUT_LINE (v_surname);
DBMS_OUPUT.PUT_LINE (v_firstname);
DBMS_OUPUT.PUT_LINE (k_salary);

END;


-- #2 RETRIEVE THE AGENT INFORMATION(AGENT 0000002) BY NO %TYPE --

DECLARE
v_agentId VARCHAR(7);
v_surname VARCHAR2(25); 
v_firstname VARCHAR2(25);
v_hiredate DATE;
v_home_phone VARCHAR2(10);
v_business_phone VARCHAR2(10);

BEGIN
SELECT agent_id, last_name, first_name, date_of_hire, home_phone, business_phone
INTO v_agentId, v_surname, v_firstname, v_hiredate, v_home_phone, v_business_phone
FROM ata_agent
WHERE agent_id = '0000002';
DBMS_OUPUT.PUT_LINE(v_agentId||' * '||v_surname ||', '|| v_firstname||' * '|| v_hiredate||' * '|| v_home_phone||' * '|| v_business_phone);

END;



-- #3 RETRIEVE THE AGENT INFORMATION(AGENT 0000002) BY %TYPE --

DECLARE
v_agentId ata_agent.agent_id%TYPE;
v_surname ata_agent.last_name%TYPE; 
v_firstname ata_agent.first_name%TYPE;
v_hiredate ata_agent.date_of_hire%TYPE;
v_home_phone ata_agent.home_phone%TYPE;
v_business_phone ata_agent.business_phone%TYPE;

BEGIN
SELECT aa.agent_id, aa.last_name, aa.first_name, aa.date_of_hire, aa.home_phone, aa.business_phone
INTO v_agentId, v_surname, v_firstname, v_hiredate, v_home_phone, v_business_phone
FROM ata_agent aa
WHERE aa.agent_id = '0000002';
DBMS_OUPUT.PUT_LINE(v_agentId||' * '||v_surname ||', '|| v_firstname||' * '|| v_hiredate||' * '|| v_home_phone||' * '|| v_business_phone);

END;



-- #4 RETRIEVE THE AGENT INFORMATION(AGENT 0000002) BY CUSTOM RECORD --

DECLARE
TYPE type_agent IS RECORD(
v_agentId ata_agent.agent_id%TYPE,
v_surname ata_agent.last_name%TYPE, 
v_firstname ata_agent.first_name%TYPE,
v_hiredate ata_agent.date_of_hire%TYPE,
v_home_phone ata_agent.home_phone%TYPE,
v_business_phone ata_agent.business_phone%TYPE);
rec_agent type_agent;

BEGIN
SELECT agent_id, last_name, first_name, date_of_hire, home_phone, business_phone
INTO rec_agent
FROM ata_agent
WHERE agent_id = '0000002';
DBMS_OUPUT.PUT_LINE(v_agentId||' * '||v_surname ||', '|| v_firstname||' * '|| v_hiredate||' * '|| v_home_phone||' * '|| v_business_phone);

END;


-- #5 RETRIEVE THE AGENT INFORMATION(AGENT 0000002) BY %ROWTYPE --

DECLARE
rec_agent ata_agent%ROWTYPE; 
BEGIN
SELECT *
INTO rec_agent
FROM ata_agent
WHERE agent_id = '0000002';
DBMS_OUPUT.PUT_LINE(v_agentId||' * '||v_surname ||', '|| v_firstname||' * '|| v_hiredate||' * '|| v_home_phone||' * '|| v_business_phone);

END;
