REM INSERTING into SDB_PGN_MOTIVO_TRAMITE
set linesize 555; 
set serveroutput on; 
SPOOL NN_SDB_PGN_MOTIVO_TRAMITE.out; 
SET DEFINE OFF;
--------------------------------------------------------------------------------------------------------------------------------
DELETE FROM SDB_PGN_MOTIVO_TRAMITE WHERE ID_PROCESO = '6' AND ID_SUBPROCESO = '4' AND ID_ETAPA_ORIGEN = '10' AND ID_MOTIVO = '10' AND ID_ETAPA_POSTERIOR = '15'
commit;
--------------------------------------------------------------------------------------------------------------------------------
SPOOL OFF
