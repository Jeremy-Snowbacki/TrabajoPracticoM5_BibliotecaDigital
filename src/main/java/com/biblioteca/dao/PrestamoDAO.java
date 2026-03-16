package com.biblioteca.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.biblioteca.model.Prestamo;

public class PrestamoDAO {

    // Registrar un nuevo préstamo
    public void registrarPrestamo(Prestamo prestamo) {
        String sql = "INSERT INTO prestamos(usuario_id, libro_id, fecha_prestamo, fecha_devolucion) VALUES(?,?,?,?)";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, prestamo.getUsuarioId());
            ps.setInt(2, prestamo.getLibroId());
            ps.setDate(3, new java.sql.Date(prestamo.getFechaPrestamo().getTime()));
            ps.setDate(4, new java.sql.Date(prestamo.getFechaDevolucion().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Listar todos los préstamos
    public List<Prestamo> listarPrestamos() {
        List<Prestamo> lista = new ArrayList<>();
        String sql = "SELECT * FROM prestamos";
        try (Connection con = ConexionBD.getConexion();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Prestamo p = new Prestamo();
                p.setId(rs.getInt("id"));
                p.setUsuarioId(rs.getInt("usuario_id"));
                p.setLibroId(rs.getInt("libro_id"));
                p.setFechaPrestamo(rs.getDate("fecha_prestamo"));
                p.setFechaDevolucion(rs.getDate("fecha_devolucion"));
                lista.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Actualizar devolución de un préstamo
    public void registrarDevolucion(int idPrestamo, java.util.Date fechaDevolucion) {
        String sql = "UPDATE prestamos SET fecha_devolucion=? WHERE id=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(fechaDevolucion.getTime()));
            ps.setInt(2, idPrestamo);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Eliminar un préstamo (opcional)
    public void eliminarPrestamo(int idPrestamo) {
        String sql = "DELETE FROM prestamos WHERE id=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPrestamo);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
