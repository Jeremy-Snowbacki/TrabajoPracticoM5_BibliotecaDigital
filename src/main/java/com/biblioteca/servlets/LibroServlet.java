package com.biblioteca.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.biblioteca.dao.LibroDAO;
import com.biblioteca.model.Libro;


public class LibroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LibroDAO libroDAO = new LibroDAO(); 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Libro> listaLibros = libroDAO.listarLibros(); 
        request.setAttribute("listaLibros", listaLibros);
        request.getRequestDispatcher("catalogo.jsp").forward(request, response);
    }
}
