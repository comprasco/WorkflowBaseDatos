set linesize 555;
set serveroutput on; 
SPOOL NN_SDB_PGN_MOTIVO_TRAMITE.out;
------------------------------------------------------------------------------------------------
-- Duvan Beltran
INSERT INTO SDB_PGN_MOTIVO_TRAMITE (ID_MOTIVO_TRAMITE,ID_PROCESO,ID_SUBPROCESO,VERSION_SUBPROCESO,ID_ETAPA_ORIGEN,ID_MOTIVO,DESCRIPCION,ID_ETAPA_POSTERIOR,ESTADO_ACTIVIDAD,INDICADOR_DEVOLUCION,TIPO_COMPUERTA_LLEGADA,ESTADO,ID_USUARIO_CREACION,FECHA_CREACION)
VALUES(SEC_PGN_MOTIVO_TRAMITE_ID_MOTIVO_TRAMITE.nextval,'62','5','1','835','200','OFICIO_REQUERIMIENTOS','840','ASG','N','EXC','A',user,SYSTIMESTAMP);
/
INSERT INTO SDB_PGN_MOTIVO_TRAMITE (ID_MOTIVO_TRAMITE,ID_PROCESO,ID_SUBPROCESO,VERSION_SUBPROCESO,ID_ETAPA_ORIGEN,ID_MOTIVO,DESCRIPCION,ID_ETAPA_POSTERIOR,ESTADO_ACTIVIDAD,INDICADOR_DEVOLUCION,TIPO_COMPUERTA_LLEGADA,ESTADO,ID_USUARIO_CREACION,FECHA_CREACION)
VALUES(SEC_PGN_MOTIVO_TRAMITE_ID_MOTIVO_TRAMITE.nextval,'62','5','1','835','200','OFICIO_REQUERIMIENTOS','841','AUT','N','EXC','A',user,SYSTIMESTAMP);
/
INSERT INTO SDB_PGN_MOTIVO_TRAMITE (ID_MOTIVO_TRAMITE,ID_PROCESO,ID_SUBPROCESO,VERSION_SUBPROCESO,ID_ETAPA_ORIGEN,ID_MOTIVO,DESCRIPCION,ID_ETAPA_POSTERIOR,ESTADO_ACTIVIDAD,INDICADOR_DEVOLUCION,TIPO_COMPUERTA_LLEGADA,ESTADO,ID_USUARIO_CREACION,FECHA_CREACION)
VALUES(SEC_PGN_MOTIVO_TRAMITE_ID_MOTIVO_TRAMITE.nextval,'62','5','1','840','400','OFICIO_REQUERIMIENTOS','830','ASG','N','EXC','A',user,SYSTIMESTAMP);
/
