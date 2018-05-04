CREATE DATABASE ArriendoVehiculos
GO

USE ArriendoVehiculos
GO

CREATE TABLE dbo.Roles
(
	--Si deseamos que comience desde 100 (100,1)
	IdRol INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NombreRol VARCHAR(20) NOT NULL UNIQUE,
	EstadoRol BIT NOT NULL
);

select * from dbo.Roles

INSERT INTO dbo.ROLES (NombreRol,EstadoRol) VALUES ('Admin',1),('Supervisor',1),('Ejecutivo',1);

CREATE TABLE dbo.Usuarios
(
	CodigoUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Rut VARCHAR(12) NOT NULL UNIQUE,
	NombreUsuario VARCHAR(80) NOT NULL,
	ApellidoUsuario VARCHAR(80) NOT NULL,
	SexoUsuario BIT NOT NULL,
	Estado BIT NOT NULL,
	PassUsuario VARCHAR(20) NOT NULL
);

INSERT INTO dbo.Usuarios (Rut,NombreUsuario,ApellidoUsuario,SexoUsuario,Estado,PassUsuario) VALUES ('16932052-7','Luis','Zuniga',1,1,'abc123');
INSERT INTO dbo.Usuarios (Rut,NombreUsuario,ApellidoUsuario,SexoUsuario,Estado,PassUsuario) VALUES ('17418770-k','Francisca','Gonzalez',0,1,'123123');
INSERT INTO dbo.Usuarios (Rut,NombreUsuario,ApellidoUsuario,SexoUsuario,Estado,PassUsuario) VALUES ('918556-k','Felipe','Sepulveda',1,1,'abc123');


CREATE TABLE dbo.RolesUsuarios
(

	idRol INT NOT NULL,
	CodigoUsuario INT NOT NULL,
);

INSERT INTO dbo.RolesUsuarios (idRol,CodigoUsuario) VALUES (1,1),(2,2),(3,3);

CREATE TABLE dbo.Clientes
(
	CodigoCliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	RutCliente VARCHAR(12) UNIQUE NOT NULL ,
	NombreCliente VARCHAR(80) NOT NULL,
	ApellidoCliente VARCHAR(80) NOT NULL,
	TelefonoCliente VARCHAR(80) NULL,
	CorreoCliente VARCHAR(80) NULL	
);

INSERT INTO dbo.Clientes(RutCliente,NombreCliente,ApellidoCliente,TelefonoCliente,CorreoCliente) 
	   VALUES ('19448770-7','Alfonso','Suarez','988367190','alfonzo.suarez@gmail.com');


CREATE TABLE dbo.TipoVehiculo
(
	CodigoTipo INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NombreTipo VARCHAR(80) NOT NULL UNIQUE
);


INSERT INTO dbo.TipoVehiculo (NombreTipo) VALUES ('Auto'),('Camioneta'),('Motocicleta');


CREATE TABLE dbo.EstadoVehiculo
(
	CodEstadoVehiculo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NombreEstado VARCHAR(80) NOT NULL UNIQUE
);

INSERT INTO dbo.EstadoVehiculo (NombreEstado) VALUES ('Optimo'),('Regular'),('Mantencion');

CREATE TABLE dbo.Vehiculos
(
	CodigoVehiculo INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CodigoTipo INT NOT NULL,
	CodEstadoVehiculo INT NOT NULL,
	MarcaVehiculo VARCHAR(80) NOT NULL,
	ModeloVehiculo VARCHAR(80) NOT NULL,
	AnoVehiculo INT NOT NULL,
	ColorVehiculo VARCHAR(80) NULL,
	PatenteVehiculo VARCHAR(80) NOT NULL UNIQUE,
	CostoVehiculo INT NOT NULL,
);


INSERT INTO dbo.Vehiculos (CodigoTipo,CodEstadoVehiculo,MarcaVehiculo,ModeloVehiculo,AnoVehiculo,ColorVehiculo,PatenteVehiculo,CostoVehiculo) 
	   VALUES(1,1,'Seat','Ibiza',2010,'Gris','DZ-GF-96',10000),
			 (2,1,'Toyota','Hilux',2014,'Roja','TR-FD-67',18000),
			 (3,1,'Yamaha','R15',2017,'Azul','YY-PO-88',1500);
	   
CREATE TABLE dbo.EstadoAlquiler
(
	CodigoEstadoAlquiler INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NombreEstado VARCHAR(80) NOT NULL UNIQUE
);

INSERT INTO dbo.EstadoAlquiler (NombreEstado) VALUES('Alquilado'),('Disponible');

CREATE TABLE dbo.AlquilerVehiculo
(
	CodigoAlquiler INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CodigoVehiculo INT NOT NULL,
	CodigoEstadoAlquiler INT NOT NULL,
	CodigoUsuario INT NOT NULL,
	CodigoCliente INT NOT NULL,
	FechaDesde DATETIME NULL,
	FechaHasta DATETIME NULL,
	MontoAlquiler INT NOT NULL,
	TotalDias AS DATEDIFF(day,FechaDesde,FechaHasta)	
);

INSERT INTO dbo.AlquilerVehiculo (CodigoVehiculo,CodigoEstadoAlquiler,CodigoUsuario,CodigoCliente,FechaDesde,FechaHasta,MontoAlquiler) 
	   VALUES (1,2,2,1,'29-04-2018','04-05-2018',1000);
	 
