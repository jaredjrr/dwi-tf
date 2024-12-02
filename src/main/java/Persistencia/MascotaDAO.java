
package Persistencia;

import Logica.Mascota;
import config.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MascotaDAO {

    
    public int agregarMascota(Mascota mascota) {
        String sql = "INSERT INTO mascotas (id_cliente, nombre, especie, raza, edad, fecha_registro) VALUES (?, ?, ?, ?, ?, ?)";
        int idMascotaGenerado = -1;

        try (Connection conn = ConexionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, mascota.getIdCliente()); 
            ps.setString(2, mascota.getNombre());
            ps.setString(3, mascota.getEspecie());
            ps.setString(4, mascota.getRaza());
            ps.setInt(5, mascota.getEdad());
            ps.setDate(6, Date.valueOf(mascota.getFechaRegistro())); 

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        idMascotaGenerado = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al agregar mascota: " + e.getMessage());
        }

        return idMascotaGenerado; 
    }

    public List<Mascota> obtenerMascotasPorCliente(int idCliente) {
        List<Mascota> mascotas = new ArrayList<>();
        String sql = "SELECT * FROM mascotas WHERE id_cliente = ?";

        try (Connection conn = ConexionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Mascota mascota = new Mascota(
                        rs.getInt("id_cliente"),
                        rs.getString("nombre"),
                        rs.getString("especie"),
                        rs.getString("raza"),
                        rs.getInt("edad"),
                        rs.getDate("fecha_registro").toLocalDate()
                );
                mascota.setIdMascota(rs.getInt("id_mascota")); 
                mascotas.add(mascota);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener mascotas: " + e.getMessage());
        }

        return mascotas;
    }
}