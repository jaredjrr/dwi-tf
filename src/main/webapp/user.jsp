<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Mascota"%>
<%@page import="Logica.Cita"%>
<%@page import="Persistencia.MascotaDAO"%>
<%@page import="Persistencia.CitaDAO"%>
<%@page import="Persistencia.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
    HttpSession userSession = request.getSession(false); 
    Usuario usuario = (userSession != null) ? (Usuario) userSession.getAttribute("usuario") : null;

    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return; 
    }

    ClienteDAO clienteDAO = new ClienteDAO();
    int idCliente = clienteDAO.obtenerIdClientePorUsuarioId(usuario.getIdUsuario());

    MascotaDAO mascotaDAO = new MascotaDAO();
    List<Mascota> mascotas = mascotaDAO.obtenerMascotasPorCliente(idCliente);

    CitaDAO citaDAO = new CitaDAO();
    List<Cita> citas = citaDAO.obtenerCitasPorCliente(idCliente);
%>

<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />

    <body>
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />


        </section>


        <main class="main-container">
            <!-- Sección de Bienvenida y Acciones Rápidas -->
            <section class="user-actions-section">
                <div class="welcome-container">
                    <h2>Hola, <%= usuario.getNombre() %></h2>
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/cita.jsp" class="animated-button">¡Agendar cita!</a>
                        <a href="${pageContext.request.contextPath}/contacto.jsp" class="animated-button">¡Llamar clinica!</a>
                    </div>
                </div>
            </section>

            <section class="pets-section">
                <div class="section-header">
                    <h3>Tus mascotas</h3>
                    <a href="#" class="view-all">Ver todas</a>
                </div>
                <div class="pets-container">
                    <% if (mascotas != null && !mascotas.isEmpty()) { %>
                    <% for (Mascota mascota : mascotas) { %>
                    <div class="pet-card">
                        <img src="${pageContext.request.contextPath}/img/MascotaAgendar.png" alt="Mascota">
                        <p><%= mascota.getNombre() %></p>
                    </div>
                    <% } %>
                    <% } else { %>
                    <p>No tienes mascotas registradas.</p>
                    <% } %>

                </div>
            </section>

            <section class="appointments-section">
                <div class="section-header">
                    <h3>Tus citas</h3>
                    <a href="#" class="view-all">Ver todas</a>
                </div>
                <div class="appointments-container">
                    <% 
                        DateTimeFormatter formatterFecha = DateTimeFormatter.ofPattern("EEEE dd 'de' MMMM");
                        DateTimeFormatter formatterHora = DateTimeFormatter.ofPattern("HH:mm");

                        if (citas != null && !citas.isEmpty()) {
                            for (Cita cita : citas) {
                    %>
                    <div class="appointment-card">
                        <% if (cita.getFechaHora() != null) { %>
                        <p><strong><%= cita.getFechaHora().format(formatterFecha) %></strong> <%= cita.getFechaHora().format(formatterHora) %></p>
                        <% } else { %>
                        <p>Fecha no disponible.</p>
                        <% } %>
                        <p><%= cita.getDescripcion() %></p>
                    </div>
                    <% 
                            }
                        } else { 
                    %>
                    <p>No tienes citas registradas.</p>
                    <% 
                        } 
                    %>
                </div>
                <a href="${pageContext.request.contextPath}/cita.jsp" class="animated-button">¡Agendar cita!</a>
            </section>
        </main>

        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>