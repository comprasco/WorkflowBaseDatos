set linesize 555; 
set serveroutput on;  
SPOOL 01_sdb_pgn_motivo_tramite.out;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------Acciones DDL en este archivo----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--SOLICITUD NATALIA MANTIS:2602 Cambiar descripcion motivo tramite de 'REALIZAR REGISTRO DIGITADOR MASIVO' a 'REALIZAR REGISTRO'
BEGIN 
  UPDATE sdb_pgn_motivo_tramite 
  SET descripcion = 'REALIZAR REGISTRO'
  where descripcion = 'REALIZAR REGISTRO DIGITADOR MASIVO';
  COMMIT;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
      ROLLBACK;
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion en SDB_PGN_MOTIVO_TRAMITE');
     RETURN;
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error actualizando SDB_PGN_MOTIVO_TRAMITE:'||SQLERRM);
      RETURN;
END;
/
