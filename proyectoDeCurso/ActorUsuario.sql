CREATE OR REPLACE PACKAGE AC_USUARIO IS

    PROCEDURE AD_USUARIO (xnombre IN VARCHAR, xtel IN VARCHAR);
	FUNCTION CO_USUARIO return sys_refcursor;
	PROCEDURE MO_USUARIO (xtel IN VARCHAR);
    
    PROCEDURE AD_INFORMACION_PERSONAL (xcodigo IN VARCHAR,xdireccion IN VARCHAR, xtelefono IN NUMBER, xcorreo IN VARCHAR, xcarrera_profesional IN VARCHAR);
	FUNCTION CO_INFORMACION_PERSONAL return sys_refcursor;
	PROCEDURE MO_INFORMACION_PERSONAL (xdireccion IN VARCHAR, xtelefono IN NUMBER, xcorreo IN VARCHAR);

END AC_USUARIO;
/
CREATE OR REPLACE PACKAGE BODY AC_USUARIO IS

    PROCEDURE AD_USUARIO (xnombre IN VARCHAR, xtel IN VARCHAR) IS
    BEGIN
        PK_USUARIO.AD_USUARIO(xnombre, xtel);
    COMMIT;
    EXCEPTION 
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20003,'No se puede insertar usuario');
    END;
    
    FUNCTION CO_USUARIO RETURN SYS_REFCURSOR IS CO_US SYS_REFCURSOR;
    BEGIN
        CO_US :=PK_USUARIO.CO_USUARIO;
        RETURN CO_US;
    END;
    
    PROCEDURE MO_USUARIO (xtel IN VARCHAR) IS
    BEGIN
        PK_USUARIO.MO_USUARIO(xtel);
    COMMIT;
    EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			RAISE_APPLICATION_ERROR(-20004,'No se puede modificar usuario.');
		END;
    
    PROCEDURE  AD_INFORMACION_PERSONAL (xcodigo IN VARCHAR,xdireccion IN VARCHAR, xtelefono IN NUMBER, xcorreo IN VARCHAR, xcarrera_profesional IN VARCHAR) IS
    BEGIN
        PK_CLIENTE.AD_INFORMACION_PERSONAL (xcodigo,xdireccion, xtelefono, xcorreo, xcarrera_profesional);
    COMMIT;
    EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003,'No se puede insertar usuario');
    END;
    
    FUNCTION CO_INFORMACION_PERSONAL RETURN SYS_REFCURSOR IS CO_IP SYS_REFCURSOR;
    BEGIN
        CO_IP :=PK_CLIENTE.CO_INFORMACION_PERSONAL;
        RETURN CO_IP;
    END;
    
    PROCEDURE MO_INFORMACION_PERSONAL (xdireccion IN VARCHAR, xtelefono IN NUMBER, xcorreo IN VARCHAR) IS
    BEGIN
        PK_CLIENTE.MO_INFORMACION_PERSONAL (xdireccion, xtelefono, xcorreo);
    COMMIT;
    EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			RAISE_APPLICATION_ERROR(-20004,'No se puede modificar informacion personal.');
	END;

END AC_USUARIO;    
    