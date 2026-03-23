-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Tabla de Libros
CREATE TABLE IF NOT EXISTS libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

-- Tabla de Préstamos
CREATE TABLE IF NOT EXISTS prestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_prestamo DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_devolucion DATETIME NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (libro_id) REFERENCES libros(id) ON DELETE CASCADE
);

-- Crear índices para optimizar búsquedas
CREATE INDEX idx_usuario_correo ON usuarios(correo);
CREATE INDEX idx_libro_autor ON libros(autor);
CREATE INDEX idx_libro_titulo ON libros(titulo);
CREATE INDEX idx_prestamo_usuario ON prestamos(usuario_id);
CREATE INDEX idx_prestamo_libro ON prestamos(libro_id);

-- Insertar datos de ejemplo
-- Usuarios
INSERT INTO usuarios (nombre, correo, password) VALUES
('Juan Pérez', 'juan@example.com', 'password123'),
('María García', 'maria@example.com', 'password456'),
('Carlos López', 'carlos@example.com', 'password789');

-- Libros
INSERT INTO libros (titulo, autor, anio, disponible) VALUES
('Don Quijote', 'Miguel de Cervantes', 1605, TRUE),
('Cien años de soledad', 'Gabriel García Márquez', 1967, TRUE),
('El Quijote', 'Miguel de Cervantes', 1605, FALSE),
('Orgullo y Prejuicio', 'Jane Austen', 1813, TRUE),
('La Casa de los Espíritus', 'Isabel Allende', 1982, TRUE);

-- Préstamos
INSERT INTO prestamos (usuario_id, libro_id, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2026-03-01', NULL),
(2, 2, '2026-02-15', '2026-03-20'),
(3, 4, '2026-03-10', NULL);
