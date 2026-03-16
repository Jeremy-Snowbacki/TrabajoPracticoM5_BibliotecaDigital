<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Catálogo de Libros - Biblioteca Digital UNTEC</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        .header h1 {
            margin: 0;
            font-size: 32px;
        }
        .user-info {
            text-align: right;
        }
        .nav-buttons {
            margin-top: 15px;
            text-align: right;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #667eea;
            text-align: center;
            margin-top: 0;
        }
        .btn, button, input[type="submit"] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin: 5px;
            display: inline-block;
        }
        .btn:hover, button:hover, input[type="submit"]:hover {
            opacity: 0.9;
            transform: scale(1.02);
            transition: all 0.3s ease;
        }
        .btn-logout {
            background: #dc3545;
        }
        .btn-prestamos {
            background: #28a745;
        }
        .btn-agregar {
            background: #17a2b8;
        }
        .btn:disabled, input[type="submit"]:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: scale(1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #667eea;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .sin-libros {
            text-align: center;
            color: #666;
            padding: 50px;
        }
        .tabla-acciones {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .tabla-acciones form {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-top">
            <h1>Biblioteca Digital UNTEC</h1>
            <c:if test="${not empty sessionScope.usuario}">
                <div class="user-info">
                    <p style="margin: 0;">Bienvenido, <strong><c:out value="${sessionScope.usuario.nombre}" /></strong></p>
                    <p style="margin: 5px 0 0 0; font-size: 14px;"><c:out value="${sessionScope.usuario.correo}" /></p>
                </div>
            </c:if>
        </div>
        <div class="nav-buttons">
            <a href="AgregarLibroServlet" class="btn btn-agregar">+ Agregar Libro</a>
            <a href="PrestamoServlet" class="btn btn-prestamos">Mis Préstamos</a>
            <a href="UsuarioServlet?accion=logout" class="btn btn-logout">Cerrar Sesión</a>
        </div>
    </div>

    <div class="container">
        <h2>Catálogo de Libros</h2>
        
        <c:choose>
            <c:when test="${empty listaLibros}">
                <div class="sin-libros">No hay libros disponibles en el catálogo</div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Año</th>
                            <th>Disponible</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="libro" items="${listaLibros}">
                            <tr>
                                <td>
                                    <c:out value="${libro.titulo}" />
                                </td>
                                <td>
                                    <c:out value="${libro.autor}" />
                                </td>
                                <td>
                                    <c:out value="${libro.anio}" />
                                </td>
                                <td>
                                    <c:if test="${libro.disponible}">
                                        <span style="color: green; font-weight: bold;">✓ Sí</span>
                                    </c:if>
                                    <c:if test="${!libro.disponible}">
                                        <span style="color: red; font-weight: bold;">✗ No</span>
                                    </c:if>
                                </td>
                                <td class="tabla-acciones">
                                    <c:if test="${libro.disponible}">
                                        <form action="AgregarPrestamoServlet" method="GET">
                                            <input type="hidden" name="libroId" value="${libro.id}">
                                            <input type="submit" class="btn" value="Prestar" style="margin: 0; display: inline-block;">
                                        </form>
                                    </c:if>
                                    <c:if test="${!libro.disponible}">
                                        <input type="submit" class="btn" value="No Disponible" disabled style="margin: 0;">
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>