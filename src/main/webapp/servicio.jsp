<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />
    <body>
        <!-- Sección de Encabezado -->
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            <div class="intro-nosotros">
                <h1>Nuestros Servicios</h1>
                <p>Consulta nuestra gama de servicios para el bienestar de tu mascota.</p>
            </div>
        </section>

        <!-- Sección de Servicios -->
        <section class="servicios-container">
            <div class="servicio">
                <div class="icono-servicio" style="background-color: #007bff;">
                    <img src="${pageContext.request.contextPath}/img/consulta2.png" alt="Consultas de especialidad">
                </div>
                <h3>Consultas de especialidad</h3>
                <p>Consulta médica veterinaria con los mejores especialistas de todo el Perú, siempre dispuestos a dar todo por la salud de tu mascota.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #ff4b5c;">
                    <img src="${pageContext.request.contextPath}/img/peluqueria-canina.png" alt="Peluquería para mascotas">
                </div>
                <h3>Peluquería para mascotas</h3>
                <p>Cuidamos el aspecto y la salud de tu engreído haciendo uso de productos de la más alta calidad.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #ff6f00;">
                    <img src="${pageContext.request.contextPath}/img/24-horas.png" alt="Internamientos de última generación">
                </div>
                <h3>Internamientos de última generación</h3>
                <p>Área de internados de última generación y el mejor personal dedicado las 24 horas al cuidado de tu mascota.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #28a745;">
                    <img src="${pageContext.request.contextPath}/img/cuidado-veterinario.png" alt="Cirugías">
                </div>
                <h3>Cirugías</h3>
                <p>Cirugía veterinaria en las más modernas instalaciones y con los cirujanos más experimentados.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #fd7e14;">
                    <img src="${pageContext.request.contextPath}/img/juguete-para-mascotas.png" alt="Tienda para mascotas">
                </div>
                <h3>Tienda para mascotas</h3>
                <p>Tenemos la mejor y más variada tienda de artículos para mascotas de toda Lima.</p>
            </div>

            <div class="servicio">
                <div class="icono-servicio" style="background-color: #20c997;">
                    <img src="${pageContext.request.contextPath}/img/animal.png" alt="Laboratorio">
                </div>
                <h3>Laboratorio</h3>
                <p>Disponemos de los mejores analistas y el más moderno laboratorio de muestras.</p>
            </div>
        </section>

        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>
