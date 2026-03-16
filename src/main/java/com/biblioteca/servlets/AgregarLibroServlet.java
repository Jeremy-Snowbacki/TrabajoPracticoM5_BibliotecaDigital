package com.biblioteca.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.biblioteca.dao.LibroDAO;
import com.biblioteca.model.Libro;


public class AgregarLibroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LibroDAO libroDAO = new LibroDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        request.getRequestDispatcher("agregar-libro.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        try {
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int anio = Integer.parseInt(request.getParameter("anio"));
            boolean disponible = request.getParameter("disponible") != null;
            
            Libro libro = new Libro();
            libro.setTitulo(titulo);
            libro.setAutor(autor);
            libro.setAnio(anio);
            libro.setDisponible(disponible);
            
            libroDAO.agregarLibro(libro);
            request.setAttribute("mensaje", "Libro agregado correctamente");
            response.sendRedirect("LibroServlet");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "El año debe ser un número válido");
            request.getRequestDispatcher("agregar-libro.jsp").forward(request, response);
        }
    }
}
