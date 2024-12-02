
package Persistencia;

import Logica.Cita;
import config.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CitaDAO {
    public boolean agendarCita(Cita cita) {
        String sql = "INSERT INTO citas (id_cliente, id_mascota, fecha_hora, descripcion, estado, servicio) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = ConexionDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, cita.getIdCliente());
            ps.setInt(2, cita.getIdMascota());
            ps.setTimestamp(3, java.sql.Timestamp.valueOf(cita.getFechaHora()));
            ps.setString(4, cita.getDescripcion());
            ps.setString(5, cita.getEstado());
            ps.setString(6, cita.getServicio());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al agendar la cita: " + e.getMessage());
            return false;
        }
    }
   public List<Cita> obtenerCitasPorCliente(int idCliente) {
    List<Cita> citas = new ArrayList<>();
    String sql = "SELECT * FROM citas WHERE id_cliente = ?";

    try (Connection conn = ConexionDB.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, idCliente);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Cita cita = new Cita();
            cita.setIdCita(rs.getInt("id_cita"));
            
            // Obtén el LocalDateTime de la base de datos
            LocalDateTime fechaHora = rs.getObject("fecha_hora", LocalDateTime.class);
            cita.setFechaHora(fechaHora);
            
            cita.setDescripcion(rs.getString("descripcion"));
            citas.add(cita);
        }
    } catch (SQLException e) {
        System.out.println("Error al obtener citas: " + e.getMessage());
    }

    return citas;
}
}
