CREATE USER 'usuarioadmin'@'localhost' IDENTIFIED BY 'AgustiniBoss_1';
GRANT ALL PRIVILEGES ON nyc_air.* TO 'usuarioadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'operaciones'@'localhost' IDENTIFIED BY 'operpass2024';
GRANT SELECT, INSERT, UPDATE ON nyc_air.staff TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.rol TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.aeropuerto TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.ciudad TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.provincia TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.pais TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.avion TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.modelo TO 'operaciones'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.fabricante TO 'operaciones'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'atencion'@'localhost' IDENTIFIED BY '2024atenclientepass';
GRANT SELECT, INSERT, UPDATE ON nyc_air.cliente TO 'atencion'@'localhost';
GRANT SELECT ON nyc_air.staff TO 'atencion'@'localhost';
GRANT SELECT ON nyc_air.avion TO 'atencion'@'localhost';
GRANT SELECT ON nyc_air.modelo TO 'atencion'@'localhost';
GRANT SELECT ON nyc_air.fabricante TO 'atencion'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.aeropuerto TO 'atencion'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.ciudad TO 'atencion'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.provincia TO 'atencion'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nyc_air.pais TO 'atencion'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'audit2024pass';
GRANT SELECT ON nyc_air.* TO 'auditor'@'localhost';
FLUSH PRIVILEGES;