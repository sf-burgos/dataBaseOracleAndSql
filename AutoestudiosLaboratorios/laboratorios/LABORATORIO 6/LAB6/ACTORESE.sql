CREATE OR REPLACE PACKAGE PA_PERFIL IS
    PROCEDURE AD_CONTENIDO (xnombre IN VARCHAR,xfecha IN DATE,xtipo IN VARCHAR, xurl IN VARCHAR);
    PROCEDURE AD_OPINION (xnumero IN NUMBER, xfecha IN DATE, xtipo IN VARCHAR, xjustificacion IN VARCHAR, xdetalle IN VARCHAR, xperfil IN VARCHAR, xcontenido IN VARCHAR);
    PROCEDURE AD_TEMPORAL (xduracion IN NUMBER, xidioma IN CHAR, xnombre IN VARCHAR);
    FUNCTION CO_CONTENIDO RETURN SYS_REFCURSOR;
    FUNCTION CO_OPINION RETURN SYS_REFCURSOR;
END PA_PERFIL;

CREATE OR REPLACE PACKAGE PA_AUDITOR IS
  FUNCTION CO_JUNTA RETURN SYS_REFCURSOR;
END PA_AUDITOR;