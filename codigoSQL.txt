CREATE DOMAIN tipo_cita_valores AS character varying(50) 
    CHECK (VALUE IN ('presencial', 'online', 'a_domicilio'));

CREATE DOMAIN modalidad_cita_valores AS character varying(50)
	CHECK (VALUE IN ('consulta_general', 'vacunacion', 'cirugia', 'analitica', 'peluqueria'));

CREATE DOMAIN tipo_producto_valores AS character varying(50)
	CHECK (VALUE IN ('accesorio', 'comida', 'medicamento', 'vacuna', 'peluqueria'));

CREATE DOMAIN metodo_envio_valores AS character varying(50)
	CHECK (VALUE IN ('correo_electronico', 'sms'));

CREATE TABLE mascota
(
  num_chip INT NOT NULL,
  nombre_mascota VARCHAR NOT NULL,
  edad INT NOT NULL,
  sexo CHAR NOT NULL,
  especie VARCHAR NOT NULL,
  PRIMARY KEY (num_chip)
);

CREATE TABLE clinica
(
  id_clinica INT NOT NULL,
  PRIMARY KEY (id_clinica)
);

CREATE TABLE cita
(
  id_cita INT NOT NULL,
  hora DATE NOT NULL,
  fecha DATE NOT NULL,
  id_clinica INT NOT NULL,
  num_chip INT NOT NULL,
  modalidad modalidad_cita_valores NOT NULL,
  tipo_cita tipo_cita_valores NOT NULL,
  PRIMARY KEY (id_cita),
  FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica),
  FOREIGN KEY (num_chip) REFERENCES mascota(num_chip)
);

CREATE TABLE producto
(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR NOT NULL,
  marca VARCHAR NOT NULL,
  imagen VARCHAR NOT NULL,
  descripcion VARCHAR NOT NULL,
  ficha_tecnica VARCHAR NOT NULL,
  precio FLOAT NOT NULL,
  cantidad_disponible INT NOT NULL,
  tipo_producto tipo_producto_valores NOT NULL,
  PRIMARY KEY (id_producto)
);

CREATE TABLE alerta
(
  id_alerta INT NOT NULL,
  mensaje VARCHAR NOT NULL,
  stock_restante INT NOT NULL,
  fecha_alerta DATE NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_alerta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE recordatorio
(
  id_recordatorio INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  periocidad INT NOT NULL,
  motivo VARCHAR NOT NULL,
  metodo_envio metodo_envio_valores NOT NULL,
  num_chip INT NOT NULL,
  id_clinica INT NOT NULL,
  PRIMARY KEY (id_recordatorio),
  FOREIGN KEY (num_chip) REFERENCES mascota(num_chip),
  FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica)
);

CREATE TABLE compra
(
  fecha_compra DATE NOT NULL,
  id_producto INT NOT NULL,
  dni VARCHAR(9) NOT NULL,
  CONSTRAINT cp_compra PRIMARY KEY (dni, id_producto),
  FOREIGN KEY (dni),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE cliente
(
  dni VARCHAR(9) NOT NULL,
  correo_electronico VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  apellidos VARCHAR NOT NULL,
  contrasenya VARCHAR NOT NULL,
  num_chip INT NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (num_chip) REFERENCES mascota(num_chip),
  FOREIGN KEY (id_producto) REFERENCES compra(id_producto)
);