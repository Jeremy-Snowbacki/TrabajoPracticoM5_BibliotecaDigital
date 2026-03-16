package com.biblioteca.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    // 🔹 Variable estática: mantiene una única instancia de la conexión
    private static Connection conexion;

    // 🔹 Datos de conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/biblioteca";
    private static final String USER = "root";
    private static final String PASS = "19763819";

    // 🔹 Constructor privado: evita que se creen instancias externas
    private ConexionBD() {}

    // 🔹 Método estático que devuelve siempre la misma conexión
    public static Connection getConexion() {
        if (conexion == null) { // Si no existe conexión, se crea
            try {
                // Cargar el driver JDBC
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Crear la conexión con la BD
                conexion = DriverManager.getConnection(URL, USER, PASS);

                // Aquí se cumple el patrón Singleton:
                // solo se crea UNA conexión y se reutiliza en toda la aplicación
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return conexion; // Devuelve la misma conexión en cada llamada
    }
}


