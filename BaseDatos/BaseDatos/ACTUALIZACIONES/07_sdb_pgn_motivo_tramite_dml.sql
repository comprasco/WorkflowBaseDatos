set linesize 555; 
set serveroutput on;  
SPOOL 01_sdb_pgn_motivo_tramite.out;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------Acciones DDL en este archivo----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--correcciones externas modificacion de etapa 15.
begin
	update sdb_pgn_motivo_tramite 
	set ID_ETAPA_ORIGEN = 15
	, id_usuario_modificacion = user
	,fecha_modificacion = systimestamp
	where id_etapa_origen = 10 AND ID_ETAPA_POSTERIOR = 130 AND ID_MOTIVO = 10 AND ID_PROCESO = '3' AND ID_SUBPROCESO = '1';
	commit;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error actualizando sdb_pgn_motivo_tramite');
      RETURN;		
end;
/
begin
	delete from sdb_pgn_motivo_tramite where id_etapa_origen = 15 AND ID_ETAPA_POSTERIOR = 17 AND ID_MOTIVO = 1 AND ID_PROCESO = '3' AND ID_SUBPROCESO = '1';
		commit;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error borrando sdb_pgn_motivo_tramite');
      RETURN;		
end;
/

--[11:16 a. m., 19/10/2021] Gabriel Cromasoft:incluir este Script en la siguiente entrega Es con relación al mantis 2580
BEGIN
	UPDATE SDB_PGN_MOTIVO_TRAMITE 
	SET ID_ETAPA_POSTERIOR = '506' 
	,ID_USUARIO_MODIFICACION = user
	,FECHA_MODIFICACION = systimestamp
	WHERE ID_PROCESO = '1' 
	AND ID_SUBPROCESO IN ('2','5') 
	AND ID_ETAPA_ORIGEN = '30' 
	AND ID_MOTIVO = '10';
		commit;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error actualizando sdb_pgn_motivo_tramite');
      RETURN;		
end;
/
BEGIN
	update sdb_acc_subproceso_version 
	set estado_actividad = 'TER'
	where id_proceso = '3' and id_subproceso = '1';
		commit;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro registro que cumplan la condicion');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error actualizando sdb_acc_subproceso_version');
      RETURN;		
end;
/

