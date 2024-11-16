# DROP DATABASE nyc_air;
# CREATE DATABASE IF NOT exists nyc_air;
USE nyc_air;

# Índice para Pasajes por Vuelo
CREATE INDEX idx_pasajes_vuelo ON pasaje (id_vuelo);

# Índice para Asientos por Avion
CREATE INDEX idx_asientos_avion ON asiento (id_avion);

# Índice para Staff por Vuelo
CREATE INDEX idx_staff_vuelo ON vuelo_staff (id_vuelo, id_staff);

# Índice para Vuelos Ida y Vuelta por Aeropuerto
CREATE INDEX idx_vuelo_aeropuerto ON vuelo (id_aeropuerto_partida, id_aeropuerto_arribo);

# Índice para Staff por Rol
CREATE INDEX idx_staff_rol ON staff_rol (id_rol, id_staff);

# Índice para Tarifa por Recibo
CREATE INDEX idx_tarifa_recibo ON tarifa (id_recibo);
