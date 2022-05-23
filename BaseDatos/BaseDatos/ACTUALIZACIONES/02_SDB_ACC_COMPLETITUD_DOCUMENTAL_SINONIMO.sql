--Bachue script
set linesize 555;
set serveroutput on; 
SPOOL SINONIMO_SDB_ACC_COMPLETITUD_DOCUMENTAL.out;  
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------Acciones DDL en este archivo----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
DECLARE
        v_user_existsWF number := 0;  
        v_user_existsSDB number := 0;  
BEGIN
        Select count(*) into v_user_existsWF from DBA_USERS where USERNAME = 'ADM_WORKFLOW_ENGINE';
        if (v_user_existsWF = 1) 
        then
            Select count(*) into v_user_existsSDB from DBA_USERS where USERNAME = 'ADM_SDB';
            if (v_user_existsSDB = 1) 
            then
                execute immediate 'create or replace editionable synonym SDB_ACC_COMPLETITUD_DOCUMENTAL  for ADM_SDB.SDB_ACC_COMPLETITUD_DOCUMENTAL';
                dbms_output.PUT_LINE('Sinonimo creado a: '||'ADM_SDB.SDB_ACC_COMPLETITUD_DOCUMENTAL');
            end if;
        end if;
END;
/
--Select * from SDB_ACC_COMPLETITUD_DOCUMENTAL
----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
SPOOL OFF



