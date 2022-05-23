set linesize 555;
set serveroutput on; 
SPOOL NN_INSERT_SDB_PGN_MOTIVO_TRAMITE.out;
------------------------------------------------------------------------------------------------
UPDATE SDB_PGN_MOTIVO_TRAMITE
SET DESCRIPCION = 'REALIZAR REGISTRO CON APERTURA DE MATRICULA'
where ID_PROCESO = '6' AND id_etapa_origen = 80 and id_motivo = 100 and id_etapa_posterior = 190 