<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />

    <body>
        <!-- Sección de Bienvenida -->
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            <div class="intro-nosotros">
                <h1>Encuéntranos muy cerca de ti</h1>
                <p>
                    Agenda tu cita ahora en cualquiera de nuestras sucursales y déjanos cuidar de tus mascotas con el amor y la atención que se merecen.
                </p>
            </div>  

        </section>

        <section class="contacto-container">


            <div class="contacto-content">
                <div class="contacto-sucursales">
                    <div class="sucursal-item">
                        <h2 class="nombre-sucursal">Miraflores</h2>
                        <p class="direccion-sucursal">Av. Larco 1234, Miraflores, Lima</p>
                        <p class="whatsapp-sucursal">Whatsapp: <a href="https://wa.me/51987654321">+51 987 654 321</a></p>
                        <a href="#" class="ver-sucursal">Ver Sucursal &rarr;</a>
                    </div>

                    <div class="sucursal-item">
                        <h2 class="nombre-sucursal">San Isidro</h2>
                        <p class="direccion-sucursal">Av. Camino Real 789, San Isidro, Lima</p>
                        <p class="whatsapp-sucursal">Whatsapp: <a href="https://wa.me/51912345678">+51 912 345 678</a></p>
                        <a href="#" class="ver-sucursal">Ver Sucursal &rarr;</a>
                    </div>

                    <div class="sucursal-item destacado">
                        <h2 class="nombre-sucursal">La Molina</h2>
                        <p class="direccion-sucursal">Av. La Universidad 1000, La Molina, Lima</p>
                        <p class="whatsapp-sucursal">Whatsapp: <a href="https://wa.me/51911223344">+51 911 223 344</a></p>
                        <a href="#" class="ver-sucursal">Ver Sucursal &rarr;</a>
                    </div>

                    <div class="sucursal-item">
                        <h2 class="nombre-sucursal">Barranco</h2>
                        <p class="direccion-sucursal">Av. Pedro de Osma 567, Barranco, Lima</p>
                        <p class="whatsapp-sucursal">Whatsapp: <a href="https://wa.me/51933445566">+51 933 445 566</a></p>
                        <a href="#" class="ver-sucursal">Ver Sucursal &rarr;</a>
                    </div>
                </div>

                <div class="contacto-mapa">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3900.680439787681!2d-77.0325851856814!3d-12.119148445323575!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c84e6574c7e7%3A0x6583edc29c6f6e50!2sAv.%20Larco%201234%2C%20Miraflores%2015081%2C%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1698312325415!5m2!1ses!2spe"
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>

            </div>
        </section>
            
            <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-lg border-0">
                <div class="card-header text-center bg-primary text-white">
                    <h2 class="mb-0">Libro de Reclamaciones</h2>
                </div>
                <div class="card-body">
                    <p class="text-center text-muted">
                        Por favor, completa el formulario para registrar tu reclamo. Nuestro equipo lo revisará a la brevedad.
                    </p>
                    <form action="ContactoServlet" method="post">
                        <!-- Nombre -->
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Escribe tu nombre" required>
                        </div>
                        <!-- Apellido -->
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Escribe tu apellido" required>
                        </div>
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Escribe tu correo electrónico" required>
                        </div>
                        <!-- Teléfono -->
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Escribe tu número de teléfono" required>
                        </div>
                        <!-- Reclamo -->
                        <div class="mb-3">
                            <label for="reclamo" class="form-label">Reclamo</label>
                            <textarea id="reclamo" name="reclamo" class="form-control" rows="5" placeholder="Describe tu reclamo aquí..." required></textarea>
                        </div>
                        <!-- Botón Enviar -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-block">Enviar Reclamo</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>
