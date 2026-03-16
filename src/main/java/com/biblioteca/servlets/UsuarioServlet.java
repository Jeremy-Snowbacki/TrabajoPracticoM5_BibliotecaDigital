package com.biblioteca.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.biblioteca.dao.UsuarioDAO;
import com.biblioteca.model.Usuario;


public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        if ("login".equals(accion)) {
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            
            Usuario usuario = usuarioDAO.validarUsuario(correo, password);
            
            if (usuario != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);
                sesion.setAttribute("usuarioId", usuario.getId());
                response.sendRedirect("LibroServlet");
            } else {
                request.setAttribute("error", "Credenciales inválidas");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if ("registrar".equals(accion)) {
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setCorreo(correo);
            nuevoUsuario.setPassword(password);
            
            usuarioDAO.registrarUsuario(nuevoUsuario);
            request.setAttribute("mensaje", "Usuario registrado correctamente");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        if ("logout".equals(accion)) {
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
