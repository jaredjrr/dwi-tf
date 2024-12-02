<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/componentes/head.jsp" />
    <body>
        <section class="cabeza-welcome">
            <jsp:include page="/componentes/header.jsp" />
            <h1>Tu Carrito de Compras</h1>
        </section>

        <main>
            <div class="container">
                <!-- Tabla del Carrito -->
                <div class="cart-table">
                    <c:if test="${not empty sessionScope.carrito}">
                        <table>
                            <thead>
                                <tr>
                                     <!-- id_detalle -->
                                    <th>Item</th>
                                    <!-- id_compra -->
                                    <th>Artículo</th>
                                    <!-- id_producto -->
                                    <th>Descripción</th>
                                    <!-- id_detalle -->
                                    <th>Precio</th>
                                    <!-- id_detalle -->
                                    <th>Cantidad</th>
                                    <!-- id_detalle -->
                                    <th>Total</th>
                                    <!-- id_detalle -->
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${sessionScope.carrito}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.nombres}</td>
                                    <td>${item.descripcion}</td>
                                    <td>${item.precioCompra}</td>
                                    <td>${item.cantidad}</td>
                                    <td>${item.subTotal}</td>
                                    <td>
                                        <!-- Dejar la columna de Acciones vacía o agregar otros botones sin iconos si es necesario -->
                                        <!-- Aquí puedes agregar botones de texto como "Editar" o "Eliminar" sin íconos -->
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty sessionScope.carrito}">
                        <p>El carrito está vacío.</p>
                    </c:if>
                </div>

                <!-- Sección de Generar Compra -->
                <div class="cart-summary">
                    <h2>Generar Compra</h2>
                    <p>Subtotal: $<span id="subtotal">950.00</span></p>
                    <p>Precio Envio: $<span id="envio">0.00</span></p>
                    <p>Descuento: $<span id="descuento">0.00</span></p>
                    <p><strong>Total a Pagar: $<span id="total">950.00</span></strong></p>
                    <button class="btn-purchase">Generar Compra</button>
                    <button class="btn-pay">Realizar Pago</button>
                </div>
            </div>
        </main>
        <jsp:include page="/componentes/footer.jsp" />
    </body>
</html>
