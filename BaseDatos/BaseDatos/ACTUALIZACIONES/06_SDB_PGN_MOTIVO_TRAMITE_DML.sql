set linesize 555; 
set serveroutput on; 
SPOOL NN_SDB_PGN_MOTIVO_TRAMITE.out; 
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-------------------------------
---SDB_PGN_MOTIVO_TRAMITE
-------------------------------
/*
Se insertan por peticion de Paula Cortes correo del 20210917
*/
--------------------------------------------------------------------------------------------------------------------------------
REM INSERTING into SDB_PGN_MOTIVO_TRAMITE
SET DEFINE OFF;
INSERT INTO sdb_pgn_motivo_tramite 
(id_motivo_tramite,id_proceso,id_subproceso,version_subproceso,id_etapa_origen,id_motivo,descripcion,id_etapa_posterior,estado_actividad,indicador_devolucion,tipo_compuerta_llegada,flujo_defecto,descriptor_fin,decision_calificacion,estado,id_usuario_creacion,fecha_creacion,ip_creacion) 
VALUES
('43635','6','1','1','214','300','NOTIFICADO PERSONAL','239','AUT','N','EXC',NULL,NULL,NULL,'A',user, systimestamp,null);
commit;

DROP SEQUENCE "SEC_PGN_MOTIVO_TRAMITE_ID_MOTIVO_TRAMITE";
CREATE SEQUENCE  "SEC_PGN_MOTIVO_TRAMITE_ID_MOTIVO_TRAMITE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43655 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------------------------------------------------------------------------------
SPOOL OFF