USE Destinos_Soñados_SA; # Utilizar Base de Datos Creada

#Inserts de las Tablas (Tipo, Clasificaciones, Metodos, etc)
-- Tipo Destino
INSERT INTO Tipo_Destino (nombre) 
VALUES ('Playa'),('Montaña'),('Ciudad Histórica'),('Aventura'),('Ecológico'),('Cultural');

-- Tipo Alojamiento
INSERT INTO Tipo_Alojamiento (nombre) 
VALUES ('Hotel'),('Hostal'),('Resort'),('Apartamento'),('Cabaña'),('Eco-Lodge');

-- Categoria Alojamiento
INSERT INTO Categoria_Alojamiento (Estrellas) 
VALUES (1),(2),(3),(4),(5);

-- Tipo Transporte
INSERT INTO Tipo_Transporte (nombre) 
VALUES ('Avión'),('Bus'),('Tren'),('Barco'),('Vehículo Privado');

-- Regimen Alimenticio
INSERT INTO Regimen_Alimenticio (nombre) 
VALUES ('Solo alojamiento'),('Desayuno incluido'),('Media pensión'),('Pensión completa'),('Todo incluido');

-- Tipo Actividad
INSERT INTO Tipo_Actividad (nombre) 
VALUES ('Aventura'),('Cultural'),('Relajación'),('Gastronómica'),('Deportiva'),('Naturaleza');

-- Tipo Descuento
INSERT INTO Tipo_Descuento (nombre) 
VALUES ('Porcentaje'),('Monto fijo'),('Promoción especial'),('Temporada baja'),('Cliente frecuente');

-- Metodo Pago
INSERT INTO Metodo_Pago (nombre) 
VALUES ('Tarjeta de crédito'),('Tarjeta de débito'),('Transferencia bancaria'),('Efectivo'),('Pago en línea');

-- Tipo Cliente
INSERT INTO Tipo_Cliente (nombre) 
VALUES ('Individual'),('Pareja'),('Familiar'),('Empresarial'),('Grupo turístico');

-- Idioma (8)
INSERT INTO Idioma (nombre) 
VALUES ('Español'),('Inglés'),('Francés'),('Alemán'),('Italiano'),('Portugués'),('Japonés'),('Chino');

-- Especialidad
INSERT INTO Especialidad (nombre) 
VALUES ('Historia'),('Ecoturismo'),('Aventura'),('Gastronomía'),('Fotografía'),('Cultura local');

-- Certificacion
INSERT INTO Certificacion (nombre) 
VALUES('Guía certificado internacional'),('Primeros auxilios'),('Turismo sostenible'),('Guía de montaña'),('Idiomas avanzados');

-- Temporada
INSERT INTO Temporada (nombre) 
VALUES('Media'),('Baja'),('Festiva'),('Verano'),('Invierno'),('Alta');

-- Servicio Alojamiento
INSERT INTO Servicio_Alojamiento (nombre)
VALUES('WiFi'),('Piscina'),('Gimnasio'),('Spa'),('Restaurante'),('Bar'),('Transporte al aeropuerto'),('Desayuno incluido');

-- Pais (20)
INSERT INTO Pais (nombre) VALUES
('Colombia'),
('México'),
('Estados Unidos'),
('España'),
('Francia'),
('Italia'),
('Alemania'),
('Brasil'),
('Argentina'),
('Chile'),
('Perú'),
('Japón'),
('China'),
('Canadá'),
('Australia'),
('Reino Unido'),
('Portugal'),
('Grecia'),
('Turquía'),
('Egipto');

-- Region
INSERT INTO Region (nombre, id_pais) VALUES
('Antioquia', 1),
('Cundinamarca', 1),
('Quintana Roo', 2),
('California', 3),
('Cataluña', 4),
('Île-de-France', 5),
('Lombardía', 6),
('Baviera', 7),
('São Paulo', 8),
('Buenos Aires', 9),
('Santiago', 10),
('Cusco', 11),
('Tokio', 12),
('Beijing', 13),
('Ontario', 14),
('Nueva Gales del Sur', 15),
('Inglaterra', 16),
('Lisboa', 17),
('Ática', 18),
('El Cairo', 20);

#Inserts de las Tablas ENTIDADES Principales

-- Tabla Destino Turistico
INSERT INTO Destino_Turistico 
(codigo, nombre, latitud, longitud, descripcion, nivel_popularidad, restricciones, id_tipo_destino, id_pais, id_region)
VALUES
('DEST001','Cartagena',10.3910,-75.4794,'Destino turístico costero en Colombia',5,'Ninguna',1,1,1),
('DEST002','Medellín',6.2442,-75.5812,'Ciudad innovadora en Colombia',4,'Ninguna',3,1,1),
('DEST003','Cancún',21.1619,-86.8515,'Playa turística en México',5,'Alta demanda',1,2,3),
('DEST004','Los Ángeles',34.0522,-118.2437,'Ciudad icónica de EE.UU.',5,'Visa requerida',3,3,4),
('DEST005','Barcelona',41.3851,2.1734,'Ciudad cultural en España',5,'Alta demanda',3,4,5),
('DEST006','París',48.8566,2.3522,'Ciudad del amor',5,'Reservas anticipadas',3,5,6),
('DEST007','Milán',45.4642,9.1900,'Capital de la moda',4,'Ninguna',3,6,7),
('DEST008','Múnich',48.1351,11.5820,'Ciudad alemana histórica',4,'Ninguna',3,7,8),
('DEST009','São Paulo',-23.5505,-46.6333,'Ciudad principal de Brasil',4,'Ninguna',3,8,9),
('DEST010','Buenos Aires',-34.6037,-58.3816,'Capital argentina',5,'Ninguna',3,9,10),
('DEST011','Santiago',-33.4489,-70.6693,'Capital de Chile',4,'Ninguna',3,10,11),
('DEST012','Cusco',-13.5319,-71.9675,'Destino histórico peruano',5,'Altura',2,11,12),
('DEST013','Tokio',35.6762,139.6503,'Capital japonesa',5,'Ninguna',3,12,13),
('DEST014','Beijing',39.9042,116.4074,'Capital china',5,'Visa requerida',3,13,14),
('DEST015','Toronto',43.6510,-79.3470,'Ciudad canadiense',4,'Ninguna',3,14,15),
('DEST016','Sídney',-33.8688,151.2093,'Ciudad australiana',5,'Visa requerida',1,15,16),
('DEST017','Londres',51.5074,-0.1278,'Capital del Reino Unido',5,'Ninguna',3,16,17),
('DEST018','Lisboa',38.7223,-9.1393,'Capital portuguesa',4,'Ninguna',3,17,18),
('DEST019','Atenas',37.9838,23.7275,'Ciudad histórica griega',5,'Ninguna',3,18,19),
('DEST020','El Cairo',30.0444,31.2357,'Destino cultural egipcio',5,'Clima extremo',3,20,20);

-- Tabla Actividad Turistica
INSERT INTO Actividad_Turistica
(codigo, nombre, duracion_horas, dificultad, equipamiento_necesario, restricciones, precio_por_persona, capacidad_maxima, id_destino, id_tipo_actividad)
VALUES
('ACT001','Tour por la Ciudad Amurallada',3,1,'Ropa cómoda','Ninguna',25.00,30,1,2),
('ACT002','Parapente en Medellín',2,4,'Equipo de seguridad','No apto para cardíacos',80.00,10,2,1),
('ACT003','Snorkel en Cancún',4,2,'Equipo de snorkel','Nadar',60.00,20,3,6),
('ACT004','Tour Hollywood',5,1,'Ninguno','Ninguna',50.00,40,4,2),
('ACT005','Ruta de Gaudí',4,1,'Ninguno','Ninguna',35.00,25,5,2),
('ACT006','Tour Torre Eiffel',2,1,'Ninguno','Filas largas',45.00,50,6,2),
('ACT007','Tour de moda en Milán',3,1,'Ninguno','Ninguna',55.00,20,7,2),
('ACT008','Festival Oktoberfest',6,2,'Ninguno','Edad legal',70.00,100,8,4),
('ACT009','Tour gastronómico São Paulo',4,1,'Ninguno','Ninguna',40.00,20,9,4),
('ACT010','Show de tango',3,1,'Ninguno','Ninguna',65.00,30,10,2),
('ACT011','Tour viñedos',5,2,'Ninguno','Edad legal',75.00,25,11,4),
('ACT012','Machu Picchu trekking',10,5,'Equipo montaña','Buena condición física',150.00,15,12,1),
('ACT013','Tour anime Tokio',6,1,'Ninguno','Ninguna',90.00,20,13,2),
('ACT014','Muralla China excursión',8,3,'Calzado cómodo','Ninguna',100.00,30,14,1),
('ACT015','Tour Niagara Falls',6,2,'Impermeable','Ninguna',85.00,40,15,6),
('ACT016','Surf en Sídney',3,3,'Tabla surf','Saber nadar',95.00,15,16,5),
('ACT017','Tour Londres histórico',4,1,'Ninguno','Ninguna',60.00,30,17,2),
('ACT018','Tranvía Lisboa',2,1,'Ninguno','Ninguna',20.00,25,18,2),
('ACT019','Acrópolis tour',3,2,'Ninguno','Ninguna',35.00,30,19,2),
('ACT020','Pirámides de Giza',5,2,'Sombrero','Calor extremo',70.00,50,20,2);

-- Tabla Alojamiento
INSERT INTO Alojamiento
(codigo, nombre_comercial, direccion, latitud, longitud, contacto, politica_cancelacion, comision_acordada, id_tipo_alojamiento, id_categoria_alojamiento)
VALUES
('ALOJ001','Hotel Caribe Plaza','Cartagena Centro',10.391,-75.479,'+573001234567','24h cancelación',15.00,1,5),
('ALOJ002','Hotel Medellín Central','El Poblado',6.244,-75.581,'+573002345678','48h cancelación',12.00,1,4),
('ALOJ003','Resort Cancún Beach','Zona Hotelera',21.161,-86.851,'+521998123456','Todo incluido',18.00,3,5),
('ALOJ004','LA Downtown Hotel','Los Ángeles',34.052,-118.243,'+12135551234','24h cancelación',14.00,1,4),
('ALOJ005','Barcelona Suites','Centro',41.385,2.173,'+34931234567','48h cancelación',13.00,4,4),
('ALOJ006','Hotel Paris Lumiere','Centro',48.856,2.352,'+33123456789','24h cancelación',16.00,1,5),
('ALOJ007','Milano Fashion Hotel','Centro',45.464,9.190,'+390212345678','24h cancelación',14.00,1,4),
('ALOJ008','Munich Lodge','Centro',48.135,11.582,'+49891234567','48h cancelación',12.00,6,3),
('ALOJ009','Sao Paulo Inn','Centro',-23.550,-46.633,'+551199999999','24h cancelación',11.00,2,3),
('ALOJ010','Buenos Aires Palace','Centro',-34.603,-58.381,'+541112345678','24h cancelación',15.00,1,5),
('ALOJ011','Santiago Andes Hotel','Centro',-33.448,-70.669,'+56223456789','48h cancelación',12.00,1,4),
('ALOJ012','Cusco Mountain Lodge','Cusco',-13.531,-71.967,'+51987654321','No reembolsable',10.00,5,3),
('ALOJ013','Tokyo Central Hotel','Shinjuku',35.676,139.650,'+81312345678','24h cancelación',17.00,1,5),
('ALOJ014','Beijing Imperial Hotel','Centro',39.904,116.407,'+861012345678','48h cancelación',15.00,1,5),
('ALOJ015','Toronto City Hotel','Centro',43.651,-79.347,'+14161234567','24h cancelación',13.00,1,4),
('ALOJ016','Sydney Beach Resort','Bondi',-33.868,151.209,'+61212345678','Todo incluido',18.00,3,5),
('ALOJ017','London Royal Hotel','Centro',51.507,-0.127,'+442012345678','24h cancelación',16.00,1,5),
('ALOJ018','Lisbon View Hotel','Centro',38.722,-9.139,'+351123456789','48h cancelación',12.00,1,4),
('ALOJ019','Athens Classic Hotel','Centro',37.983,23.727,'+302112345678','24h cancelación',13.00,1,4),
('ALOJ020','Cairo Desert Hotel','Centro',30.044,31.235,'+20212345678','No reembolsable',11.00,1,3);

-- Tabla Transporte
INSERT INTO Transporte
(codigo, proveedor, ruta, capacidad, duracion_minutos, restricciones_equipaje, tarifa, id_tipo_transporte)
VALUES
('TRANS001','Avianca','Bogotá - Cartagena',180,90,'20kg equipaje',120.00,1),
('TRANS002','LATAM','Medellín - Cancún',200,180,'25kg equipaje',250.00,1),
('TRANS003','Greyhound','LA - San Francisco',50,360,'1 maleta',45.00,2),
('TRANS004','Renfe','Madrid - Barcelona',200,180,'Sin restricción',60.00,3),
('TRANS005','MSC Cruceros','Mediterráneo',3000,7200,'Equipaje libre',800.00,4),
('TRANS006','Uber Black','Traslado aeropuerto',4,60,'1 maleta',30.00,5),
('TRANS007','Delta Airlines','NY - LA',220,300,'23kg equipaje',200.00,1),
('TRANS008','FlixBus','Berlín - Múnich',60,480,'1 maleta',35.00,2),
('TRANS009','JR Rail','Tokio - Osaka',300,180,'Sin restricción',100.00,3),
('TRANS010','Royal Caribbean','Caribe',4000,10080,'Equipaje libre',1200.00,4),
('TRANS011','Cabify','Ciudad',4,45,'1 maleta',25.00,5),
('TRANS012','Air France','París - Roma',180,120,'20kg equipaje',150.00,1),
('TRANS013','Emirates','Dubai - Londres',300,420,'30kg equipaje',500.00,1),
('TRANS014','Alsa','Madrid - Valencia',55,240,'1 maleta',30.00,2),
('TRANS015','Amtrak','Chicago - Toronto',120,600,'2 maletas',80.00,3),
('TRANS016','Princess Cruises','Alaska',3500,14400,'Equipaje libre',1500.00,4),
('TRANS017','Taxi Ejecutivo','Ciudad',4,30,'1 maleta',20.00,5),
('TRANS018','Qantas','Sydney - Melbourne',180,90,'20kg equipaje',110.00,1),
('TRANS019','Viazul','La Habana - Varadero',40,180,'1 maleta',25.00,2),
('TRANS020','Trenitalia','Roma - Milán',250,180,'Sin restricción',70.00,3);

-- Tabla Guia Turistico
INSERT INTO Guia_Turistico
(nombres, apellidos, documento_identidad, fecha_nacimiento, nacionalidad, evaluacion_desempeno, disponibilidad)
VALUES
('Carlos','Ramírez','CC1001','1985-03-12','Colombiano',4.5,1),
('Laura','González','CC1002','1990-07-25','Colombiana',4.7,1),
('John','Smith','US2001','1980-05-10','Estadounidense',4.6,1),
('Emma','Johnson','US2002','1992-11-03','Estadounidense',4.8,1),
('Luis','Martínez','MX3001','1988-02-18','Mexicano',4.4,1),
('Sofía','Hernández','MX3002','1995-09-09','Mexicana',4.9,1),
('Pierre','Dubois','FR4001','1983-06-15','Francés',4.6,1),
('Marie','Lefevre','FR4002','1991-12-20','Francesa',4.7,1),
('Marco','Rossi','IT5001','1986-08-08','Italiano',4.5,1),
('Giulia','Bianchi','IT5002','1993-04-14','Italiana',4.8,1),
('Hans','Müller','DE6001','1982-01-30','Alemán',4.3,1),
('Anna','Schmidt','DE6002','1994-10-05','Alemana',4.7,1),
('Pedro','Silva','BR7001','1987-07-07','Brasileño',4.6,1),
('Lucía','Fernández','AR8001','1990-03-03','Argentina',4.5,1),
('Diego','Torres','CL9001','1989-05-22','Chileno',4.4,1),
('Kenji','Tanaka','JP10001','1984-11-11','Japonés',4.9,1),
('Li','Wei','CN11001','1986-06-06','Chino',4.3,1),
('James','Brown','UK12001','1981-09-19','Británico',4.6,1),
('Miguel','Santos','PT13001','1992-02-02','Portugués',4.5,1),
('Ahmed','Hassan','EG14001','1983-12-12','Egipcio',4.4,1);

-- Tabla Cliente
INSERT INTO Cliente
(codigo, nombres_razon_social, documento, nacionalidad, direccion, telefono, correo, programa_fidelizacion, id_tipo_cliente)
VALUES
('CLI001','Andrés Pérez','DOC001','Colombiano','Medellín','3001111111','andres@gmail.com','Gold',1),
('CLI002','María López','DOC002','Colombiana','Bogotá','3002222222','maria@gmail.com','Silver',2),
('CLI003','Michael Johnson','DOC003','Estadounidense','Los Angeles','3101234567','michael@gmail.com','Gold',1),
('CLI004','Emily Davis','DOC004','Estadounidense','New York','2121234567','emily@gmail.com','Platinum',2),
('CLI005','José Martínez','DOC005','Mexicano','Cancún','9981234567','jose@gmail.com','Silver',3),
('CLI006','Ana García','DOC006','Mexicana','CDMX','5512345678','ana@gmail.com','Gold',1),
('CLI007','Pierre Martin','DOC007','Francés','París','123456789','pierre@gmail.com','Gold',1),
('CLI008','Sophie Bernard','DOC008','Francesa','Lyon','987654321','sophie@gmail.com','Silver',2),
('CLI009','Luca Rossi','DOC009','Italiano','Roma','345678912','luca@gmail.com','Gold',1),
('CLI010','Giulia Romano','DOC010','Italiana','Milán','456789123','giulia@gmail.com','Platinum',2),
('CLI011','Hans Weber','DOC011','Alemán','Berlín','567891234','hans@gmail.com','Silver',1),
('CLI012','Anna Fischer','DOC012','Alemana','Hamburgo','678912345','anna@gmail.com','Gold',2),
('CLI013','Carlos Souza','DOC013','Brasileño','São Paulo','1198765432','carlos@gmail.com','Gold',1),
('CLI014','Lucía Gómez','DOC014','Argentina','Buenos Aires','1134567890','lucia@gmail.com','Silver',2),
('CLI015','Pedro Castillo','DOC015','Peruano','Lima','987654321','pedro@gmail.com','Gold',1),
('CLI016','Kenji Sato','DOC016','Japonés','Tokio','8012345678','kenji@gmail.com','Platinum',1),
('CLI017','Li Zhang','DOC017','Chino','Beijing','8612345678','li@gmail.com','Gold',1),
('CLI018','James Wilson','DOC018','Británico','Londres','4412345678','james@gmail.com','Silver',2),
('CLI019','Miguel Costa','DOC019','Portugués','Lisboa','3519123456','miguel@gmail.com','Gold',1),
('CLI020','Omar Ali','DOC020','Egipcio','El Cairo','2012345678','omar@gmail.com','Silver',1);

-- Tabla Paquete Turistico
INSERT INTO Paquete_Turistico
(codigo, nombre_comercial, duracion_dias, duracion_noches, precio_base, minimo_participantes, nivel_dificultad, id_tipo_transporte, id_categoria_alojamiento, id_regimen)
VALUES
('PAQ001','Caribe Relax',5,4,800.00,2,1,1,5,5),
('PAQ002','Aventura Andes',7,6,950.00,4,4,1,4,3),
('PAQ003','Cancún Premium',6,5,1200.00,2,1,1,5,5),
('PAQ004','California Dream',5,4,1400.00,2,2,1,4,2),
('PAQ005','Barcelona Cultural',4,3,900.00,2,1,3,4,2),
('PAQ006','París Romance',5,4,1500.00,2,1,1,5,3),
('PAQ007','Italia Fashion',6,5,1300.00,2,2,3,4,2),
('PAQ008','Alemania Tradicional',5,4,1100.00,2,2,3,3,2),
('PAQ009','Brasil Urbano',4,3,700.00,2,1,2,3,2),
('PAQ010','Argentina Tango',5,4,1000.00,2,1,1,4,3),
('PAQ011','Chile Gourmet',6,5,1150.00,2,2,1,4,3),
('PAQ012','Perú Histórico',7,6,1400.00,2,5,1,3,3),
('PAQ013','Japón Moderno',6,5,1800.00,2,2,1,5,3),
('PAQ014','China Imperial',7,6,1700.00,2,3,1,5,3),
('PAQ015','Canadá Naturaleza',5,4,1250.00,2,2,1,4,2),
('PAQ016','Australia Surf',6,5,1900.00,2,3,1,5,5),
('PAQ017','Londres Histórico',5,4,1500.00,2,1,1,5,2),
('PAQ018','Portugal Relax',4,3,850.00,2,1,3,4,2),
('PAQ019','Grecia Antigua',5,4,1200.00,2,2,1,4,2),
('PAQ020','Egipto Misterio',6,5,1600.00,2,3,1,4,3);

-- Tabla Promocion
INSERT INTO Promocion
(codigo, nombre, descripcion, fecha_inicio, fecha_fin, valor_descuento, condiciones_especiales, resultados_obtenidos, id_tipo_descuento)
VALUES
('PROMO01','Descuento Verano','Promo temporada alta','2025-06-01','2025-08-31',15.00,'Reservas anticipadas','Alta demanda',1),
('PROMO02','Black Friday','Descuentos especiales','2024-11-20','2024-11-30',200.00,'Pago inmediato','Incremento ventas',2),
('PROMO03','Cliente VIP','Beneficio fidelización','2026-01-01','2026-12-31',10.00,'Clientes frecuentes','Retención alta',1),
('PROMO04','Temporada Baja','Incentivo viajes','2025-02-01','2025-03-31',20.00,'Viajes fuera de temporada','Baja ocupación',1),
('PROMO05','Oferta Flash','Promoción limitada','2024-07-10','2024-07-20',150.00,'24 horas','Alta conversión',2);

-- Tabla Reserva
INSERT INTO Reserva
(numero_reserva, fecha_creacion, fecha_inicio, fecha_fin, cantidad_adultos, cantidad_ninos, solicitudes_especiales, precio_total, abonos_realizados, saldo_pendiente, estado, id_cliente, id_metodo_pago, id_paquete, id_guia)
VALUES
('RES001','2024-03-10 10:00:00','2024-04-01','2024-04-06',2,0,'Ninguna',800.00,400.00,400.00,'Confirmada',1,1,1,1),
('RES002','2024-07-15 12:00:00','2024-08-01','2024-08-08',4,1,'Habitación familiar',950.00,950.00,0.00,'Confirmada',2,2,2,2),
('RES003','2024-11-05 09:30:00','2024-12-01','2024-12-07',2,0,'Vista al mar',1200.00,600.00,600.00,'Pendiente',3,3,3,3),
('RES004','2025-01-20 14:00:00','2025-02-10','2025-02-15',2,0,'Ninguna',1400.00,1400.00,0.00,'Confirmada',4,1,4,4),
('RES005','2025-03-12 11:00:00','2025-04-01','2025-04-05',2,1,'Cuna bebé',900.00,300.00,600.00,'Pendiente',5,2,5,5),
('RES006','2025-05-22 16:00:00','2025-06-10','2025-06-15',2,0,'Ninguna',1500.00,1500.00,0.00,'Confirmada',6,1,6,6),
('RES007','2025-07-18 08:00:00','2025-08-01','2025-08-06',2,0,'Ninguna',1300.00,650.00,650.00,'Cancelada',7,3,7,7),
('RES008','2025-09-25 13:00:00','2025-10-10','2025-10-15',2,0,'Ninguna',1100.00,500.00,600.00,'Pendiente',8,4,8,8),
('RES009','2025-11-30 10:00:00','2025-12-15','2025-12-20',3,0,'Ninguna',700.00,700.00,0.00,'Confirmada',9,2,9,9),
('RES010','2026-01-05 09:00:00','2026-02-01','2026-02-06',2,0,'Ninguna',1000.00,500.00,500.00,'Pendiente',10,1,10,10),
('RES011','2026-02-14 11:00:00','2026-03-01','2026-03-07',2,1,'Ninguna',1150.00,1150.00,0.00,'Confirmada',11,2,11,11),
('RES012','2026-03-20 15:00:00','2026-04-01','2026-04-08',2,0,'Altura',1400.00,700.00,700.00,'Pendiente',12,3,12,12),
('RES013','2026-04-10 10:00:00','2026-05-01','2026-05-06',2,0,'Ninguna',1800.00,1800.00,0.00,'Confirmada',13,1,13,13),
('RES014','2026-05-05 12:00:00','2026-06-01','2026-06-07',2,0,'Ninguna',1700.00,800.00,900.00,'Pendiente',14,2,14,14),
('RES015','2026-06-18 14:00:00','2026-07-01','2026-07-06',2,0,'Ninguna',1250.00,1250.00,0.00,'Confirmada',15,3,15,15),
('RES016','2026-07-22 09:00:00','2026-08-01','2026-08-07',2,0,'Ninguna',1900.00,900.00,1000.00,'Pendiente',16,1,16,16),
('RES017','2026-08-30 16:00:00','2026-09-10','2026-09-15',2,0,'Ninguna',1500.00,1500.00,0.00,'Confirmada',17,2,17,17),
('RES018','2026-09-15 11:00:00','2026-10-01','2026-10-05',2,0,'Ninguna',850.00,400.00,450.00,'Cancelada',18,4,18,18),
('RES019','2026-10-10 13:00:00','2026-11-01','2026-11-06',2,0,'Ninguna',1200.00,600.00,600.00,'Pendiente',19,1,19,19),
('RES020','2026-11-25 10:00:00','2026-12-01','2026-12-07',2,0,'Ninguna',1600.00,1600.00,0.00,'Confirmada',20,2,20,20);

# Inserts de las Tablas Pivote

INSERT INTO Destino_Fotografia (id_destino, url) VALUES
(1,'https://img.com/cartagena1.jpg'),
(2,'https://img.com/medellin1.jpg'),
(3,'https://img.com/cancun1.jpg'),
(4,'https://img.com/la1.jpg'),
(5,'https://img.com/barcelona1.jpg'),
(6,'https://img.com/paris1.jpg'),
(7,'https://img.com/milan1.jpg'),
(8,'https://img.com/munich1.jpg'),
(9,'https://img.com/saopaulo1.jpg'),
(10,'https://img.com/buenosaires1.jpg'),
(11,'https://img.com/santiago1.jpg'),
(12,'https://img.com/cusco1.jpg'),
(13,'https://img.com/tokyo1.jpg'),
(14,'https://img.com/beijing1.jpg'),
(15,'https://img.com/toronto1.jpg'),
(16,'https://img.com/sydney1.jpg'),
(17,'https://img.com/london1.jpg'),
(18,'https://img.com/lisbon1.jpg'),
(19,'https://img.com/athens1.jpg'),
(20,'https://img.com/cairo1.jpg');

SELECT * FROM Destino_Temporada;
INSERT INTO Destino_Temporada (id_destino, id_temporada) VALUES
(1,1),(1,5),
(2,2),(2,3),
(3,1),(3,5),
(4,2),(4,3),
(5,1),(5,2),
(6,1),(6,6),
(7,2),(7,3),
(8,6),(8,3),
(9,5),(9,1),
(10,2),(10,3),
(11,2),(11,5),
(12,1),(12,2),
(13,6),(13,3),
(14,2),(14,3),
(15,5),(15,6),
(16,5),(16,1),
(17,2),(17,3),
(18,1),(18,2),
(19,5),(19,2),
(20,1),(20,2);

INSERT INTO Paquete_Destino (id_paquete, id_destino) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);

INSERT INTO Paquete_Actividad_Incluida (id_paquete, id_actividad) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);

INSERT INTO Paquete_Actividad_Opcional (id_paquete, id_actividad) VALUES
(1,2),(2,3),(3,4),(4,5),(5,6),
(6,7),(7,8),(8,9),(9,10),(10,11),
(11,12),(12,13),(13,14),(14,15),(15,16),
(16,17),(17,18),(18,19),(19,20),(20,1);

INSERT INTO Alojamiento_Servicio (id_alojamiento, id_servicio) VALUES
(1,1),(1,2),(1,5),
(2,1),(2,3),
(3,1),(3,2),(3,4),(3,5),
(4,1),(4,3),
(5,1),(5,6),
(6,1),(6,4),(6,5),
(7,1),(7,3),
(8,1),(8,2),
(9,1),(9,6),
(10,1),(10,2),(10,5),
(11,1),(11,3),
(12,1),(12,7),
(13,1),(13,4),
(14,1),(14,5),
(15,1),(15,3),
(16,1),(16,2),(16,4),
(17,1),(17,5),
(18,1),(18,6),
(19,1),(19,3),
(20,1),(20,7);

INSERT INTO Guia_Idioma (id_guia, id_idioma) VALUES
(1,1),(1,2),
(2,1),(2,2),
(3,2),(4,2),
(5,1),(5,2),
(6,1),(6,2),
(7,3),(8,3),
(9,5),(10,5),
(11,4),(12,4),
(13,6),(14,1),
(15,1),(16,7),
(17,8),(18,2),
(19,6),(20,1);

INSERT INTO Guia_Especialidad (id_guia, id_especialidad) VALUES
(1,1),(2,2),(3,1),(4,2),(5,3),
(6,4),(7,1),(8,2),(9,5),(10,6),
(11,1),(12,2),(13,3),(14,4),(15,5),
(16,6),(17,1),(18,2),(19,3),(20,4);

INSERT INTO Guia_Destino (id_guia, id_destino) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);

INSERT INTO Guia_Certificacion (id_guia, id_certificacion) VALUES
(1,1),(2,2),(3,1),(4,2),(5,3),
(6,4),(7,1),(8,2),(9,3),(10,4),
(11,1),(12,2),(13,3),(14,4),(15,5),
(16,1),(17,2),(18,3),(19,4),(20,5);