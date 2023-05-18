CREATE TABLE MASCOTA
(
  num_chip INT NOT NULL,
  nombre_mascota VARCHAR NOT NULL,
  edad INT NOT NULL,
  sexo CHAR NOT NULL,
  especie VARCHAR NOT NULL,
  PRIMARY KEY (num_chip)
);

CREATE TABLE CLINICA
(
  id_clinica INT NOT NULL,
  PRIMARY KEY (id_clinica)
);

CREATE TABLE CITA
(
  id_cita INT NOT NULL,
  hora DATE NOT NULL,
  fecha DATE NOT NULL,
  id_clinica INT NOT NULL,
  num_chip INT NOT NULL,
  PRIMARY KEY (id_cita),
  FOREIGN KEY (id_clinica) REFERENCES CLINICA(id_clinica),
  FOREIGN KEY (num_chip) REFERENCES MASCOTA(num_chip)
);

CREATE TABLE CITA_tipo_cita
(
  tipo_cita VARCHAR NOT NULL,
  id_cita INT NOT NULL,
  PRIMARY KEY (tipo_cita, id_cita),
  FOREIGN KEY (id_cita) REFERENCES CITA(id_cita)
);

CREATE TABLE CITA_modalidad
(
  modalidad VARCHAR NOT NULL,
  id_cita INT NOT NULL,
  PRIMARY KEY (modalidad, id_cita),
  FOREIGN KEY (id_cita) REFERENCES CITA(id_cita)
);

CREATE TABLE PRODUCTO
(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR NOT NULL,
  marca VARCHAR NOT NULL,
  imagen VARCHAR NOT NULL,
  descripcion VARCHAR NOT NULL,
  ficha_tecnica VARCHAR NOT NULL,
  precio FLOAT NOT NULL,
  cantidad_disponible INT NOT NULL,
  PRIMARY KEY (id_producto)
);

CREATE TABLE ALERTA
(
  id_alerta INT NOT NULL,
  mensaje VARCHAR NOT NULL,
  stock_restante INT NOT NULL,
  fecha_alerta DATE NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_alerta),
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

CREATE TABLE PRODUCTO_tipo_producto
(
  tipo_producto VARCHAR NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (tipo_producto, id_producto),
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

CREATE TABLE RECORDATORIO
(
  id_recordatorio INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  periocidad INT NOT NULL,
  motivo VARCHAR NOT NULL,
  metodo_envio VARCHAR NOT NULL,
  num_chip INT NOT NULL,
  id_clinica INT NOT NULL,
  PRIMARY KEY (id_recordatorio),
  FOREIGN KEY (num_chip) REFERENCES MASCOTA(num_chip),
  FOREIGN KEY (id_clinica) REFERENCES CLINICA(id_clinica)
);

CREATE TABLE compra
(
  fecha_compra DATE NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_producto),
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

CREATE TABLE CLIENTE
(
  dni VARCHAR NOT NULL,
  correo_electronico VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  apellidos VARCHAR NOT NULL,
  contrasenya VARCHAR NOT NULL,
  num_chip INT NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (num_chip) REFERENCES MASCOTA(num_chip),
  FOREIGN KEY (id_producto) REFERENCES compra(id_producto)
);