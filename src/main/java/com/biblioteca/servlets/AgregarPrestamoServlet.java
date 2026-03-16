package com.biblioteca.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.biblioteca.dao.LibroDAO;
import com.biblioteca.dao.PrestamoDAO;
import com.biblioteca.model.Libro;
import com.biblioteca.model.Prestamo;


public class AgregarPrestamoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LibroDAO libroDAO = new LibroDAO();
    private PrestamoDAO prestamoDAO = new PrestamoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        List<Libro> libros = libroDAO.listarLibros();
        request.setAttribute("libros", libros);
        request.getRequestDispatcher("agregar-prestamo.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        Integer usuarioId = (Integer) sesion.getAttribute("usuarioId");
        
        if (usuarioId == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        try {
            int libroId = Integer.parseInt(request.getParameter("libroId"));
            String fechaPrestamo = request.getParameter("fechaPrestamo");
            String fechaDevolucion = request.getParameter("fechaDevolucion");
            
            // Validar que el libro exista y esté disponible
            Libro libro = libroDAO.obtenerLibroPorId(libroId);
            
            if (libro == null || !libro.isDisponible()) {
                request.setAttribute("error", "El libro no está disponible");
                request.getRequestDispatcher("agregar-prestamo.jsp").forward(request, response);
                return;
            }
            
            // Registrar el préstamo
            Prestamo prestamo = new Prestamo();
            prestamo.setUsuarioId(usuarioId);
            prestamo.setLibroId(libroId);
            prestamo.setFechaPrestamo(java.sql.Date.valueOf(fechaPrestamo));
            prestamo.setFechaDevolucion(java.sql.Date.valueOf(fechaDevolucion));
            
            prestamoDAO.registrarPrestamo(prestamo);
            response.sendRedirect("PrestamoServlet");
        } catch (Exception e) {
            request.setAttribute("error", "Error: Verifica todos los datos ingresados");
            request.getRequestDispatcher("agregar-prestamo.jsp").forward(request, response);
        }
    }
}
