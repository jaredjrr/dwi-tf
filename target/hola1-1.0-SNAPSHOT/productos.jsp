<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />

    <body>
        <!-- Sección de Encabezado -->
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            <div class="intro-nosotros">
                <h1>Nuestros Productos para Mascotas</h1>
                <p>Encuentra todo lo que necesitas para el bienestar de tus mascotas.</p>
            </div>
        </section>

        <div class="productos-container-unique">
            <div class="productos-grid-unique">
                <div class="producto-item-unique">
                    <img src="img/producto1.jpg" alt="Ricocan Perros">
                    <h3>PERROS</h3>
                    <p>Ricocan Grande - Adulto raza mediana y grande</p>
                    <span class="precio">S/ 10.00</span>
                    <button>Añadir al carrito</button>
                </div>
            </div>
        </div>









        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>
