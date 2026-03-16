package com.biblioteca.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.biblioteca.model.Libro;

public class LibroDAO {

    public List<Libro> listarLibros() {
        List<Libro> lista = new ArrayList<>();
        String sql = "SELECT * FROM libros";

        try (Connection con = ConexionBD.getConexion();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Libro libro = new Libro();
                libro.setId(rs.getInt("id"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAutor(rs.getString("autor"));
                libro.setAnio(rs.getInt("anio"));
                libro.setDisponible(rs.getBoolean("disponible"));
                lista.add(libro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void agregarLibro(Libro libro) {
        String sql = "INSERT INTO libros(titulo, autor, anio, disponible) VALUES(?,?,?,?)";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, libro.getTitulo());
            ps.setString(2, libro.getAutor());
            ps.setInt(3, libro.getAnio());
            ps.setBoolean(4, libro.isDisponible());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Libro obtenerLibroPorId(int id) {
        Libro libro = null;
        String sql = "SELECT * FROM libros WHERE id=?";
        
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                libro = new Libro();
                libro.setId(rs.getInt("id"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAutor(rs.getString("autor"));
                libro.setAnio(rs.getInt("anio"));
                libro.setDisponible(rs.getBoolean("disponible"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return libro;
    }

    // Métodos actualizarLibro() y eliminarLibro() se implementan de forma similar
}
