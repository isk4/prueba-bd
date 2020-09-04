-- Ingresar a PSQL
psql 

-- Crear base de datos 
CREATE DATABASE prueba;

-- Conectarse a la base de datos
\c prueba

-- Crear tabla facturas
CREATE TABLE facturas(
    id SERIAL PRIMARY KEY,
    subtotal FLOAT NOT NULL,
    iva FLOAT NOT NULL,
    precio_total FLOAT NOT NULL
);

-- Crear tabla clientes
CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    rut VARCHAR(9) UNIQUE NOT NULL,
    direccion VARCHAR(100)
);

-- Crear tabla relación clientes_facturas
CREATE TABLE clientes_facturas(
    cliente_id INT NOT NULL,
    factura_id INT NOT NULL,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id),
    FOREIGN KEY(factura_id) REFERENCES facturas(id)
);

-- Crear tabla productos
CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion VARCHAR(100),
    valor_unitario FLOAT NOT NULL
);

-- Crear tabla categorías
CREATE TABLE categorias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion VARCHAR(100)
);

-- Crear tabla relación categorías_productos
CREATE TABLE categorias_productos(
    categoria_id INT NOT NULL,
    producto_id INT UNIQUE NOT NULL,
    FOREIGN KEY(categoria_id) REFERENCES categorias(id),
    FOREIGN KEY(producto_id) REFERENCES productos(id)
);

-- Crear tabla intermedia listado_productos que relaciona facturas con productos y almacena datos sobre la relación;
CREATE TABLE listado_productos(
    factura_id INT NOT NULL,
    producto_id INT NOT NULL,
    precio_unitario FLOAT NOT NULL,
    cantidad INT NOT NULL,
    total_producto FLOAT NOT NULL,
    FOREIGN KEY(factura_id) REFERENCES facturas(id),
    FOREIGN KEY(producto_id) REFERENCES productos(id)
);

-- Insertar información tabla clientes
INSERT INTO clientes(nombre, rut, direccion) VALUES
    ('Jorge Lobos', '103948472', 'Lo Ovalle 12'),
    ('Paula Reyes', '183847363', 'Chacabuco 243'),
    ('Monica Lagos', '123847362', 'Calera 4957'),
    ('Pedro Casas', '192734981', 'Manantial 400'),
    ('Pablo Garcia', '102834762', 'Curico 393');

-- Insertar información tabla productos
INSERT INTO productos(nombre, valor_unitario) VALUES
    ('saxo alto', 350000),
    ('bateria', 550000),
    ('guitarra', 300000),
    ('ukelele', 70000),
    ('flauta', 10000),
    ('armonica', 8500),
    ('metalofono', 10000),
    ('bajo', 280000);

-- Insertar información tabla categorías
INSERT INTO categorias(nombre)
VALUES ('cuerda'), ('percusion'), ('viento');

-- Insertar información tabla facturas
INSERT INTO facturas(fecha, subtotal, iva, precio_total) VALUES
    ('2018-12-01', 900000, 171000, 1071000),
    ('2011-05-28', 380000, 72200, 452200),
    ('2019-04-27', 298500, 56715, 355215),
    ('2013-06-06', 900000, 171000, 1071000),
    ('2010-01-05', 380000, 72200, 452200),
    ('2011-03-04', 8500, 1615, 10115),
    ('2009-10-14', 290000, 55100, 345100),
    ('2003-12-19', 1200000, 228000, 1428000),
    ('2001-10-22', 98500, 18715, 117215),
    ('2020-07-01', 280000, 53200, 333200);

-- Insertar información tabla categorias_productos
INSERT INTO categorias_productos(categoria_id, producto_id)
VALUES(3, 1), (3, 5), (3, 6), (2, 2), (2, 7), (1, 3), (1, 4), (1, 8);

-- Insertar información tabla listado_productos
INSERT INTO listado_productos(factura_id, producto_id, precio_unitario, cantidad, total_producto) VALUES
    (1, 1, 350000, 1, 350000),
    (1, 2, 550000, 1, 550000),
    (2, 3, 300000, 1, 300000),
    (2, 4, 70000, 1, 70000),
    (2, 5, 10000, 1, 10000),
    (3, 6, 8500, 1, 8500),
    (3, 7, 10000, 1, 10000),
    (3, 8, 280000, 1, 280000),
    (4, 1, 350000, 1, 350000),
    (4, 2, 550000, 1, 550000),
    (5, 3, 300000, 1, 300000),
    (5, 4, 70000, 1, 70000),
    (5, 5, 10000, 1, 10000),
    (6, 6, 8500, 1, 8500),
    (7, 7, 10000, 1, 10000),
    (7, 8, 280000, 1, 280000),
    (8, 1, 350000, 1, 350000),
    (8, 2, 550000, 1, 550000),
    (8, 3, 300000, 1, 300000),
    (9, 4, 70000, 1, 70000),
    (9, 5, 10000, 1, 10000),
    (9, 6, 8500, 1, 8500),
    (9, 7, 10000, 1, 10000),
    (10, 8, 280000, 1, 280000);