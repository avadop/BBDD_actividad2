-- Inserts tabla cliente
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('01189877H', 'andrea@gmail.com', 'Madrid', 'Andrea', 'del Vado Puell', 'andrea123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('12345678Z', 'pablo@gmail.com', 'Galicia', 'Palbo', 'Vazquez Fernandez', 'pablo123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('98745632C', 'joaquin@gmail.com', 'Córdoba', 'Joaquin Ángel', 'Tejero Cañero', 'joaquin123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('44556677G', 'fulanito@gmail.com', 'Asturias', 'fulanito', 'García López', 'fulanito123!');
INSERT INTO cliente(dni, correo_electronico, direccion, nombre, apellidos, contrasenya) VALUES ('58236478A', 'menganito@gmail.com', 'Navarra', 'menganito', 'Perez Almansa', 'menganito123!');

-- Inserts tabla mascota
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (1234567, 'Darwin', 2, 'H', 'gato', '01189877H')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (7896541, 'Coco', 2, 'M', 'gato', '01189877H')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (6542893, 'Mau', 4, 'M', 'gato', '12345678Z')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (4566981, 'Leo', 12, 'M', 'gato', '98745632C')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (7755689, 'Aru', 3, 'H', 'gato', '98745632C')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (1122334, 'Django', 8, 'M', 'perro', '58236478A')
INSERT INTO mascota(num_chip, nombre_mascota, edad, sexo, especie, dni) VALUES (6987354, 'Mango', 6, 'H', 'perro', '44556677G')
