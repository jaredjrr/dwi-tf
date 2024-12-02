<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />

    <body>

        <!-- Sección de Bienvenida -->
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            
            
            <h1>Bienvenido a PetLife</h1>
            <p>"Tu veterinaria de confianza para el cuidado integral de tus mascotas".</p>
            <a href="${pageContext.request.contextPath}/productos.jsp" class="animated-button">¡COMPRA YA!</a>
        </section>

        <br>
        <br>

        <!-- Sección de Servicios -->

        <section class="index-services">
            <!-- Servicio Consulta Veterinaria -->
            <div class="service-item">
                <h2>Consulta Veterinaria</h2>
                <img src="${pageContext.request.contextPath}/img/consulta.jpg" alt="Consulta Veterinaria" class="service-image">
                <p>Ofrecemos consultas completas para el diagnóstico y tratamiento de tus mascotas.</p>
                <a href="${pageContext.request.contextPath}/servicio.jsp" class="animated-button">Servicios</a>
            </div>

            <!-- Servicio Tienda de Mascotas -->
            <div class="service-item">
                <h2>Tienda de Mascotas</h2>
                <img src="${pageContext.request.contextPath}/img/tienda1.jpg" alt="Tienda de Mascotas" class="service-image">
                <p>Encuentra una amplia gama de productos para el bienestar de tus mascotas.</p>
                <a href="${pageContext.request.contextPath}/productos.jsp" class="animated-button">Productos</a>
            </div>

            <!-- Servicio Agendar Cita -->
            <div class="service-item">
                <h2>Agendar Cita</h2>
                <img src="${pageContext.request.contextPath}/img/cita.jpg" alt="Agendar Cita" class="service-image">
                <p>Agenda una cita con nuestros veterinarios de manera rápida y sencilla.</p>
                <a href="${pageContext.request.contextPath}/cita.jsp" class="animated-button">Citas</a>
            </div>
        </section>
            
                    <!-- Por que visitarnos -->


        <section class="cabeza-welcome">

            <h1>¿Por qué visitarnos con tu mascota?</h1>


        </section>
        <section class="servicios-container">
            <div class="servicio">
                <div class="icono-servicio" style="background-color: #9999ff;">
                    <img src="${pageContext.request.contextPath}/img/huella.png" alt="Consultas de especialidad">
                </div>
                <h3>Experiencia</h3>
                <p>Contamos conmédicos veterinarios residentes, expertos y reconocidos
                    en el rubro veterinario a nivel nacional por su trayectoria.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #ff4b5c;">
                    <img src="${pageContext.request.contextPath}/img/premio.png" alt="Peluquería para mascotas">
                </div>
                <h3>Trabajo en equipo</h3>
                <p>Nuestro equipo humano íntegramente conectado con todas las áreas
                    del centro, para buscar soluciones beneficiosas en pro de la salud
                    de nuestros pacientes y la tranquilidad de sus familias que confían en nosotros.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #003399;">
                    <img src="${pageContext.request.contextPath}/img/interaction.png" alt="Internamientos de última generación">
                </div>
                <h3>Tratamiento personalizado</h3>
                <p>Realizamos tratamientos especializados para lograr 
                    el bienestar de la mascota y mejorar su calidad. De acuerdo a,la necesidad 
                    de nuestros pacientes y de sus familias.</p>
            </div>
            <div class="servicio">
                <div class="icono-servicio" style="background-color: #ff6f00;">
                    <img src="${pageContext.request.contextPath}/img/24-horas.png" alt="Internamientos de última generación">
                </div>
                <h3>Nuestra comunidad  </h3>
                <p>Nuestra comunidad está compuesta por tutores 
                    responsables e informados que confían en nuestro equipo 
                    y en la información que compartimos</p>
            </div>


        </section>
            
            
            
        <jsp:include page="/componentes/footer.jsp" />
        
    </body>
</html>
