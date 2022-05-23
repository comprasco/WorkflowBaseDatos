set linesize 555; 
set serveroutput on;  
SPOOL 01_sdb_pgn_motivo_tramite.out;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------Acciones DDL en este archivo----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--select * from sdb_pgn_motivo_tramite where id_etapa_origen = 281 and id_etapa_posterior = 80 AND ID_MOTIVO = 20
--REQ 099: FIN DE ESTAPA 281 y 80BLQ
BEGIN
  UPDATE sdb_pgn_motivo_tramite
  SET ESTADO_ACTIVIDAD = 'BLQ'
  WHERE id_etapa_origen = 281 
    AND id_etapa_posterior = 80 
    AND ID_MOTIVO = 20;
	commit;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error actualizando sdb_pgn_motivo_tramite:'||SQLERRM);
      RETURN;		
end;
/
