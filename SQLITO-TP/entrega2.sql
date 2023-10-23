CREATE SCHEMA SQLITO
GO
-- DROP DE TABLAS
-- Eliminar tablas en orden inverso a su creaci�n

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[pago_alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[pago_alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[alquiler]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[detalle_importe_alquiler]') AND type in (N'U'))
DROP TABLE [SQLITO].[detalle_importe_alquiler]
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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[departamento]') AND type in (N'U'))
DROP TABLE [SQLITO].[departamento]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[localidad]') AND type in (N'U'))
DROP TABLE [SQLITO].[localidad]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[provincia]') AND type in (N'U'))
DROP TABLE [SQLITO].[provincia]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_inmueble]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[tipo_ambiente]') AND type in (N'U'))
DROP TABLE [SQLITO].[tipo_ambiente]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[disposicion]') AND type in (N'U'))
DROP TABLE [SQLITO].[disposicion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[orientacion]') AND type in (N'U'))
DROP TABLE [SQLITO].[orientacion]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQLITO].[estado_inmueble]') AND type in (N'U'))
DROP TABLE [SQLITO].[estado_inmueble]
GO

-- CREACION DE TABLAS INMUEBLE

CREATE TABLE [SQLITO].[tipo_inmueble](
	[tipo_inmueble_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[tipo_ambiente](
	[tipo_ambiente_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[disposicion](
	[disposicion_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[orientacion](
	[orientacion_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[estado_inmueble](
	[estado_inmueble_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100) 
)

CREATE TABLE [SQLITO].[provincia](
	[provincia_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[localidad](
	[localidad_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[provincia] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[provincia] ([provincia_id]),
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[barrio](
	[barrio_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[localidad] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[localidad] ([localidad_id]),
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[direccion](
	[direccion_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[barrio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[barrio] ([barrio_id]),
	[descripcion] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[caracteristica](
	[caracteristica_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100) 
)

CREATE TABLE [SQLITO].[inmueble] (
	[codigo_inmueble] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[tipo_inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_inmueble] ([tipo_inmueble_id]),
	[descripcion] VARCHAR(100),
	[direccion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[direccion] ([direccion_id]),
	[tipo_ambiente] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_ambiente] ([tipo_ambiente_id]),
	[supericie_total] NUMERIC(18,2),
	[disposicion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[disposicion] ([disposicion_id]),
	[orientacion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[orientacion] ([orientacion_id]),
	[estado_inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_inmueble] ([estado_inmueble_id]),
	[antiguedad] NUMERIC(18,0),
	[expensas] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[caracteristica_X_inmueble](
	[caracteristica] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[caracteristica] ([caracteristica_id]),
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]),
)

CREATE TABLE [SQLITO].[propietario](
	[propietario_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[telefono] NUMERIC(18,0),
	[mail] VARCHAR(100),
	[fecha_nacimiento] DATETIME
)

CREATE TABLE [SQLITO].[propietario_X_inmueble](
	[propietario] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[propietario] ([propietario_id]),
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]),
)

-- CREACION TABLAS ANUNCIO

CREATE TABLE [SQLITO].[estado_anuncio](
	[estado_anuncio_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100)
)

CREATE TABLE [SQLITO].[tipo_periodo](
	[tipo_periodo_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100)
)
CREATE TABLE [SQLITO].[tipo_operacion](
	[tipo_operacion_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100)
)
CREATE TABLE [SQLITO].[moneda](
	[moneda_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[tipo_moneda] VARCHAR(100)
)

CREATE TABLE [SQLITO].[agencia](
	[agencia_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100),
	[direccion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[direccion] ([direccion_id])
)

CREATE TABLE [SQLITO].[agente_inmobiliario](
	[agente_inmobiliario_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[agencia] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[agencia] ([agencia_id]),
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[fecha_nacimiento] DATETIME,
	[mail] VARCHAR(100),
	[telefono] NUMERIC(18,0)

)

CREATE TABLE [SQLITO].[anuncio](
	[codigo_anuncio] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[estado] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_anuncio] ([estado_anuncio_id]),
	[agente] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[agente_inmobiliario] ([agente_inmobiliario_id]),
	[moneda] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[moneda] ([moneda_id]),
	[inmueble] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inmueble] ([codigo_inmueble]),
	[tipo_periodo] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_periodo] ([tipo_periodo_id]),
	[tipo_operacion] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[tipo_operacion] ([tipo_operacion_id]),
	[precio_publicado_inmueble] NUMERIC(18,2),
	[fecha_publicacion] DATETIME,
	[fecha_finalizacion] DATETIME,
	[costo_anuncio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[venta](
	[codigo_venta] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[anuncio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([codigo_anuncio]),
	[fecha_venta] DATETIME,
	[precio_venta] NUMERIC(18,0),
	[comision_inmobiliaria] NUMERIC(18,0)
)

CREATE TABLE [SQLITO].[medio_pago](
	[medio_pago_id]  NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100)
)

CREATE TABLE [SQLITO].[pago_compra_inmueble](
	[pago_compra_inmueble]  NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[moneda] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[moneda] ([moneda_id]),
	[medio_pago]  NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[medio_pago] ([medio_pago_id]),
	[venta]  NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[venta] ([codigo_venta]),
	[cotizacion] NUMERIC(18,2)
)

-- CREACION TABLAS ALQUILER

CREATE TABLE [SQLITO].[inquilino](
	[inquilino_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(100),
	[apellido] VARCHAR(100),
	[dni] VARCHAR(100),
	[fecha_registro] DATETIME,
	[telefono] NUMERIC(18,0),
	[mail] VARCHAR(100),
	[fecha_nacimiento] DATETIME
)

CREATE TABLE [SQLITO].[estado_alquiler](
	[estado_alquiler_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[nombre] NVARCHAR(100)
)

CREATE TABLE [SQLITO].[detalle_importe_alquiler](
	[detalle_importe_alquiler_id] NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[numero_periodo_inicio] NUMERIC(18,0),
	[numero_periodo_fin] NUMERIC(18,0),
	[precio] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[alquiler](
	[codigo_alquiler]  NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[anuncio] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[anuncio] ([codigo_anuncio]),
	[inquilino] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[inquilino] ([inquilino_id]),
	[estado_alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[estado_alquiler] ([estado_alquiler_id]),
	[fecha_inicio] DATETIME,
	[fecha_fin] DATETIME,
	[detalle_importe_alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[detalle_importe_alquiler] ([detalle_importe_alquiler_id]),
	[deposito]  NUMERIC(18,2),
	[comision] NUMERIC(18,2),
	[gastos_de_averiguacion] NUMERIC(18,2)
)

CREATE TABLE [SQLITO].[pago_alquiler](
	[codigo_pago]  NUMERIC(18,0) NOT NULL PRIMARY KEY,
	[alquiler] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[alquiler] ([codigo_alquiler]),
	[medio_pago] NUMERIC(18,0) NOT NULL FOREIGN KEY REFERENCES [SQLITO].[medio_pago] ([medio_pago_id]),
	[fecha_pago] DATETIME,
	[numero_periodo] NUMERIC(18,0),
	[descripcion_periodo] VARCHAR(100),
	[fecha_inicio_periodo] DATETIME,
	[fecha_fin_periodo] DATETIME,
	[importe] NUMERIC(18,2)
)

GO