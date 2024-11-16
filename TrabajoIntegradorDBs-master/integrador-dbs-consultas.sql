# DROP DATABASE nyc_air;
CREATE DATABASE IF NOT exists nyc_air;
USE nyc_air;

# Todos los asientos desocupados de un vuelo dado por parámetro
CREATE OR REPLACE VIEW asientos_desocupados_vuelo AS
SELECT a.*, v.id_vuelo
FROM asiento a
LEFT JOIN check_in ci ON a.id_asiento = ci.id_asiento
LEFT JOIN vuelo v ON a.id_avion = v.id_avion
WHERE ci.id_asiento IS NULL;

SELECT * FROM asientos_desocupados_vuelo WHERE id_vuelo = 1;

# Todos los clientes que viajan en un vuelo dado por parámetro
CREATE OR REPLACE VIEW clientes_vuelo_base AS
SELECT c.*, p.id_vuelo
FROM cliente c
JOIN pasaje p ON c.id_cliente = p.id_cliente;

SELECT * FROM clientes_vuelo_base WHERE id_vuelo = 1;

# Buscar staff desocupado para fecha dada por parámetro
DELIMITER //
CREATE PROCEDURE obtener_staff_desocupado(IN fecha_param DATETIME)
BEGIN
    SELECT s.*
    FROM staff s
    LEFT JOIN vuelo_staff vs ON s.id_staff = vs.id_staff
    LEFT JOIN vuelo v ON vs.id_vuelo = v.id_vuelo
    WHERE (fecha_param NOT BETWEEN v.tiempo_partida AND v.tiempo_llegada) OR v.id_vuelo IS NULL;
END //
DELIMITER ;

CALL obtener_staff_desocupado('2024-11-20 10:00:00');

# Buscar aviones desocupados para fecha dada por parámetro
DELIMITER //
CREATE PROCEDURE obtener_aviones_desocupados(IN fecha_param DATETIME)
BEGIN
    SELECT a.*
    FROM avion a
    LEFT JOIN vuelo v ON a.id_avion = v.id_avion
    WHERE (fecha_param NOT BETWEEN v.tiempo_partida AND v.tiempo_llegada) OR v.id_vuelo IS NULL;
END //
DELIMITER ;

CALL obtener_aviones_desocupados('2024-11-20 10:00:00');

# Verificar vuelos hacia una ubicación dada por parámetro
DELIMITER //
CREATE PROCEDURE vuelos_a_ubicacion(IN ubicacion VARCHAR(50))
BEGIN
    SELECT *
    FROM vuelo v
    JOIN aeropuerto a ON v.id_aeropuerto_arribo = a.id_aeropuerto
    JOIN ciudad c ON a.id_ciudad = c.id_ciudad
    WHERE c.ciudad = ubicacion;
END;
//
DELIMITER ;

CALL vuelos_a_ubicacion('Marsella');

# Verificar si el asiento de un cliente está en una ventana
DELIMITER //
CREATE FUNCTION asiento_es_ventana(id_cliente INT) RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE resultado BOOLEAN;

    -- Manejar el caso de no encontrar registros
    SELECT COALESCE(a.es_ventana, FALSE) INTO resultado
    FROM check_in ci
    JOIN asiento a ON ci.id_asiento = a.id_asiento
    JOIN pasaje p ON ci.id_pasaje = p.id_pasaje
    WHERE p.id_cliente = id_cliente
    LIMIT 1;

    RETURN resultado;
END;
//
DELIMITER ;

SELECT asiento_es_ventana(124);

# Buscar el porcentaje de todos los asientos ocupados en un vuelo dado por parámetro
DELIMITER //
CREATE FUNCTION porcentaje_asientos_ocupados(id_vuelo INT) RETURNS DECIMAL(5,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_asientos INT DEFAULT 0;
    DECLARE asientos_ocupados INT DEFAULT 0;
    DECLARE porcentaje DECIMAL(5,2) DEFAULT 0;

    -- Obtener total de asientos del avión asociado al vuelo
    SELECT COUNT(*) INTO total_asientos 
    FROM asiento 
    WHERE id_avion = (SELECT id_avion FROM vuelo WHERE id_vuelo = id_vuelo);

    -- Validar que haya asientos antes de continuar
    IF total_asientos > 0 THEN
        -- Contar los asientos ocupados
        SELECT COUNT(*) INTO asientos_ocupados 
        FROM check_in 
        WHERE id_pasaje IN (SELECT id_pasaje FROM pasaje WHERE id_vuelo = id_vuelo);

        -- Calcular porcentaje
        SET porcentaje = (asientos_ocupados / total_asientos) * 100;
    END IF;

    RETURN porcentaje;
END;
//
DELIMITER ;

SELECT porcentaje_asientos_ocupados(1);

# Buscar el estado de los vuelos de las próximas 48hs
CREATE OR REPLACE VIEW estado_vuelos_48hs AS
SELECT v.id_vuelo, v.tiempo_partida_aprox, v.tiempo_llegada_aprox, sv.estado
FROM vuelo v
JOIN status_vuelo sv ON v.id_status_vuelo = sv.id_status_vuelo
WHERE v.tiempo_partida_aprox BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 48 HOUR);


SELECT * FROM estado_vuelos_48hs;

# Buscar el peso total del equipaje de un vuelo dado por parámetro
DELIMITER //
CREATE FUNCTION peso_total_equipaje(id_vuelo INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE peso_total DECIMAL(10,2);
    SELECT COALESCE(SUM(e.peso), 0) INTO peso_total
    FROM equipaje e
    JOIN check_in ci ON e.id_check_in = ci.id_check_in
    JOIN pasaje p ON ci.id_pasaje = p.id_pasaje
    WHERE p.id_vuelo = id_vuelo;
    RETURN peso_total;
END //
DELIMITER ;

SELECT peso_total_equipaje(1); 

# Buscar el estado de todos los check-ins de los clientes de un vuelo dado por parámetro
DELIMITER //
CREATE PROCEDURE obtener_estado_check_ins_vuelo(IN id_vuelo_param INT)
BEGIN
    SELECT ci.*, sc.estado
    FROM check_in ci
    JOIN pasaje p ON ci.id_pasaje = p.id_pasaje
    JOIN status_check_in sc ON ci.id_status_check_in = sc.id_status_check_in
    WHERE p.id_vuelo = id_vuelo_param;
END //
DELIMITER ;

CALL obtener_estado_check_ins_vuelo(1);

# Buscar todos los vuelos de un cliente dado por parámetro
DELIMITER //
CREATE PROCEDURE obtener_vuelos_cliente(IN id_cliente_param INT)
BEGIN
    SELECT v.*
    FROM vuelo v
    JOIN pasaje p ON v.id_vuelo = p.id_vuelo
    WHERE p.id_cliente = id_cliente_param;
END //
DELIMITER ;

CALL obtener_vuelos_cliente(1); 

# Todos los aeropuertos dentro de un país por ciudad dado por parámetro
DELIMITER //
CREATE PROCEDURE obtener_aeropuertos_pais_ciudad(IN nombre_pais VARCHAR(50), IN nombre_ciudad VARCHAR(50))
BEGIN
    SELECT a.*
    FROM aeropuerto a
    JOIN ciudad c ON a.id_ciudad = c.id_ciudad
    JOIN provincia p ON c.id_provincia = p.id_provincia
    JOIN pais pa ON p.id_pais = pa.id_pais
    WHERE pa.pais = nombre_pais AND c.ciudad = nombre_ciudad;
END //
DELIMITER ;

CALL obtener_aeropuertos_pais_ciudad('Francia', 'Marsella');

# El tablero LED de un aeropuerto (slug ciudad, slug país, arribo y llegada esperada)
DELIMITER //
CREATE PROCEDURE obtener_tablero_led(IN slug_aeropuerto VARCHAR(20))
BEGIN
    SELECT c.slug AS ciudad_slug, pa.slug AS pais_slug, v.tiempo_llegada_aprox, v.tiempo_partida_aprox
    FROM vuelo v
    JOIN aeropuerto a ON v.id_aeropuerto_arribo = a.id_aeropuerto OR v.id_aeropuerto_partida = a.id_aeropuerto
    JOIN ciudad c ON a.id_ciudad = c.id_ciudad
    JOIN provincia p ON c.id_provincia = p.id_provincia
    JOIN pais pa ON p.id_pais = pa.id_pais
    WHERE a.slug = slug_aeropuerto;
END //
DELIMITER ;

CALL obtener_tablero_led('mrs'); 
