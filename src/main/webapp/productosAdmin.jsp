<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>PETLIFE- PRODUCTOS</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <jsp:include page="/componentes/headeradmin.jsp" />



            <div class="container-fluid">

                <div class="container-fluid">

                    <h1 class="h3 mb-2 text-gray-800">PRODUCTOS</h1>
                    <p class="mb-4">Esta tabla muestra los productos.</p>

                    <!-- Botón para Agregar Usuario -->
                    <div class="mb-4">
                        <button class="btn btn-primary" onclick="mostrarModalAgregar()">Agregar producto</button>
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Datos Generales</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Categoria</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Precio</th>
                                            <th>Stock</th>
                                            <th>Elección</th>
                                        </tr>
                                    </thead>
                                    
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Modal de Agregar/Editar producto-->
                    <div class="modal fade" id="usuarioModal" tabindex="-1" role="dialog" aria-labelledby="usuarioModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="usuarioModalLabel">Agregar Productos</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="usuarioForm">
                                        <input type="hidden" id="Idcategoria" name="Idcategoria" value="">
                                        <div class="form-group">
                                            <label for="categoria">Categoria</label>
                                            <input type="text" class="form-control" id="categoria" name="categoria" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="nombre">Nombre del producto</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="descripcion">Descripción</label>
                                            <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="precio">Precio</label>
                                            <input type="text" class="form-control" id="precio" name="precio" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="imagen">Imagen del producto</label>
                                            <input type="file" class="form-control" id="imagen" name="imagen" accept="image/*" onchange="previewImage(event)">
                                        </div>
                                        <div class="form-group">
                                            <label>Vista previa de la imagen:</label>
                                            <img id="imagenPreview" src="#" alt="Vista previa" style="max-width: 50%; height: auto; display: none;">
                                        </div>
                                        <div class="form-group">
                                            <label for="stock">Stock</label>
                                            <input type="text" class="form-control" id="stock" name="stock" required>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-primary" onclick="guardarUsuario()">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        function previewImage(event) {
                            const input = event.target;
                            const preview = document.getElementById('imagenPreview');

                            if (input.files && input.files[0]) {
                                const reader = new FileReader();

                                reader.onload = function (e) {
                                    preview.src = e.target.result;
                                    preview.style.display = "block";
                                };

                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                        function mostrarModalAgregar() {
                            $('#usuarioModalLabel').text('Agregar Producto');
                            $('#usuarioId').val('');
                            $('#nombre').val('');
                            $('#apellido').val('');
                            $('#correo').val('');
                            $('#rol').val('usuario');
                            $('#contrasena').val('');
                            $('#contrasenaDiv').show();
                            $('#usuarioModal').modal('show');
                        }

                        function mostrarModalEditar(id, nombre, apellido, correo, rol, contrasena) {
                            $('#usuarioModalLabel').text('Editar Usuario');
                            $('#usuarioId').val(id);
                            $('#nombre').val(nombre);
                            $('#apellido').val(apellido);
                            $('#correo').val(correo);
                            $('#rol').val(rol);
                            $('#contrasena').val(contrasena);
                            $('#contrasenaDiv').show();
                            $('#usuarioModal').modal('show');
                        }

                        function guardarUsuario() {
                            const id = $('#usuarioId').val();
                            const nombre = $('#nombre').val();
                            const apellido = $('#apellido').val();
                            const correo = $('#correo').val();
                            const rol = $('#rol').val();
                            const contrasena = $('#contrasena').val();


                            const data = {
                                usuarioId: id,
                                nombre: nombre,
                                apellido: apellido,
                                correo: correo,
                                rol: rol,
                                action: id ? 'editar' : 'agregar'
                            };


                            if (!id) {
                                data.contrasena = contrasena;
                            }


                            $.ajax({
                                url: 'UsuarioServlet',
                                type: 'POST',
                                data: data,
                                success: function (response) {
                                    alert(response.message);
                                    location.reload();
                                },
                                error: function (xhr, status, error) {
                                    alert('Error al guardar usuario: ' + error);
                                }
                            });

                            $('#usuarioModal').modal('hide');
                        }

                        function eliminarUsuario(userId) {
                            if (!confirm("¿Estás seguro de que quieres eliminar este usuario?"))
                                return;

                            $.ajax({
                                url: 'UsuarioServlet',
                                type: 'POST',
                                data: {
                                    usuarioId: userId,
                                    action: 'eliminar'
                                },
                                success: function (response) {
                                    alert(response.message);
                                    location.reload();
                                },
                                error: function (xhr, status, error) {
                                    alert('Error al eliminar usuario: ' + error);
                                }
                            });
                        }
                    </script>
                </div>


            </div>

            <jsp:include page="/componentes/footeradmin.jsp" />

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <jsp:include page="/componentes/cerraradmin.jsp" />


    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>