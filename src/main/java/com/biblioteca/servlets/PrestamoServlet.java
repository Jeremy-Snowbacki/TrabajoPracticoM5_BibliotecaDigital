package com.biblioteca.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.biblioteca.dao.PrestamoDAO;
import com.biblioteca.model.Prestamo;


public class PrestamoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PrestamoDAO prestamoDAO = new PrestamoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        List<Prestamo> listaPrestamos = prestamoDAO.listarPrestamos();
        request.setAttribute("listaPrestamos", listaPrestamos);
        request.getRequestDispatcher("prestamos.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        String accion = request.getParameter("accion");
        
        if ("registrar".equals(accion)) {
            Prestamo prestamo = new Prestamo();
            prestamo.setUsuarioId(Integer.parseInt(request.getParameter("usuarioId")));
            prestamo.setLibroId(Integer.parseInt(request.getParameter("libroId")));
            
            try {
                prestamo.setFechaPrestamo(java.sql.Date.valueOf(request.getParameter("fechaPrestamo")));
                prestamo.setFechaDevolucion(java.sql.Date.valueOf(request.getParameter("fechaDevolucion")));
                
                prestamoDAO.registrarPrestamo(prestamo);
                request.setAttribute("mensaje", "Préstamo registrado correctamente");
            } catch (IllegalArgumentException e) {
                request.setAttribute("error", "Formato de fecha inválido");
            }
            
            response.sendRedirect("PrestamoServlet");
        }
    }
}
