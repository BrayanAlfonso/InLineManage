CREATE DATABASE SigDB;

USE SigDB;

CREATE TABLE existencias(
IdExistencias int auto_increment PRIMARY KEY not null,
IdCategoria int,
Observaciones varchar(50),
NumeroSerial int (20),
fechaGarantia date
);

CREATE TABLE usuario (
IdUsuario int auto_increment PRIMARY KEY not null,
Nombre varchar (50),
Correo varchar (100),
Contraseña varbinary (20),
Cargo varchar (50)
);

CREATE TABLE producto (
IdProducto int auto_increment PRIMARY KEY not null,
IdCategoria int,
Nombre varchar (50),
Descripcion varchar (100),
NumeroExistencias varchar (100),
NumeroPedidos varchar (100),
PrecioxUnidad int,
Estado int
);

CREATE TABLE categoria (
IdCategoria int auto_increment PRIMARY KEY not null,
TipoCategoria varchar (50)
);

CREATE TABLE detalleVenta (
IdDeVenta int auto_increment PRIMARY KEY not null,
IdUsuario int,
IdCategoria int,
IdProducto int,
Fecha date,
NombreCliente varchar (50),
Subtotal int,
Total int
);

INSERT INTO categoria values(1,"Cargador"),(2,"Audifonos"),(3,"Cuadernos"),(4,"Lapices");

ALTER TABLE detalleVenta ADD CONSTRAINT FKUsuario FOREIGN KEY (IdUsuario) REFERENCES usuario (IdUsuario);

ALTER TABLE detalleVenta ADD CONSTRAINT FKCategoria FOREIGN KEY (IdCategoria) REFERENCES categoria (IdCategoria);

ALTER TABLE detalleVenta ADD CONSTRAINT FKProducto FOREIGN KEY (IdProducto) REFERENCES producto (IdProducto);

ALTER TABLE existencias ADD CONSTRAINT FKexistCate foreign key (IdCategoria) REFERENCES categoria (IdCategoria);