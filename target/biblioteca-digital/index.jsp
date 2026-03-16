<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Biblioteca Digital - Login</title>
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
            text-align: center;
            padding: 40px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            margin: 0;
            font-size: 48px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .header p {
            margin: 10px 0 0 0;
            font-size: 16px;
            opacity: 0.9;
        }
        .login-box {
            width: 300px; 
            margin: 50px auto; 
            padding: 30px;
            background: white; 
            border: none; 
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        .login-box h2 {
            text-align: center;
            color: #667eea;
            margin-top: 0;
        }
        input[type=text], input[type=password] {
            width: 100%; 
            padding: 10px; 
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type=submit] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white; 
            border: none; 
            padding: 12px;
            width: 100%; 
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 10px;
        }
        input[type=submit]:hover {
            opacity: 0.9;
            transform: scale(1.02);
            transition: all 0.3s ease;
        }
        label {
            display: block;
            margin-top: 10px;
            color: #333;
            font-weight: bold;
        }
    </style>  
</head>
<body>
<div class="header">
    <h1>Biblioteca Digital UNTEC</h1>
    <p>Sistema de Gestión de Libros</p>
</div>
<div class="login-box">
    <h2>Iniciar Sesión</h2>
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="accion" value="login">
        <label>Correo:</label>
        <input type="text" name="correo" required>
        <label>Contraseña:</label>
        <input type="password" name="password" required>
        <input type="submit" value="Ingresar">
    </form>
</div>
</body>
</html>
