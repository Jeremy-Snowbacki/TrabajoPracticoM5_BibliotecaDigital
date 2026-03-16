<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Mis Préstamos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #667eea;
            text-align: center;
            margin-top: 0;
        }
        .btn-agregar {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin: 10px 5px 10px 0;
        }
        .btn-agregar:hover {
            opacity: 0.9;
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
        .btn-volver {
            display: inline-block;
            background: #6c757d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 20px;
        }
        .btn-volver:hover {
            opacity: 0.9;
        }
        .btn-devolver {
            background: #28a745;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-devolver:hover {
            background: #218838;
        }
        .sin-prestamos {
            text-align: center;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mis Préstamos</h1>
        
        <a href="AgregarPrestamoServlet" class="btn-agregar">+ Nuevo Préstamo</a>
        <a href="LibroServlet" class="btn-agregar">Ver Catálogo</a>
        
        <c:choose>
            <c:when test="${empty listaPrestamos}">
                <div class="sin-prestamos">No tienes préstamos registrados</div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Libro ID</th>
                            <th>Usuario ID</th>
                            <th>Fecha Préstamo</th>
                            <th>Fecha Devolución</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="prestamo" items="${listaPrestamos}">
                            <tr>
                                <td>${prestamo.id}</td>
                                <td>${prestamo.libroId}</td>
                                <td>${prestamo.usuarioId}</td>
                                <td>${prestamo.fechaPrestamo}</td>
                                <td>${prestamo.fechaDevolucion}</td>
                                <td>
                                    <form method="POST" action="PrestamoServlet" style="display: inline;">
                                        <input type="hidden" name="accion" value="devolver">
                                        <input type="hidden" name="id" value="${prestamo.id}">
                                        <button type="submit" class="btn-devolver">Devolver</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        
        <a href="index.jsp" class="btn-volver">Cerrar Sesión</a>
    </div>
</body>
</html>
