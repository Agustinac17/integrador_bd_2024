CREATE DATABASE IF NOT EXISTS nyc_air;
USE nyc_air;

-- Create the audit_logs table
CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    operation VARCHAR(50) NOT NULL,
    changed_at DATETIME NOT NULL,
    changed_by VARCHAR(255) NOT NULL,
    primary_key_value VARCHAR(255) NOT NULL
);

DELIMITER //

-- Triggers for metodo_pago
CREATE TRIGGER metodo_pago_after_insert
AFTER INSERT ON metodo_pago
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('metodo_pago', 'INSERT', NOW(), USER(), NEW.id_metodo_pago);
END//

CREATE TRIGGER metodo_pago_after_update
AFTER UPDATE ON metodo_pago
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('metodo_pago', 'UPDATE', NOW(), USER(), NEW.id_metodo_pago);
END//

CREATE TRIGGER metodo_pago_after_delete
AFTER DELETE ON metodo_pago
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('metodo_pago', 'DELETE', NOW(), USER(), OLD.id_metodo_pago);
END//

-- Triggers for status_pasaje
CREATE TRIGGER status_pasaje_after_insert
AFTER INSERT ON status_pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_pasaje', 'INSERT', NOW(), USER(), NEW.id_status);
END//

CREATE TRIGGER status_pasaje_after_update
AFTER UPDATE ON status_pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_pasaje', 'UPDATE', NOW(), USER(), NEW.id_status);
END//

CREATE TRIGGER status_pasaje_after_delete
AFTER DELETE ON status_pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_pasaje', 'DELETE', NOW(), USER(), OLD.id_status);
END//

-- Triggers for aeropuerto
CREATE TRIGGER aeropuerto_after_insert
AFTER INSERT ON aeropuerto
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('aeropuerto', 'INSERT', NOW(), USER(), NEW.id_aeropuerto);
END//

CREATE TRIGGER aeropuerto_after_update
AFTER UPDATE ON aeropuerto
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('aeropuerto', 'UPDATE', NOW(), USER(), NEW.id_aeropuerto);
END//

CREATE TRIGGER aeropuerto_after_delete
AFTER DELETE ON aeropuerto
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('aeropuerto', 'DELETE', NOW(), USER(), OLD.id_aeropuerto);
END//

-- Triggers for provincia
CREATE TRIGGER provincia_after_insert
AFTER INSERT ON provincia
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('provincia', 'INSERT', NOW(), USER(), NEW.id_provincia);
END//

CREATE TRIGGER provincia_after_update
AFTER UPDATE ON provincia
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('provincia', 'UPDATE', NOW(), USER(), NEW.id_provincia);
END//

CREATE TRIGGER provincia_after_delete
AFTER DELETE ON provincia
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('provincia', 'DELETE', NOW(), USER(), OLD.id_provincia);
END//

-- Triggers for ciudad
CREATE TRIGGER ciudad_after_insert
AFTER INSERT ON ciudad
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('ciudad', 'INSERT', NOW(), USER(), NEW.id_ciudad);
END//

CREATE TRIGGER ciudad_after_update
AFTER UPDATE ON ciudad
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('ciudad', 'UPDATE', NOW(), USER(), NEW.id_ciudad);
END//

CREATE TRIGGER ciudad_after_delete
AFTER DELETE ON ciudad
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('ciudad', 'DELETE', NOW(), USER(), OLD.id_ciudad);
END//

-- Triggers for staff
CREATE TRIGGER staff_after_insert
AFTER INSERT ON staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff', 'INSERT', NOW(), USER(), NEW.id_staff);
END//

CREATE TRIGGER staff_after_update
AFTER UPDATE ON staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff', 'UPDATE', NOW(), USER(), NEW.id_staff);
END//

CREATE TRIGGER staff_after_delete
AFTER DELETE ON staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff', 'DELETE', NOW(), USER(), OLD.id_staff);
END//

-- Triggers for avion
CREATE TRIGGER avion_after_insert
AFTER INSERT ON avion
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('avion', 'INSERT', NOW(), USER(), NEW.id_avion);
END//

CREATE TRIGGER avion_after_update
AFTER UPDATE ON avion
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('avion', 'UPDATE', NOW(), USER(), NEW.id_avion);
END//

CREATE TRIGGER avion_after_delete
AFTER DELETE ON avion
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('avion', 'DELETE', NOW(), USER(), OLD.id_avion);
END//

-- Triggers for pasaje
CREATE TRIGGER pasaje_after_insert
AFTER INSERT ON pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pasaje', 'INSERT', NOW(), USER(), NEW.id_pasaje);
END//

CREATE TRIGGER pasaje_after_update
AFTER UPDATE ON pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pasaje', 'UPDATE', NOW(), USER(), NEW.id_pasaje);
END//

CREATE TRIGGER pasaje_after_delete
AFTER DELETE ON pasaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pasaje', 'DELETE', NOW(), USER(), OLD.id_pasaje);
END//

-- Triggers for recibo
CREATE TRIGGER recibo_after_insert
AFTER INSERT ON recibo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('recibo', 'INSERT', NOW(), USER(), NEW.id_recibo);
END//

CREATE TRIGGER recibo_after_update
AFTER UPDATE ON recibo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('recibo', 'UPDATE', NOW(), USER(), NEW.id_recibo);
END//

CREATE TRIGGER recibo_after_delete
AFTER DELETE ON recibo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('recibo', 'DELETE', NOW(), USER(), OLD.id_recibo);
END//

-- Triggers for check_in
CREATE TRIGGER check_in_after_insert
AFTER INSERT ON check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('check_in', 'INSERT', NOW(), USER(), NEW.id_check_in);
END//

CREATE TRIGGER check_in_after_update
AFTER UPDATE ON check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('check_in', 'UPDATE', NOW(), USER(), NEW.id_check_in);
END//

CREATE TRIGGER check_in_after_delete
AFTER DELETE ON check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('check_in', 'DELETE', NOW(), USER(), OLD.id_check_in);
END//

-- Triggers for asiento
CREATE TRIGGER asiento_after_insert
AFTER INSERT ON asiento
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('asiento', 'INSERT', NOW(), USER(), NEW.id_asiento);
END//

CREATE TRIGGER asiento_after_update
AFTER UPDATE ON asiento
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('asiento', 'UPDATE', NOW(), USER(), NEW.id_asiento);
END//

CREATE TRIGGER asiento_after_delete
AFTER DELETE ON asiento
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('asiento', 'DELETE', NOW(), USER(), OLD.id_asiento);
END//

-- Triggers for clase
CREATE TRIGGER clase_after_insert
AFTER INSERT ON clase
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('clase', 'INSERT', NOW(), USER(), NEW.id_clase);
END//

CREATE TRIGGER clase_after_update
AFTER UPDATE ON clase
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('clase', 'UPDATE', NOW(), USER(), NEW.id_clase);
END//

CREATE TRIGGER clase_after_delete
AFTER DELETE ON clase
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('clase', 'DELETE', NOW(), USER(), OLD.id_clase);
END//

-- Triggers for cliente
CREATE TRIGGER cliente_after_insert
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('cliente', 'INSERT', NOW(), USER(), NEW.id_cliente);
END//

CREATE TRIGGER cliente_after_update
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('cliente', 'UPDATE', NOW(), USER(), NEW.id_cliente);
END//

CREATE TRIGGER cliente_after_delete
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('cliente', 'DELETE', NOW(), USER(), OLD.id_cliente);
END//

-- Triggers for equipaje
CREATE TRIGGER equipaje_after_insert
AFTER INSERT ON equipaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('equipaje', 'INSERT', NOW(), USER(), NEW.id_equipaje);
END//

CREATE TRIGGER equipaje_after_update
AFTER UPDATE ON equipaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('equipaje', 'UPDATE', NOW(), USER(), NEW.id_equipaje);
END//

CREATE TRIGGER equipaje_after_delete
AFTER DELETE ON equipaje
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('equipaje', 'DELETE', NOW(), USER(), OLD.id_equipaje);
END//

-- Triggers for fabricante
CREATE TRIGGER fabricante_after_insert
AFTER INSERT ON fabricante
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('fabricante', 'INSERT', NOW(), USER(), NEW.id_fabricante);
END//

CREATE TRIGGER fabricante_after_update
AFTER UPDATE ON fabricante
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('fabricante', 'UPDATE', NOW(), USER(), NEW.id_fabricante);
END//

CREATE TRIGGER fabricante_after_delete
AFTER DELETE ON fabricante
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('fabricante', 'DELETE', NOW(), USER(), OLD.id_fabricante);
END//

-- Triggers for modelo
CREATE TRIGGER modelo_after_insert
AFTER INSERT ON modelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('modelo', 'INSERT', NOW(), USER(), NEW.id_modelo);
END//

CREATE TRIGGER modelo_after_update
AFTER UPDATE ON modelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('modelo', 'UPDATE', NOW(), USER(), NEW.id_modelo);
END//

CREATE TRIGGER modelo_after_delete
AFTER DELETE ON modelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('modelo', 'DELETE', NOW(), USER(), OLD.id_modelo);
END//

-- Triggers for pais
CREATE TRIGGER pais_after_insert
AFTER INSERT ON pais
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pais', 'INSERT', NOW(), USER(), NEW.id_pais);
END//

CREATE TRIGGER pais_after_update
AFTER UPDATE ON pais
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pais', 'UPDATE', NOW(), USER(), NEW.id_pais);
END//

CREATE TRIGGER pais_after_delete
AFTER DELETE ON pais
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('pais', 'DELETE', NOW(), USER(), OLD.id_pais);
END//

-- Triggers for rol
CREATE TRIGGER rol_after_insert
AFTER INSERT ON rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('rol', 'INSERT', NOW(), USER(), NEW.id_rol);
END//

CREATE TRIGGER rol_after_update
AFTER UPDATE ON rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('rol', 'UPDATE', NOW(), USER(), NEW.id_rol);
END//

CREATE TRIGGER rol_after_delete
AFTER DELETE ON rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('rol', 'DELETE', NOW(), USER(), OLD.id_rol);
END//

-- Triggers for staff_rol
CREATE TRIGGER staff_rol_after_insert
AFTER INSERT ON staff_rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff_rol', 'INSERT', NOW(), USER(), NEW.id_staff_rol);
END//

CREATE TRIGGER staff_rol_after_update
AFTER UPDATE ON staff_rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff_rol', 'UPDATE', NOW(), USER(), NEW.id_staff_rol);
END//

CREATE TRIGGER staff_rol_after_delete
AFTER DELETE ON staff_rol
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('staff_rol', 'DELETE', NOW(), USER(), OLD.id_staff_rol);
END//

-- Triggers for status_check_in
CREATE TRIGGER status_check_in_after_insert
AFTER INSERT ON status_check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_check_in', 'INSERT', NOW(), USER(), NEW.id_status_check_in);
END//

CREATE TRIGGER status_check_in_after_update
AFTER UPDATE ON status_check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_check_in', 'UPDATE', NOW(), USER(), NEW.id_status_check_in);
END//

CREATE TRIGGER status_check_in_after_delete
AFTER DELETE ON status_check_in
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_check_in', 'DELETE', NOW(), USER(), OLD.id_status_check_in);
END//

-- Triggers for status_vuelo
CREATE TRIGGER status_vuelo_after_insert
AFTER INSERT ON status_vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_vuelo', 'INSERT', NOW(), USER(), NEW.id_status_vuelo);
END//

CREATE TRIGGER status_vuelo_after_update
AFTER UPDATE ON status_vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_vuelo', 'UPDATE', NOW(), USER(), NEW.id_status_vuelo);
END//

CREATE TRIGGER status_vuelo_after_delete
AFTER DELETE ON status_vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('status_vuelo', 'DELETE', NOW(), USER(), OLD.id_status_vuelo);
END//

-- Triggers for tarifa
CREATE TRIGGER tarifa_after_insert
AFTER INSERT ON tarifa
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('tarifa', 'INSERT', NOW(), USER(), NEW.id_tarifa);
END//

CREATE TRIGGER tarifa_after_update
AFTER UPDATE ON tarifa
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('tarifa', 'UPDATE', NOW(), USER(), NEW.id_tarifa);
END//

CREATE TRIGGER tarifa_after_delete
AFTER DELETE ON tarifa
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('tarifa', 'DELETE', NOW(), USER(), OLD.id_tarifa);
END//

-- Triggers for vuelo
CREATE TRIGGER vuelo_after_insert
AFTER INSERT ON vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo', 'INSERT', NOW(), USER(), NEW.id_vuelo);
END//

CREATE TRIGGER vuelo_after_update
AFTER UPDATE ON vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo', 'UPDATE', NOW(), USER(), NEW.id_vuelo);
END//

CREATE TRIGGER vuelo_after_delete
AFTER DELETE ON vuelo
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo', 'DELETE', NOW(), USER(), OLD.id_vuelo);
END//

-- Triggers for vuelo_staff
CREATE TRIGGER vuelo_staff_after_insert
AFTER INSERT ON vuelo_staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo_staff', 'INSERT', NOW(), USER(), NEW.id_vuelo_staff);
END//

CREATE TRIGGER vuelo_staff_after_update
AFTER UPDATE ON vuelo_staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo_staff', 'UPDATE', NOW(), USER(), NEW.id_vuelo_staff);
END//

CREATE TRIGGER vuelo_staff_after_delete
AFTER DELETE ON vuelo_staff
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, operation, changed_at, changed_by, primary_key_value)
    VALUES ('vuelo_staff', 'DELETE', NOW(), USER(), OLD.id_vuelo_staff);
END//

DELIMITER ;
