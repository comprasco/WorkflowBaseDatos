set linesize 555;
set serveroutput on; 
SPOOL NN_SDB_PGN_MOTIVO_TRAMITE.out;
------------------------------------------------------------------------------------------------

UPDATE SDB_PGN_MOTIVO_TRAMITE SET ESTADO_ACTIVIDAD = 'XRP' WHERE ID_MOTIVO_TRAMITE = '130';
UPDATE SDB_PGN_MOTIVO_TRAMITE SET ESTADO_ACTIVIDAD = 'XRP' WHERE ID_MOTIVO_TRAMITE = '749';


