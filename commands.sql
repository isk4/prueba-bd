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
    descripcion VARCHAR(100)
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