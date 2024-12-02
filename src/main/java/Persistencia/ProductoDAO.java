package Persistencia;

import Logica.Productos;
import config.ConexionDB;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

public class ProductoDAO {

    // Método para listar los productos de la base de datos
    public List<Productos> listar() {
        List<Productos> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery())
        {

            while (rs.next())
            {
                Productos producto = new Productos();
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setCategoria(rs.getString("categoria"));
                producto.setIdProveedor(rs.getInt("id_proveedor"));
                producto.setFoto(rs.getBinaryStream("foto")); // Obtener la foto como InputStream

                productos.add(producto);
            }

        } catch (SQLException e)
        {
            System.out.println("Error al listar productos: " + e.getMessage());
        }

        return productos;
    }

    // Método para mostrar la imagen del producto
    public void listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT foto FROM productos WHERE id_producto = ?";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql))
        {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
            {
                inputStream = rs.getBinaryStream("foto"); // Obtener la foto en formato binario
                outputStream = response.getOutputStream();
                bufferedInputStream = new BufferedInputStream(inputStream);
                bufferedOutputStream = new BufferedOutputStream(outputStream);

                int i;
                while ((i = bufferedInputStream.read()) != -1)
                {
                    bufferedOutputStream.write(i);
                }
            }

        } catch (Exception e)
        {
            System.out.println("Error al mostrar la imagen: " + e.getMessage());
        } finally
        {
            try
            {
                if (bufferedInputStream != null)
                {
                    bufferedInputStream.close();
                }
                if (bufferedOutputStream != null)
                {
                    bufferedOutputStream.close();
                }
                if (inputStream != null)
                {
                    inputStream.close();
                }
                if (outputStream != null)
                {
                    outputStream.close();
                }
            } catch (Exception e)
            {
                System.out.println("Error al cerrar los streams: " + e.getMessage());
            }
        }
    }
}
