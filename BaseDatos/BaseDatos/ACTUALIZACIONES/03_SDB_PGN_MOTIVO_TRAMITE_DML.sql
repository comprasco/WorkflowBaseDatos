--INSERTA MOTIVO TRAMITE ID_MOTIVO = 15 PARA CERTIFICADOS ESPECIALES.
set linesize 555; 
set serveroutput on;  
SPOOL 02_sdb_pgn_motivo_tramite.out; 
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------Acciones DDL en este archivo----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
begin
	update sdb_pgn_motivo_tramite 
		set id_etapa_posterior = '20', estado_actividad = 'ESP' 
		where id_proceso = '5' and id_etapa_origen = '350' and id_motivo = '20' and estado = 'A';
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
-----------------------------------------------------------------------------------------------------------
-- modificación certificados especiales.
-----------------------------------------------------------------------------------------------------------
declare 
VID_MOTIVO_TRAMITE VARCHAR2(20);
vmaximo integer;
begin
  begin
    select max(to_number(ID_MOTIVO_TRAMITE)) into vmaximo from sdb_pgn_motivo_tramite;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('No se encontro el maximo id_motivo_tramite');
     RETURN;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error consultando el maximo id_motivo_tramite');
      RETURN;             
  end;
  for vrec in (
  select ID_MOTIVO_TRAMITE
  ,ID_PROCESO
  ,ID_SUBPROCESO
  ,VERSION_SUBPROCESO
  ,ID_ETAPA_ORIGEN
  ,ID_MOTIVO
  ,DESCRIPCION
  ,ID_ETAPA_POSTERIOR
  ,ESTADO_ACTIVIDAD
  ,INDICADOR_DEVOLUCION
  ,TIPO_COMPUERTA_LLEGADA
  ,FLUJO_DEFECTO
  ,DESCRIPTOR_FIN
  ,DECISION_CALIFICACION
  ,ESTADO
  , rownum registro
  from sdb_pgn_motivo_tramite where id_proceso = 1 and id_subproceso in ('9','10','11','12','13','14','15','18')
  and id_etapa_origen = 10 and id_etapa_posterior = 20 and estado = 'A'
  )
  loop
    vid_motivo_tramite := to_char(vmaximo + vrec.registro);
    begin
      insert into sdb_pgn_motivo_tramite
      (ID_MOTIVO_TRAMITE
      ,ID_PROCESO
      ,ID_SUBPROCESO
      ,VERSION_SUBPROCESO
      ,ID_ETAPA_ORIGEN
      ,ID_MOTIVO
      ,DESCRIPCION
      ,ID_ETAPA_POSTERIOR
      ,ESTADO_ACTIVIDAD
      ,INDICADOR_DEVOLUCION
      ,TIPO_COMPUERTA_LLEGADA
      ,FLUJO_DEFECTO
      ,DESCRIPTOR_FIN
      ,DECISION_CALIFICACION
      ,ESTADO
      ,ID_USUARIO_CREACION
      ,FECHA_CREACION
      )
      values
      (
  vid_motivo_tramite
  ,vrec.ID_PROCESO
  ,vrec.ID_SUBPROCESO
  ,vrec.VERSION_SUBPROCESO
  ,vrec.ID_ETAPA_ORIGEN
  ,15
  ,vrec.DESCRIPCION
  ,vrec.ID_ETAPA_POSTERIOR
  ,vrec.ESTADO_ACTIVIDAD
  ,vrec.INDICADOR_DEVOLUCION
  ,vrec.TIPO_COMPUERTA_LLEGADA
  ,vrec.FLUJO_DEFECTO
  ,vrec.DESCRIPTOR_FIN
  ,vrec.DECISION_CALIFICACION
  ,vrec.ESTADO
  ,user
  ,systimestamp
      );
	  commit;
      DBMS_OUTPUT.PUT_LINE('Se inserto id_motivo_tramite:'||vid_motivo_tramite||','||vrec.ID_PROCESO||','||vrec.ID_SUBPROCESO||','||vrec.VERSION_SUBPROCESO||','||vrec.ID_ETAPA_ORIGEN||','||vrec.DESCRIPCION||','||vrec.ID_ETAPA_POSTERIOR);
    EXCEPTION 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error insertando id_motivo_tramite:'||vrec.ID_PROCESO||','||vrec.ID_SUBPROCESO||','||vrec.VERSION_SUBPROCESO||','||vrec.ID_ETAPA_ORIGEN||','||vrec.DESCRIPCION||','||vrec.ID_ETAPA_POSTERIOR);
      continue;      
    end;
  end loop;
end;
/
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
SPOOL OFF