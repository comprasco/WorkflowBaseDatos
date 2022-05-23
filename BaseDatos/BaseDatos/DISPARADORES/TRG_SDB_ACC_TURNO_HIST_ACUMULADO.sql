--------------------------------------------------------
--  DDL for Trigger TRG_SDB_ACC_TURNO_HIST_ACUMULADO 
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_SDB_ACC_TURNO_HIST_ACUMULADO" 
-- Actualizar campo acumulado de la tabla SDB_PNG_USUARIO_ETAPA
AFTER UPDATE ON SDB_ACC_TURNO_HISTORIA
FOR EACH ROW

/*
Nombre: TRG_SDB_ACC_TURNO_HIST_ACUMULADO

Objeto: Actualizar campo acumulado de la tabla SDB_PNG_USUARIO_ETAPA

Descripcion:
    1.Si el estado_actividad cambio de XRP a BLQ o XRP a ASG Incrementar el acumulado
	2.Si el estado_actividad cambio de BLQ a XRP Decrementar el acumulado

Retorno: Registro Actualizado

*/

DECLARE   
	VUSER_XCEP				EXCEPTION;
	PRAGMA EXCEPTION_INIT (VUSER_XCEP,-20001 );
	RET						    INTEGER;

BEGIN
	--  1.Si el estado_actividad cambio de XRP a BLQ o XRP a ASG Incrementar el acumulado
	IF ((:NEW.ESTADO_ACTIVIDAD in ('BLQ','ASG') AND :OLD.ESTADO_ACTIVIDAD = 'XRP' ) OR 
		(:NEW.ESTADO_ACTIVIDAD in ('XRP') AND :OLD.ESTADO_ACTIVIDAD <> :NEW.ESTADO_ACTIVIDAD  )) and :new.id_etapa > 80 THEN
		RET := 0;
		SELECT NVL(EQUIVALENCIA_TURNOS,0)
		INTO RET
		FROM SDB_ACC_TURNO
		WHERE ID_TURNO = :NEW.ID_TURNO;

		--	2.Si el estado_actividad cambio de BLQ a XRP Decrementar el acumulado
		IF :NEW.ESTADO_ACTIVIDAD in ('XRP') THEN
			RET := NVL(RET,0) * -1;
		END IF;

		IF RET <> 0 THEN
			UPDATE SDB_PNG_USUARIO_ETAPA SET
				ACUMULADO = NVL(ACUMULADO,0) + RET
        ,ID_USUARIO_MODIFICACION = :NEW.ID_USUARIO_CREACION
        ,FECHA_MODIFICACION = :NEW.FECHA_CREACION
        ,IP_MODIFICACION = :NEW.IP_CREACION
			WHERE ID_USUARIO = :NEW.ID_USUARIO
				AND ID_ETAPA = :NEW.ID_ETAPA;
		END IF;
	END IF;

	EXCEPTION WHEN OTHERS THEN
	RAISE VUSER_XCEP;
END TRG_SDB_ACC_TURNO_HIST_UPD_AFTER;
/
ALTER TRIGGER "TRG_SDB_ACC_TURNO_HIST_ACUMULADO" ENABLE;
/