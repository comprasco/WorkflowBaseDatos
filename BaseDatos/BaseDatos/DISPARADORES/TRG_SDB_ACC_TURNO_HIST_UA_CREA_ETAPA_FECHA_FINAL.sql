--------------------------------------------------------
--  DDL for Trigger TRG_SDB_ACC_TURNO_HIST_UA_CREA_ETAPA_FECHA_FINAL 
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_SDB_ACC_TURNO_HIST_UA_CREA_ETAPA_FECHA_FINAL" 
-- Crear una etapa 280 AUT a partir de las etapas 200,205,210,215,220 
BEFORE UPDATE ON SDB_ACC_TURNO_HISTORIA
FOR EACH ROW

/*
Nombre: TRG_SDB_ACC_TURNO_HIST_UA_CREA_ETAPA_FECHA_FINAL

Objeto: Crear una etapa 280 AUT a partir de las etapas 200,205,210,215,220

Descripcion:
    1.Crear una etapa 280 AUT a partir de las etapas 200,205,210,215,220

Retorno: Registro Actualizado

*/
DECLARE 
	sProcedimiento  VARCHAR2(32000);
  njob            NUMBER(15);
BEGIN
	IF (:NEW.FECHA_FINAL <> NVL(:OLD.FECHA_FINAL, SYSDATE + 1)) THEN
		IF :OLD.ID_ETAPA IN (200,205,210,215,220) AND :OLD.CALIFICACION = 'SUSPENSION DE TERMINOS' THEN            
			:NEW.ESTADO_ACTIVIDAD := 'TER';
			:NEW.ID_MOTIVO := 280;
			:NEW.FECHA_MODIFICACION := SYSDATE;
			BEGIN            
                sProcedimiento := 'DECLARE PN_ID_TURNO_HISTORIA	NUMBER; '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||' PN_ID_TURNO_HISTORIA_PARALELA NUMBER; '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||' RRETORNO INTEGER; PMENSAJE VARCHAR2(1000); '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||' BEGIN '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||'     PKG_WORKFLOW.PROC_CREA_ETAPA ('||:NEW.ID_TURNO_HISTORIA||',NULL,NULL,NULL,NULL,'''||:NEW.ID_USUARIO_MODIFICACION||''','''||:NEW.IP_MODIFICACION||''',PN_ID_TURNO_HISTORIA,RRETORNO,PMENSAJE); '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||'     COMMIT; '||CHR(13)||CHR(10);
                sProcedimiento := sProcedimiento||' END;';
                dbms_job.submit(job => njob,
                       what => sProcedimiento,
                       next_date => SYSDATE + 1/(24*60*60), -- Lo programa para dentro un segundo
                       interval => NULL); -- Sin repeticion    
            END;                   
		END IF;
	END IF;		
  IF :NEW.ESTADO_ACTIVIDAD = 'TER' THEN
    :NEW.FECHA_FINAL := SYSDATE;
  END IF;

END TRG_SDB_ACC_TURNO_HIST_UA_CREA_ETAPA_FECHA_FINAL;
/
ALTER TRIGGER "TRG_SDB_ACC_TURNO_HIST_UA_CREA_ETAPA_FECHA_FINAL" ENABLE;