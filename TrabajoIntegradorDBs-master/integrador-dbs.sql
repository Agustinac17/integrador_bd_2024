# DROP DATABASE nyc_air;
CREATE DATABASE IF NOT exists nyc_air;
USE nyc_air;

# SET FOREIGN_KEY_CHECKS = 0;
# TRUNCATE TABLE equipaje;
# TRUNCATE TABLE check_in;
# TRUNCATE TABLE tarifa;
# TRUNCATE TABLE recibo;
# TRUNCATE TABLE pasaje;
# TRUNCATE TABLE asiento;
# TRUNCATE TABLE vuelo_staff;
# TRUNCATE TABLE vuelo;
# TRUNCATE TABLE staff;
# set foreign_key_check = 1;

# Nuevas tablas normalizadas

CREATE TABLE metodo_pago (
    id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
    metodo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE status_pasaje (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE status_check_in (
    id_status_check_in INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE status_vuelo (
    id_status_vuelo INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);


# Zona locaciones

CREATE TABLE pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(100) NOT NULL,
    slug VARCHAR(20) NOT NULL
);

CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY AUTO_INCREMENT,
    id_pais INT,
    provincia VARCHAR(100) NOT NULL,
    slug VARCHAR(20),
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE ciudad (
    id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    id_provincia INT,
    ciudad VARCHAR(100) NOT NULL,
    slug VARCHAR(20),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE aeropuerto (
    id_aeropuerto INT PRIMARY KEY AUTO_INCREMENT,
    id_ciudad INT,
    nombre VARCHAR(255),
    slug VARCHAR(20),
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT true,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

# Zona empleados
CREATE TABLE rol (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(100) NOT NULL
);

CREATE TABLE staff (
    id_staff INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    identificacion VARCHAR(100),
    tipo_identificacion VARCHAR(255),
    fecha_nacimiento DATE,
    fecha_inicio_empleo DATE,
    fecha_fin_empleo DATE,
    activo BOOLEAN,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Zona aviones

CREATE TABLE fabricante (
    id_fabricante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE modelo (
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_fabricante INT,
    FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante)
);

CREATE TABLE avion (
    id_avion INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    id_modelo INT,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo)
);

# Objeto vuelo

CREATE TABLE vuelo (
    id_vuelo INT PRIMARY KEY AUTO_INCREMENT,
    id_status_vuelo INT,
    tiempo_partida DATETIME,
    tiempo_llegada DATETIME,
    tiempo_partida_aprox DATETIME,
    tiempo_llegada_aprox DATETIME,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_avion INT,
    id_aeropuerto_partida INT,
    id_aeropuerto_arribo INT,
    FOREIGN KEY (id_aeropuerto_partida) REFERENCES aeropuerto(id_aeropuerto),
    FOREIGN KEY (id_aeropuerto_arribo) REFERENCES aeropuerto(id_aeropuerto),
    FOREIGN KEY (id_avion) REFERENCES avion(id_avion),
    FOREIGN KEY (id_status_vuelo) REFERENCES status_vuelo(id_status_vuelo)
);

CREATE TABLE clase (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    clase VARCHAR(50),
    descripcion VARCHAR(255)
);

CREATE TABLE asiento (
    id_asiento INT PRIMARY KEY AUTO_INCREMENT,
    id_avion INT,
    id_clase INT,
    es_ventana BOOLEAN,
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase),
    FOREIGN KEY (id_avion) REFERENCES avion(id_avion)
);

# Zona cliente y datos

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    numero_tel VARCHAR(50),
    email VARCHAR(100),
    identificacion VARCHAR(100),
    tipo_identificacion VARCHAR(255),
    fecha_nacimiento DATE,
    activo BOOLEAN,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pasaje (
    id_pasaje INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_vuelo INT,
    costo_base DECIMAL(10,2),
    id_status INT,
    flexible BOOLEAN,
    flexible_hasta DATE,
    plan_millas VARCHAR(50),
    activo BOOLEAN,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo),
    FOREIGN KEY (id_status) REFERENCES status_pasaje(id_status)
);

CREATE TABLE recibo (
    id_recibo INT PRIMARY KEY AUTO_INCREMENT,
    id_pasaje INT,
    id_metodo_pago INT,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pasaje) REFERENCES pasaje(id_pasaje),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

CREATE TABLE tarifa (
    id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    id_recibo INT,
    detalle VARCHAR(255),
    monto DECIMAL(10,2),
    FOREIGN KEY (id_recibo) REFERENCES recibo(id_recibo)
);

CREATE TABLE check_in (
    id_check_in INT PRIMARY KEY AUTO_INCREMENT,
    id_pasaje INT,
    id_asiento INT,
    id_status_check_in INT,
    activo BOOLEAN,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_asiento) REFERENCES asiento(id_asiento),
    FOREIGN KEY (id_pasaje) REFERENCES pasaje(id_pasaje),
    FOREIGN KEY (id_status_check_in) REFERENCES status_check_in(id_status_check_in)
);

CREATE TABLE equipaje (
    id_equipaje INT PRIMARY KEY AUTO_INCREMENT,
    id_check_in INT,
    estado VARCHAR(50),
    peso DECIMAL(10,2),
    codigo VARCHAR(100),
    tipo VARCHAR(50),
    activo BOOLEAN,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_check_in) REFERENCES check_in(id_check_in)
);

# Tablas intermedias para relaciones muchos a muchos

CREATE TABLE vuelo_staff (
    id_vuelo_staff INT PRIMARY KEY AUTO_INCREMENT,
    id_vuelo INT,
    id_staff INT,
    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo),
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);

CREATE TABLE staff_rol (
    id_staff_rol INT PRIMARY KEY AUTO_INCREMENT,
    id_rol INT,
    id_staff INT,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);

# Indices
# pasajes x vuelo
# asiento x avion
# staff x vuelo
# vuelo ida y vuelta x aeropuerto
# staff x rol
# tarifa x recibo

# consultas, vistas, funciones
# todos los asientos desocupados de un vuelo dado por parametro
# todos los clientes que viajan en un vuelo dado por parametro
# buscar staff desocupado para fecha dado por parametro
# buscar aviones desocupados para fecha dada dado por parametro
# verificar vuelos hacia una ubicacion dado por parametro
# verificar si el asiento de un cliente está en una ventana, partiendo desde el pasaje
# buscar el porcentaje de todos los asientos ocupados en un vuelo dado por parametro
# buscar el estado de los vuelos de las proximas 48hs
# buscar el peso total del equipaje de un vuelo dado por parametro
# buscar el estado de todos los check ins de los clientes de un vuelo dado por parametro
# buscar todos los vuelos de un cliente dado por parametro
# todos los aeropuertos dentro de un país por cuidad dado por parametro
# el tablero led de un aeropuerto (slug ciudad, slug pais, arribo y llegada esperada)

# Funcion
# cambiar de asiento un pasaje
# marcar todos los equipajes de un cliente como entregados
# completar un vuelo
# reprogramar vuelo
# crear vuelo, asignar staff y avion
# asignar pasaje para cliente

# Triggers
# Crear recibo y tarifas después de comprar
# crear check in y equipaje despues de comprar
# cuando se completa un vuelo, marcar equipajes como retirados