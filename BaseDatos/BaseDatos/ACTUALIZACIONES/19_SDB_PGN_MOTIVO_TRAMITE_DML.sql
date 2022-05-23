set linesize 555;
set serveroutput on;
SPOOL NN_INSERT_SDB_PGN_MOTIVO_TRAMITE.out;  
--------------------------------------------------------
--  DDL for Table SDB_PGN_MOTIVO_TRAMITE
--------------------------------------------------------
/*
Correo Natalia. 30/12/2021
Me ayuda por favor a modificar la etapa posterior e los siguientes registros para el proceso 62.
Modificar a etapa posterior 835 con estado actividad = AUT
*/
SET SERVEROUTPUT ON;
begin
  for vrec in (SELECT ID_MOTIVO_TRAMITE,
                      ID_PROCESO,
                      ID_SUBPROCESO,
                      VERSION_SUBPROCESO,
                      ID_ETAPA_ORIGEN,
                      ID_MOTIVO,
                      ID_ETAPA_POSTERIOR,
                      ESTADO_ACTIVIDAD 
                FROM SDB_PGN_MOTIVO_TRAMITE 
                WHERE ID_PROCESO = '62' 
                  AND ID_ETAPA_ORIGEN = '830' 
                  AND ID_ETAPA_POSTERIOR = '830')
  loop
    BEGIN
      update SDB_PGN_MOTIVO_TRAMITE
      set ID_ETAPA_POSTERIOR = 835
      ,ESTADO_ACTIVIDAD = 'AUT'
      ,ID_USUARIO_MODIFICACION = USER
      ,FECHA_MODIFICACION = SYSTIMESTAMP
      where ID_PROCESO = VREC.ID_PROCESO
        and ID_SUBPROCESO = VREC.ID_SUBPROCESO
        and VERSION_SUBPROCESO = VREC.VERSION_SUBPROCESO
        and ID_ETAPA_ORIGEN = VREC.ID_ETAPA_ORIGEN
        and ID_MOTIVO = VREC.ID_MOTIVO
        and ID_ETAPA_POSTERIOR = VREC.ID_ETAPA_POSTERIOR;
        COMMIT;
      exception when others then 
        DBMS_OUTPUT.PUT_LINE('ERROR ACTUALIZANDO EN SDB_PGN_MOTIVO_TRAMITE:' || VREC.ID_MOTIVO_TRAMITE);
        ROLLBACK;
    END;
  end loop;
end;
/


                  