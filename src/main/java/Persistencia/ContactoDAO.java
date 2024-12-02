
package Persistencia;

import Logica.contacto;
import config.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactoDAO {

    public boolean guardarContacto(contacto contacto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean guardado = false;

        try {
            conn = ConexionDB.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO contactos (nombre, apellido, email, telefono, reclamo) VALUES (?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, contacto.getNombre());
                stmt.setString(2, contacto.getApellido());
                stmt.setString(3, contacto.getEmail());
                stmt.setString(4, contacto.getTelefono());
                stmt.setString(5, contacto.getReclamo());

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Contacto guardado correctamente.");
                    guardado = true;
                }
            } else {
                System.out.println("La conexión a la base de datos no fue establecida.");
            }
        } catch (SQLException e) {
            System.out.println("Error al guardar el contacto: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return guardado;
    }
}