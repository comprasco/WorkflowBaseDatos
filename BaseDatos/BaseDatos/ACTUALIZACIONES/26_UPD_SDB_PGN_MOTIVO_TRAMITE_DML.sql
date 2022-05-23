set linesize 555;
set serveroutput on; 
SPOOL NN_SDB_PGN_ETAPA.out;   
-------------------------------------------------------------------------------------------------------------
--MANTIS 2795
BEGIN
	UPDATE SDB_PGN_MOTIVO_TRAMITE
	SET ESTADO = 'I'
	,ID_USUARIO_MODIFICACION = USER
	,FECHA_MODIFICACION = SYSTIMESTAMP
	WHERE ID_MOTIVO_TRAMITE = '44051'
	AND ID_ETAPA_ORIGEN = 111
	AND ID_MOTIVO = 10
	AND ID_ETAPA_POSTERIOR = 111;
END;
/

