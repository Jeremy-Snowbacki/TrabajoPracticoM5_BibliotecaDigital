package com.biblioteca.dao;

import java.sql.*;
import com.biblioteca.model.Usuario;

public class UsuarioDAO {

    // Validar credenciales de usuario
    public Usuario validarUsuario(String correo, String password) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE correo=? AND password=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, correo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Registrar nuevo usuario
    public void registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios(nombre, correo, password) VALUES(?,?,?)";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
