<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Nuevo Préstamo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
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
        label {
            display: block;
            margin-top: 15px;
            color: #333;
            font-weight: bold;
        }
        input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button, input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }
        button:hover, input[type="submit"]:hover {
            opacity: 0.9;
            transform: scale(1.02);
            transition: all 0.3s ease;
        }
        .btn-volver {
            background: #6c757d;
            margin-top: 10px;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registrar Nuevo Préstamo</h1>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        
        <form method="POST" action="AgregarPrestamoServlet">
            <label for="libroId">Selecciona un Libro:</label>
            <select id="libroId" name="libroId" required>
                <option value="">-- Selecciona un libro --</option>
                <c:forEach var="libro" items="${libros}">
                    <c:if test="${libro.disponible}">
                        <option value="${libro.id}">${libro.titulo} - ${libro.autor}</option>
                    </c:if>
                </c:forEach>
            </select>
            
            <label for="fechaPrestamo">Fecha de Préstamo:</label>
            <input type="date" id="fechaPrestamo" name="fechaPrestamo" required>
            
            <label for="fechaDevolucion">Fecha de Devolución:</label>
            <input type="date" id="fechaDevolucion" name="fechaDevolucion" required>
            
            <input type="submit" value="Registrar Préstamo">
        </form>
        
        <form action="PrestamoServlet" method="GET">
            <button type="submit" class="btn-volver">Volver a Mis Préstamos</button>
        </form>
    </div>
</body>
</html>
