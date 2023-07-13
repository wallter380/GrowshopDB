/*Creacion de la base de datos GROWSHOP*/

CREATE SCHEMA IF NOT EXISTS growshop;

/*Seleccionamos la base de datos mercado con el comando use para poder trabajar sobre la misma*/

USE growshop;

                         /*Creacion de las tablas*/

/*Creacion de Cliente*/

CREATE TABLE IF NOT EXISTS cliente(
	ID_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY(ID_cliente)
);

/*Creacion de Repartidor*/

CREATE TABLE IF NOT EXISTS repartidor(
	ID_repartidor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    vehiculo VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY(ID_repartidor)
);

/*Creacion del proveedor*/

CREATE TABLE IF NOT EXISTS proveedor(
	ID_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    cuit INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID_proveedor)
);

/*Creacion de Producto*/

CREATE TABLE IF NOT EXISTS producto(
	ID_producto INT NOT NULL AUTO_INCREMENT,
    precio_unidad FLOAT NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    ID_proveedor INT NOT NULL,
    PRIMARY KEY(ID_producto)
);

/*Creacion de Pedido*/

CREATE TABLE IF NOT EXISTS pedido(
	ID_pedido INT NOT NULL AUTO_INCREMENT,
    ID_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    ID_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unidad FLOAT NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    total FLOAT NOT NULL,
    ID_pago INT NOT NULL,
    PRIMARY KEY(ID_pedido)
);

/*Creacion de Pago*/

CREATE TABLE IF NOT EXISTS pago(
	ID_pago INT NOT NULL AUTO_INCREMENT,
    ID_cliente INT NOT NULL, 
    metodo_pago VARCHAR(50) NOT NULL,
    total FLOAT NOT NULL,
    PRIMARY KEY(ID_pago)
);

/*Creacion de Envios*/

CREATE TABLE IF NOT EXISTS envio(
	ID_envio INT NOT NULL AUTO_INCREMENT,
    ID_repartidor INT NOT NULL,
    ID_cliente INT NOT NULL,
    ID_pedido INT NOT NULL,
    fecha_envio DATE NOT NULL,
    costo_envio INT NOT NULL,
    PRIMARY KEY(ID_envio)
);


    /*Asignacion de FK pedido*/

ALTER TABLE pedido
ADD FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
ADD FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
        /*Asignacion de FK producto*/

ALTER TABLE producto
ADD FOREIGN KEY (ID_proveedor) REFERENCES proveedor(ID_proveedor)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    

 
    /*Asignacion de FK envio*/

ALTER TABLE envio
ADD FOREIGN KEY (ID_repartidor) REFERENCES repartidor(ID_repartidor),
ADD  FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
ADD FOREIGN KEY (ID_pedido) REFERENCES pedido(ID_pedido)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION; 
    
    /*Asignacion de FK pago*/

ALTER TABLE pago
ADD FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION; 
    
USE growshop;

-- Inserción de datos en la tabla "cliente"
INSERT INTO cliente (nombre, apellido, DNI, direccion, email, fecha_nacimiento)
VALUES
    ('Juan', 'Pérez', '12345678', 'Avenida San Martín 123, San Martín', 'juan@example.com', '2000-01-01'),
    ('María', 'Gómez', '87654321', 'Alvear 456, Villa Ballester', 'maria@example.com', '1995-03-15'),
    ('Pedro', 'López', '45678912', 'Triunvirato 789, Villa Urquiza', 'pedro@example.com', '1988-07-22'),
    ('Laura', 'Torres', '98765432', 'Chivilcoy 2345, Villa Devoto', 'laura@example.com', '1999-11-30'),
    ('Carlos', 'Sánchez', '54321678', 'Rivadavia 6789, Ciudadela', 'carlos@example.com', '1990-05-10'),
    ('Ana', 'Rodríguez', '87654321', 'Lynch 432, Villa Lynch', 'ana@example.com', '1993-08-25'),
    ('Luis', 'García', '12349876', 'Avenida San Martín 987, San Martín', 'luis@example.com', '1985-02-14'),
    ('Sofía', 'López', '98761234', 'Alberdi 543, Villa Ballester', 'sofia@example.com', '1992-09-12'),
    ('Diego', 'Martínez', '23456789', 'Los Incas 7890, Villa Urquiza', 'diego@example.com', '1997-04-03'),
    ('Isabella', 'Hernández', '67891234', 'Beiro 4321, Villa Devoto', 'isabella@example.com', '1998-12-08'),
    ('Alejandro', 'Fernández', '34567891', 'General Paz 654, Ciudadela', 'alejandro@example.com', '1991-06-18'),
    ('Valentina', 'González', '89123456', 'San Martín 321, Villa Lynch', 'valentina@example.com', '1989-10-05'),
    ('Andrés', 'Ramírez', '45678912', 'Avenida San Martín 876, San Martín', 'andres@example.com', '1996-03-22'),
    ('Camila', 'Pérez', '91234567', 'Sucre 543, Villa Ballester', 'camila@example.com', '1994-07-11'),
    ('Mateo', 'Gómez', '67891234', 'Congreso 987, Villa Urquiza', 'mateo@example.com', '1993-01-30'),
    ('Lucía', 'López', '34567891', 'Nogoyá 234, Villa Devoto', 'lucia@example.com', '1992-05-20'),
    ('Daniel', 'Sánchez', '89123456', 'General Mosconi 8765, Ciudadela', 'daniel@example.com', '1997-09-28'),
    ('Valeria', 'Hernández', '23456789', 'José León Suárez 5432, Villa Lynch', 'valeria@example.com', '1996-02-17'),
    ('Emilio', 'Fernández', '91234567', 'Avenida San Martín 1234, San Martín', 'emilio@example.com', '1995-06-07'),
    ('Renata', 'González', '45678912', 'Márquez 4321, Villa Ballester', 'renata@example.com', '1994-10-26'),
    ('Leo', 'Cardoso', 38123456, 'Valentin Gomez 517, Villa Lynch', 'eze.cardo@ejemplo.com', '1993-01-03'),
    ('Juan', 'Perez', '11111111', 'Av. Corrientes 123', 'juan.perez@example.com', '2000-01-01'),
    ('María', 'López', '22222222', 'Calle Rivadavia 456', 'maria.lopez@example.com', '1999-02-15'),
    ('Pedro', 'Gómez', '33333333', 'Av. Santa Fe 789', 'pedro.gomez@example.com', '2002-05-10'),
    ('Ana', 'Fernández', '44444444', 'Calle Florida 987', 'ana.fernandez@example.com', '2001-06-20'),
    ('Luis', 'Rodríguez', '55555555', 'Av. Córdoba 321', 'luis.rodriguez@example.com', '2000-09-03'),
    ('Laura', 'González', '66666666', 'Calle Corrientes 654', 'laura.gonzalez@example.com', '2003-08-12'),
    ('Carlos', 'Silva', '77777777', 'Av. Rivadavia 1111', 'carlos.silva@example.com', '2002-11-25'),
    ('Marta', 'Martínez', '88888888', 'Calle Reconquista 222', 'marta.martinez@example.com', '2000-04-05'),
    ('Javier', 'López', '99999999', 'Av. Cabildo 333', 'javier.lopez@example.com', '2001-12-15'),
    ('Valeria', 'García', '10101010', 'Calle Sarmiento 444', 'valeria.garcia@example.com', '2002-07-28');

-- Inserción de datos en la tabla "proveedor"   
 
INSERT INTO proveedor (nombre, cuit, direccion, email)
VALUES
    ('delplataseeds', '12345678', 'Avenida San Martín 210, San Martín', 'juan@example.com'),
    ('Bellavita Cultivos', '87654321', 'Chacabuco 543, Villa Ballester', 'maria@example.com'),
    ('Distribuidora Pop', '56789012', 'Olazábal 789, Villa Urquiza', 'pedro@example.com');

-- Inserción de datos en la tabla "repartidor"

INSERT INTO repartidor (nombre, apellido, DNI, vehiculo, direccion, email, fecha_nacimiento)
VALUES
    ('Carlos', 'Gómez', '12345678', 'Camioneta', 'Nueva York 2345, Villa Devoto', 'carlos@example.com', '1990-05-15'),
    ('Ana', 'López', '87654321', 'Motocicleta', 'Rivadavia 4321, Ciudadela', 'ana@example.com', '1995-08-20'),
    ('Pedro', 'Ramírez', '56789012', 'Bicicleta', 'De la Guitarra 876, Villa Ballester', 'pedro@example.com', '1988-12-10'),
    ('Pedro', 'González', '11111111', 'Moto', 'Calle San Juan 123, Villa Ballester', 'pedro.gonzalez@example.com', '1990-05-01'),
    ('María', 'Rodríguez', '22222222', 'Camioneta chica', 'Calle San Luis 456, Villa Ballester', 'maria.rodriguez@example.com', '1992-08-15'),
    ('Javier', 'López', '33333333', 'Camioneta chica', 'Calle San Martín 789, Villa Ballester', 'javier.lopez@example.com', '1988-11-10');

-- Inserción de datos en la tabla "producto"

INSERT INTO producto (precio_unidad, tipo_producto, ID_proveedor)
VALUES
    ( 6000, 'Semillas de cannabis', 1),
    ( 1000, 'Fertilizantes Top Veg', 2),
    ( 1000, 'Fertilizantes Top Candy', 2),
    ( 1000, 'Fertilizantes Top Bloom', 2),
    ( 1000, 'Fertilizantes Enraizante Top', 2),
    ( 800, 'Macetas rocket 10L', 2),
    ( 1100, 'Macetas rocket 15L', 2),
    ( 3000, 'Sustrato 20L', 2),
    ( 9000, 'Sustrato 80L', 2),
    ( 1200, 'Pipas', 3),
    ( 2000, 'Grinders', 3),
    ( 600, 'Papelillo OCB', 3),
    ( 800, 'Papelillo Celulosa', 3),
    ( 80000, 'Luces de cultivo', 2),
    ( 120000, 'Luces de cultivo', 2),
    ( 1200, 'Filtros de carbón activado', 2),
    ( 50000, 'Armarios de cultivo', 2);

-- Inserción de datos en la tabla "pedido"

INSERT INTO pedido (ID_cliente, fecha_pedido, ID_producto, cantidad, precio_unidad, metodo_pago, total, ID_pago) 
VALUES
	(1, '2023-05-01', 2, 1, 1000, 'Mercado pago', 2000, 1),
	(2, '2023-05-02', 2, 1, 1000, 'Mercado pago', 2000, 2),
	(3, '2023-05-03', 3, 1, 1000, 'Efectivo', 1000, 3),
	(4, '2023-05-04', 4, 1, 1000, 'Efectivo', 1000, 4),
	(5, '2023-05-05', 17, 2, 50000, 'Mercado pago', 100000, 5),
	(6, '2023-05-06', 6, 4, 800, 'Mercado pago', 3200, 6),
	(7, '2023-05-07', 7, 3, 1100, 'Efectivo', 3300, 7),
	(8, '2023-05-08', 8, 2, 3000, 'Efectivo', 6000, 8),
	(9, '2023-05-09', 14, 1, 80000, 'Efectivo', 80000, 9),
	(10, '2023-05-10', 10, 4, 1200, 'Mercado pago', 4800, 10),
	(11, '2023-05-11', 1, 2, 6000, 'Efectivo', 12000, 11),
	(12, '2023-05-12', 15, 1, 120000, 'Mercado pago', 120000, 12),
	(13, '2023-05-13', 13, 1, 800, 'Efectivo', 800, 13),
	(14, '2023-05-14', 17, 2, 50000, 'Mercado pago', 100000, 14),
	(15, '2023-05-15', 15, 1, 120000, 'Mercado pago', 120000, 15),
	(16, '2023-05-16', 6, 3, 800, 'Efectivo', 2400, 16),
	(17, '2023-05-17', 7, 2, 1100, 'Efectivo', 2200, 17),
	(18, '2023-05-18', 14, 2, 80000, 'Mercado pago', 160000, 18),
	(19, '2023-05-19', 9, 1, 9000, 'Mercado pago', 9000, 19),
	(20, '2023-05-20', 2, 2, 1000, 'Efectivo', 2000, 20),
	(1, '2023-05-21', 6, 2, 800, 'Mercado pago', 1600, 21),
	(2, '2023-05-22', 2, 1, 1000, 'Efectivo', 1000, 22),
	(3, '2023-05-23', 2, 2, 1000, 'Mercado pago', 2000, 23),
	(4, '2023-05-24', 14, 1, 80000, 'Efectivo', 80000, 24),
	(5, '2023-05-25', 5, 1, 1000, 'Mercado pago', 1000, 25),
	(6, '2023-05-26', 6, 3, 800, 'Mercado pago', 2400, 26),
	(7, '2023-05-27', 7, 2, 1100, 'Efectivo', 2200, 27),
	(8, '2023-05-28', 8, 1, 3000, 'Efectivo', 3000, 28),
	(9, '2023-05-29', 9, 3, 9000, 'Mercado pago', 27000, 29),
	(1, '2023-05-30', 10, 2, 1200, 'Efectivo', 2400, 30),
	(10, '2023-05-31', 11, 1, 2000, 'Mercado pago', 2000, 31),
	(12, '2023-06-01', 12, 4, 600, 'Mercado pago', 2400, 32),
	(3, '2023-06-02', 5, 2, 1000, 'Efectivo', 2000, 33),
	(4, '2023-06-03', 3, 1, 1000, 'Efectivo', 1000, 34),
	(15, '2023-06-04', 4, 1, 1000, 'Mercado pago', 1000, 35),
	(6, '2023-06-05', 6, 2, 800, 'Mercado pago', 1600, 36),
	(7, '2023-06-06', 7, 1, 1100, 'Efectivo', 1100, 37),
	(8, '2023-06-07', 8, 3, 3000, 'Mercado pago', 9000, 38),
	(9, '2023-06-08', 9, 2, 9000, 'Efectivo', 18000, 39),
	(4, '2023-06-09', 6, 4, 800, 'Efectivo', 3200, 40),
	(12, '2023-06-10', 12, 3, 600, 'Efectivo', 1800, 41),
	(2, '2023-06-11', 2, 2, 1000, 'Mercado pago', 2000, 42),
	(13, '2023-06-12', 13, 1, 800, 'Mercado pago', 800, 43),
	(14, '2023-06-13', 14, 1, 80000, 'Mercado pago', 80000, 44),
	(15, '2023-06-14', 5, 2, 1000, 'Mercado pago', 2000, 45),
	(16, '2023-06-15', 6, 3, 800, 'Mercado pago', 1800, 46),
	(17, '2023-06-16', 7, 1, 1100, 'Mercado pago', 1100, 47),
	(18, '2023-06-17', 8, 2, 3000, 'Efectivo', 6000, 48),
	(19, '2023-06-18', 9, 1, 9000, 'Mercado pago', 9000, 49),
	(10, '2023-06-19', 10, 5, 1200, 'Mercado pago', 6000, 50),
	(11, '2023-06-20', 1, 3, 6000, 'Mercado pago', 18000, 51),
	(12, '2023-06-21', 2, 2, 1000, 'Efectivo', 2000, 52),
	(13, '2023-06-22', 3, 1, 1000, 'Mercado pago', 1000, 53),
	(14, '2023-06-23', 4, 1, 1000, 'Mercado pago', 1000, 54),
	(15, '2023-06-24', 5, 1, 1000, 'Mercado pago', 1000, 55)
;

-- Inserción de datos en la tabla "pago"

INSERT INTO pago (ID_cliente, metodo_pago, total) 
VALUES
	 (1, 'Mercado pago', 2000),
	 (2, 'Mercado pago', 2000),
	 (3, 'Efectivo', 1000),
	 (4, 'Efectivo', 1000),
	 (5, 'Mercado pago', 100000),
	 (6, 'Mercado pago', 3200),
	 (7, 'Efectivo', 3300),
	 (8, 'Efectivo', 6000),
	 (9, 'Efectivo', 80000),
	 (10, 'Mercado pago', 4800),
	 (11, 'Efectivo', 12000),
	 (12, 'Mercado pago', 120000),
	 (13, 'Efectivo', 800),
	 (14, 'Mercado pago', 100000),
	 (15, 'Mercado pago', 120000),
	 (16, 'Efectivo', 2400),
	 (17, 'Efectivo', 2200),
	 (18, 'Mercado pago', 160000),
	 (19, 'Mercado pago', 9000),
	 (20, 'Efectivo', 2000),
	 (1,  'Mercado pago', 1600),
	 (2,  'Efectivo', 1000),
	 (3,  'Mercado pago', 2000),
	 (4, 'Efectivo', 80000),
	 (5, 'Mercado pago', 1000),
	 (6, 'Mercado pago', 2400),
	 (7, 'Efectivo', 2200),
	 (8, 'Efectivo', 3000),
	 (9, 'Mercado pago', 27000),
	 (1, 'Efectivo', 2400),
	 (10,'Mercado pago', 2000),
	 (12, 'Mercado pago', 2400),
	 (3, 'Efectivo', 2000),
	 (4, 'Efectivo', 1000),
	 (15, 'Mercado pago', 1000),
	 (6, 'Mercado pago', 1600),
	 (7, 'Efectivo', 1100),
	 (8, 'Mercado pago', 9000),
	 (9, 'Efectivo', 18000),
	 (4, 'Efectivo', 3200),
	 (12, 'Efectivo', 1800),
	 (2, 'Mercado pago', 2000),
	 (13, 'Mercado pago', 800),
	 (14, 'Mercado pago', 80000),
	 (15, 'Mercado pago', 2000),
	 (16, 'Mercado pago', 1800),
	 (17, 'Mercado pago', 1100),
	 (18, 'Efectivo', 6000),
	 (19, 'Mercado pago', 9000),
	 (10, 'Mercado pago', 6000),
	 (11, 'Mercado pago', 18000),
	 (12, 'Efectivo', 2000),
	 (13, 'Mercado pago', 1000),
	 (14, 'Mercado pago', 1000),
	 (15, 'Mercado pago', 1000)
;

-- Inserción de datos en la tabla "envio"

INSERT INTO envio (ID_repartidor, ID_cliente, ID_pedido, fecha_envio, costo_envio) VALUES
(2, 3, 3, '2023-05-04', 850),
(3, 6, 6, '2023-05-07', 700),
(2, 9, 9, '2023-05-10', 900),
(1, 14, 14, '2023-05-15', 1500),
(2, 15, 15, '2023-05-16', 900),
(1, 19, 19, '2023-05-20', 1500),
(1, 9, 29, '2023-06-04', 1500),
(2, 15, 35, '2023-06-05', 900),
(2, 12, 41, '2023-06-10', 800),
(1, 18, 48, '2023-06-18', 800)
;

INSERT INTO pago (ID_cliente, metodo_pago, total) 
VALUES
	 (1, 'Mercado pago', 2000);
     
USE growshop;

-- Creacion FUNCION

DELIMITER //

CREATE FUNCTION VerificarClienteStatus(Cliente INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
    DECLARE CantidadPedidos INT;

    SELECT COUNT(*) 
    FROM pedido
    WHERE ID_cliente = Cliente
	INTO CantidadPedidos;
    
    IF CantidadPedidos < 3 THEN
        RETURN 'Cliente irregular';
    ELSEIF CantidadPedidos >= 3 AND CantidadPedidos <= 5 THEN
        RETURN 'Cliente regular';
    ELSE
        RETURN 'Cliente plus';
    END IF;
END //

DELIMITER ;

-- Creacion FUNCION 2

DELIMITER //

CREATE FUNCTION ObtenerProductosPorCliente(ID_cliente INT)
RETURNS VARCHAR(200)
READS SQL DATA
BEGIN
    DECLARE Productos VARCHAR(200);

    SELECT GROUP_CONCAT(DISTINCT p.tipo_producto SEPARATOR ', ') 
    FROM pedido pe
    INNER JOIN producto p ON pe.ID_producto = p.ID_producto
    WHERE pe.ID_cliente = ID_cliente
	INTO Productos;
    
    RETURN Productos;
END //

DELIMITER ;

-- 1 S.P. Este SP permite insertar un nuevo cliente en la tabla "cliente" con los datos proporcionados: nombre, apellido, DNI, dirección, email y fecha_nacimiento la cual usa formato `yyyy-mm-dd`.

DELIMITER //
CREATE PROCEDURE Insert_cliente(
  IN nombre VARCHAR(50),
  IN apellido VARCHAR(50),
  IN DNI INT,
  IN direccion VARCHAR(50),
  IN email VARCHAR(40),
  IN fecha_nacimiento DATE
)
BEGIN
  INSERT INTO cliente (nombre, apellido, DNI, direccion, email, fecha_nacimiento)
  VALUES (nombre, apellido, DNI, direccion, email, fecha_nacimiento);
END//
DELIMITER ;

-- 2 S.P.

DELIMITER //
CREATE PROCEDURE Aumentar_Precio(
  IN ID_producto INT,
  IN porcentaje_aumento FLOAT
)
BEGIN
  DECLARE precio_original FLOAT;
  DECLARE nuevo_precio FLOAT;
  
  -- Obtener el precio_unidad original
  SELECT precio_unidad INTO precio_original
  FROM producto
  WHERE ID_producto = ID_producto
  LIMIT 1;
  
  -- Calcular el nuevo precio con el aumento
  SET nuevo_precio = precio_original + (precio_original * porcentaje_aumento / 100);
  
  -- Actualizar el precio_unidad en la tabla "producto"
  UPDATE producto
  SET precio_unidad = nuevo_precio
  WHERE ID_producto = ID_producto
  LIMIT 1;
  
  SELECT nuevo_precio AS precio_actualizado;
END //
DELIMITER ;

-- 3 S.P.

DELIMITER //

CREATE PROCEDURE insertar_pedido(
    IN cliente_id INT,
    IN producto_id INT,
    IN cantidad INT,
    IN fecha_pedido DATE,
    IN metodo_pago VARCHAR(50)
)
BEGIN
    DECLARE valor_unidad FLOAT;
    DECLARE total FLOAT;

    -- Obtener el valor_unidad del producto utilizando el ID_producto
    SELECT precio_unidad INTO valor_unidad FROM producto WHERE ID_producto = producto_id;

    -- Calcular el total del pedido (valor_unidad * cantidad)
    SET total = valor_unidad * cantidad;

    -- Insertar en la tabla "pedido"
    INSERT INTO pedido (ID_cliente, fecha_pedido, ID_producto, cantidad, precio_unidad, metodo_pago, total, ID_pago)
    VALUES (cliente_id, fecha_pedido, producto_id, cantidad, valor_unidad, metodo_pago, total, 0);
END //

DELIMITER ;

USE growshop;

--- Triggers para cliente
-- Creacion tabla new_cliente

CREATE TABLE IF NOT EXISTS new_cliente(
	ID_new_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY (ID_new_cliente)
);

-- Creacion Trigger para que cada vez que se inserte un nuevo cliente a la tabla cliente, le cambie la primer letra del nombre y del apellido por la letra en mayuscula.

DELIMITER //

-- Crear el trigger
CREATE TRIGGER `tr_add_new_cliente_capi`
BEFORE INSERT ON `cliente`
FOR EACH ROW
BEGIN
    -- Capitalizar la primera letra del nombre
    SET NEW.nombre = CONCAT(UPPER(SUBSTRING(NEW.nombre, 1, 1)), LOWER(SUBSTRING(NEW.nombre FROM 2)));

    -- Capitalizar la primera letra del apellido
    SET NEW.apellido = CONCAT(UPPER(SUBSTRING(NEW.apellido, 1, 1)), LOWER(SUBSTRING(NEW.apellido FROM 2)));
END //

DELIMITER ;

-- Creacion Trigger para que cada vez que se inserte un nuevo cliente a la tabla cliente, tambien se guarde al nuevo cliente en la tabla new_cliente

CREATE TRIGGER `tr_add_new_cliente`
AFTER INSERT ON `cliente`
FOR EACH ROW
INSERT INTO `new_cliente`(nombre, apellido, DNI, direccion, email, fecha_nacimiento) 
VALUES (NEW.nombre, NEW.apellido, NEW.DNI, NEW.direccion, NEW.email, NEW.fecha_nacimiento);

--- Triggers para producto
-- Creacion tabla new_producto

CREATE TABLE IF NOT EXISTS new_producto(
	ID_new_producto INT NOT NULL AUTO_INCREMENT,
    precio_unidad FLOAT NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    ID_proveedor INT NOT NULL,
    PRIMARY KEY(ID_new_producto)
);

-- Creacion Trigger para que cada vez que se inserte un nuevo producto a la tabla producto, tambien se guarde al nuevo producto en la tabla new_producto

CREATE TRIGGER `tr_add_new_producto`
AFTER INSERT ON `producto`
FOR EACH ROW
INSERT INTO `new_producto`(precio_unidad, tipo_producto, ID_proveedor) 
VALUES (NEW.precio_unidad, NEW.tipo_producto, NEW.ID_proveedor);

--- Triggers para proveedor
-- Creacion tabla new_proveedor

CREATE TABLE IF NOT EXISTS new_proveedor(
	ID_new_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    cuit INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID_new_proveedor)
);

-- Creacion Trigger para que cada vez que se inserte un nuevo proveedor a la tabla proveedor, tambien se guarde al nuevo proveedor en la tabla new_proveedor

CREATE TRIGGER `tr_add_new_proveedor`
AFTER INSERT ON `proveedor`
FOR EACH ROW
INSERT INTO `new_proveedor`(nombre, cuit, direccion, email) 
VALUES (NEW.nombre, NEW.cuit, NEW.direccion, NEW.email);

INSERT INTO proveedor (nombre, cuit, direccion, email)
VALUES
    ('Distribuidora Papushhka', '96789012', 'Ibera 2789, Villa Urquiza', 'pedro_papushhka@example.com');
    
    
DELIMITER //

CREATE TRIGGER before_insert_pedido
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
    DECLARE valor_unidad FLOAT;
    DECLARE id_pago INT;
    
    -- Obtener el valor_unidad del producto utilizando el ID_producto
    SELECT precio_unidad INTO valor_unidad FROM producto WHERE ID_producto = NEW.ID_producto;
    
    -- Calcular el total del pedido (valor_unidad * cantidad)
    SET NEW.total = valor_unidad * NEW.cantidad;
    
    -- Insertar en la tabla "pago" con el método de pago utilizado por el cliente
    INSERT INTO pago (ID_cliente, metodo_pago, total) VALUES (NEW.ID_cliente, NEW.metodo_pago, NEW.total);
    
    -- Obtener el ID_pago generado
    SET id_pago = LAST_INSERT_ID();
    
    -- Insertar el ID_pago en el pedido
    SET NEW.ID_pago = id_pago;
END //

DELIMITER ;

USE growshop;

-- Creacion de vistas 1

CREATE VIEW vista_cliente_pedidos AS
SELECT p.ID_cliente, c.nombre, c.apellido, COUNT(p.ID_pedido) AS cantidad_pedidos
FROM pedido p
INNER JOIN cliente c ON p.ID_cliente = c.ID_cliente
GROUP BY p.ID_cliente, c.nombre, c.apellido;

SELECT * FROM vista_cliente_pedidos;
    
-- Creacion de vistas 2    
    
CREATE VIEW vista_cliente_pagos AS
SELECT p.ID_cliente, c.nombre, c.apellido,
    COUNT(CASE WHEN p.metodo_pago = 'Efectivo' THEN p.ID_pedido END) AS cantidad_pedidos_efectivo,
    COUNT(CASE WHEN p.metodo_pago = 'Mercado Pago' THEN p.ID_pedido END) AS cantidad_pedidos_mercado_pago
FROM pedido p
INNER JOIN cliente c ON p.ID_cliente = c.ID_cliente
GROUP BY p.ID_cliente, c.nombre, c.apellido;

SELECT * FROM vista_cliente_pagos;

-- Creacion de vistas 3

CREATE VIEW vista_producto_ventas AS
SELECT p.ID_producto, p.tipo_producto, SUM(pe.cantidad) AS cantidad_vendida
FROM producto p
INNER JOIN pedido pe ON p.ID_producto = pe.ID_producto
GROUP BY p.ID_producto, p.tipo_producto;

SELECT * FROM vista_producto_ventas;

-- Creacion de vistas 4

CREATE VIEW vista_repartidor_pedidos AS
SELECT r.ID_repartidor, p.ID_cliente, pr.tipo_producto, p.ID_pedido, p.fecha_pedido, e.fecha_envio
FROM pedido p
INNER JOIN producto pr ON p.ID_producto = pr.ID_producto
INNER JOIN envio e ON p.ID_pedido = e.ID_pedido
INNER JOIN repartidor r ON e.ID_repartidor = r.ID_repartidor;

SELECT * FROM vista_repartidor_pedidos;

-- Creacion de vistas 5

CREATE VIEW vista_cliente_compras AS
SELECT c.ID_cliente, c.nombre, c.apellido, p.ID_producto, p.tipo_producto, COUNT(*) AS cantidad_compras
FROM cliente c
INNER JOIN pedido pe ON c.ID_cliente = pe.ID_cliente
INNER JOIN producto p ON pe.ID_producto = p.ID_producto
GROUP BY c.ID_cliente, c.nombre, c.apellido, p.ID_producto, p.tipo_producto
ORDER BY ID_cliente ASC;

SELECT * FROM vista_cliente_compras;