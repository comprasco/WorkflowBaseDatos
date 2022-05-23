--------------------------------------------------------
--  DDL for Table SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO 
--------------------------------------------------------

  CREATE TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" 
   (	"ID_MOTIVO_TRAMITE" VARCHAR2(20 BYTE), 
	"ID_REGLA_NEGOCIO" VARCHAR2(20 BYTE), 
	"ORDEN" NUMBER, 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'S', 
	"ID_USUARIO_CREACION" VARCHAR2(30 BYTE), 
	"FECHA_CREACION" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"IP_CREACION" VARCHAR2(100 BYTE), 
	"ID_USUARIO_MODIFICACION" VARCHAR2(30 BYTE), 
	"FECHA_MODIFICACION" TIMESTAMP (6), 
	"IP_MODIFICACION" VARCHAR2(100 BYTE)
   ) TABLESPACE "WORKFLOW_ENGINE_DATA" ;

   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ID_MOTIVO_TRAMITE" IS 'Identifcador del motivo tramite';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ID_REGLA_NEGOCIO" IS 'Identificador de la regla del negocio aplicable';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ORDEN" IS 'Indica el orden de evaluacion de la regla';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ACTIVO" IS 'Indicador de estado del registro S/N';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ID_USUARIO_CREACION" IS 'Identificador del usuario que crea el registro en BD';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."FECHA_CREACION" IS 'Fecha de creacion del registro en BD';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."IP_CREACION" IS 'IP de creacion del registro en BD';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."ID_USUARIO_MODIFICACION" IS 'Identificador del usuario que modifica el registro en BD';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."FECHA_MODIFICACION" IS 'Fecha de modificacion del registro en BD';
   COMMENT ON COLUMN "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"."IP_MODIFICACION" IS 'IP de modificacion del registro en BD';
   COMMENT ON TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO"  IS 'Tabla parametrica que relaciona los motivos de tramite con las reglas del negocio';
--------------------------------------------------------
--  DDL for Index PK_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ON "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ("ID_MOTIVO_TRAMITE", "ID_REGLA_NEGOCIO") 
  TABLESPACE "WORKFLOW_ENGINE_INDX" ;
  
--------------------------------------------------------
--  DDL for Trigger TRG_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_AUD_IUD_AFTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_AUD_IUD_AFTER" AFTER
-- Realizar registro de auditoria en SDB_ACC_BITACORA_AUD
INSERT OR UPDATE OR DELETE ON SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO FOR EACH ROW
declare
rec SDB_ACC_BITACORA_AUD%RowType;
VUSUARIOC SDB_AUT_USUARIO.ID_USUARIO%TYPE;
VFECHAC TimeStamp;
VUSUARIOM SDB_AUT_USUARIO.ID_USUARIO%TYPE;
VFECHAM TimeStamp;
MENSAJE varchar2(4000);
begin
    if inserting then 
            rec.ACCION := 'I';
    elsif updating then 
            rec.ACCION :='U';
    else 
            rec.ACCION := 'D';
    end if;
    if (:old.ID_USUARIO_CREACION IS NULL ) then VUSUARIOC :=user; else VUSUARIOC := to_char(:new.ID_USUARIO_CREACION);  end if;
    if (:old.FECHA_CREACION IS NULL)   then  VFECHAC :=systimestamp; else VFECHAC := to_char(:new.FECHA_CREACION );    end if;
    if (:old.ID_USUARIO_MODIFICACION IS NULL ) then VUSUARIOM :=user; else VUSUARIOM := to_char(:new.ID_USUARIO_MODIFICACION);  end if;
    if (:old.FECHA_MODIFICACION IS NULL)   then  VFECHAM :=systimestamp; else VFECHAM := to_char(:new.FECHA_MODIFICACION );    end if;
    rec.NOMBRE_TABLA      :=  'SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO';
    rec.LLAVE1            :=  CASE WHEN INSERTING OR UPDATING THEN to_char(:new.ID_MOTIVO_TRAMITE) WHEN DELETING THEN to_char(:old.ID_MOTIVO_TRAMITE) END; 
    rec.LLAVE2            :=  CASE WHEN INSERTING OR UPDATING THEN to_char(:new.ID_REGLA_NEGOCIO) WHEN DELETING THEN to_char(:old.ID_REGLA_NEGOCIO) END;    
    rec.USUARIO           :=  CASE WHEN INSERTING  THEN to_char(VUSUARIOC) WHEN UPDATING THEN to_char(VUSUARIOM) WHEN DELETING THEN to_char(user)END;
    rec.FECHA             :=  CASE WHEN INSERTING  THEN to_char(VFECHAC) WHEN UPDATING THEN to_char(VFECHAM) WHEN DELETING THEN (systimestamp)END;

    case rec.ACCION
        when 'I' then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          insert into SDB_ACC_BITACORA_AUD values rec;
        when 'U' then
         if updating('ID_MOTIVO_TRAMITE')then
              rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
              rec.CAMPO             :=  'ID_MOTIVO_TRAMITE';
              rec.VAL_INICIAL       :=  to_char(:old.ID_MOTIVO_TRAMITE);
              rec.VAL_FINAL         :=  to_char(:new.ID_MOTIVO_TRAMITE);
              insert into SDB_ACC_BITACORA_AUD values rec;
         end if;
         if updating('ID_REGLA_NEGOCIO')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'ID_REGLA_NEGOCIO';
          rec.VAL_INICIAL       :=  to_char(:old.ID_REGLA_NEGOCIO);
          rec.VAL_FINAL         :=  to_char(:new.ID_REGLA_NEGOCIO);
          insert into SDB_ACC_BITACORA_AUD values rec;
         end if;         
         if updating('ORDEN')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'ORDEN';
          rec.VAL_INICIAL       :=  to_char(:old.ORDEN);
          rec.VAL_FINAL         :=  to_char(:new.ORDEN);
          insert into SDB_ACC_BITACORA_AUD values rec;
         end if;                 
         if updating('ACTIVO')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'ACTIVO';
          rec.VAL_INICIAL       :=  to_char(:old.ACTIVO);
          rec.VAL_FINAL         :=  to_char(:new.ACTIVO);
          insert into SDB_ACC_BITACORA_AUD values rec;
         end if;
     if updating('ID_USUARIO_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'ID_USUARIO_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.ID_USUARIO_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.ID_USUARIO_CREACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
        if updating('FECHA_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'FECHA_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.FECHA_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.FECHA_CREACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;     
      if updating('IP_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'IP_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.IP_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.IP_CREACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('ID_USUARIO_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'ID_USUARIO_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.ID_USUARIO_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.ID_USUARIO_MODIFICACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('FECHA_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'FECHA_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.FECHA_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.FECHA_MODIFICACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
        if updating('IP_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.CAMPO             :=  'IP_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.IP_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.IP_MODIFICACION);
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     else
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.LLAVE3            :=  to_char(:old.ORDEN);
          rec.LLAVE4            :=  to_char(:old.ACTIVO);
          rec.LLAVE5            :=  to_char(:old.ID_USUARIO_CREACION);
          rec.LLAVE6            :=  to_char(:old.FECHA_CREACION);
        insert into SDB_ACC_BITACORA_AUD values rec;
  end case;
end;
/
ALTER TRIGGER "TRG_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_AUD_IUD_AFTER" ENABLE;

--------------------------------------------------------
--  Constraints for Table SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO
--------------------------------------------------------

  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" MODIFY ("ID_MOTIVO_TRAMITE" CONSTRAINT "NN_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ID_MOTIVO_TRAMITE" NOT NULL ENABLE);
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" MODIFY ("ID_REGLA_NEGOCIO" CONSTRAINT "NN_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ID_REGLA_NEGOCIO" NOT NULL ENABLE);
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" MODIFY ("ORDEN" CONSTRAINT "NN_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ORDEN" NOT NULL ENABLE);
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" MODIFY ("ID_USUARIO_CREACION" CONSTRAINT "NN_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ID_USUARIO_CREACION" NOT NULL ENABLE);
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ADD CONSTRAINT "CK_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ACTIVO" CHECK (ACTIVO in ('S','N')) ENABLE;
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ADD CONSTRAINT "PK_SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" PRIMARY KEY ("ID_MOTIVO_TRAMITE", "ID_REGLA_NEGOCIO")
  USING INDEX TABLESPACE "WORKFLOW_ENGINE_INDX"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO
--------------------------------------------------------

  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ADD CONSTRAINT "FK_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ID_MOTIVO_TRAMITE" FOREIGN KEY ("ID_MOTIVO_TRAMITE")
	  REFERENCES "SDB_PGN_MOTIVO_TRAMITE_TRABAJO" ("ID_MOTIVO_TRAMITE") ENABLE;
  ALTER TABLE "SDB_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO" ADD CONSTRAINT "FK_PGN_MOTIVO_TRAMITE_REGLA_TRABAJO_ID_REGLA_NEGOCIO" FOREIGN KEY ("ID_REGLA_NEGOCIO")
	  REFERENCES "SDB_PGN_REGLA_NEGOCIO" ("ID_REGLA_NEGOCIO") ENABLE;
