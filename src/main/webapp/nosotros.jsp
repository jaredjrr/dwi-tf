<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />

    <body>
        <!-- Sección de Encabezado -->
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            <div class="intro-nosotros">
                <h1>Nosotros somos Pet Life, una empresa líder</h1>
                <p>Cuidamos el bienestar de cada mascota como si fuera nuestra propia vida.</p>
                <a href="${pageContext.request.contextPath}/servicio.jsp" class="animated-button">¡Nuestros Servicios!</a>
            </div>
        </section>

        <!-- Información de los Veterinarios -->
        <section class="info-veterinarios">
            <!-- Dr. Pancho Cavero -->
            <div class="contenedor-seccion">
                <div class="imagen-izquierda">
                    <img src="${pageContext.request.contextPath}/img/nosotros2.jpg" alt="Dr. Pancho Cavero">
                </div>
                <div class="texto-derecha">
                    <h2>Dr. Pancho Cavero</h2>
                    <p>
                        Médico Veterinario egresado de la Universidad Nacional Mayor de San Marcos, líder de opinión en temas de Neurología, traumatología y Ortopedia Veterinaria, Diplomado de Traumatología y Ortopedia en CEAMVET-México y realizó una pasantía en la Clínica San Juan de Dios, 2007. Expositor de innumerables Congresos de Medicina Veterinaria y como Influencer en temas relacionados a los animales y el medio ambiente. Condecorado en el 2011 por la UNMSM, por su contribución en el desarrollo de la Medicina Veterinaria en el Perú y Medalla Cívica de la orden Santiago de Apóstol en “Reconocimiento al desarrollo de técnicas y procedimientos innovadores en el ejercicio de la Medicina Veterinaria” por la Municipalidad de Santiago de Surco 2005.
                    </p>
                    <p>
                        Comunicador y activista en pro del bienestar de los animales y promotor de la conservación de la biodiversidad del medio ambiente. Columnista del Diario el Trome, Bloguero, Autor del libro de consulta “Veterinario en casa” por editorial Planeta, conductor del programa radial “Veterinaria Capital” por Radio Capital, conductor y productor del Programa “Los Animales me Importan”, emitido por Frecuencia Latina.
                    </p>
                    <p>
                        En el 2015 y por 3 temporadas, condujo y co-produjo el programa semanal “Dr. Vet” por América Televisión. En el 2013 co-condujo el programa de radio “Naturaleza Animal por Radio San Borja y en el 2009 condujo la secuencia de “entre patas al rescate” en el Magazine “Hola a Todos”, transmitido por ATV.
                    </p>
                </div>
            </div>

            <!-- Dra. Fiorella Cochella -->
            <div class="contenedor-seccion">
                <div class="texto-izquierda">
                    <h2>Dra. Fiorella Cochella</h2>
                    <p>
                        MV. MBA. MSC(c). Dplm. Fiorella Cochella, Socia Cofundadora y Directora de Operaciones del Grupo Pancho Cavero. Médico Veterinario Especialista en Comportamiento en animales de compañía, profesional certificado en manejo Fear Free®. Egresada de la Universidad Nacional Mayor de San Marcos (UNMSM), Maestra en Administración de Negocios (UPC), Diplomado en Gerencia Estratégica del Recurso Humano -International University of South Florida (USA)/ Universidad de La Salle (Colombia). Diplomado de Comportamiento Animal (VetesWeb Argentina). Diplomado en Gerencia y Marketing para la Clínica Veterinaria II (Universidad de Tolima-Colombia).
                    </p>
                    <p>
                        Actualmente cursando la Maestría de Ciencias, en Etología Clínica (Universidad Autónoma de Barcelona-España). Docente postgrado de la Universidad ESAN en diplomados relacionados a la Gestión de negocios veterinarios. Se desempeñó como Gerente de línea en reconocidas empresas del medio veterinario.
                    </p>
                </div>
                <div class="imagen-derecha">
                    <img src="${pageContext.request.contextPath}/img/nosotros3.jpg" alt="Dra. Fiorella Cochella">
                </div>
            </div>
        </section>

        <!-- SECCION OTROS PROFESIONALES-->

        <header>
            <h1 class="ari-nomecae">OTROS VETERINARIOS</h1>
        </header>
        <section class="index-services">

            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/alvaro mamani.jpg" alt="Consulta Veterinaria" class="service-image">
                <h2>M.V.Z. Alvaro Mamani </h2>
                <p>    CMVP:13899   </p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/jessica.jpg" alt="Tienda de Mascotas" class="service-image">
                <h2>M.V. Jessica Batista</h2>
                <p>CMVP:12480</p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/carlos castañeda.jpg" alt="Agendar Cita" class="service-image">
                <h2>M.V. Dipl. Carlos Castañeda</h2>
                <p>CMVP:14087</p>

            </div>
        </section>




        <section class="index-services">

            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/alisson.jpg" alt="Consulta Veterinaria" class="service-image">
                <h2>M.V.Z. Dipl. Allison Montenegro </h2>
                <p>   CMVP:14112   </p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/aimed.jpg" alt="Tienda de Mascotas" class="service-image">
                <h2>M.V.Z. Dipl. Aimed Gonzales</h2>
                <p>CMVP:13433</p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/angel.jpg" alt="Agendar Cita" class="service-image">
                <h2>M.V.Z. Angel Shinno</h2>
                <p>CMVP:11699</p>

            </div>
        </section>




        <section class="index-services">

            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/diana.jpg" alt="Consulta Veterinaria" class="service-image">
                <h2>MV. Dipl. Mg(c). Diana Figueroa</h2>
                <p>    CMVP:13079 </p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/enrique.jpg" alt="Tienda de Mascotas" class="service-image">
                <h2>M.V.Z MSC. Enrique Ferreyra</h2>
                <p>CMVP:7029</p>

            </div>


            <div class="service-item">

                <img src="${pageContext.request.contextPath}/img/mario.jpg" alt="Agendar Cita" class="service-image">
                <h2>M.V. Mario Flores</h2>
                <p>CMVP:10720</p>

                <p>Dermatología</p>

            </div>
        </section>




        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>
