USE nyc_air;

-- Insertando datos en la tabla de fabricantes
INSERT INTO fabricante (nombre) VALUES
('Boeing'),
('Airbus'),
('Embraer'),
('Bombardier'),
('Cessna');

-- Insertando datos en la tabla de modelos
INSERT INTO modelo (nombre, id_fabricante) VALUES
-- Modelos de Boeing
('737 MAX', 1),
('747', 1),
('777', 1),
('787 Dreamliner', 1),
-- Modelos de Airbus
('A320', 2),
('A330', 2),
('A350', 2),
('A380', 2),
-- Modelos de Embraer
('E175', 3),
('E190', 3),
('E195', 3),
('Legacy 600', 3),
-- Modelos de Bombardier
('CRJ200', 4),
('CRJ700', 4),
('CRJ900', 4),
('Global 7500', 4),
-- Modelos de Cessna
('Citation X', 5),
('Citation XLS+', 5),
('Citation Latitude', 5),
('Citation Sovereign+', 5);

-- Insertando datos en la tabla de aviones
INSERT INTO avion (codigo, id_modelo) VALUES
-- Aviones del modelo Boeing 737 MAX
('B737MAX-001', 1),
('B737MAX-002', 1),
('B737MAX-003', 1),
-- Aviones del modelo Boeing 747
('B747-001', 2),
('B747-002', 2),
('B747-003', 2),
-- Aviones del modelo Boeing 777
('B777-001', 3),
('B777-002', 3),
('B777-003', 3),
-- Aviones del modelo Boeing 787 Dreamliner
('B787-001', 4),
('B787-002', 4),
('B787-003', 4),
-- Aviones del modelo Airbus A320
('A320-001', 5),
('A320-002', 5),
('A320-003', 5),
-- Aviones del modelo Airbus A330
('A330-001', 6),
('A330-002', 6),
('A330-003', 6),
-- Aviones del modelo Airbus A350
('A350-001', 7),
('A350-002', 7),
('A350-003', 7),
-- Aviones del modelo Airbus A380
('A380-001', 8),
('A380-002', 8),
('A380-003', 8),
-- Aviones del modelo Embraer E175
('E175-001', 9),
('E175-002', 9),
('E175-003', 9),
-- Aviones del modelo Embraer E190
('E190-001', 10),
('E190-002', 10),
('E190-003', 10),
-- Aviones del modelo Embraer E195
('E195-001', 11),
('E195-002', 11),
('E195-003', 11),
-- Aviones del modelo Embraer Legacy 600
('Legacy600-001', 12),
('Legacy600-002', 12),
('Legacy600-003', 12),
-- Aviones del modelo Bombardier CRJ200
('CRJ200-001', 13),
('CRJ200-002', 13),
('CRJ200-003', 13),
-- Aviones del modelo Bombardier CRJ700
('CRJ700-001', 14),
('CRJ700-002', 14),
('CRJ700-003', 14),
-- Aviones del modelo Bombardier CRJ900
('CRJ900-001', 15),
('CRJ900-002', 15),
('CRJ900-003', 15),
-- Aviones del modelo Bombardier Global 7500
('Global7500-001', 16),
('Global7500-002', 16),
('Global7500-003', 16),
-- Aviones del modelo Cessna Citation X
('CitationX-001', 17),
('CitationX-002', 17),
('CitationX-003', 17),
-- Aviones del modelo Cessna Citation XLS+
('CitationXLS+-001', 18),
('CitationXLS+-002', 18),
('CitationXLS+-003', 18),
-- Aviones del modelo Cessna Citation Latitude
('CitationLatitude-001', 19),
('CitationLatitude-002', 19),
('CitationLatitude-003', 19),
-- Aviones del modelo Cessna Citation Sovereign+
('CitationSovereign+-001', 20),
('CitationSovereign+-002', 20),
('CitationSovereign+-003', 20);
