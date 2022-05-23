set linesize 555;
set serveroutput on; 
SPOOL NN_SDB_ACC_SUBPROCESO.out;   
--------------------------------------------------------------------------------------------------------------------------------
------------------------------- 
---SDB_ACC_SUBPROCESO
-------------------------------
/*
Solicitud Natalia suarez, 18/08/2021
*/
Begin
UPDATE SDB_ACC_SUBPROCESO 
SET ACTIVO = 'N',
ID_USUARIO_MODIFICACION = user,
FECHA_MODIFICACION = SYSTIMESTAMP
WHERE ID_PROCESO = '42' AND ID_SUBPROCESO = '2';
DBMS_OUTPUT.PUT_LINE('Registro actualizado en:SDB_ACC_SUBPROCESO: CORE_BACHUE');
commit;
EXCEPTION 
WHEN OTHERS THEN
dbms_output.PUT_LINE('Error en la actualizacion:SDB_ACC_SUBPROCESO: CORE_BACHUE:'|| sqlcode ||','||  sqlerrm);
End;
/
