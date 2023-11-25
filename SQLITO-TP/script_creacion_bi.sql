USE GD2C2023;
GO

IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'SQLITO')
BEGIN
    DROP SCHEMA SQLITO;
END;

--------------------------
--Creacion tablas--
--------------------------


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
	BI_PROVINCIA_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_PROVINCIA_NOMBRE nvarchar(100)
);
GO

CREATE TABLE [SQLITO].BI_LOCALIDAD(
	BI_LOCALIDAD_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_LOCALIDAD_NOMBRE NVARCHAR(100),
	BI_PROVINCIA_ID NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_PROVINCIA] ([BI_PROVINCIA_ID])
);
GO

CREATE TABLE [SQLITO].BI_BARRIO(
	BI_BARRIO_ID NUMERIC(18,0) IDENTITY PRIMARY KEY,
	BI_BARRIO_NOMBRE VARCHAR(100),
	BI_LOCALIDAD_ID NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_LOCALIDAD] ([BI_LOCALIDAD_ID])
);
GO

CREATE TABLE [SQLITO].[BI_AGENTE](
	BI_AGENTE_ID NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	BI_AGENCIA NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AGENCIA] ([BI_AGENCIA_ID]) ,
	BI_NOMBRE VARCHAR(100),
	BI_APELLIDO VARCHAR(100),
	BI_DNI NUMERIC(18,0),
	BI_FECHA_REGISTRO DATETIME,
	BI_FECHA_NACIMIENTO DATETIME,
	BI_MAIL VARCHAR(100),
	BI_TELEFONO NUMERIC(18,0)
);
GO

CREATE TABLE [SQLITO].[BI_INQUILINO](
	BI_INQUILINO_ID NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	BI_NOMBRE VARCHAR(100),
	BI_APELLIDO VARCHAR(100),
	BI_DNI NUMERIC(18,0),
	BI_FECHA_REGISTRO DATETIME,
	BI_FECHA_NACIMIENTO DATETIME,
	BI_MAIL VARCHAR(100),
	BI_TELEFONO NUMERIC(18,0)
);
GO

CREATE TABLE [SQLITO].BI_INMUEBLE (
	BI_INMUEBLE_ID NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	BI_codigo_inmueble NUMERIC(18,0),
	BI_tipo_inmueble NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_INMUEBLE] ([BI_TIPO_INMUEBLE_ID]) ,
	BI_descripcion NVARCHAR(100),
	BI_supericie_total NUMERIC(18,2), 
);
GO

--------------------------
--Creacion tablas hechos--
--------------------------


CREATE TABLE [SQLITO].BI_HECHOS_ANUNCIO(
	BI_tiempo NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_tipo_operacion NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_OPERACION] ([BI_TIPO_OPERACION_ID]),
	BI_barrio NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_BARRIO] ([BI_BARRIO_ID]),
	BI_ambientes NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AMBIENTES] ([BI_AMBIENTES_ID]),
	BI_tipo_inmueble NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_INMUEBLE] ([BI_TIPO_INMUEBLE_ID]),
	BI_rango_metros NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_METROS] ([BI_RANGO_METROS_ID]),
	BI_tipo_moneda NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_MONEDA] ([BI_TIPO_MONEDA_ID]),
	BI_agencia NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AGENCIA] ([BI_AGENCIA_ID]),
	BI_rango_etario_empleado NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_ETARIO] ([BI_RANGO_ETARIO_ID]),
	BI_agente NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AGENTE] ([BI_AGENTE_ID]),
	BI_inmueble NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_INMUEBLE] ([BI_INMUEBLE_ID]),	
	BI_anuncio_fecha_publicacion datetime,
	BI_anuncio_fecha_finalizacion datetime,
	BI_anuncio_precio_publicado numeric(18, 2)
	PRIMARY KEY (BI_tiempo, BI_tipo_operacion, BI_barrio, BI_ambientes, BI_tipo_inmueble, BI_rango_metros, BI_tipo_moneda, BI_agencia, BI_rango_etario_empleado, BI_agente, BI_inmueble)
);
GO

CREATE TABLE [SQLITO].BI_HECHOS_ALQUILER(
	BI_rango_etario_inquilino NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_RANGO_ETARIO] ([BI_RANGO_ETARIO_ID]),
	BI_tiempo NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_barrio NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_BARRIO] ([BI_BARRIO_ID]),
	BI_inquilino NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_INQUILINO] ([BI_INQUILINO_ID]),
	BI_pago_alq_fecha datetime,
	BI_pago_alq_fecha_vencimiento datetime,
	BI_pago_alq_importe numeric(18, 2),
	BI_alq_comision numeric(18, 2),
	PRIMARY KEY (BI_rango_etario_inquilino, BI_tiempo, BI_barrio, BI_inquilino)
);
GO

CREATE TABLE [SQLITO].BI_HECHOS_VENTA(
	BI_tiempo NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIEMPO] ([BI_TIEMPO_ID]),
	BI_tipo_inmueble NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_TIPO_INMUEBLE] ([BI_TIPO_INMUEBLE_ID]),
	BI_localidad NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_LOCALIDAD] ([BI_LOCALIDAD_ID]),
	BI_agencia NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[BI_AGENCIA] ([BI_AGENCIA_ID]),
	BI_venta_precio numeric(18,2),
	BI_superficie_total numeric(18, 2),
	BI_venta_comision numeric(18, 2),
	PRIMARY KEY (BI_tiempo, BI_tipo_inmueble, BI_localidad, BI_agencia)
);
GO

CREATE FUNCTION [SQLITO].CALCULAR_RANGO_ETARIO_EMPLEADO(@EMPLEADO NUMERIC(18,0))
RETURNS INT
BEGIN
	DECLARE @FECHA_NACIMIENTO SMALLDATETIME
	DECLARE @EDAD INT
	DECLARE @ID_RANGO_ETARIO_EMPLEADO INT
	SET @FECHA_NACIMIENTO = (SELECT BI_FECHA_NACIMIENTO
							FROM [SQLITO].BI_AGENTE
							WHERE BI_AGENTE_ID = @EMPLEADO)
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
	SET @FECHA_NACIMIENTO = (SELECT BI_FECHA_NACIMIENTO
							FROM [SQLITO].BI_INQUILINO
							WHERE BI_INQUILINO_ID = @INQUILINO)
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

	SET @SUPERFICIE = (SELECT i.BI_supericie_total
					   FROM [SQLITO].BI_INMUEBLE i
					   WHERE i.BI_INMUEBLE_ID = @INMUEBLE)

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

INSERT INTO [SQLITO].BI_AMBIENTES
SELECT
	nombre
FROM [SQLITO].tipo_ambiente

END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_PUBLICACION
AS
BEGIN
INSERT INTO BI_TIEMPO
SELECT
	YEAR(a.fecha_publicacion),
	DATEPART(Q, a.fecha_publicacion),
	DATEPART(M, a.fecha_publicacion)
FROM [SQLITO].anuncio a
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_TIEMPO_FINALIZACION
AS
BEGIN
INSERT INTO BI_TIEMPO
SELECT
	YEAR(a.fecha_publicacion),
	DATEPART(Q, a.fecha_finalizacion),
	DATEPART(M, a.fecha_finalizacion)
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

CREATE PROCEDURE [SQLITO].BI_MIGRAR_SUCURSAL
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
INSERT INTO BI_BARRIO
SELECT
	b.nombre
FROM [SQLITO].barrio b
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_LOCALIDAD
AS
BEGIN
INSERT INTO BI_LOCALIDAD
SELECT
	l.nombre
FROM [SQLITO].localidad l
END
GO

CREATE PROCEDURE [SQLITO].BI_MIGRAR_PROVINCIA
AS
BEGIN
INSERT INTO BI_PROVINCIA
SELECT
	p.nombre
FROM [SQLITO].provincia p
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
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('<35-55')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('55-75')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
		VALUES('75-100')
	INSERT INTO BI_RANGO_ETARIO(BI_RANGO_ETARIO_RANGO)
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






