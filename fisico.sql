CREATE DOMAIN modalidad_cita_valores AS character varying(50) 
    CHECK (VALUE IN ('presencial', 'online', 'a_domicilio'));

CREATE DOMAIN tipo_cita_valores AS character varying(50)
	CHECK (VALUE IN ('consulta_general', 'vacunacion', 'cirugia', 'analitica', 'peluqueria'));

CREATE DOMAIN tipo_producto_valores AS character varying(50)
	CHECK (VALUE IN ('accesorio', 'comida', 'medicamento', 'vacuna', 'peluqueria'));

CREATE DOMAIN metodo_envio_valores AS character varying(50)
	CHECK (VALUE IN ('correo_electronico', 'sms'));

CREATE TABLE cliente(
  dni VARCHAR(9) NOT NULL,
  correo_electronico VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  apellidos VARCHAR NOT NULL,
  contrasenya VARCHAR NOT NULL,
  telefono INT NOT NULL,
  CONSTRAINT cp_cliente PRIMARY KEY (dni), 
);

CREATE TABLE mascota( 
  num_chip INT NOT NULL,
  nombre_mascota VARCHAR NOT NULL,
  edad INT NOT NULL,
  sexo CHAR NOT NULL,
  especie VARCHAR NOT NULL,
  vacunas VARCHAR NOT NULL,
  informes_de_mascota VARCHAR[] NOT NULL,
  historial_clinico VARCHAR,
  dni VARCHAR(9) NOT NULL, 
  CONSTRAINT cp_mascota PRIMARY KEY (num_chip),
  CONSTRAINT caj_cliente FOREIGN KEY (dni) REFERENCES cliente(dni) 
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE clinica( 
  id_clinica INT NOT NULL,
  CONSTRAINT cp_clinica PRIMARY KEY (id_clinica)
);

CREATE TABLE cita(
  id_cita INT NOT NULL,
  hora TIME NOT NULL,
  fecha DATE NOT NULL,
  id_clinica INT NOT NULL,
  num_chip INT NOT NULL,
  modalidad modalidad_cita_valores NOT NULL,
  tipo_cita tipo_cita_valores NOT NULL,
  CONSTRAINT cp_cita PRIMARY KEY (id_cita),
  CONSTRAINT caj_clinica_cita FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT caj_mascota_cita FOREIGN KEY (num_chip) REFERENCES mascota(num_chip)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE producto(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR NOT NULL,
  marca VARCHAR NOT NULL,
  imagen VARCHAR NOT NULL,
  descripcion VARCHAR NOT NULL,
  ficha_tecnica VARCHAR NOT NULL,
  precio FLOAT NOT NULL,
  cantidad_disponible INT NOT NULL,
  tipo_producto tipo_producto_valores NOT NULL,
  CONSTRAINT cp_producto PRIMARY KEY (id_producto)
);

CREATE TABLE alerta(
  id_alerta INT NOT NULL,
  mensaje VARCHAR NOT NULL,
  stock_restante INT NOT NULL,
  fecha_alerta DATE NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_alerta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE recordatorio(
  id_recordatorio INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  periocidad INT NOT NULL,
  motivo VARCHAR NOT NULL,
  metodo_envio metodo_envio_valores NOT NULL,
  num_chip INT NOT NULL,
  id_clinica INT NOT NULL,
  CONSTRAINT cp_recordatorio PRIMARY KEY (id_recordatorio),
  CONSTRAINT caj_mascota_recordatorio FOREIGN KEY (num_chip) REFERENCES mascota(num_chip)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT caj_clinica_recordatorio FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE compra(
  fecha_compra DATE NOT NULL,
  id_producto INT NOT NULL,
  dni VARCHAR(9) NOT NULL,
  CONSTRAINT cp_compra PRIMARY KEY (dni, id_producto),
  CONSTRAINT caj_cliente_compra FOREIGN KEY (dni) REFERENCES cliente(dni)
  ON DELETE SET NULL
  ON UPDATE CASCADE, 
  CONSTRAINT caj_producto_compra FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
