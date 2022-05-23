set linesize 555;
set serveroutput on; 
SPOOL NN_SDB_PGN_ETAPA.out;   
-------------------------------------------------------------------------------------------------------------
-- MANTIS: 2791 NATALIA.
UPDATE SDB_PGN_ETAPA
SET NOMBRE = 'APROBACION EJECUCION'
,DESCRIPCION = 'APROBACION EJECUCION' 
,ID_USUARIO_MODIFICACION = USER
,FECHA_MODIFICACION = SYSTIMESTAMP
where Id_Etapa = 840;
/