USE [GD2C2023]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[pago_alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[pago_alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[detalle_importe_alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[detalle_importe_alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[estado_alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[estado_alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[inquilino]') AND type in (N'U'))
DROP TABLE [SQLITO].[inquilino]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[pago_compra_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[pago_compra_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[medio_pago]') AND type in (N'U'))
DROP TABLE [SQLITO].[medio_pago]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[venta]') AND type in (N'U'))
DROP TABLE [SQLITO].[venta]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[anuncio]') AND type in (N'U'))
DROP TABLE [SQLITO].[anuncio]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[agente_inmobiliario]') AND type in (N'U'))
DROP TABLE [SQLITO].[agente_inmobiliario]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[agencia]') AND type in (N'U'))
DROP TABLE [SQLITO].[agencia]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[moneda]') AND type in (N'U'))
DROP TABLE [SQLITO].[moneda]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_operacion]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_operacion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_periodo]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_periodo]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[estado_anuncio]') AND type in (N'U'))
DROP TABLE [SQLITO].[estado_anuncio]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[propietario_X_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[propietario_X_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[propietario]') AND type in (N'U'))
DROP TABLE [SQLITO].[propietario]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[caracteristica_X_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[caracteristica_X_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[caracteristica]') AND type in (N'U'))
DROP TABLE [SQLITO].[caracteristica]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[direccion]') AND type in (N'U'))
DROP TABLE [SQLITO].[direccion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[barrio]') AND type in (N'U'))
DROP TABLE [SQLITO].[barrio]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[localidad]') AND type in (N'U'))
DROP TABLE [SQLITO].[localidad]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[provincia]') AND type in (N'U'))
DROP TABLE [SQLITO].[provincia]
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[estado_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[estado_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[orientacion]') AND type in (N'U'))
DROP TABLE [SQLITO].[orientacion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[disposicion]') AND type in (N'U'))
DROP TABLE [SQLITO].[disposicion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_ambiente]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_ambiente]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND object_id = OBJECT_ID(N'[SQLITO].[MIGRACION]'))
DROP PROCEDURE [SQLITO].[MIGRACION]
GO

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'SQLITO')
DROP SCHEMA [SQLITO]
GO

/**************************************************CREACION DE TABLAS***************************************************************************/


CREATE SCHEMA SQLITO
GO

-- CREACION DE TABLAS INMUEBLE

CREATE TABLE [SQLITO].[tipo_inmueble](
	[tipo_inmueble_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[tipo_ambiente](
	[tipo_ambiente_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[disposicion](
	[disposicion_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[orientacion](
	[orientacion_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[estado_inmueble](
	[estado_inmueble_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[provincia](
	[provincia_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[localidad](
	[localidad_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[provincia] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[provincia] ([provincia_id]) ,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[barrio](
	[barrio_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[localidad] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[localidad] ([localidad_id]) ,
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[direccion](
	[direccion_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[barrio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[barrio] ([barrio_id]) ,
	[descripcion] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[caracteristica](
	[caracteristica_id] NUMERIC(18,0) IDENTITY NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[inmueble] (
	[codigo_inmueble] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[tipo_inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_inmueble] ([tipo_inmueble_id]) ,
	[descripcion] VARCHAR(100),
	[direccion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[direccion] ([direccion_id]) ,
	[tipo_ambiente] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_ambiente] ([tipo_ambiente_id]) ,
	[supericie_total] NUMERIC(18,2),
	[disposicion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[disposicion] ([disposicion_id]) ,
	[orientacion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[orientacion] ([orientacion_id]) ,
	[estado_inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_inmueble] ([estado_inmueble_id]) ,
	[antiguedad] NUMERIC(18,0),
	[expensas] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[caracteristica_X_inmueble](
	[caracteristica] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[caracteristica] ([caracteristica_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]) ,
)

CREATE TABLE [SQLITO].[propietario](
	[propietario_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[telefono] NUMERIC(18,0),
	[mail] VARCHAR(100),
	[fecha_nacimiento] DATETIME
)

CREATE TABLE [SQLITO].[propietario_X_inmueble](
	[propietario] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[propietario] ([propietario_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]) ,
)

-- CREACION TABLAS ANUNCIO

CREATE TABLE [SQLITO].[estado_anuncio](
	[estado_anuncio_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100)
)

CREATE TABLE [SQLITO].[tipo_periodo](
	[tipo_periodo_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100)
)
CREATE TABLE [SQLITO].[tipo_operacion](
	[tipo_operacion_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100)
)
CREATE TABLE [SQLITO].[moneda](
	[moneda_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[tipo_moneda] VARCHAR(100)
)

CREATE TABLE [SQLITO].[agencia](
	[agencia_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100),
	[direccion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[direccion] ([direccion_id]) 
)

CREATE TABLE [SQLITO].[agente_inmobiliario](
	[agente_inmobiliario_id] NUMERIC(18,0) IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[agencia] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[agencia] ([agencia_id]) ,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[fecha_nacimiento] DATETIME,
	[mail] VARCHAR(100),
	[telefono] NUMERIC(18,0)
)

CREATE TABLE [SQLITO].[anuncio](
	[codigo_anuncio] NUMERIC(19,0) NOT NULL PRIMARY KEY,
	[estado] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_anuncio] ([estado_anuncio_id]) ,
	[agente] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[agente_inmobiliario] ([agente_inmobiliario_id]) ,
	[moneda] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[moneda] ([moneda_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]),
	[tipo_periodo] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_periodo] ([tipo_periodo_id]) ,
	[tipo_operacion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_operacion] ([tipo_operacion_id]) ,
	[precio_publicado_inmueble] NUMERIC(18,2),
	[fecha_publicacion] DATETIME,
	[fecha_finalizacion] DATETIME,
	[costo_anuncio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[venta](
	[codigo_venta] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[anuncio] NUMERIC(19,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([codigo_anuncio]) ,
	[fecha_venta] DATETIME,
	[precio_venta] NUMERIC(18,0),
	[comision_inmobiliaria] NUMERIC(18,0)
)

CREATE TABLE [SQLITO].[medio_pago](
	[medio_pago_id]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100)
)

CREATE TABLE [SQLITO].[pago_compra_inmueble](
	[pago_compra_inmueble]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[moneda] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[moneda] ([moneda_id]) ,
	[medio_pago]  NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[medio_pago] ([medio_pago_id]) ,
	[venta]  NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[venta] ([codigo_venta]) ,
	[cotizacion] NUMERIC(18,2)
)

-- CREACION TABLAS ALQUILER

CREATE TABLE [SQLITO].[inquilino](
	[inquilino_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[telefono] NUMERIC(18,0),
	[mail] VARCHAR(100),
	[fecha_nacimiento] DATETIME
)

CREATE TABLE [SQLITO].[estado_alquiler](
	[estado_alquiler_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] NVARCHAR(100)
)

CREATE TABLE [SQLITO].[alquiler](
	[codigo_alquiler]  NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[anuncio] NUMERIC(19,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([codigo_anuncio]) ,
	[inquilino] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inquilino] ([inquilino_id]) ,
	[estado_alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_alquiler] ([estado_alquiler_id]) ,
	[fecha_inicio] DATETIME,
	[fecha_fin] DATETIME,
	[deposito]  NUMERIC(18,2),
	[comision] NUMERIC(18,2),
	[gastos_de_averiguacion] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[detalle_importe_alquiler](
	[detalle_importe_alquiler_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[alquiler] ([codigo_alquiler]) ,
	[numero_periodo_inicio] NUMERIC(18,0),
	[numero_periodo_fin] NUMERIC(18,0),
	[precio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[pago_alquiler](
	[codigo_pago]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[alquiler] ([codigo_alquiler]) ,
	[medio_pago] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[medio_pago] ([medio_pago_id]) ,
	[fecha_pago] DATETIME,
	[numero_periodo] NUMERIC(18,0),
	[descripcion_periodo] VARCHAR(100),
	[fecha_inicio_periodo] DATETIME,
	[fecha_fin_periodo] DATETIME,
	[importe] NUMERIC(18,2)
)

GO

/***********************************************MIGRACION DE TABLAS******************************************************************************/

CREATE PROCEDURE [SQLITO].[MIGRACION] AS
BEGIN

INSERT INTO [SQLITO].[propietario](apellido, dni, fecha_nacimiento, fecha_registro, mail, nombre, telefono)
SELECT DISTINCT
	PROPIETARIO_APELLIDO,
	PROPIETARIO_DNI,
	PROPIETARIO_FECHA_NAC,
	PROPIETARIO_FECHA_REGISTRO,
	PROPIETARIO_MAIL,
	PROPIETARIO_NOMBRE, 
	PROPIETARIO_TELEFONO
FROM gd_esquema.Maestra

INSERT INTO [SQLITO].[tipo_inmueble](nombre)
SELECT DISTINCT
	INMUEBLE_TIPO_INMUEBLE
FROM gd_esquema.Maestra
WHERE
    INMUEBLE_TIPO_INMUEBLE IS NOT NULL

INSERT INTO [SQLITO].[disposicion](nombre)
SELECT DISTINCT
	INMUEBLE_DISPOSICION
FROM gd_esquema.Maestra
WHERE
    INMUEBLE_DISPOSICION IS NOT NULL

INSERT INTO [SQLITO].[moneda](tipo_moneda)
SELECT DISTINCT
PAGO_VENTA_MONEDA
FROM gd_esquema.Maestra
WHERE
    PAGO_VENTA_MONEDA IS NOT NULL

INSERT INTO [SQLITO].[medio_pago](nombre)
SELECT DISTINCT
PAGO_VENTA_MEDIO_PAGO
FROM gd_esquema.Maestra
WHERE
    PAGO_VENTA_MEDIO_PAGO IS NOT NULL

INSERT INTO [SQLITO].[orientacion](nombre)
SELECT DISTINCT
INMUEBLE_ORIENTACION
FROM gd_esquema.Maestra
WHERE
    INMUEBLE_ORIENTACION IS NOT NULL

INSERT INTO [SQLITO].[tipo_operacion](nombre)
SELECT DISTINCT
ANUNCIO_TIPO_OPERACION
FROM gd_esquema.Maestra
WHERE
    ANUNCIO_TIPO_OPERACION IS NOT NULL

INSERT INTO [SQLITO].[tipo_periodo](nombre)
SELECT DISTINCT
ANUNCIO_TIPO_PERIODO
FROM gd_esquema.Maestra
WHERE
    ANUNCIO_TIPO_PERIODO IS NOT NULL


INSERT INTO [SQLITO].[tipo_ambiente](nombre)
SELECT DISTINCT
INMUEBLE_CANT_AMBIENTES
FROM gd_esquema.Maestra
WHERE
    INMUEBLE_CANT_AMBIENTES IS NOT NULL

INSERT INTO [SQLITO].[provincia](nombre)
SELECT DISTINCT INMUEBLE_PROVINCIA
FROM gd_esquema.Maestra

UNION

SELECT DISTINCT SUCURSAL_PROVINCIA
FROM gd_esquema.Maestra

select * from [SQLITO].provincia
select * from [SQLITO].localidad


INSERT INTO [SQLITO].[localidad](nombre, provincia)
SELECT DISTINCT
    INMUEBLE_LOCALIDAD,
    P.provincia_id
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].[provincia] AS P ON M.INMUEBLE_PROVINCIA = P.nombre
UNION
SELECT DISTINCT
    SUCURSAL_LOCALIDAD,
    P.provincia_id
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].[provincia] AS P ON M.SUCURSAL_PROVINCIA = P.nombre

INSERT INTO [SQLITO].[barrio](nombre, localidad)
	SELECT DISTINCT
	INMUEBLE_BARRIO,
	L.localidad_id
	from gd_esquema.Maestra M
	INNER JOIN localidad AS L ON M.INMUEBLE_LOCALIDAD = L.nombre

INSERT INTO [SQLITO].direccion(barrio, descripcion)
SELECT DISTINCT 
    B.barrio_id,
    INMUEBLE_DIRECCION
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].barrio AS B ON M.INMUEBLE_BARRIO = B.nombre
UNION
SELECT DISTINCT 
    B.barrio_id,
    SUCURSAL_DIRECCION
FROM gd_esquema.Maestra M
INNER JOIN barrio AS B ON M.INMUEBLE_BARRIO = B.nombre

INSERT INTO [SQLITO].[agencia](nombre, direccion)
	SELECT DISTINCT 
	SUCURSAL_NOMBRE,
	D.direccion_id
	from gd_esquema.Maestra M
	INNER JOIN direccion AS D ON M.SUCURSAL_DIRECCION = D.descripcion

INSERT INTO [SQLITO].[agente_inmobiliario](nombre,apellido,dni,fecha_registro,telefono,mail,fecha_nacimiento,agencia)
	SELECT DISTINCT 
	AGENTE_NOMBRE,
	AGENTE_APELLIDO,
	AGENTE_DNI,
	AGENTE_FECHA_REGISTRO,
	AGENTE_TELEFONO,AGENTE_MAIL,
	AGENTE_FECHA_NAC,
	S.agencia_id
	from gd_esquema.Maestra M
	join agencia S on (M.SUCURSAL_NOMBRE = S.nombre);

INSERT INTO [SQLITO].[estado_alquiler](nombre)
	SELECT DISTINCT
	ALQUILER_ESTADO
	from gd_esquema.Maestra 
	WHERE
    ALQUILER_ESTADO IS NOT NULL

INSERT INTO [SQLITO].[estado_anuncio](nombre)
	SELECT DISTINCT
	ANUNCIO_ESTADO
	from gd_esquema.Maestra 
	WHERE
    ANUNCIO_ESTADO IS NOT NULL

INSERT INTO [SQLITO].[estado_inmueble](nombre)
	SELECT DISTINCT
	INMUEBLE_ESTADO
	from gd_esquema.Maestra 
	WHERE
    INMUEBLE_ESTADO IS NOT NULL

INSERT INTO [SQLITO].[inquilino](nombre, apellido, dni, fecha_nacimiento, fecha_registro, mail, telefono)
	SELECT DISTINCT 
	INQUILINO_NOMBRE,
	INQUILINO_APELLIDO,
	INQUILINO_DNI,
	INQUILINO_FECHA_NAC,
	INQUILINO_FECHA_REGISTRO,
	INQUILINO_MAIL,
	INQUILINO_TELEFONO
	from gd_esquema.Maestra
	WHERE
    INQUILINO_NOMBRE IS NOT NULL AND
    INQUILINO_APELLIDO IS NOT NULL AND
    INQUILINO_DNI IS NOT NULL AND
    INQUILINO_FECHA_NAC IS NOT NULL AND
    INQUILINO_FECHA_REGISTRO IS NOT NULL AND
    INQUILINO_MAIL IS NOT NULL AND
    INQUILINO_TELEFONO IS NOT NULL

--select * FROM gd_esquema.Maestra
--WHERE INMUEBLE_CODIGO != '0'

INSERT INTO [SQLITO].[inmueble](descripcion, codigo_inmueble, antiguedad, direccion, disposicion, estado_inmueble, orientacion, supericie_total, expensas, tipo_inmueble, tipo_ambiente)
	SELECT DISTINCT
	INMUEBLE_DESCRIPCION,
	INMUEBLE_CODIGO,
	INMUEBLE_ANTIGUEDAD,
	D.direccion_id,
	INMUEBLE_DISPOSICION,
	E.estado_inmueble_id,
	INMUEBLE_ORIENTACION,
	INMUEBLE_SUPERFICIETOTAL,
	INMUEBLE_EXPESAS,
	T.tipo_inmueble_id,
	A.tipo_ambiente_id
	from gd_esquema.Maestra M
	join direccion AS D ON (M.INMUEBLE_DIRECCION = D.descripcion)
	join estado_inmueble AS E ON (M.INMUEBLE_ESTADO = E.nombre)
	join tipo_inmueble AS T ON (M.INMUEBLE_TIPO_INMUEBLE = T.nombre)
	join tipo_ambiente AS A ON (M.INMUEBLE_CANT_AMBIENTES = A.nombre)
	WHERE
    INMUEBLE_DESCRIPCION IS NOT NULL AND
    INMUEBLE_CODIGO IS NOT NULL AND
    INMUEBLE_ANTIGUEDAD IS NOT NULL AND
    INMUEBLE_DISPOSICION IS NOT NULL AND
    INMUEBLE_ORIENTACION IS NOT NULL AND
    INMUEBLE_SUPERFICIETOTAL IS NOT NULL AND
    INMUEBLE_EXPESAS IS NOT NULL

	--select * from [SQLITO].anuncio

	--select * from [SQLITO].alquiler

	--select * from gd_esquema.Maestra

	--select * from [SQLITO].inmueble


INSERT INTO [SQLITO].[anuncio](codigo_anuncio, estado, moneda, fecha_finalizacion, agente, fecha_publicacion, inmueble, costo_anuncio,precio_publicado_inmueble, tipo_operacion, tipo_periodo)
	SELECT DISTINCT 
	ANUNCIO_CODIGO,
	E.estado_anuncio_id,
	MO.moneda_id,
	ANUNCIO_FECHA_FINALIZACION,
	A.agente_inmobiliario_id,
	ANUNCIO_FECHA_PUBLICACION,
	I.codigo_inmueble,
	ANUNCIO_COSTO_ANUNCIO,
	ANUNCIO_PRECIO_PUBLICADO,
	O.tipo_operacion_id,
	P.tipo_periodo_id
	from gd_esquema.Maestra M
	join estado_anuncio AS E on (M.ANUNCIO_ESTADO = E.nombre)
	join moneda AS MO on (M.PAGO_VENTA_MONEDA = MO.tipo_moneda)
	join agente_inmobiliario AS A on (M.AGENTE_NOMBRE = A.nombre)
	join inmueble AS I on (M.INMUEBLE_DESCRIPCION = I.descripcion)
	join tipo_operacion AS O on (M.ANUNCIO_TIPO_OPERACION = O.nombre)
	join tipo_periodo AS P on (M.ANUNCIO_TIPO_PERIODO = O.nombre)
	WHERE
    ANUNCIO_CODIGO IS NOT NULL AND
    ANUNCIO_ESTADO IS NOT NULL AND
    ANUNCIO_FECHA_FINALIZACION IS NOT NULL AND
    ANUNCIO_FECHA_PUBLICACION IS NOT NULL AND
    ANUNCIO_COSTO_ANUNCIO IS NOT NULL AND
    ANUNCIO_PRECIO_PUBLICADO IS NOT NULL 


INSERT INTO [SQLITO].[alquiler](anuncio,comision,fecha_fin,fecha_inicio,codigo_alquiler,gastos_de_averiguacion, deposito, estado_alquiler, inquilino)
	SELECT DISTINCT 
	A.codigo_anuncio,
	ALQUILER_COMISION,
	ALQUILER_FECHA_FIN,
	ALQUILER_FECHA_INICIO,
	ALQUILER_CODIGO,
	ALQUILER_GASTOS_AVERIGUA,
	ALQUILER_DEPOSITO,
	E.estado_alquiler_id,
	I.inquilino_id
	from gd_esquema.Maestra M
	INNER JOIN anuncio AS A ON M.ANUNCIO_CODIGO = A.codigo_anuncio
	INNER JOIN estado_alquiler AS E ON M.ALQUILER_ESTADO = E.nombre
	INNER JOIN inquilino AS I ON M.INQUILINO_NOMBRE = I.nombre 
								AND  M.INQUILINO_APELLIDO = I.apellido
	WHERE
    ALQUILER_COMISION IS NOT NULL AND
    ALQUILER_FECHA_FIN IS NOT NULL AND
    ALQUILER_FECHA_INICIO IS NOT NULL AND
    ALQUILER_CODIGO IS NOT NULL AND
    ALQUILER_GASTOS_AVERIGUA IS NOT NULL AND
    ALQUILER_DEPOSITO IS NOT NULL 

/*
INSERT INTO [SQLITO].[pago_alquiler]
INSERT INTO [SQLITO].[caracteristica]
INSERT INTO [SQLITO].[caracteristica_X_inmueble]
INSERT INTO [SQLITO].[pago_compra_inmueble]
INSERT INTO [SQLITO].[propietario_X_inmueble]
*/
END
GO

EXEC SQLITO.MIGRACION;
GO

    
