<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Usuario" %>
<%@page import="Persistencia.ClienteDAO" %>
<%@page import="Persistencia.MascotaDAO" %>
<%@page import="Persistencia.CitaDAO" %>
<%@page import="Logica.Mascota" %>
<%@page import="Logica.Cita" %>
<%@page import="java.time.LocalDate" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    HttpSession userSession = request.getSession(false);
    Usuario usuario = (userSession != null) ? (Usuario) userSession.getAttribute("usuario") : null;

    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
%>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/componentes/head.jsp" />

<body>
    <section class="cabeza-welcome">
        <jsp:include page="/componentes/header.jsp" />
    </section>

    <!-- Sección de mensajes de error y confirmación -->
    <section class="mensajes">
        <% if (request.getParameter("error") != null) { %>
            <p class="mensaje-error">Error al agendar la cita. Por favor, inténtalo de nuevo.</p>
        <% } %>
        <% if (request.getParameter("errorMascota") != null) { %>
            <p class="mensaje-error">Error al agregar la mascota. Asegúrate de que todos los datos sean correctos.</p>
        <% } %>
        <% if (request.getParameter("errorClienteNoEncontrado") != null) { %>
            <p class="mensaje-error">No se encontró un cliente asociado a tu cuenta. Por favor, regístrate o contacta con el soporte.</p>
        <% } %>
        <% if (request.getParameter("agendada") != null) { %>
            <p class="mensaje-exito">Cita agendada exitosamente.</p>
        <% } %>
    </section>

    <!-- Formulario de Agendar Cita -->
    <section class="formulario-cita">
        <h2>Agendar Cita</h2>
        <form action="AgendarCitaServlet" method="post" class="cita-form">
            <div class="form-group">
                <label for="nombreCliente">Nombre del Cliente:</label>
                <input type="text" id="nombreCliente" name="nombreCliente" value="<%= usuario.getNombre() %>" readonly>
            </div>

            <div class="form-group">
                <label for="nombreMascota">Nombre de la Mascota:</label>
                <input type="text" id="nombreMascota" name="nombreMascota" required>
            </div>

            <div class="form-group">
                <label for="especie">Especie:</label>
                <input type="text" id="especie" name="especie" required>
            </div>

            <div class="form-group">
                <label for="raza">Raza:</label>
                <input type="text" id="raza" name="raza" required>
            </div>

            <div class="form-group">
                <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" required>
            </div>

            <div class="form-group">
                <label for="servicio">Servicio:</label>
                <select id="servicio" name="servicio" required>
                    <option value="baño">Baño</option>
                    <option value="corte">Corte de Pelo</option>
                    <option value="consulta">Consulta</option>
                </select>
            </div>

            <div class="form-group">
                <label for="fechaHora">Fecha y Hora:</label>
                <input type="datetime-local" id="fechaHora" name="fechaHora" required>
            </div>

            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required></textarea>
            </div>

            <button type="submit" class="btn-agendar">Agendar Cita</button>
        </form>
    </section>

    <jsp:include page="/componentes/footer.jsp" />
</body>
</html>
