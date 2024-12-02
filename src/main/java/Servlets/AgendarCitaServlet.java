package Servlets;
import Logica.Cita;
import Logica.Mascota;
import Logica.Usuario;
import Persistencia.CitaDAO;
import Persistencia.ClienteDAO;
import Persistencia.MascotaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/AgendarCitaServlet")
public class AgendarCitaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        int idUsuario = usuario.getIdUsuario();
        
        ClienteDAO clienteDAO = new ClienteDAO();
        int idCliente = clienteDAO.obtenerIdClientePorUsuarioId(idUsuario);

        if (idCliente == -1) {
            response.sendRedirect("agendarCita.jsp?errorClienteNoEncontrado=true");
            return;
        }

        String nombreMascota = request.getParameter("nombreMascota");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String servicio = request.getParameter("servicio");
        String fechaHoraStr = request.getParameter("fechaHora");
        String descripcion = request.getParameter("descripcion");
        String estado = "pendiente"; 

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime fechaHora = LocalDateTime.parse(fechaHoraStr, formatter);

        Mascota mascota = new Mascota(idCliente, nombreMascota, especie, raza, edad, LocalDate.now());

        MascotaDAO mascotaDAO = new MascotaDAO();
        int idMascota = mascotaDAO.agregarMascota(mascota);

        if (idMascota > 0) {
            Cita cita = new Cita(idCliente, idMascota, fechaHora, descripcion, estado, servicio);

            CitaDAO citaDAO = new CitaDAO();
            boolean agendada = citaDAO.agendarCita(cita);
            
            if (agendada) {
                response.sendRedirect("user.jsp?agendada=true");
            } else {
                response.sendRedirect("agendarCita.jsp?error=true");
            }
        } else {
            response.sendRedirect("agendarCita.jsp?errorMascota=true");
        }
    }
}

