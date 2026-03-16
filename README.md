# 📚 Biblioteca Digital UNTEC

Una aplicación web de gestión de biblioteca digital construida con **Java**, **Jakarta EE**, **JSP** y **MySQL**.

## 🎯 Descripción

Biblioteca Digital UNTEC es una aplicación web que permite a los usuarios:
- **Autenticarse** en el sistema
- **Ver el catálogo** de libros disponibles
- **Registrar préstamos** de libros
- **Gestionar su historial** de préstamos
- **(Admin)** Agregar nuevos libros a la biblioteca

## 📋 Requisitos Previos

Antes de ejecutar el proyecto, asegúrate de tener instalado:

- **Java 11+** (JDK)
- **Apache Maven 3.6+**
- **Apache Tomcat 10.1.52** (o compatible con Jakarta EE)
- **MySQL 8.0+**

### Verificar Instalaciones

```bash
java -version
mvn -version
mysql --version
```

## ⚙️ Configuración Inicial

### 1. Clonar/Descargar el Proyecto

```bash
cd "tu/ruta/del/proyecto"
cd biblioteca-digital
```

### 2. Crear la Base de Datos

Abre un terminal de MySQL y ejecuta:

```sql
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca;

```

### 3. Configurar Credenciales de Base de Datos

Edita el archivo `src/main/java/com/biblioteca/dao/ConexionBD.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3306/biblioteca";
private static final String USUARIO = "root";
private static final String CONTRASENA = "tu_contraseña_aqui"; // ← Cambiar aquí
```

## 🚀 Compilación y Despliegue

### 1. Compilar el Proyecto

```bash
cd biblioteca-digital
mvn clean package
```

Esto generará un archivo `WAR` en `target/biblioteca-digital.war`

### 2. Desplegar en Tomcat

**Opción A - Copia Manual:**

```bash
# Copiar el WAR a la carpeta webapps de Tomcat
copy target\biblioteca-digital.war C:\tomcat\webapps\

# Tomcat extraerá automáticamente el WAR en una carpeta
```

**Opción B - Gestor de Aplicaciones:**

1. Abre http://localhost:8080/manager/html
2. Sube el archivo `target/biblioteca-digital.war`
3. Presiona "Deploy"

## 🖥️ Ejecutar la Aplicación

### 1. Iniciar Tomcat

```bash
# Windows
C:\tomcat\bin\startup.bat

# Linux/Mac
./tomcat/bin/startup.sh
```

### 2. Acceder a la Aplicación

Abre tu navegador e ingresa a:

```
http://localhost:8080/biblioteca-digital/
```

## ✅ Credenciales de Prueba

Después de ejecutar `schema.sql`, puedes acceder con:

| Campo | Valor |
|-------|-------|
| **Email** | admin@biblioteca.com |
| **Contraseña** | 1234 |

## 📁 Estructura del Proyecto

```
biblioteca-digital/
├── src/
│   ├── main/
│   │   ├── java/com/biblioteca/
│   │   │   ├── servlets/          # Controladores HTTP
│   │   │   │   ├── UsuarioServlet.java
│   │   │   │   ├── LibroServlet.java
│   │   │   │   ├── PrestamoServlet.java
│   │   │   │   ├── AgregarLibroServlet.java
│   │   │   │   └── AgregarPrestamoServlet.java
│   │   │   ├── dao/               # Acceso a datos
│   │   │   │   ├── ConexionBD.java
│   │   │   │   ├── UsuarioDAO.java
│   │   │   │   ├── LibroDAO.java
│   │   │   │   └── PrestamoDAO.java
│   │   │   └── model/             # Modelos de datos
│   │   │       ├── Usuario.java
│   │   │       ├── Libro.java
│   │   │       └── Prestamo.java
│   │   ├── webapp/
│   │   │   ├── index.jsp          # Página de login
│   │   │   ├── catalogo.jsp       # Listado de libros
│   │   │   ├── prestamos.jsp      # Historial de préstamos
│   │   │   ├── agregar-libro.jsp  # Formulario para agregar libros
│   │   │   ├── agregar-prestamo.jsp # Formulario para registrar préstamos
│   │   │   └── WEB-INF/
│   │   │       └── web.xml        # Configuración de la aplicación
│   │   └── resources/
│   │       └── schema.sql         # Script de base de datos
│   └── test/
├── target/                         # Salida compilada (generada)
├── pom.xml                        # Configuración Maven
└── README.md                      # Este archivo
```

## 🔧 Arquitectura

El proyecto sigue el patrón **MVC (Model-View-Controller)**:

- **Model**: Clases en `com.biblioteca.model` (Usuario, Libro, Prestamo)
- **View**: Archivos JSP en `webapp/`
- **Controller**: Servlets en `com.biblioteca.servlets`
- **Data Access**: DAOs en `com.biblioteca.dao`

## 🗄️ Base de Datos

### Tablas Principales

**usuarios**
- `id` (INT, PRIMARY KEY)
- `nombre` (VARCHAR)
- `email` (VARCHAR, UNIQUE)
- `password` (VARCHAR)
- `fecha_registro` (TIMESTAMP)

**libros**
- `id` (INT, PRIMARY KEY)
- `titulo` (VARCHAR)
- `autor` (VARCHAR)
- `isbn` (VARCHAR, UNIQUE)
- `disponibles` (INT)

**prestamos**
- `id` (INT, PRIMARY KEY)
- `usuario_id` (INT, FOREIGN KEY)
- `libro_id` (INT, FOREIGN KEY)
- `fecha_prestamo` (TIMESTAMP)
- `fecha_vencimiento` (TIMESTAMP)
- `devuelto` (BOOLEAN)

## ⚡ Funcionalidades Principales

### 👤 Gestión de Usuarios
- ✅ Registro de nuevos usuarios
- ✅ Autenticación segura (login/logout)
- ✅ Sesiones de usuario

### 📚 Catálogo de Libros
- ✅ Ver todos los libros disponibles
- ✅ Verificar disponibilidad
- ✅ Información de autor e ISBN

### 📋 Gestión de Préstamos
- ✅ Registrar nuevo préstamo
- ✅ Ver historial personal de préstamos
- ✅ Control de devoluciones

### 🛠️ Administración
- ✅ Agregar nuevos libros (admin)
- ✅ Registrar nuevos préstamos

## 🐛 Solución de Problemas

### Error: "Base de datos no existe"
```bash
# Asegúrate de ejecutar schema.sql
mysql -u root -p < src/main/resources/schema.sql
```

### Error: "Conexión rechazada en puerto 3306"
```bash
# Verifica que MySQL está corriendo
mysql -u root -p -e "SELECT 1;"
```

### Error 404 al acceder a la aplicación
1. Verifica que Tomcat esté corriendo: http://localhost:8080/
2. Comprueba que el WAR está en `C:\tomcat\webapps\`
3. Reinicia Tomcat y espera a que despliegue (5-10 segundos)

### Error 500 en servlets
- Revisa los logs de Tomcat en `C:\tomcat\logs\catalina.log`
- Verifica las credenciales de MySQL en `ConexionBD.java`

## 📝 Notas Importantes

- ⚠️ **Jakarta EE**: Este proyecto usa Jakarta 6.0.0, compatible con Tomcat 10+
- ⚠️ **Java 11+**: Requiere JDK 11 o superior
- ⚠️ **Seguridad**: Las contraseñas deben ser hasheadas en producción
- ⚠️ **SSL**: Se recomienda usar HTTPS en producción

## 🔐 Mejoras Futuras

- [ ] Hash de contraseñas con BCrypt
- [ ] Autenticación con JWT
- [ ] Búsqueda avanzada de libros
- [ ] Notificaciones de devolución
- [ ] Panel de estadísticas
- [ ] API REST

## 📧 Contacto

Para preguntas o sugerencias sobre este proyecto, contacta al administrador.

---

**Última actualización:** 16 de Marzo de 2026  
**Versión:** 1.0  
**Estado:** ✅ Operativo

*Este Archivo fue creado por la inteligencia artificial Copilot*