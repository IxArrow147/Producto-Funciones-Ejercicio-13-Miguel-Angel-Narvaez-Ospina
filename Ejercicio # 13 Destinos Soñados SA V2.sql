/* 
   Ejecutar En Orden ya que las tablas fueron creadas ya con sus llaves foraneas y relaciones incluyendo CONSTRAINT
   para no utilizar el ALTER y no hacer el codigo mas largo o complejo
   Ejercicio # 13 Destinos_Soñados_SA
*/

CREATE DATABASE Destinos_Soñados_SA; # Comando para Crear Base de Datos de la operadora turistica "Destinos Soñados S.A."

USE Destinos_Soñados_SA; # Utilizar Base de Datos Creada

# Creacion de Tablas de (Tipo, Clasificaciones, Metodos, etc)
CREATE TABLE Tipo_Destino (
	id_tipo_destino INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Tipo_Alojamiento (
	id_tipo_alojamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Categoria_Alojamiento (
	id_categoria_alojamiento INT AUTO_INCREMENT PRIMARY KEY,
    Estrellas TINYINT NOT NULL
);
CREATE TABLE Tipo_Transporte (
	id_tipo_transporte INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Regimen_Alimenticio (
	id_regimen INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Tipo_Actividad (
	id_tipo_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Tipo_Descuento (
	id_tipo_descuento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Metodo_Pago (
	id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Tipo_Cliente (
	id_tipo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Pais (
	id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) 
);
CREATE TABLE Region (
	id_region INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50), 
    id_pais INT NOT NULL, # Llave Foranea de la tabla Pais
    #Relacion
    CONSTRAINT fk_Region_Pais 
        FOREIGN KEY (id_pais) REFERENCES Pais (id_pais)
);
CREATE TABLE Idioma (
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE Certificacion (
    id_certificacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);
CREATE TABLE Temporada (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Servicio_Alojamiento (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

# Creacion de Tablas ENTIDADES Principales

CREATE TABLE Destino_Turistico (
	id_destino INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    latitud DECIMAL(9,6),  #Coordenadas Geograficas
    longitud DECIMAL(9,6), #Coordenadas Geograficas
    descripcion TEXT,
    nivel_popularidad TINYINT,
    restricciones TEXT,
    id_tipo_destino INT NOT NULL, # Llave Foranea de la tabla Tipo Destino
    id_pais INT NOT NULL, # Llave Foranea de la tabla Pais
    id_region INT NOT NULL, # Llave Foranea de la tabla Region
    #Relaciones
    CONSTRAINT fk_destino_pais
        FOREIGN KEY (id_pais) REFERENCES Pais (id_pais),
    CONSTRAINT fk_destino_region
        FOREIGN KEY (id_region) REFERENCES Region (id_region),
    CONSTRAINT fk_destino_tipo
        FOREIGN KEY (id_tipo_destino) REFERENCES Tipo_Destino (id_tipo_destino)
); 

CREATE TABLE Actividad_Turistica (
	id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    duracion_horas DECIMAL (4,2),
    dificultad TINYINT,
    equipamiento_necesario TEXT,
    restricciones TEXT,
    precio_por_persona DECIMAL(10,2),
    capacidad_maxima SMALLINT,
    id_destino INT NOT NULL, # Llave Foranea de la tabla Destino Turistico
    id_tipo_actividad INT NOT NULL, # Llave Foranea de la tabla Tipo Actividad
    #Relaciones
    CONSTRAINT fk_actividad_destino
        FOREIGN KEY (id_destino) REFERENCES Destino_Turistico (id_destino),
    CONSTRAINT fk_actividad_tipo
        FOREIGN KEY (id_tipo_actividad) REFERENCES Tipo_Actividad (id_tipo_actividad)
);

CREATE TABLE Alojamiento (
	id_alojamiento INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre_comercial VARCHAR(150) NOT NULL,
    direccion VARCHAR(200),
	latitud DECIMAL(9,6),  #Coordenadas Geograficas
    longitud DECIMAL(9,6), #Coordenadas Geograficas
    contacto VARCHAR(200),
    politica_cancelacion TEXT,
    comision_acordada DECIMAL(5,2),
    id_tipo_alojamiento INT NOT NULL, # Llave Foranea de la tabla Tipo Alojamiento
    id_categoria_alojamiento INT NOT NULL, # Llave Foranea de la tabla Categoria Alojamiento
    #Relaciones
    CONSTRAINT fk_tipo_aloj
        FOREIGN KEY (id_tipo_alojamiento) REFERENCES Tipo_Alojamiento (id_tipo_alojamiento),
    CONSTRAINT fk_categoria_aloj
        FOREIGN KEY (id_categoria_alojamiento) REFERENCES Categoria_Alojamiento (id_categoria_alojamiento)
);

CREATE TABLE Transporte (
	id_transporte INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    proveedor VARCHAR(200),
    ruta VARCHAR(200),
    capacidad SMALLINT,
    duracion_minutos INT,
    restricciones_equipaje TEXT,
    tarifa DECIMAL (10,2),
	id_tipo_transporte INT NOT NULL,  # Llave Foranea de la tabla Tipo Transporte
    #Relacion
    CONSTRAINT fk_transporte_tipo
        FOREIGN KEY (id_tipo_transporte) REFERENCES Tipo_Transporte (id_tipo_transporte)
);

CREATE TABLE Guia_Turistico (
    id_guia INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    documento_identidad VARCHAR(30) NOT NULL UNIQUE,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(100),
    evaluacion_desempeno DECIMAL(3,2),
    disponibilidad BOOLEAN
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombres_razon_social VARCHAR (200) NOT NULL,
    documento VARCHAR(30) NOT NULL UNIQUE,
    nacionalidad VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(10),
    correo VARCHAR(150),
    programa_fidelizacion VARCHAR(100),
    id_tipo_cliente INT NOT NULL, # Llave Foranea de la tabla Tipo Cliente
    #Relacion
    CONSTRAINT fk_cliente_tipo
        FOREIGN KEY (id_tipo_cliente) REFERENCES Tipo_Cliente (id_tipo_cliente)
);

CREATE TABLE Paquete_Turistico (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre_comercial VARCHAR(150) NOT NULL,
    duracion_dias TINYINT,
    duracion_noches TINYINT,
	precio_base DECIMAL(10,2),
    minimo_participantes SMALLINT,
    nivel_dificultad TINYINT,
    id_tipo_transporte INT NOT NULL, # Llave Foranea de la tabla Tipo Transporte
    id_categoria_alojamiento INT NOT NULL, # Llave Foranea de la tabla Categoria Alojamiento
    id_regimen INT NOT NULL, # Llave Foranea de la tabla Regimen alimenticio
    #Relaciones
    CONSTRAINT fk_paquete_transporte
        FOREIGN KEY (id_tipo_transporte) REFERENCES Tipo_Transporte (id_tipo_transporte),
    CONSTRAINT fk_paquete_categoria
        FOREIGN KEY (id_categoria_alojamiento) REFERENCES Categoria_Alojamiento (id_categoria_alojamiento),
    CONSTRAINT fk_paquete_regimen
        FOREIGN KEY (id_regimen) REFERENCES Regimen_Alimenticio (id_regimen)
);

CREATE TABLE Promocion (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    valor_descuento DECIMAL(10,2),
    condiciones_especiales TEXT,
    resultados_obtenidos TEXT,
    id_tipo_descuento INT NOT NULL, # Llave Foranea de la tabla Tipo Descuento
    #Relacion
    CONSTRAINT fk_promocion_tipo_desc
        FOREIGN KEY (id_tipo_descuento) REFERENCES Tipo_Descuento (id_tipo_descuento)
);

CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    numero_reserva VARCHAR(20) UNIQUE NOT NULL,
    fecha_creacion DATETIME,
    fecha_inicio DATE,
    fecha_fin DATE,
    cantidad_adultos SMALLINT,
    cantidad_ninos SMALLINT,
    solicitudes_especiales TEXT,
    precio_total DECIMAL(10,2),
    abonos_realizados DECIMAL(10,2),
    saldo_pendiente DECIMAL(10,2),
    estado VARCHAR(50),
    id_cliente INT NOT NULL, # Llave Foranea de la tabla Cliente Principal
	id_metodo_pago INT NOT NULL, # Llave Foranea de la tabla Metodo de Pago
    id_paquete INT NOT NULL,
	id_guia INT NOT NULL,
    #Relaciones
    CONSTRAINT fk_reserva_cliente
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente),
    CONSTRAINT fk_reserva_metodo_pago
        FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_Pago (id_metodo_pago),
	CONSTRAINT fk_reserva_paquete
		FOREIGN KEY (id_paquete) REFERENCES Paquete_Turistico (id_paquete),
	CONSTRAINT fk_reserva_guia
		FOREIGN KEY (id_guia) REFERENCES Guia_Turistico (id_guia)
);

# Tablas Pivotes Con datos que obviamente tienen implicacion o son restantes en varias Tablas

CREATE TABLE Destino_Fotografia (
    id_foto INT AUTO_INCREMENT PRIMARY KEY,
    id_destino INT NOT NULL,
    url VARCHAR(255),
    CONSTRAINT fk_foto_destino
        FOREIGN KEY (id_destino) REFERENCES Destino_Turistico (id_destino)
);

CREATE TABLE Destino_Temporada (
    id_destino_temporada INT AUTO_INCREMENT PRIMARY KEY,
    id_destino INT NOT NULL,
    id_temporada INT NOT NULL,
    CONSTRAINT fk_dt_destino
        FOREIGN KEY (id_destino) REFERENCES Destino_Turistico (id_destino),
    CONSTRAINT fk_dt_temporada
        FOREIGN KEY (id_temporada) REFERENCES Temporada (id_temporada)
);

CREATE TABLE Paquete_Destino (
    id_paquete_destino INT AUTO_INCREMENT PRIMARY KEY,
    id_paquete INT NOT NULL,
    id_destino INT NOT NULL,
    CONSTRAINT fk_pd_paquete
        FOREIGN KEY (id_paquete) REFERENCES Paquete_Turistico (id_paquete),
    CONSTRAINT fk_pd_destino
        FOREIGN KEY (id_destino) REFERENCES Destino_Turistico (id_destino)
);

CREATE TABLE Paquete_Actividad_Incluida (
    id_paquete_act_inc INT AUTO_INCREMENT PRIMARY KEY,
    id_paquete INT NOT NULL,
    id_actividad INT NOT NULL,
    CONSTRAINT fk_pai_paquete
        FOREIGN KEY (id_paquete) REFERENCES Paquete_Turistico (id_paquete),
    CONSTRAINT fk_pai_actividad
        FOREIGN KEY (id_actividad) REFERENCES Actividad_Turistica (id_actividad)
);

CREATE TABLE Paquete_Actividad_Opcional (
    id_paquete_act_opc INT AUTO_INCREMENT PRIMARY KEY,
    id_paquete INT NOT NULL,
    id_actividad INT NOT NULL,
    CONSTRAINT fk_pao_paquete
        FOREIGN KEY (id_paquete) REFERENCES Paquete_Turistico (id_paquete),
    CONSTRAINT fk_pao_actividad
        FOREIGN KEY (id_actividad) REFERENCES Actividad_Turistica (id_actividad)
);

CREATE TABLE Alojamiento_Servicio (
    id_aloj_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_alojamiento INT NOT NULL,
    id_servicio INT NOT NULL,
    CONSTRAINT fk_as_aloj
        FOREIGN KEY (id_alojamiento) REFERENCES Alojamiento (id_alojamiento),
    CONSTRAINT fk_as_servicio
        FOREIGN KEY (id_servicio) REFERENCES Servicio_Alojamiento (id_servicio)
);

CREATE TABLE Guia_Idioma (
    id_guia_idioma INT AUTO_INCREMENT PRIMARY KEY,
    id_guia INT NOT NULL,
    id_idioma INT NOT NULL,
    CONSTRAINT fk_gi_guia
        FOREIGN KEY (id_guia) REFERENCES Guia_Turistico (id_guia),
    CONSTRAINT fk_gi_idioma
        FOREIGN KEY (id_idioma) REFERENCES Idioma (id_idioma)
);

CREATE TABLE Guia_Especialidad (
    id_guia_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    id_guia INT NOT NULL,
    id_especialidad INT NOT NULL,
    CONSTRAINT fk_ge_guia
        FOREIGN KEY (id_guia) REFERENCES Guia_Turistico (id_guia),
    CONSTRAINT fk_ge_especialidad
        FOREIGN KEY (id_especialidad) REFERENCES Especialidad (id_especialidad)
);

CREATE TABLE Guia_Destino (
    id_guia_destino INT AUTO_INCREMENT PRIMARY KEY,
    id_guia INT NOT NULL,
    id_destino INT NOT NULL,
    CONSTRAINT fk_gd_guia
        FOREIGN KEY (id_guia) REFERENCES Guia_Turistico (id_guia),
    CONSTRAINT fk_gd_destino
        FOREIGN KEY (id_destino) REFERENCES Destino_Turistico (id_destino)
);

CREATE TABLE Guia_Certificacion (
    id_guia_certificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_guia INT NOT NULL,
    id_certificacion INT NOT NULL,
    CONSTRAINT fk_gc_guia
        FOREIGN KEY (id_guia) REFERENCES Guia_Turistico (id_guia),
    CONSTRAINT fk_gc_cert
        FOREIGN KEY (id_certificacion) REFERENCES Certificacion (id_certificacion)
);

