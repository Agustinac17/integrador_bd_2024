USE nyc_air;

INSERT INTO status_vuelo (estado, descripcion) VALUES
('Programado', 'El vuelo está programado para una fecha y hora específicas.'),
('En puerta', 'El vuelo está en proceso de embarque en la puerta asignada.'),
('Despegado', 'El vuelo ha despegado y está en el aire.'),
('Arribado', 'El vuelo ha llegado a su destino.'),
('Con retraso', 'El vuelo ha sido retrasado.'),
('Cancelado', 'El vuelo ha sido cancelado.'),
('Reprogramado', 'El vuelo ha sido reprogramado para otra hora.');

INSERT INTO status_pasaje (estado, descripcion) VALUES 
('Reservado', 'El pasaje ha sido reservado pero aún no está confirmado.'),
('Confirmado', 'El pasaje ha sido confirmado y el asiento está asegurado.'),
('Cancelado', 'El pasaje fue cancelado por el usuario o por la aerolínea.'),
('Emitido', 'El pasaje ha sido emitido y está listo para su uso.'),
('Check-in realizado', 'El pasajero ha realizado el check-in y ha confirmado su asiento.'),
('No presentado', 'El pasajero no se presentó para el vuelo en la hora indicada.');

INSERT INTO clase (clase, descripcion) VALUES
('Económica', 'Clase de asiento estándar, con servicios básicos.'),
('Primera Clase', 'Clase de asiento premium con mayor confort y servicio personalizado.'),
('Clase Ejecutiva', 'Clase superior a la económica, con más espacio y mejores servicios.'),
('Business', 'Otra forma de denominar la clase ejecutiva, ideal para viajeros de negocios.'),
('Turista', 'Una opción de clase económica de bajo costo.');

INSERT INTO metodo_pago (metodo)
VALUES
('EFECTIVO'),
('DEBITO'),
('CREDITO'),
('QR (BILLETERA VIRTUAL)'),
('CUENTA CORRIENTE'),
('TRANSFERENCIA BANCARIA');

INSERT INTO status_check_in (estado, descripcion) VALUES
('No realizado', 'El check-in no se ha realizado aún.'),
('Realizado', 'El check-in se ha completado correctamente.'),
('Fallido', 'El check-in no se ha completado debido a un error o problema.'),
('Cancelado', 'El check-in ha sido cancelado por el pasajero o la aerolínea.');

INSERT INTO rol (rol) VALUES
('Piloto'),
('Azafata'),
('Administrador'),
('Operador de tierra'),
('Mantenimiento'),
('Agente de ventas');
