USE GD2C2023;
GO

-- Eliminar vistas

--1
IF OBJECT_ID('[SQLITO].VW_DURACION_PROMEDIO_ANUNCIOS', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW_DURACION_PROMEDIO_ANUNCIOS;
END

--2
IF OBJECT_ID('[SQLITO].VW_PROMEDIO_PRECIO_INMUEBLES', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW_PROMEDIO_PRECIO_INMUEBLES;
END

--4
IF OBJECT_ID('[SQLITO].VW_PORCENTAJE_INCUMPLIMIENTO_ALQUILER', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW2_PORCENTAJE_INCUMPLIMIENTO_ALQUILER;
END

--5
IF OBJECT_ID('[SQLITO].VW_PROMEDIO_INCREMENTO_ALQUILER', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW_PROMEDIO_INCREMENTO_ALQUILER;
END

--6
IF OBJECT_ID('[SQLITO].VW_PRECIO_PROMEDIO_M2_VENTAS', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW_PRECIO_PROMEDIO_M2_VENTAS;
END

--8
IF OBJECT_ID('[SQLITO].VW_PORCENTAJE_OPERACIONES_CONCRETADAS', 'V') IS NOT NULL
BEGIN
    DROP VIEW [SQLITO].VW_PORCENTAJE_OPERACIONES_CONCRETADAS;
END


-- Eliminar Procedimientos Almacenados
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_HECHOS_ANUNCIOS' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_ANUNCIOS;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_HECHOS_ALQUILER' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_ALQUILER;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_HECHOS_VENTA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_VENTA;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_AMBIENTES' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_AMBIENTES;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_TIEMPO_PUBLICACION' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_PUBLICACION;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_TIEMPO_FINALIZACION' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_FINALIZACION;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_TIPO_MONEDA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_TIPO_MONEDA;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_TIPO_OPERACION' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_TIPO_OPERACION;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_AGENCIA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_AGENCIA;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_BARRIO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_BARRIO;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_LOCALIDAD' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_LOCALIDAD;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_PROVINCIA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_PROVINCIA;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_RANGO_ETARIO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_RANGO_ETARIO;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_RANGO_METROS' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_RANGO_METROS;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BI_MIGRAR_TIPO_INMUEBLE' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP PROCEDURE [SQLITO].BI_MIGRAR_TIPO_INMUEBLE;

-- Eliminar Funciones
IF EXISTS (SELECT * FROM sys.objects WHERE type IN ('FN', 'IF', 'TF') AND name = 'CALCULAR_RANGO_ETARIO_EMPLEADO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP FUNCTION [SQLITO].CALCULAR_RANGO_ETARIO_EMPLEADO;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type IN ('FN', 'IF', 'TF') AND name = 'CALCULAR_RANGO_ETARIO_INQUILINO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP FUNCTION [SQLITO].CALCULAR_RANGO_ETARIO_INQUILINO;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type IN ('FN', 'IF', 'TF') AND name = 'CALCULAR_RANGO_METROS' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP FUNCTION [SQLITO].CALCULAR_RANGO_METROS;
GO

-- Eliminar Tablas


IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_HECHOS_ANUNCIO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_HECHOS_ANUNCIO;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_HECHOS_ALQUILER' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_HECHOS_ALQUILER;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_HECHOS_VENTA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_HECHOS_VENTA;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_AGENTE' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_AGENTE;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_INQUILINO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_INQUILINO;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_INMUEBLE' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_INMUEBLE;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_BARRIO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_BARRIO;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_LOCALIDAD' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_LOCALIDAD;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_PROVINCIA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_PROVINCIA;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_AGENCIA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_AGENCIA;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_TIPO_MONEDA' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_TIPO_MONEDA;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_TIPO_OPERACION' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_TIPO_OPERACION;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_RANGO_METROS' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_RANGO_METROS;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_AMBIENTES' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_AMBIENTES;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_TIPO_INMUEBLE' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_TIPO_INMUEBLE;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_RANGO_ETARIO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_RANGO_ETARIO;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BI_TIEMPO' AND schema_id = SCHEMA_ID('SQLITO'))
    DROP TABLE [SQLITO].BI_TIEMPO;

-- Eliminar Esquema
/*IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'SQLITO')
BEGIN
    DROP SCHEMA SQLITO;
END; */

--------------------------
--Creacion tablas--
--------------------------

/*IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'SQLITO')
BEGIN
    EXEC('CREATE SCHEMA SQLITO')
END
GO */

CREATE TABLE [SQLITO].BI_TIEMPO(
	BI_TIEMPO_ID NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	BI_TIEMPO_ANIO INT,
	BI_TIEMPO_CUATRIMESTRE INT,
	BI_TIEMPO_MES INT
);
GO

CREATE TABLE [SQLITO].BI_RANGO_ETARIO(
	BI_RANGO_ETARIO_ID NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	BI_RANGO_ETARIO_RANGO nvarchar(10),
);
GO

CREATE TABLE [SQLITO].BI_TIPO_INMUEBLE(
	BI_TIPO_INMUEBLE_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_TIPO_INMUEBLE nvarchar(45)
);
GO

CREATE TABLE [SQLITO].BI_AMBIENTES(
	BI_AMBIENTES_ID NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	BI_AMBIENTES_CANTIDAD nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_RANGO_METROS(
	BI_RANGO_METROS_ID NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	BI_RANGO_METROS_DESCRIPCION nvarchar(50)
);
GO

CREATE TABLE [SQLITO].BI_TIPO_OPERACION(
	BI_TIPO_OPERACION_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_TIPO_OPERACION_DESCRIPCION nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_TIPO_MONEDA(
	BI_TIPO_MONEDA_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_TIPO_MONEDA nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_AGENCIA(
	BI_AGENCIA_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_AGENCIA_NOMBRE nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_PROVINCIA(
	BI_PROVINCIA_ID NUMERIC(18,0) PRIMARY KEY,
	BI_PROVINCIA_NOMBRE nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_LOCALIDAD(
	BI_LOCALIDAD_ID NUMERIC(18,0) PRIMARY KEY,
	BI_LOCALIDAD_NOMBRE NVARCHAR(100),
	BI_PROVINCIA_ID NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_PROVINCIA] ([BI_PROVINCIA_ID])
);
GO

CREATE TABLE [SQLITO].BI_BARRIO(
	BI_BARRIO_ID NUMERIC(18,0) PRIMARY KEY,
	BI_BARRIO_NOMBRE VARCHAR(100),
	BI_LOCALIDAD_ID NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_LOCALIDAD] ([BI_LOCALIDAD_ID])
);
GO

--------------------------
--Creacion tablas hechos--
--------------------------

CREATE TABLE [SQLITO].BI_HECHOS_ANUNCIO(
	BI_hechos_anuncio_id NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_tiempo NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_tipo_operacion NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_OPERACION] ([BI_TIPO_OPERACION_ID]),
	BI_barrio NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_BARRIO] ([BI_BARRIO_ID]),
	BI_ambientes NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_AMBIENTES] ([BI_AMBIENTES_ID]),
	BI_tipo_inmueble NUMERIC(18,0)FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_INMUEBLE] ([BI_TIPO_INMUEBLE_ID]),
	BI_rango_metros NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_METROS] ([BI_RANGO_METROS_ID]),
	BI_tipo_moneda NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_MONEDA] ([BI_TIPO_MONEDA_ID]),
	BI_agencia NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[BI_AGENCIA] ([BI_AGENCIA_ID]),
	BI_rango_etario_empleado NUMERIC(18,0)  FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_ETARIO] ([BI_RANGO_ETARIO_ID]),
	BI_anuncio_fecha_publicacion datetime,
	BI_anuncio_fecha_finalizacion datetime,
	BI_anuncio_precio_publicado numeric(18, 2)
);
GO

CREATE TABLE [SQLITO].BI_HECHOS_ALQUILER(
	BI_hechos_alquiler_id NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_rango_etario_inquilino NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_ETARIO] ([BI_RANGO_ETARIO_ID]),
	BI_tiempo NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_barrio NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_BARRIO] ([BI_BARRIO_ID]),
	BI_pago_alq_fecha datetime,
	BI_pago_alq_fecha_vencimiento datetime,
	BI_pago_alq_importe numeric(18, 2),
	BI_alq_comision numeric(18, 2)
);
GO

CREATE TABLE [SQLITO].BI_HECHOS_VENTA(
	BI_hechos_venta_id NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_tiempo NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_tipo_inmueble NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_INMUEBLE] ([BI_TIPO_INMUEBLE_ID]),
	BI_localidad NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_LOCALIDAD] ([BI_LOCALIDAD_ID]),
	BI_agencia NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AGENCIA] ([BI_AGENCIA_ID]),
	BI_venta_precio numeric(18,2),
	BI_superficie_total numeric(18, 2),
	BI_venta_comision numeric(18, 2),
);
GO

CREATE FUNCTION [SQLITO].CALCULAR_RANGO_ETARIO_EMPLEADO(@EMPLEADO NUMERIC(18,0))
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_EMPLEADO INT
	SET @FECHA_NACIMIENTO = (SELECT fecha_nacimiento
							FROM [SQLITO].agente_inmobiliario
							WHERE agente_inmobiliario_id = @EMPLEADO)
	SET @EDAD = YEAR(GETDATE()) - YEAR(@FECHA_NACIMIENTO)

	IF @EDAD < 25
		SET @ID_RANGO_ETARIO_EMPLEADO = 1
	ELSE IF @EDAD BETWEEN  25 AND 35
		SET @ID_RANGO_ETARIO_EMPLEADO = 2
	ELSE IF @EDAD BETWEEN 35 AND 50
		SET @ID_RANGO_ETARIO_EMPLEADO = 3
	ELSE IF @EDAD > 50
		SET @ID_RANGO_ETARIO_EMPLEADO = 4

RETURN @ID_RANGO_ETARIO_EMPLEADO
END
GO

CREATE FUNCTION [SQLITO].CALCULAR_RANGO_ETARIO_INQUILINO(@INQUILINO NUMERIC(18,0))
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_INQUILINO INT
	SET @FECHA_NACIMIENTO = (SELECT fecha_nacimiento
							FROM [SQLITO].inquilino
							WHERE inquilino_id = @INQUILINO)
	SET @EDAD = YEAR(GETDATE()) - YEAR(@FECHA_NACIMIENTO)

	IF @EDAD < 25
		SET @ID_RANGO_ETARIO_INQUILINO = 1
	ELSE IF @EDAD BETWEEN  25 AND 35
		SET @ID_RANGO_ETARIO_INQUILINO = 2
	ELSE IF @EDAD BETWEEN 35 AND 50
		SET @ID_RANGO_ETARIO_INQUILINO = 3
	ELSE IF @EDAD > 50
		SET @ID_RANGO_ETARIO_INQUILINO = 4

RETURN @ID_RANGO_ETARIO_INQUILINO
END
GO

CREATE FUNCTION [SQLITO].CALCULAR_RANGO_METROS(@INMUEBLE NUMERIC(18,0))
RETURNS INT
BEGIN
	DECLARE @SUPERFICIE numeric(18, 2)
	DECLARE @ID_RANGO_METROS INT

	SET @SUPERFICIE = (SELECT i.supericie_total
					   FROM [SQLITO].inmueble i
					   WHERE i.inmueble_id = @INMUEBLE)

	IF @SUPERFICIE < 35
		SET @ID_RANGO_METROS = 1
	ELSE IF @SUPERFICIE BETWEEN 35 AND 55
		SET @ID_RANGO_METROS = 2
	ELSE IF @SUPERFICIE BETWEEN 55 AND 75
		SET @ID_RANGO_METROS = 3
	ELSE IF @SUPERFICIE BETWEEN 75 AND 100
		SET @ID_RANGO_METROS = 4
	ELSE IF @SUPERFICIE > 100
		SET @ID_RANGO_METROS = 5

RETURN @ID_RANGO_METROS
END
GO

---------------------------
--Migraciones Dimensiones--
---------------------------

CREATE PROCEDURE [SQLITO].BI_MIGRAR_AMBIENTES
AS
BEGIN
INSERT INTO [SQLITO].BI_AMBIENTES(BI_AMBIENTES_CANTIDAD)
SELECT
	t.nombre
FROM [SQLITO].tipo_ambiente t
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_PUBLICACION
AS
BEGIN
    INSERT INTO BI_TIEMPO (BI_TIEMPO_ANIO, BI_TIEMPO_MES, BI_TIEMPO_CUATRIMESTRE)
    SELECT DISTINCT
        YEAR(a.fecha_publicacion) AS BI_TIEMPO_ANIO,
        MONTH(a.fecha_publicacion) AS BI_TIEMPO_MES,
        CASE
            WHEN MONTH(a.fecha_publicacion) BETWEEN 1 AND 3 THEN 1 
            WHEN MONTH(a.fecha_publicacion) BETWEEN 4 AND 6 THEN 2 
            WHEN MONTH(a.fecha_publicacion) BETWEEN 7 AND 9 THEN 3 
            WHEN MONTH(a.fecha_publicacion) BETWEEN 10 AND 12 THEN 4 
            ELSE NULL 
        END AS BI_TIEMPO_CUATRIMESTRE
    FROM [SQLITO].anuncio a;
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_FINALIZACION
AS
BEGIN
INSERT INTO BI_TIEMPO(BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_MES)
SELECT DISTINCT
	YEAR(a.fecha_finalizacion) AS BI_TIEMPO_ANIO,
        MONTH(a.fecha_finalizacion) AS BI_TIEMPO_MES,
        CASE
            WHEN MONTH(a.fecha_finalizacion) BETWEEN 1 AND 3 THEN 1 
            WHEN MONTH(a.fecha_finalizacion) BETWEEN 4 AND 6 THEN 2 
            WHEN MONTH(a.fecha_finalizacion) BETWEEN 7 AND 9 THEN 3 
            WHEN MONTH(a.fecha_finalizacion) BETWEEN 10 AND 12 THEN 4 
			ELSE NULL 
        END AS BI_TIEMPO_CUATRIMESTRE
FROM [SQLITO].anuncio a
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIPO_MONEDA
AS
BEGIN
INSERT INTO BI_TIPO_MONEDA
SELECT
	m.tipo_moneda
FROM [SQLITO].moneda m
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIPO_OPERACION
AS
BEGIN
INSERT INTO BI_TIPO_OPERACION
SELECT
	t.nombre
FROM [SQLITO].tipo_operacion t
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_AGENCIA
AS
BEGIN
INSERT INTO BI_AGENCIA
SELECT
	s.nombre
FROM [SQLITO].agencia s
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_BARRIO
AS
BEGIN
    INSERT INTO BI_BARRIO (BI_BARRIO_ID,BI_BARRIO_NOMBRE, BI_LOCALIDAD_ID)
    SELECT
		b.barrio_id,
        b.nombre,
        l.BI_LOCALIDAD_ID
    FROM [SQLITO].barrio b
    INNER JOIN [SQLITO].BI_LOCALIDAD l ON b.localidad = l.BI_LOCALIDAD_ID;
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_PROVINCIA
AS
BEGIN
INSERT INTO BI_PROVINCIA
SELECT
	p.provincia_id,
	p.nombre
FROM [SQLITO].provincia p
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_LOCALIDAD
AS
BEGIN
    INSERT INTO BI_LOCALIDAD (BI_LOCALIDAD_ID,BI_LOCALIDAD_NOMBRE, BI_PROVINCIA_ID)
    SELECT
		l.localidad_id,
        l.nombre,
         p.BI_PROVINCIA_ID
    FROM [SQLITO].localidad l
    INNER JOIN [SQLITO].BI_PROVINCIA P ON l.provincia = p.BI_PROVINCIA_ID;
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_RANGO_ETARIO
AS
BEGIN
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('<25')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('25-35')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('35-50')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('>50')
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_RANGO_METROS
AS
BEGIN
	INSERT INTO BI_RANGO_METROS(BI_RANGO_METROS_DESCRIPCION)
		VALUES('<35')
	INSERT INTO BI_RANGO_METROS(BI_RANGO_METROS_DESCRIPCION)
		VALUES('<35-55')
	INSERT INTO BI_RANGO_METROS(BI_RANGO_METROS_DESCRIPCION)
		VALUES('55-75')
	INSERT INTO BI_RANGO_METROS(BI_RANGO_METROS_DESCRIPCION)
		VALUES('75-100')
	INSERT INTO BI_RANGO_METROS(BI_RANGO_METROS_DESCRIPCION)
		VALUES('>100')			
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIPO_INMUEBLE
AS
BEGIN
INSERT INTO [SQLITO].BI_TIPO_INMUEBLE
SELECT
	ti.nombre
FROM [SQLITO].tipo_inmueble ti
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_ANUNCIOS
AS
BEGIN
INSERT INTO [SQLITO].BI_HECHOS_ANUNCIO(
	BI_tiempo,
	BI_tipo_operacion,
	BI_barrio,
	BI_ambientes,
	BI_tipo_inmueble,
	BI_rango_metros,
	BI_tipo_moneda,
	BI_agencia,
	BI_rango_etario_empleado,
	BI_anuncio_fecha_publicacion,
	BI_anuncio_fecha_finalizacion,
	BI_anuncio_precio_publicado
)
SELECT DISTINCT
	t.BI_TIEMPO_ID, --ID TIEMPO
	tiop.BI_TIPO_OPERACION_ID, --ID TIPO OPERACION
	bb.BI_BARRIO_ID , --ID BARRIO
	amb.BI_AMBIENTES_ID, --ID AMBIENTES
	bti.BI_TIPO_INMUEBLE_ID, --TIPO INMUEBLES
	rm.BI_RANGO_METROS_ID, --RANGO METROS
	tm.BI_TIPO_MONEDA_ID, --TIPO MONEDA
	bs.BI_AGENCIA_ID, --SUCURSALES
	re.BI_RANGO_ETARIO_ID, --RANGO ETARIO EMPLEADO
	a.fecha_publicacion,
	a.fecha_finalizacion,
	a.precio_publicado_inmueble
FROM [SQLITO].anuncio a
JOIN [SQLITO].inmueble i ON i.inmueble_id = a.inmueble
JOIN [SQLITO].BI_BARRIO bb ON bb.BI_BARRIO_ID =  i.barrio
JOIN [SQLITO].BI_AMBIENTES amb ON amb.BI_AMBIENTES_ID = i.tipo_ambiente
JOIN [SQLITO].BI_TIPO_INMUEBLE bti ON bti.BI_TIPO_INMUEBLE_ID = i.tipo_inmueble
JOIN [SQLITO].agente_inmobiliario ag ON ag.agente_inmobiliario_id = a.agente
JOIN [SQLITO].BI_AGENCIA bs ON bs.BI_AGENCIA_ID = ag.agencia  
JOIN [SQLITO].BI_TIEMPO t ON t.BI_TIEMPO_ANIO = DATEPART(YEAR,a.fecha_publicacion) AND t.BI_TIEMPO_MES = DATEPART(MONTH, a.fecha_publicacion) AND t.BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.fecha_publicacion)
JOIN [SQLITO].BI_TIPO_OPERACION tiop ON tiop.BI_TIPO_OPERACION_ID = a.tipo_operacion
JOIN [SQLITO].BI_RANGO_ETARIO re ON re.BI_RANGO_ETARIO_ID = [SQLITO].CALCULAR_RANGO_ETARIO_EMPLEADO(a.agente)
JOIN [SQLITO].BI_RANGO_METROS rm ON rm.BI_RANGO_METROS_ID= [SQLITO].CALCULAR_RANGO_METROS(a.inmueble)
JOIN [SQLITO].BI_TIPO_MONEDA tm ON tm.BI_TIPO_MONEDA_ID = a.moneda
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_ALQUILER
AS
BEGIN
INSERT INTO [SQLITO].BI_HECHOS_ALQUILER(
    BI_rango_etario_inquilino,
    BI_tiempo,
    BI_barrio,
    BI_pago_alq_fecha,
    BI_pago_alq_fecha_vencimiento,
    BI_pago_alq_importe,
    BI_alq_comision
)
SELECT DISTINCT
    re.BI_RANGO_ETARIO_ID, --RANGO ETARIO INQUILINO
    t.BI_TIEMPO_ID, --TIEMPO
    b.BI_BARRIO_ID, --BARRIO
    ppa.fecha_pago, --PAGO ALQ FECHA
    ppa.fecha_vencimiento, --PAGO ALQ FECHA VENC
    ppa.IMPORTE,-- PAGO ALQ IMPORTE
    a.COMISION --ALQ COMISION
FROM [SQLITO].alquiler a
JOIN [SQLITO].anuncio anun ON anun.anuncio_id = a.anuncio
JOIN [SQLITO].inmueble inmu ON inmu.inmueble_id = anun.inmueble
JOIN [SQLITO].pago_alquiler ppa ON ppa.alquiler = a.alquiler_id
JOIN [SQLITO].BI_RANGO_ETARIO re ON re.BI_RANGO_ETARIO_ID = [SQLITO].CALCULAR_RANGO_ETARIO_INQUILINO(a.inquilino)
JOIN [SQLITO].BI_TIEMPO t ON t.BI_TIEMPO_ANIO = DATEPART(YEAR, a.fecha_inicio) AND t.BI_TIEMPO_MES = DATEPART(MONTH, a.fecha_inicio) AND t.BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, a.FECHA_INICIO)
JOIN [SQLITO].BI_BARRIO b ON b.BI_BARRIO_ID = inmu.barrio
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_HECHOS_VENTA
AS
BEGIN
INSERT INTO [SQLITO].BI_HECHOS_VENTA(
	BI_tiempo,
	BI_tipo_inmueble,
	BI_localidad,
	BI_agencia,
	BI_venta_precio,
	BI_superficie_total,
	BI_venta_comision
)
SELECT DISTINCT
	t.BI_TIEMPO_ID, --VENTA TIEMPO	
	ti.BI_TIPO_INMUEBLE_ID, --TIPO INMUEBLE
	l.BI_LOCALIDAD_ID, --LOCALIDAD
	s.BI_AGENCIA_ID, --SUCURSAL
	v.precio_venta, --VENTA PRECIO
	i.supericie_total, --SUPERFICIE TOTAL
	v.comision_inmobiliaria --COMISION
FROM [SQLITO].venta v
JOIN [SQLITO].anuncio a ON a.anuncio_id = v.venta_id 
JOIN [SQLITO].agente_inmobiliario agen ON agen.agente_inmobiliario_id = a.agente
JOIN [SQLITO].inmueble i ON i.inmueble_id = a.inmueble
JOIN [SQLITO].BI_TIPO_INMUEBLE ti ON ti.BI_TIPO_INMUEBLE_ID = i.tipo_inmueble 
JOIN [SQLITO].barrio b ON b.barrio_id = i.barrio
JOIN [SQLITO].BI_LOCALIDAD l ON l.BI_LOCALIDAD_ID = b.localidad  
JOIN [SQLITO].BI_TIEMPO t ON t.BI_TIEMPO_ANIO = DATEPART(YEAR,v.fecha_venta) AND t.BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER,v.fecha_venta) AND t.BI_TIEMPO_MES = DATEPART(MONTH,v.fecha_venta)
JOIN [SQLITO].BI_AGENCIA s ON s.BI_AGENCIA_ID = agen.agencia
END
GO


BEGIN TRANSACTION
	EXECUTE [SQLITO].BI_MIGRAR_AMBIENTES
	EXECUTE [SQLITO].BI_MIGRAR_TIEMPO_PUBLICACION
	EXECUTE [SQLITO].BI_MIGRAR_TIEMPO_FINALIZACION
	EXECUTE [SQLITO].BI_MIGRAR_TIPO_MONEDA
	EXECUTE [SQLITO].BI_MIGRAR_TIPO_OPERACION
	EXECUTE [SQLITO].BI_MIGRAR_AGENCIA
	EXECUTE [SQLITO].BI_MIGRAR_PROVINCIA
	EXECUTE [SQLITO].BI_MIGRAR_LOCALIDAD
	EXECUTE [SQLITO].BI_MIGRAR_BARRIO
	EXECUTE [SQLITO].BI_MIGRAR_RANGO_ETARIO
	EXECUTE [SQLITO].BI_MIGRAR_RANGO_METROS
	EXECUTE [SQLITO].BI_MIGRAR_TIPO_INMUEBLE
	EXECUTE [SQLITO].BI_MIGRAR_HECHOS_ANUNCIOS
	EXECUTE [SQLITO].BI_MIGRAR_HECHOS_ALQUILER
	EXECUTE [SQLITO].BI_MIGRAR_HECHOS_VENTA

COMMIT;

/*1*/
GO
CREATE VIEW [SQLITO].VW_DURACION_PROMEDIO_ANUNCIOS 
AS
SELECT
    t.BI_TIEMPO_ANIO AS Anio,
    t.BI_TIEMPO_CUATRIMESTRE AS Cuatrimestre,
    tiop.BI_TIPO_OPERACION_DESCRIPCION AS TipoOperacion,
    bb.BI_BARRIO_NOMBRE AS Barrio,
    amb.BI_AMBIENTES_CANTIDAD AS Ambientes,
    AVG(DATEDIFF(day, a.BI_anuncio_fecha_publicacion, a.BI_anuncio_fecha_finalizacion)) AS DuracionPromedio
FROM [SQLITO].BI_HECHOS_ANUNCIO a
JOIN [SQLITO].BI_TIEMPO t ON t.BI_TIEMPO_ID = a.BI_tiempo
JOIN [SQLITO].BI_TIPO_OPERACION tiop ON tiop.BI_TIPO_OPERACION_ID = a.BI_tipo_operacion
JOIN [SQLITO].BI_BARRIO bb ON bb.BI_BARRIO_ID = a.BI_barrio
JOIN [SQLITO].BI_AMBIENTES amb ON amb.BI_AMBIENTES_ID = a.BI_ambientes
GROUP BY
    t.BI_TIEMPO_ANIO,
    t.BI_TIEMPO_CUATRIMESTRE,
    tiop.BI_TIPO_OPERACION_DESCRIPCION,
    bb.BI_BARRIO_NOMBRE,
    amb.BI_AMBIENTES_CANTIDAD;
GO
SELECT * FROM [SQLITO].VW_DURACION_PROMEDIO_ANUNCIOS;

/*2*/
GO
CREATE VIEW [SQLITO].VW_PROMEDIO_PRECIO_INMUEBLES AS
SELECT 
    t.BI_TIEMPO_ANIO,
    t.BI_TIEMPO_CUATRIMESTRE,
    op.BI_TIPO_OPERACION_DESCRIPCION,
    inm.BI_TIPO_INMUEBLE,
    rm.BI_RANGO_METROS_DESCRIPCION,
    tm.BI_TIPO_MONEDA,
    AVG(ha.BI_anuncio_precio_publicado) AS Precio_Promedio
FROM 
    [SQLITO].BI_HECHOS_ANUNCIO ha
INNER JOIN 
    [SQLITO].BI_TIEMPO t ON ha.BI_tiempo = t.BI_TIEMPO_ID
INNER JOIN 
    [SQLITO].BI_TIPO_OPERACION op ON ha.BI_tipo_operacion = op.BI_TIPO_OPERACION_ID
INNER JOIN 
    [SQLITO].BI_TIPO_INMUEBLE inm ON ha.BI_tipo_inmueble = inm.BI_TIPO_INMUEBLE_ID
INNER JOIN 
    [SQLITO].BI_RANGO_METROS rm ON ha.BI_rango_metros = rm.BI_RANGO_METROS_ID
INNER JOIN 
    [SQLITO].BI_TIPO_MONEDA tm ON ha.BI_tipo_moneda = tm.BI_TIPO_MONEDA_ID
GROUP BY 
    t.BI_TIEMPO_ANIO,
    t.BI_TIEMPO_CUATRIMESTRE,
    op.BI_TIPO_OPERACION_DESCRIPCION,
    inm.BI_TIPO_INMUEBLE,
    rm.BI_RANGO_METROS_DESCRIPCION,
    tm.BI_TIPO_MONEDA;
GO
SELECT * FROM [SQLITO].VW_PROMEDIO_PRECIO_INMUEBLES

/*3*/
GO

CREATE VIEW [SQLITO].[BI_VW_TOP_BARRIOS_POR_RANGO_ETARIO]
AS
SELECT
    [barrio].[nombre] AS [Barrio],
    [SQLITO].[CALCULAR_RANGO_ETARIO_INQUILINO]([inquilino].[inquilino_id]) AS [RangoEtario],
    COUNT(*) AS [CantidadAlquileres]
FROM
    [SQLITO].[alquiler]
INNER JOIN [SQLITO].[anuncio] ON [alquiler].[anuncio] = [anuncio].[anuncio_id]
INNER JOIN [SQLITO].[inmueble] ON [anuncio].[inmueble] = [inmueble].[inmueble_id]
INNER JOIN [SQLITO].[barrio] ON [inmueble].[barrio] = [barrio].[barrio_id]
INNER JOIN [SQLITO].[inquilino] ON [alquiler].[inquilino] = [inquilino].[inquilino_id]
GROUP BY
    [barrio].[nombre],
    [SQLITO].[CALCULAR_RANGO_ETARIO_INQUILINO]([inquilino].[inquilino_id]);
GO
SELECT * FROM [SQLITO].BI_VW_TOP_BARRIOS_POR_RANGO_ETARIO

/*4*/
GO
CREATE VIEW [SQLITO].VW_PORCENTAJE_INCUMPLIMIENTO_ALQUILER AS
SELECT
    T.BI_TIEMPO_ANIO AS Anio,
    T.BI_TIEMPO_MES AS Mes,
    COUNT(CASE WHEN A.BI_pago_alq_fecha > A.BI_pago_alq_fecha_vencimiento THEN 1 END) AS PagosIncumplidos,
    COUNT(*) AS TotalPagos,
    (COUNT(CASE WHEN A.BI_pago_alq_fecha > A.BI_pago_alq_fecha_vencimiento THEN 1 END) * 100.0) / COUNT(*) AS PorcentajeIncumplimiento
FROM [SQLITO].BI_HECHOS_ALQUILER A
INNER JOIN [SQLITO].BI_TIEMPO T ON T.BI_TIEMPO_ID = A.BI_tiempo
GROUP BY
    T.BI_TIEMPO_ANIO,
    T.BI_TIEMPO_MES;
GO

/*5*/
GO
CREATE VIEW [SQLITO].VW_PROMEDIO_INCREMENTO_ALQUILER AS
WITH DatosAlquiler AS (
    SELECT
        ha.BI_hechos_alquiler_id,
        t.BI_TIEMPO_ANIO,
        t.BI_TIEMPO_MES,
        ha.BI_pago_alq_importe,
        LAG(ha.BI_pago_alq_importe) OVER (PARTITION BY ha.BI_hechos_alquiler_id ORDER BY t.BI_TIEMPO_ANIO, t.BI_TIEMPO_MES) AS Pago_Anterior
    FROM
        [SQLITO].BI_HECHOS_ALQUILER ha
    INNER JOIN
        [SQLITO].BI_TIEMPO t ON ha.BI_tiempo = t.BI_TIEMPO_ID
)
SELECT
    BI_TIEMPO_ANIO,
    BI_TIEMPO_MES,
    AVG(CASE 
            WHEN Pago_Anterior IS NOT NULL THEN ((BI_pago_alq_importe - Pago_Anterior) / Pago_Anterior) * 100
            ELSE 0 
        END) AS Porcentaje_Promedio_Incremento
FROM
    DatosAlquiler
WHERE
    Pago_Anterior IS NOT NULL
GROUP BY
    BI_TIEMPO_ANIO,
    BI_TIEMPO_MES;

GO


/*6*/
GO
CREATE VIEW [SQLITO].VW_PRECIO_PROMEDIO_M2_VENTAS AS
SELECT
    t.BI_TIPO_INMUEBLE_ID AS TipoInmuebleID,
    l.BI_LOCALIDAD_ID AS LocalidadID,
    ti.BI_TIEMPO_ANIO AS Anio,
    ti.BI_TIEMPO_CUATRIMESTRE AS Cuatrimestre,
    AVG(v.BI_SUPERFICIE_TOTAL / v.BI_VENTA_PRECIO) AS PrecioPromedioM2
FROM [SQLITO].BI_HECHOS_VENTA v
JOIN [SQLITO].BI_TIPO_INMUEBLE t ON v.BI_tipo_inmueble = t.BI_TIPO_INMUEBLE_ID
JOIN [SQLITO].BI_LOCALIDAD l ON v.BI_localidad = l.BI_LOCALIDAD_ID
JOIN [SQLITO].BI_TIEMPO ti ON v.BI_tiempo = ti.BI_TIEMPO_ID
GROUP BY
    t.BI_TIPO_INMUEBLE_ID,
    l.BI_LOCALIDAD_ID,
    ti.BI_TIEMPO_ANIO,
    ti.BI_TIEMPO_CUATRIMESTRE;
GO
SELECT * FROM [SQLITO].VW_PRECIO_PROMEDIO_M2_VENTAS

/*7*/
GO
CREATE VIEW [SQLITO].VW_PROMEDIO_COMISION_TIPO_OPERACION AS
WITH Comisiones AS (
    SELECT
        'Alquiler' AS TipoOperacion,
        an.BI_agencia,
        t.BI_TIEMPO_CUATRIMESTRE,
        t.BI_TIEMPO_ANIO,
        a.BI_alq_comision AS Comision
    FROM [SQLITO].BI_HECHOS_ALQUILER a
    INNER JOIN [SQLITO].BI_TIEMPO t ON a.BI_tiempo = t.BI_TIEMPO_ID
    INNER JOIN [SQLITO].BI_HECHOS_ANUNCIO an ON an.BI_hechos_anuncio_id = a.BI_hechos_alquiler_id
    WHERE a.BI_alq_comision IS NOT NULL

    UNION ALL

    SELECT
        'Venta' AS TipoOperacion,
        an.BI_agencia,
        t.BI_TIEMPO_CUATRIMESTRE,
        t.BI_TIEMPO_ANIO,
        v.BI_venta_comision AS Comision
    FROM [SQLITO].BI_HECHOS_VENTA v
    INNER JOIN [SQLITO].BI_TIEMPO t ON v.BI_tiempo = t.BI_TIEMPO_ID
    INNER JOIN [SQLITO].BI_HECHOS_ANUNCIO an ON an.BI_hechos_anuncio_id = v.BI_hechos_venta_id
    WHERE v.BI_venta_comision IS NOT NULL
)
SELECT
    TipoOperacion,
    BI_agencia,
    BI_TIEMPO_CUATRIMESTRE,
    BI_TIEMPO_ANIO,
    AVG(Comision) AS PromedioComision
FROM Comisiones
GROUP BY TipoOperacion, BI_agencia, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO;
GO

SELECT * FROM [SQLITO].VW_PROMEDIO_COMISION_TIPO_OPERACION


/*8*/
GO
CREATE VIEW Vista_Montos_Cierre_Contratos AS
SELECT
    CASE
        WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Alquiler' THEN 'Alquiler'
        WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Venta' THEN 'Venta'
        ELSE 'Otro'
    END AS Tipo_Operacion,
    t.BI_TIEMPO_CUATRIMESTRE AS Cuatrimestre,
    a.BI_AGENCIA_NOMBRE AS Sucursal,
    tm.BI_TIPO_MONEDA AS Tipo_Moneda,
    SUM(CASE
            WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Alquiler' THEN ho
            WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Venta' THEN hv.BI_venta_comision
            ELSE 0
        END) AS Monto_Total
FROM [SQLITO].BI_TIEMPO t
JOIN [SQLITO].BI_HECHOS_ANUNCIO ha ON t.BI_TIEMPO_ID = ha.BI_tiempo
JOIN [SQLITO].BI_HECHOS_VENTA hv ON t.BI_TIEMPO_ID = hv.BI_tiempo
JOIN [SQLITO].BI_AGENCIA a ON ha.BI_agencia = a.BI_AGENCIA_ID
JOIN [SQLITO].BI_TIPO_MONEDA tm ON ha.BI_tipo_moneda = tm.BI_TIPO_MONEDA_ID
JOIN [SQLITO].BI_TIPO_OPERACION ho ON ha.BI_tipo_operacion = ho.BI_TIPO_OPERACION_ID
GROUP BY
    CASE
        WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Alquiler' THEN 'Alquiler'
        WHEN ho.BI_TIPO_OPERACION_DESCRIPCION = 'Venta' THEN 'Venta'
        ELSE 'Otro'
    END,
    t.BI_TIEMPO_CUATRIMESTRE,
    a.BI_AGENCIA_NOMBRE,
    tm.BI_TIPO_MONEDA;
GO

/*9*/
GO
CREATE VIEW [SQLITO].VW_TOTAL_CIERRE_CONTRATOS AS
WITH Totales AS (
    SELECT
        'Alquiler' AS TipoOperacion,
        an.BI_agencia,
        t.BI_TIEMPO_CUATRIMESTRE,
        t.BI_TIEMPO_ANIO,
        an.BI_tipo_moneda,
        SUM(a.BI_pago_alq_importe) AS MontoTotal
    FROM [SQLITO].BI_HECHOS_ALQUILER a
    INNER JOIN [SQLITO].BI_TIEMPO t ON a.BI_tiempo = t.BI_TIEMPO_ID
    INNER JOIN [SQLITO].BI_HECHOS_ANUNCIO an ON an.BI_hechos_anuncio_id = a.BI_hechos_alquiler_id
    GROUP BY an.BI_agencia, t.BI_TIEMPO_CUATRIMESTRE, t.BI_TIEMPO_ANIO, an.BI_tipo_moneda

    UNION ALL

    SELECT
        'Venta' AS TipoOperacion,
        an.BI_agencia,
        t.BI_TIEMPO_CUATRIMESTRE,
        t.BI_TIEMPO_ANIO,
        an.BI_tipo_moneda,
        SUM(v.BI_venta_precio) AS MontoTotal
    FROM [SQLITO].BI_HECHOS_VENTA v
    INNER JOIN [SQLITO].BI_TIEMPO t ON v.BI_tiempo = t.BI_TIEMPO_ID
    INNER JOIN [SQLITO].BI_HECHOS_ANUNCIO an ON an.BI_hechos_anuncio_id = v.BI_hechos_venta_id
    GROUP BY an.BI_agencia, t.BI_TIEMPO_CUATRIMESTRE, t.BI_TIEMPO_ANIO, an.BI_tipo_moneda
)
SELECT
    TipoOperacion,
    BI_agencia,
    BI_TIEMPO_CUATRIMESTRE,
    BI_TIEMPO_ANIO,
    BI_tipo_moneda,
    SUM(MontoTotal) AS MontoTotal
FROM Totales
GROUP BY TipoOperacion, BI_agencia, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO, BI_tipo_moneda;
GO

SELECT * FROM [SQLITO].VW_TOTAL_CIERRE_CONTRATOS