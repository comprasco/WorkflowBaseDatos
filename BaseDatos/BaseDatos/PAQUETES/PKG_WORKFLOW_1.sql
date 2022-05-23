--------------------------------------------------------
--  DDL for Package PKG_WORKFLOW 
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_WORKFLOW" AS 
  
    PROCEDURE PROC_CREA_ETAPA 
            ( PID_HISTORIA            IN NUMBER,
              PID_TURNO               IN VARCHAR2,
              PID_SOLICITUD           IN VARCHAR2,
              PID_USUARIO_ASIGNACION  IN VARCHAR2,
              PID_CIRCULO             IN VARCHAR2,
              PID_USUARIO_ACCION      IN VARCHAR2,
              PIP_ACCION              IN VARCHAR2, 
              PN_ID_TURNO_HISTORIA	  OUT NUMBER,
              PRETORNO		            OUT INTEGER,
              PMENSAJE		            OUT VARCHAR2
            );
    PROCEDURE PROC_APRUEBA_FLUJO
            (PID_PROCESO               IN VARCHAR2,
              PID_SUBPROCESO           IN VARCHAR2,
              PVERSION                 IN NUMBER,
              PID_USUARIO_ACCION       IN VARCHAR2,
              PIP_ACCION               IN VARCHAR2, 
              PRETORNO		             OUT INTEGER,
              PMENSAJE		             OUT VARCHAR2
            );
    ------------------
    -----FUNCIONES----
    ------------------
    FUNCTION FUNC_ULTIMA_VERSION (LID_PROCESO VARCHAR2,LID_SUBPROCESO VARCHAR2) RETURN NUMBER ;
    FUNCTION FUNC_ULTIMA_VERSION_TRABAJO (LID_PROCESO VARCHAR2,LID_SUBPROCESO VARCHAR2) RETURN NUMBER;
    FUNCTION FUNC_VER_PARALELAS (PLID_TURNO_HISTORIA NUMBER, PLID_MOTIVO NUMBER) RETURN NUMBER;
    FUNCTION FUNC_VENCIMIENTO_ETAPA(PID_ETAPA NUMBER, PID_CIRCULO VARCHAR2, FECHA_INICIO DATE) RETURN DATE;
   END PKG_WORKFLOW;

/

