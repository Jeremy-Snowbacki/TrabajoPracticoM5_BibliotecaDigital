<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Agregar Libro</title>
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
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .checkbox-group {
            margin: 15px 0;
        }
        input[type="checkbox"] {
            margin-right: 8px;
        }
        .checkbox-group label {
            display: inline;
            margin: 0;
            font-weight: normal;
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
        .mensaje {
            background: #d4edda;
            color: #155724;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Agregar Nuevo Libro</h1>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        
        <form method="POST" action="AgregarLibroServlet">
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" required>
            
            <label for="autor">Autor:</label>
            <input type="text" id="autor" name="autor" required>
            
            <label for="anio">Año de Publicación:</label>
            <input type="number" id="anio" name="anio" min="1900" max="2100" required>
            
            <div class="checkbox-group">
                <input type="checkbox" id="disponible" name="disponible" value="1">
                <label for="disponible">Disponible</label>
            </div>
            
            <input type="submit" value="Agregar Libro">
        </form>
        
        <form action="LibroServlet" method="GET">
            <button type="submit" class="btn-volver">Volver al Catálogo</button>
        </form>
    </div>
</body>
</html>
