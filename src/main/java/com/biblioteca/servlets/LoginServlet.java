package com.biblioteca.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Aquí iría la validación con UsuarioDAO que se vera en la siguiente leccion
        if("admin@biblioteca.com".equals(correo) && "1234".equals(password)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", correo);
            response.sendRedirect("catalogo.jsp");
        } else {
            request.setAttribute("error", "Credenciales inválidas");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
