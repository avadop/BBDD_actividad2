-- Inserts tabla cliente
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('01189877H', 'andrea@gmail.com', 'Madrid', 'Andrea', 'del Vado Puell', 'andrea123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('12345678Z', 'pablo@gmail.com', 'Galicia', 'Palbo', 'Vazquez Fernandez', 'pablo123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('98745632C', 'joaquin@gmail.com', 'Córdoba', 'Joaquin Ángel', 'Tejero Cañero', 'joaquin123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('44556677G', 'fulanito@gmail.com', 'Asturias', 'fulanito', 'García López', 'fulanito123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('58236478A', 'menganito@gmail.com', 'Navarra', 'menganito', 'Perez Almansa', 'menganito123!');

-- Inserts tabla mascota
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, historial_clinico, dni) VALUES (1234567, 'Darwin', 2, 'H', 'gato','Rabia, trivalente y leucemia', ARRAY ['informe1.doc', 'resultado.doc', 'informe2.doc'],'castrado', '01189877H');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, dni) VALUES (7896541, 'Coco', 2, 'M', 'gato','Rabia, trivalente y leucemia', ARRAY ['informe1.doc', 'resultado.doc', 'informe2.doc'], '01189877H');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, dni) VALUES (6542893, 'Mau', 4, 'M', 'gato','Rabia, trivalente y leucemia', ARRAY ['informe1.doc', 'resultado.doc', 'informe2.doc'],'12345678Z');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, dni) VALUES (4566981, 'Leo', 12, 'M', 'gato', 'Rabia, trivalente y leucemia', ARRAY ['informe1.doc', 'resultado.doc', 'informe2.doc'],'98745632C');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, historial_clinico, dni) VALUES (7755689, 'Aru', 3, 'H', 'gato', 'Rabia, trivalente y leucemia', ARRAY ['resultado.doc', 'resultado2.doc'],'madre','98745632C');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, historial_clinico, dni) VALUES (1122334, 'Django', 8, 'M', 'perro', 'Rabia y polivalente', ARRAY ['analitica.doc'],'viejito', '58236478A');
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, vacunas, informes_de_mascota, historial_clinico, dni) VALUES (6987354, 'Mango', 6, 'H', 'perro', 'Rabia y polivalente', ARRAY ['informe.doc'],'castrado', '44556677G');

-- Insert tabla clinica
INSERT INTO clinica(id_clinica) VALUES (123589746)

-- Inserts tabla cita
INSERT INTO cita(id_cita, hora, fecha, id_clinica, num_chip, modalidad, tipo_cita) VALUES (1, '10:00', '06/03/2023', 123589746, 1234567, 'online', 'consulta_general')
INSERT INTO cita(id_cita, hora, fecha, id_clinica, num_chip, modalidad, tipo_cita) VALUES ((SELECT COUNT(id_cita) FROM cita) + 1, '16:30', '05/29/2023', 123589746, 7896541, 'presencial', 'vacunacion')
INSERT INTO cita(id_cita, hora, fecha, id_clinica, num_chip, modalidad, tipo_cita) VALUES ((SELECT COUNT(id_cita) FROM cita) + 1, '12:00', '06/01/2023', 123589746, 1122334, 'a_domicilio', 'peluqueria')
INSERT INTO cita(id_cita, hora, fecha, id_clinica, num_chip, modalidad, tipo_cita) VALUES ((SELECT COUNT(id_cita) FROM cita) + 1, '10:00', '05/25/2023', 123589746, 7755689, 'presencial', 'analitica')
INSERT INTO cita(id_cita, hora, fecha, id_clinica, num_chip, modalidad, tipo_cita) VALUES ((SELECT COUNT(id_cita) FROM cita) + 1, '12:00', '06/06/2023', 123589746, 7755689, 'presencial', 'consulta_general')

-- Inserts tabla producto
-- Productos de comida
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES (1, 'Comida perro 3kg', 'VIUpets', 'comida.png', 'Comida saludable de la propia clinica', 'Saco de 3kg', 20.15, 10, 'comida');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Comida perro 6kg', 'VIUpets', 'comida.png', 'Comida saludable de la propia clinica', 'Saco de 6kg', 40.99, 5, 'comida');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Comida gato 3kg', 'VIUpets', 'comida.png', 'Comida saludable de la propia clinica', 'Saco de 2kg', 16, 13, 'comida');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Comida humeda', 'VIUpets', 'comida-humeda.png', 'Comida saludable de la propia clinica', 'Lata individual', 1.99, 20, 'comida');


-- Productos accesorios
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Correa roja', 'Kiwoko', 'correa-roja.png', 'Correa de color rojo', 'No es extensible', 22.99, 4, 'accesorio');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Transportin tela mediano', 'kiwoko', 'transportin-tela.png', 'Transportind e tela de tamaño mediano', 'Muy recomendable para gatos', 35, 2, 'accesorio');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Corta uñas', 'VIUpets', 'cortauñas.png', 'Corta uñas de mascota', 'Corta uñas', 5.99, 6, 'accesorio');

-- Productos medicamento
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'desparasitador gato ', 'FarmaciaAnimal', 'desparasitador.png', 'Desparasitador gato super rápido y eficaz', 'Apto para gatos de hasta 7kg', 16.25, 28, 'medicamento');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'desparasitador perro', 'FarmaciaAnimal', 'desparasitador.png', 'Desparasitador perro super rápido y eficaz', 'Apto para perros hasta 15kg', 17, 32, 'medicamento');

-- Productos vacunas
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Rabia ', 'FarmaciaAnimal', 'vacuna-rabia.png', 'Vacuna de la rabia', 'Rabia', 33, 42, 'vacuna');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Trivalente', 'FarmaciaAnimal', 'vacuna-trivalente.png', 'Vacuna trivalente gatos', 'FHV-1, FPV y FCV', 40, 35, 'vacuna');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Polivalente', 'FarmaciaAnimal', 'vacuna-polivalente.png', 'Vacuna polivalente perros', 'parvovirus, virus del moquillo, virus de Parainfluenza, virus de la hepatitis y leptospira', 40, 37, 'vacuna');

-- Productos peluquería
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Cepillo', 'VIUpets', 'cepillo.png', 'Cepillo para gato', 'Puas pequeñas.', 6.99, 10, 'peluqueria');
INSERT INTO producto(id_producto, nombre_producto, marca, imagen, descripcion, ficha_tecnica, precio, cantidad_disponible, tipo_producto) VALUES ((SELECT COUNT(id_producto) FROM producto) + 1, 'Champú perro', 'Kiwoko', 'champu.png', 'Champú perros olor natural.', 'Champú hipoalergénico, apto para todo tipo de pieles', 12, 5, 'peluqueria');

-- Inserts alertas
INSERT INTO alerta(id_alerta, mensaje, stock_restante, fecha_alerta, id_producto) VALUES (1, 'Bajo stock', 10, '01/25/2023', 1);
INSERT INTO alerta(id_alerta, mensaje, stock_restante, fecha_alerta, id_producto) VALUES ((SELECT COUNT(id_alerta) FROM alerta) + 1, 'Bajo stock', 10, '08/06/2022', 4);
INSERT INTO alerta(id_alerta, mensaje, stock_restante, fecha_alerta, id_producto) VALUES ((SELECT COUNT(id_alerta) FROM alerta) + 1, 'Bajo stock', 10, '02/22/2023', 11);
INSERT INTO alerta(id_alerta, mensaje, stock_restante, fecha_alerta, id_producto) VALUES ((SELECT COUNT(id_alerta) FROM alerta) + 1, 'Bajo stock', 10, '05/13/2023', 10);

-- Inserts recordatorios
INSERT INTO recordatorio(id_recordatorio, fecha_inicio, periocidad, motivo, metodo_envio, num_chip, id_clinica) VALUES (1,'03/29/2022',365,'RENOVAR VACUNAS','sms',7896541,123589746);
INSERT INTO recordatorio(id_recordatorio, fecha_inicio, periocidad, motivo, metodo_envio, num_chip, id_clinica) VALUES ((SELECT COUNT(id_recordatorio) FROM recordatorio) + 1,'02/28/2023',90,'DESPARASITAR','sms',1234567,123589746);
INSERT INTO recordatorio(id_recordatorio, fecha_inicio, periocidad, motivo, metodo_envio, num_chip, id_clinica) VALUES ((SELECT COUNT(id_recordatorio) FROM recordatorio) + 1,'08/01/2022',365,'RENOVAR VACUNAS','sms',4566981,123589746);
INSERT INTO recordatorio(id_recordatorio, fecha_inicio, periocidad, motivo, metodo_envio, num_chip, id_clinica) VALUES ((SELECT COUNT(id_recordatorio) FROM recordatorio) + 1,'10/19/2022',365,'RENOVAR VACUNAS','sms',6542893,123589746);
INSERT INTO recordatorio(id_recordatorio, fecha_inicio, periocidad, motivo, metodo_envio, num_chip, id_clinica) VALUES ((SELECT COUNT(id_recordatorio) FROM recordatorio) + 1,'10/05/2022',365,'RENOVAR VACUNAS','sms',6987354,123589746);

-- Inserts compras
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('07/03/2023',13,'01189877H');
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('03/07/2023',1,'01189877H');
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('05/12/2023',6,'01189877H');
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('05/11/2023',5,'58236478A');
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('05/11/2023',2,'58236478A');
INSERT INTO compra(fecha_compra, id_producto, dni) VALUES ('04/22/2023',7,'44556677G');
