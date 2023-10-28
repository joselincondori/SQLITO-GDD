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


IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'SQLITO')
BEGIN
    EXEC('CREATE SCHEMA SQLITO')
END
GO

CREATE PROCEDURE [SQLITO].[MIGRACION] AS
BEGIN

BEGIN TRANSACTION

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
	[inmueble_id]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[codigo_inmueble] NUMERIC(18,0),
	[tipo_inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_inmueble] ([tipo_inmueble_id]) ,
	[descripcion] NVARCHAR(100),
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
	[caracteristica_X_inmueble_id]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[caracteristica] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[caracteristica] ([caracteristica_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([inmueble_id]) ,
)

CREATE TABLE [SQLITO].[propietario](
	[propietario_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] NUMERIC(18,0),
	[fecha_registro] DATETIME,
	[telefono] NUMERIC(18,0),
	[mail] VARCHAR(100),
	[fecha_nacimiento] DATETIME
)

CREATE TABLE [SQLITO].[propietario_X_inmueble](
	[propietario] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[propietario] ([propietario_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([inmueble_id]) ,
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
	[agencia] NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[agencia] ([agencia_id]) ,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] NUMERIC(18,0),
	[fecha_registro] DATETIME,
	[fecha_nacimiento] DATETIME,
	[mail] VARCHAR(100),
	[telefono] NUMERIC(18,0)
)

CREATE TABLE [SQLITO].[anuncio](
	[anuncio_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[codigo_anuncio] NUMERIC(19,0),
	[estado] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_anuncio] ([estado_anuncio_id]) ,
	[agente] NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[agente_inmobiliario] ([agente_inmobiliario_id]) ,
	[moneda] NUMERIC(18,0) FOREIGN KEY REFERENCES [SQLITO].[moneda] ([moneda_id]) ,
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([inmueble_id]),
	[tipo_periodo] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_periodo] ([tipo_periodo_id]) ,
	[tipo_operacion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_operacion] ([tipo_operacion_id]) ,
	[precio_publicado_inmueble] NUMERIC(18,2),
	[fecha_publicacion] DATETIME,
	[fecha_finalizacion] DATETIME,
	[costo_anuncio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[venta](
	[venta_id]  NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[codigo_venta] NUMERIC(18,0),
	[anuncio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([anuncio_id]) ,
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
	[venta]  NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[venta] ([venta_id]) ,
	[cotizacion] NUMERIC(18,2)
)

-- CREACION TABLAS ALQUILER

CREATE TABLE [SQLITO].[inquilino](
	[inquilino_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] NUMERIC(18,0),
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
	[alquiler_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[codigo_alquiler]  NUMERIC(18,0),
	[anuncio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([anuncio_id]) ,
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
	[alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[alquiler] ([alquiler_id]) ,
	[numero_periodo_inicio] NUMERIC(18,0),
	[numero_periodo_fin] NUMERIC(18,0),
	[precio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[pago_alquiler](
	[pago_alquiler_id] NUMERIC(18,0) NOT NULL IDENTITY PRIMARY KEY,
	[codigo_pago]  NUMERIC(18,0),
	[alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[alquiler] ([alquiler_id]) ,
	[medio_pago] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[medio_pago] ([medio_pago_id]) ,
	[fecha_pago] DATETIME,
	[numero_periodo] NUMERIC(18,0),
	[descripcion_periodo] VARCHAR(100),
	[fecha_inicio_periodo] DATETIME,
	[fecha_fin_periodo] DATETIME,
	[importe] NUMERIC(18,2)
)
/*************************************************INDICES****************************************************************************/

CREATE NONCLUSTERED INDEX IDX_DIRECCION ON [SQLITO].[direccion] (descripcion);

CREATE NONCLUSTERED INDEX IDX_AGENCIA ON [SQLITO].[agencia] (nombre);

CREATE NONCLUSTERED INDEX IDX_AGENTE ON [SQLITO].[agente_inmobiliario] (nombre);

CREATE NONCLUSTERED INDEX IDX_AGENTE_ID ON [SQLITO].[agente_inmobiliario] (agente_inmobiliario_id);

CREATE NONCLUSTERED INDEX IDX_AGENTE_DNI ON [SQLITO].[agente_inmobiliario] (dni);

CREATE NONCLUSTERED INDEX IDX_AGENTE_MAIL ON [SQLITO].[agente_inmobiliario] (mail);

CREATE NONCLUSTERED INDEX IDX_AGENTE_FECHA_REGISTRO ON [SQLITO].[agente_inmobiliario] (fecha_registro);

CREATE NONCLUSTERED INDEX IDX_AGENTE_TELEFONO ON [SQLITO].[agente_inmobiliario] (telefono);

CREATE NONCLUSTERED INDEX IDX_AGENTE_FECHA_NAC ON [SQLITO].[agente_inmobiliario] (fecha_nacimiento);

CREATE NONCLUSTERED INDEX IDX_INMUEBLE ON [SQLITO].[inmueble] (codigo_inmueble);

CREATE NONCLUSTERED INDEX IDX_PROVINCIA ON [SQLITO].[provincia] (nombre);

CREATE NONCLUSTERED INDEX IDX_LOCALIDAD ON [SQLITO].[localidad] (nombre);

CREATE NONCLUSTERED INDEX IDX_BARRIO ON [SQLITO].[barrio] (nombre);

CREATE NONCLUSTERED INDEX IDX_ALQUILER ON [SQLITO].[alquiler] (codigo_alquiler);

CREATE NONCLUSTERED INDEX IDX_ANUNCIO ON [SQLITO].[anuncio] (codigo_anuncio);

CREATE NONCLUSTERED INDEX idx_propietario_dni ON [SQLITO].[propietario](dni);

CREATE NONCLUSTERED INDEX idx_disposicion_nombre ON [SQLITO].[disposicion](nombre);
	
CREATE NONCLUSTERED INDEX idx_estado_inmueble_nombre ON [SQLITO].[estado_inmueble](nombre);

CREATE NONCLUSTERED INDEX idx_orientacion_nombre ON [SQLITO].[orientacion](nombre);

CREATE NONCLUSTERED INDEX idx_tipo_inmueble_nombre ON [SQLITO].[tipo_inmueble](nombre);
	
CREATE NONCLUSTERED INDEX idx_tipo_ambiente_nombre ON [SQLITO].[tipo_ambiente](nombre);

CREATE NONCLUSTERED INDEX idx_estado_anuncio_nombre ON [SQLITO].[estado_anuncio](nombre);

CREATE NONCLUSTERED INDEX idx_moneda_tipo_moneda ON [SQLITO].[moneda](tipo_moneda);
	   
CREATE NONCLUSTERED INDEX idx_tipo_operacion_nombre ON [SQLITO].[tipo_operacion](nombre);
	
CREATE NONCLUSTERED INDEX idx_tipo_periodo_nombre ON [SQLITO].[tipo_periodo](nombre);
	 
CREATE NONCLUSTERED INDEX idx_estado_alquiler_nombre ON [SQLITO].[estado_alquiler](nombre);
	  
CREATE NONCLUSTERED INDEX idx_inquilino_dni ON [SQLITO].[inquilino](dni);
	 
CREATE NONCLUSTERED INDEX idx_inmueble_descripcion ON [SQLITO].[inmueble](descripcion);

CREATE NONCLUSTERED INDEX idx_anuncio_fecha_publicacion ON [SQLITO].[anuncio](fecha_publicacion);


/***********************************************MIGRACION DE TABLAS******************************************************************************/


INSERT INTO [SQLITO].[propietario](apellido, dni, fecha_nacimiento, fecha_registro, mail, nombre, telefono)
SELECT DISTINCT
	PROPIETARIO_APELLIDO,
	PROPIETARIO_DNI,
	PROPIETARIO_FECHA_NAC,
	PROPIETARIO_FECHA_REGISTRO,
	PROPIETARIO_MAIL,
	PROPIETARIO_NOMBRE, 
	PROPIETARIO_TELEFONO
FROM gd_esquema.Maestra -- 8153


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
WHERE
    INMUEBLE_PROVINCIA IS NOT NULL

INSERT INTO [SQLITO].[localidad](nombre, provincia)
SELECT DISTINCT
    M.INMUEBLE_LOCALIDAD,
    P.provincia_id
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].[provincia] AS P ON M.INMUEBLE_PROVINCIA = P.nombre
WHERE M.INMUEBLE_LOCALIDAD IS NOT NULL
UNION
SELECT DISTINCT
    M.SUCURSAL_LOCALIDAD,
    P.provincia_id
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].[provincia] AS P ON M.SUCURSAL_PROVINCIA = P.nombre
WHERE M.SUCURSAL_LOCALIDAD IS NOT NULL


INSERT INTO [SQLITO].[barrio](nombre, localidad)
	SELECT DISTINCT 
	M.INMUEBLE_BARRIO, 
	L.localidad_id
	FROM gd_esquema.Maestra AS M
	INNER JOIN Provincia AS P ON M.INMUEBLE_PROVINCIA = P.nombre   
	INNER JOIN Localidad AS L ON M.INMUEBLE_LOCALIDAD = L.nombre
	WHERE 
	M.INMUEBLE_BARRIO IS NOT NULL 
	AND L.provincia = P.provincia_id;

INSERT INTO [SQLITO].direccion(barrio, descripcion)
SELECT DISTINCT 
    B.barrio_id,
    M.INMUEBLE_DIRECCION
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].barrio AS B ON M.INMUEBLE_BARRIO = B.nombre
INNER JOIN [SQLITO].localidad AS L ON M.INMUEBLE_LOCALIDAD = L.nombre
INNER JOIN [SQLITO].provincia AS P ON M.INMUEBLE_PROVINCIA = P.nombre
WHERE M.INMUEBLE_DIRECCION IS NOT NULL
AND L.provincia = P.provincia_id
AND B.localidad = L.localidad_id
UNION
SELECT DISTINCT 
    B.barrio_id,
    M.SUCURSAL_DIRECCION
FROM gd_esquema.Maestra M
INNER JOIN [SQLITO].barrio AS B ON M.INMUEBLE_BARRIO = B.nombre
INNER JOIN [SQLITO].localidad AS L ON M.INMUEBLE_LOCALIDAD = L.nombre
INNER JOIN [SQLITO].provincia AS P ON M.INMUEBLE_PROVINCIA = P.nombre
WHERE M.SUCURSAL_DIRECCION IS NOT NULL
AND L.provincia = P.provincia_id
AND B.localidad = L.localidad_id

INSERT INTO [SQLITO].[agencia](nombre, direccion)
	SELECT DISTINCT 
	M.SUCURSAL_NOMBRE,
	D.direccion_id
	from gd_esquema.Maestra M
	INNER JOIN direccion AS D ON M.SUCURSAL_DIRECCION = D.descripcion
	WHERE M.SUCURSAL_NOMBRE IS NOT NULL

INSERT INTO [SQLITO].[agente_inmobiliario] (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)--, agencia)
SELECT DISTINCT
    M.AGENTE_NOMBRE,
    M.AGENTE_APELLIDO,
    M.AGENTE_DNI,
    M.AGENTE_FECHA_REGISTRO,
    M.AGENTE_TELEFONO,
    M.AGENTE_MAIL,
    M.AGENTE_FECHA_NAC
    --S.agencia_id
FROM gd_esquema.Maestra M
--JOIN agencia S ON M.SUCURSAL_NOMBRE = S.nombre

-- select count (*) nombre from [SQLITO].agencia 6783
-- select count (*) nombre from [SQLITO].agente_inmobiliario 20349


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
    INQUILINO_TELEFONO IS NOT NULL;


INSERT INTO [SQLITO].[inmueble](descripcion, codigo_inmueble, antiguedad, direccion, disposicion, estado_inmueble, orientacion, supericie_total, expensas, tipo_inmueble, tipo_ambiente)
	SELECT DISTINCT
	M.INMUEBLE_DESCRIPCION,
	M.INMUEBLE_CODIGO,
	M.INMUEBLE_ANTIGUEDAD,
	D.direccion_id,
	S.disposicion_id,
	E.estado_inmueble_id,
	O.orientacion_id,
	M.INMUEBLE_SUPERFICIETOTAL,
	M.INMUEBLE_EXPESAS,
	T.tipo_inmueble_id,
	A.tipo_ambiente_id
	FROM gd_esquema.Maestra M
	JOIN direccion AS D ON (M.INMUEBLE_DIRECCION = D.descripcion)
	JOIN estado_inmueble AS E ON (M.INMUEBLE_ESTADO = E.nombre)
	JOIN disposicion AS S ON (M.INMUEBLE_DISPOSICION = S.nombre)
	JOIN orientacion AS O ON (M.INMUEBLE_ORIENTACION = O.nombre)
	JOIN tipo_inmueble AS T ON (M.INMUEBLE_TIPO_INMUEBLE = T.nombre)
	JOIN tipo_ambiente AS A ON (M.INMUEBLE_CANT_AMBIENTES = A.nombre)
	WHERE
	M.INMUEBLE_DESCRIPCION IS NOT NULL AND
	M.INMUEBLE_CODIGO IS NOT NULL AND
	M.INMUEBLE_ANTIGUEDAD IS NOT NULL AND
	M.INMUEBLE_SUPERFICIETOTAL IS NOT NULL AND
	M.INMUEBLE_EXPESAS IS NOT NULL 

	--select * from [SQLITO].[anuncio]

INSERT INTO [SQLITO].[anuncio](codigo_anuncio, estado,moneda,fecha_finalizacion,agente,fecha_publicacion, inmueble, costo_anuncio, precio_publicado_inmueble, tipo_operacion, tipo_periodo)
	SELECT DISTINCT 
	M.ANUNCIO_CODIGO,
	E.estado_anuncio_id,
	MO.moneda_id,
	M.ANUNCIO_FECHA_FINALIZACION,
	A.agente_inmobiliario_id,
	M.ANUNCIO_FECHA_PUBLICACION,
	I.inmueble_id,
	M.ANUNCIO_COSTO_ANUNCIO,
	M.ANUNCIO_PRECIO_PUBLICADO,
	O.tipo_operacion_id,
	P.tipo_periodo_id
	from gd_esquema.Maestra M
	inner join [SQLITO].estado_anuncio AS E on (M.ANUNCIO_ESTADO = E.nombre)
	inner join [SQLITO].moneda AS MO on (M.ANUNCIO_MONEDA = MO.tipo_moneda)
	inner join [SQLITO].agente_inmobiliario AS A on (M.AGENTE_NOMBRE = A.nombre)
	inner join [SQLITO].inmueble AS I on ( M.INMUEBLE_CODIGO = I.codigo_inmueble)
	inner join [SQLITO].tipo_operacion AS O on (M.ANUNCIO_TIPO_OPERACION = O.nombre)
	inner join [SQLITO].tipo_periodo AS P on (M.ANUNCIO_TIPO_PERIODO = P.nombre)
	WHERE
	M.AGENTE_NOMBRE IS NOT NULL AND
	M.ANUNCIO_MONEDA IS NOT NULL AND
    M.ANUNCIO_CODIGO IS NOT NULL AND
    M.ANUNCIO_ESTADO IS NOT NULL AND
    M.ANUNCIO_FECHA_FINALIZACION IS NOT NULL AND
    M.ANUNCIO_FECHA_PUBLICACION IS NOT NULL AND
    M.ANUNCIO_COSTO_ANUNCIO IS NOT NULL AND
    M.ANUNCIO_PRECIO_PUBLICADO IS NOT NULL 


INSERT INTO [SQLITO].[alquiler](anuncio,comision,fecha_fin,fecha_inicio,codigo_alquiler,gastos_de_averiguacion, deposito, estado_alquiler, inquilino)
	SELECT DISTINCT 
	A.anuncio_id,
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

INSERT INTO [SQLITO].[pago_alquiler](numero_periodo, fecha_inicio_periodo, fecha_fin_periodo, codigo_pago, descripcion_periodo, alquiler, fecha_pago, importe, medio_pago)
	SELECT DISTINCT
	M.PAGO_ALQUILER_NRO_PERIODO,
	M.PAGO_ALQUILER_FEC_INI,
	M.PAGO_ALQUILER_FEC_FIN,
	M.PAGO_ALQUILER_CODIGO,
	M.PAGO_ALQUILER_DESC,
	A.alquiler_id,
	M.PAGO_ALQUILER_FECHA,
	M.PAGO_ALQUILER_IMPORTE,
	MP.medio_pago_id
	from gd_esquema.Maestra M
	join medio_pago AS MP ON M.PAGO_ALQUILER_MEDIO_PAGO = MP.nombre
	join alquiler AS A ON M.ALQUILER_CODIGO = A.codigo_alquiler
	WHERE
    M.PAGO_ALQUILER_NRO_PERIODO IS NOT NULL AND
    M.PAGO_ALQUILER_FEC_INI IS NOT NULL AND
    M.PAGO_ALQUILER_FEC_FIN IS NOT NULL AND
    M.PAGO_ALQUILER_CODIGO IS NOT NULL AND
    M.PAGO_ALQUILER_DESC IS NOT NULL AND
    M.PAGO_ALQUILER_IMPORTE IS NOT NULL AND
    M.PAGO_ALQUILER_FECHA IS NOT NULL 

INSERT INTO [SQLITO].[caracteristica](nombre)
	SELECT DISTINCT
	CASE
	WHEN
	INMUEBLE_CARACTERISTICA_CABLE = 1 THEN 'CABLE' ELSE NULL END
	FROM gd_esquema.Maestra
	WHERE INMUEBLE_CARACTERISTICA_CABLE IS NOT NULL AND INMUEBLE_CARACTERISTICA_CABLE != '0'
	UNION
	SELECT DISTINCT
		CASE
		WHEN
		INMUEBLE_CARACTERISTICA_CALEFACCION = 1 THEN 'CALEFACCION' ELSE NULL END
		FROM gd_esquema.Maestra
		WHERE INMUEBLE_CARACTERISTICA_CALEFACCION IS NOT NULL AND INMUEBLE_CARACTERISTICA_CALEFACCION != '0'
	UNION 
	SELECT DISTINCT
	CASE
	WHEN
	INMUEBLE_CARACTERISTICA_GAS = 1 THEN 'GAS' ELSE NULL END
	FROM gd_esquema.Maestra
	WHERE INMUEBLE_CARACTERISTICA_GAS IS NOT NULL AND INMUEBLE_CARACTERISTICA_GAS != '0'
	UNION 
	SELECT DISTINCT
	CASE
	WHEN
	INMUEBLE_CARACTERISTICA_WIFI = 1 THEN 'WIFI' ELSE NULL END
	FROM gd_esquema.Maestra
	WHERE INMUEBLE_CARACTERISTICA_WIFI IS NOT NULL AND INMUEBLE_CARACTERISTICA_WIFI != '0'


--INSERT INTO [SQLITO].[caracteristica_X_inmueble] (caracteristica, inmueble)
--SELECT 
--    C.caracteristica_id, 
--    I.inmueble_id 
--FROM 
--    gd_esquema.Maestra M
--JOIN [SQLITO].[inmueble] I ON M.INMUEBLE_CODIGO = I.codigo_inmueble
--JOIN [SQLITO].[caracteristica] C ON 
--    C.nombre = 
--        CASE 
--            WHEN M.INMUEBLE_CARACTERISTICA_CABLE IS NOT NULL THEN 'CABLE'
--            WHEN M.INMUEBLE_CARACTERISTICA_CALEFACCION IS NOT NULL THEN 'CALEFACCION'
--            WHEN M.INMUEBLE_CARACTERISTICA_GAS IS NOT NULL THEN 'GAS'
--            WHEN M.INMUEBLE_CARACTERISTICA_WIFI IS NOT NULL THEN 'WIFI'
--            ELSE NULL 
--        END
--	WHERE 
--    NOT EXISTS (
--        SELECT 1 
--        FROM [SQLITO].[caracteristica_X_inmueble] CXI
--        WHERE CXI.caracteristica = C.caracteristica_id AND CXI.inmueble = I.inmueble_id
--    )
/*

INSERT INTO [SQLITO].[caracteristica_X_inmueble]
INSERT INTO [SQLITO].[pago_compra_inmueble]
INSERT INTO [SQLITO].[propietario_X_inmueble]


*/


COMMIT
END
GO
 
EXEC SQLITO.MIGRACION;
GO

    
