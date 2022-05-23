--------------------------------------------------------
--  DDL for Trigger TRG_SDB_PGN_ETAPA_AUD_IUD_AFTER
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_SDB_PGN_ETAPA_AUD_IUD_AFTER" AFTER
-- Realizar registro de auditoria en SDB_ACC_BITACORA_AUD
INSERT OR UPDATE OR DELETE ON SDB_PGN_ETAPA FOR EACH ROW
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
  if (:old.FECHA_CREACION IS NULL)   then  VFECHAC :=systimestamp; else VFECHAC := to_char(:new.FECHA_CREACION );    end if;
  if (:old.FECHA_MODIFICACION IS NULL)   then  VFECHAM :=systimestamp; else VFECHAM := to_char(:new.FECHA_MODIFICACION );    end if;
   if (:old.ID_USUARIO_CREACION IS NULL ) then VUSUARIOC :=user; else VUSUARIOC := to_char(:new.ID_USUARIO_CREACION);  end if;
  if (:old.ID_USUARIO_MODIFICACION IS NULL ) then VUSUARIOM :=user; else VUSUARIOM := to_char(:new.ID_USUARIO_MODIFICACION);  end if;

   case rec.ACCION
  when 'I' then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'I';
          rec.USUARIO           :=  VUSUARIOC;
          rec.FECHA             := VFECHAC;
          insert into SDB_ACC_BITACORA_AUD values rec;
  when 'U' then
        if updating('ID_ETAPA')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'ID_ETAPA';
          rec.VAL_INICIAL       :=  to_char(:old.ID_ETAPA);
          rec.VAL_FINAL         :=  to_char(:new.ID_ETAPA);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
        if updating('NOMBRE')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'NOMBRE';
          rec.VAL_INICIAL       :=  to_char(:old.NOMBRE);
          rec.VAL_FINAL         :=  to_char(:new.NOMBRE);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('DESCRIPCION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'DESCRIPCION';
          rec.VAL_INICIALCLOB   :=  to_char(:old.DESCRIPCION);
          rec.VAL_FINALCLOB     :=  to_char(:new.DESCRIPCION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
       if updating('ESTADO')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'ESTADO';
          rec.VAL_INICIAL   :=  to_char(:old.ESTADO);
          rec.VAL_FINAL     :=  to_char(:new.ESTADO);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
      if updating('INDICADOR_PESO')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'INDICADOR_PESO';
          rec.VAL_INICIAL   :=  to_char(:old.INDICADOR_PESO);
          rec.VAL_FINAL     :=  to_char(:new.INDICADOR_PESO);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('INDICADOR_BLOQUEO')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'INDICADOR_BLOQUEO';
          rec.VAL_INICIAL   :=  to_char(:old.INDICADOR_BLOQUEO);
          rec.VAL_FINAL     :=  to_char(:new.INDICADOR_BLOQUEO);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
      if updating('INDICADOR_DESBORDE')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'INDICADOR_DESBORDE';
          rec.VAL_INICIAL   :=  to_char(:old.INDICADOR_DESBORDE);
          rec.VAL_FINAL     :=  to_char(:new.INDICADOR_DESBORDE);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;       
      
        if updating('DIAS_HABILES_NORMAL')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'DIAS_HABILES_NORMAL';
          rec.VAL_INICIAL   :=  to_char(:old.DIAS_HABILES_NORMAL);
          rec.VAL_FINAL     :=  to_char(:new.DIAS_HABILES_NORMAL);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;    
      if updating('ID_USUARIO_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'ID_USUARIO_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.ID_USUARIO_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.ID_USUARIO_CREACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
      if updating('FECHA_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'FECHA_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.FECHA_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.FECHA_CREACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('ID_USUARIO_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'ID_USUARIO_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.ID_USUARIO_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.ID_USUARIO_MODIFICACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('FECHA_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'FECHA_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.FECHA_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.FECHA_MODIFICACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
      if updating('IP_CREACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'IP_CREACION';
          rec.VAL_INICIAL       :=  to_char(:old.IP_CREACION);
          rec.VAL_FINAL         :=  to_char(:new.IP_CREACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('IP_MODIFICACION')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'IP_MODIFICACION';
          rec.VAL_INICIAL       :=  to_char(:old.IP_MODIFICACION);
          rec.VAL_FINAL         :=  to_char(:new.IP_MODIFICACION);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
     if updating('INDICADOR_TOPE')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'INDICADOR_TOPE';
          rec.VAL_INICIAL       :=  to_char(:old.INDICADOR_TOPE);
          rec.VAL_FINAL         :=  to_char(:new.INDICADOR_TOPE);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
         if updating('ID_FASE')then
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
          rec.ACCION            :=  'U';
          rec.CAMPO             :=  'ID_FASE';
          rec.VAL_INICIAL       :=  to_char(:old.ID_FASE);
          rec.VAL_FINAL         :=  to_char(:new.ID_FASE);
          rec.USUARIO           :=  VUSUARIOM ;
          rec.FECHA             :=  VFECHAM;
          insert into SDB_ACC_BITACORA_AUD values rec;
     end if;
    if updating('TIPO_REPARTO')then
        rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
        rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
        rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
        rec.ACCION            :=  'U';
        rec.CAMPO             :=  'TIPO_REPARTO';
        rec.VAL_INICIAL       :=  to_char(:old.TIPO_REPARTO);
        rec.VAL_FINAL         :=  to_char(:new.TIPO_REPARTO);
        rec.USUARIO           :=  VUSUARIOM ;
        rec.FECHA             :=  VFECHAM;
        insert into SDB_ACC_BITACORA_AUD values rec;
    end if;
 if updating('ID_UNIDAD_TIEMPO_ESPERA')then
        rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
        rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
        rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
        rec.ACCION            :=  'U';
        rec.CAMPO             :=  'ID_UNIDAD_TIEMPO_ESPERA';
        rec.VAL_INICIAL       :=  to_char(:old.ID_UNIDAD_TIEMPO_ESPERA);
        rec.VAL_FINAL         :=  to_char(:new.ID_UNIDAD_TIEMPO_ESPERA);
        rec.USUARIO           :=  VUSUARIOM ;
        rec.FECHA             :=  VFECHAM;
        insert into SDB_ACC_BITACORA_AUD values rec;
    end if;   
 if updating('CANTIDAD_TIEMPO_ESPERA')then
        rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
        rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
        rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
        rec.ACCION            :=  'U';
        rec.CAMPO             :=  'CANTIDAD_TIEMPO_ESPERA';
        rec.VAL_INICIAL       :=  to_char(:old.CANTIDAD_TIEMPO_ESPERA);
        rec.VAL_FINAL         :=  to_char(:new.CANTIDAD_TIEMPO_ESPERA);
        rec.USUARIO           :=  VUSUARIOM ;
        rec.FECHA             :=  VFECHAM;
        insert into SDB_ACC_BITACORA_AUD values rec;
    end if;
 if updating('GENERAR_QR')then
        rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
        rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
        rec.LLAVE1            :=  to_char(:new.ID_ETAPA);
        rec.ACCION            :=  'U';
        rec.CAMPO             :=  'GENERAR_QR';
        rec.VAL_INICIAL       :=  to_char(:old.GENERAR_QR);
        rec.VAL_FINAL         :=  to_char(:new.GENERAR_QR);
        rec.USUARIO           :=  VUSUARIOM ;
        rec.FECHA             :=  VFECHAM;
        insert into SDB_ACC_BITACORA_AUD values rec;
    end if;

    else
          rec.ID_BITACORA_AUD   :=  SEC_ACC_BITACORA_AUD_ID_BITACORA_AUD.NextVal ;
          rec.NOMBRE_TABLA      :=  'SDB_PGN_ETAPA';
          rec.LLAVE1            :=  to_char(:old.ID_ETAPA);
          rec.LLAVE2            :=  to_char(:old.NOMBRE);
          rec.LLAVE3            :=  to_char(:old.DESCRIPCION);
          rec.LLAVE4            :=  to_char(:old.ESTADO);
          rec.LLAVE5            :=  to_char(:old.INDICADOR_PESO);
          rec.LLAVE6            :=  to_char(:old.INDICADOR_BLOQUEO);
          rec.ACCION            :=  'D';
          rec.USUARIO           :=  user;
          rec.FECHA             :=  systimestamp;
          insert into SDB_ACC_BITACORA_AUD values rec;
  end case;
end;
/
ALTER TRIGGER "TRG_SDB_PGN_ETAPA_AUD_IUD_AFTER" ENABLE;
