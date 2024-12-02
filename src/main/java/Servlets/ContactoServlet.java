/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Logica.contacto;
import Persistencia.ContactoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String reclamo = request.getParameter("reclamo"); 

        System.out.println("Nombre: " + nombre);
        System.out.println("Apellido: " + apellido);
        System.out.println("Email: " + email);
        System.out.println("Teléfono: " + telefono);
        System.out.println("Reclamo: " + reclamo); 

        if (nombre == null || nombre.isEmpty() || 
            apellido == null || apellido.isEmpty() || 
            email == null || email.isEmpty() || 
            reclamo == null || reclamo.isEmpty()) { 
            
            request.setAttribute("error", "Todos los campos obligatorios deben ser llenados.");
            request.getRequestDispatcher("contacto.jsp").forward(request, response);
            return;
        }

        contacto contacto = new contacto(nombre, apellido, email, telefono, reclamo); 
        
        ContactoDAO contactoDAO = new ContactoDAO();
        boolean resultado = contactoDAO.guardarContacto(contacto);

        if (resultado) {
            System.out.println("Contacto guardado correctamente.");
            request.setAttribute("mensaje", "Contacto registrado exitosamente.");
        } else {
            request.setAttribute("error", "Ocurrió un error al guardar el contacto.");
        }
        
        request.getRequestDispatcher("contacto.jsp").forward(request, response);
    }
}