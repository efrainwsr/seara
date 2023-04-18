create database damarisfp;
  use damarisfp;

create table usuarios (
  id_usuario INT AUTO_INCREMENT,
  nombre VARCHAR(45),
  apellido VARCHAR(45),
  email VARCHAR(45),
  password TEXT(50),
  fechaCaptura DATE,
  tipo VARCHAR (20), 
  ver INT DEFAULT 1,
  PRIMARY KEY (id_usuario) 
  );


create table carta (
  id_item INT AUTO_INCREMENT,
  nombre VARCHAR(45),
  precio FLOAT,
  categoria VARCHAR(10), 
  descripcion VARCHAR(45),
  variante VARCHAR(20),
  status VARCHAR(15),
  PRIMARY KEY (id_item)
  );

  
create table orden (
  id_orden INT,
  id_item INT,
  id_mesa INT,
  id_usuario INT,
  cantidad INT,
  nota varchar(45),
  precio FLOAT,
  variante varchar(15),
  fecha DATE,
  hora TIME,
  total FLOAT,
  status VARCHAR(45),
  id_cocinero VARCHAR(5)
  );

INSERT INTO `orden` (`id_orden`, `id_item`, `id_mesa`, `id_usuario`, `cantidad`, `nota`, `precio`, `variante`, `fecha`, `hora`, `total`, `status`) VALUES
(1, 0, 0, 0, 0, ' ', NULL, NULL, '0000-00-00', '00:00:00', NULL, 'NULL');


create table mesas (
  id_mesa INT NOT NULL,
  total_ordenes INT,
  total_ventas FLOAT,
  status INT DEFAULT 1,
  PRIMARY KEY (id_mesa)
  );



create table empleados (
  id_empleado INT,
  nombre VARCHAR(45),
  telefono VARCHAR(45),
  observaciones TEXT(200),
  fecha DATE,
  sueldo FLOAT,
  ver INT DEFAULT 1,
  PRIMARY KEY (id_empleado) 
  );


create table cliente (
  id_cliente INT,
  id_usuario INT NOT NULL,
  nombre VARCHAR(45),
  telefono VARCHAR(15),
  ver INT DEFAULT 1,
  PRIMARY KEY (id_cliente)
  );

create table residencia (
  id_residencia INT AUTO_INCREMENT,
  id_cliente INT,
  nombre VARCHAR(45),
  direccion VARCHAR(200),
  gmap VARCHAR(200),
  casas INT,
  kgbasura FLOAT,
  pago FLOAT,
  lat decimal(8,7),
  lng decimal(9,7),
  ver INT DEFAULT 1,
  PRIMARY KEY (id_residencia),
  INDEX (id_cliente),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
  ON UPDATE CASCADE ON DELETE RESTRICT
  );


create table pagos(
	id_pago INT AUTO_INCREMENT,
	id_residencia INT,
  id_cliente INT,
	tasa FLOAT,
	fecha date,
	referencia varchar(25),
	dolares FLOAT,
	bs FLOAT,
  emisor varchar(45),
  receptor varchar(45),
	PRIMARY KEY(id_pago),
	FOREIGN KEY(id_residencia) REFERENCES residencia(id_residencia)
);


create table rutas(
  id_ruta int NOT NULL,
  id_cliente int,
  id_residencia INT,
  id_usuario INT,
  fecha DATE,
  casas INT,
  dia VARCHAR(45),
  kgbasura FLOAT,
  ver INT DEFAULT 1,
  nombre_residencia VARCHAR(25),
  nombre_ruta VARCHAR(45)
  );


CREATE  TABLE vehiculo (
  id_vehiculo varchar(10),
  capacidad FLOAT,
  marca VARCHAR(45),
  modelo VARCHAR(45),
  cant_ruedas INT,
  rin INT,
  ver INT DEFAULT 1,
  PRIMARY KEY (id_vehiculo) 
  );

CREATE  TABLE reportes (
  id_reportes INT AUTO_INCREMENT,
  fecha date,  
  id_cliente  INT,
  descripcion text,  
  id_usuario  INT,
  id_vehiculo VARCHAR(10),
  nombre varchar(25),
  vehiculo varchar(25),
  residencia varchar(25),
  ruta varchar(25),
  PRIMARY KEY (id_reportes) 
  );

INSERT INTO cliente (id_cliente, id_usuario, nombre, telefono)
VALUES (0, 0, 'Sin Cliente', 'Sin telefono');
