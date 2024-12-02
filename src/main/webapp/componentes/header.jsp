<%@page import="Logica.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<header>

    <div class="logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo de la Empresa" width="170" height="auto">
        </a>
    </div>

    <!-- Barra de navegación -->
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/nosotros.jsp">Nosotros</a></li>
            <li><a href="${pageContext.request.contextPath}/contacto.jsp">Contactos</a></li>
            <li><a href="${pageContext.request.contextPath}/servicio.jsp">Servicios</a></li>
            <li><a href="${pageContext.request.contextPath}/productos.jsp">Productos</a></li>
            <li><a href="${pageContext.request.contextPath}/cita.jsp">Agendar cita</a></li>



        </ul>


    </nav>


    <div class="user-actions">
        <% if (usuario != null) { %>
        <a href="${pageContext.request.contextPath}/user.jsp">
            <img src="${pageContext.request.contextPath}/img/usuario.png" alt="Usuario">
        </a>
        <a href="${pageContext.request.contextPath}/carrito.jsp">
            <img src="${pageContext.request.contextPath}/img/carritoCompra.png" alt="Carrito">
        </a>
        <a href="${pageContext.request.contextPath}/logout">
            <img src="${pageContext.request.contextPath}/img/salida.png" alt="Cerrar sesión">
        </a>
        <% } else { %>
        <a href="${pageContext.request.contextPath}/login.jsp" class="btn-primary">Iniciar Sesión</a>
        <% } %>
    </div>

</header>
