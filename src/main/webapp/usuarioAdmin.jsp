<%@ page import="Persistencia.UsuarioDAO" %>
<%@ page import="Logica.Usuario" %>
<%@ page import="java.util.List" %>

<%
    
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    List<Usuario> usuarios = usuarioDAO.obtenerTodosLosUsuarios(); 
%>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>PETLIFE- ADMINISTRADOR</title>

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

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">PETLIFE </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>ADMINISTRADOR</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Páginas</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Contenido:</h6>
                            <a class="collapse-item" href="ventasAdmin.jsp">ventas</a>
                            <a class="collapse-item" href="productosAdmin.jsp">productos</a>                      
                            <a class="collapse-item" href="usuarioAdmin.jsp">usuarios</a>

                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>



                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="citasAdmin.jsp">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Citas</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>




            </ul>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">usuario</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Confirmar Cierre de Sesi�n</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">�</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">�Est�s seguro de que deseas cerrar sesi�n?</div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-primary" href="logout">Cerrar Sesi�n</a> <!-- Redirige al servlet de logout -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <div class="container-fluid">

                            <h1 class="h3 mb-2 text-gray-800">USUARIOS</h1>
                            <p class="mb-4">Esta tabla muestra los datos registrados.</p>

                            <!-- Bot�n para Agregar Usuario -->
                            <div class="mb-4">
                                <button class="btn btn-primary" onclick="mostrarModalAgregar()">Agregar Usuario</button>
                                
                                <br>
                                <br>
                                <a href="${pageContext.request.contextPath}/ReporteUsuarioServlet" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                        class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>

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
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Tel�fono</th>
                                                    <th>Correo</th>
                                                    <th>Rol</th>
                                                    <th>Elecci�n</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Tel�fono</th>
                                                    <th>Correo</th>
                                                    <th>Rol</th>
                                                    <th>Elecci�n</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%
                                                
                                                    for (Usuario usuario : usuarios) {
                                                %>
                                                <tr>
                                                    <td><%= usuario.getNombre() %></td>
                                                    <td><%= usuario.getApellido() %></td>
                                                    <td>--</td> 
                                                    <td><%= usuario.getCorreo() %></td>
                                                    <td><%= usuario.getRol() %></td>
                                                    <td>
                                                        <button class="btn btn-warning btn-sm" onclick="mostrarModalEditar(<%= usuario.getIdUsuario() %>, '<%= usuario.getNombre() %>', '<%= usuario.getApellido() %>', '<%= usuario.getCorreo() %>', '<%= usuario.getRol() %>', '<%= usuario.getContrasena() %>')">Editar</button>
                                                        <button class="btn btn-danger btn-sm" onclick="eliminarUsuario(<%= usuario.getIdUsuario() %>)">Eliminar</button>
                                                    </td>
                                                </tr>
                                                <%
                                                    } 
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal de Agregar/Editar Usuario -->
                            <div class="modal fade" id="usuarioModal" tabindex="-1" role="dialog" aria-labelledby="usuarioModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="usuarioModalLabel">Agregar Usuario</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="usuarioForm">
                                                <input type="hidden" id="usuarioId" name="usuarioId" value="">
                                                <div class="form-group">
                                                    <label for="nombre">Nombre</label>
                                                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="apellido">Apellido</label>
                                                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="correo">Correo</label>
                                                    <input type="email" class="form-control" id="correo" name="correo" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="rol">Rol</label>
                                                    <select class="form-control" id="rol" name="rol" required>
                                                        <option value="admin">Admin</option>
                                                        <option value="usuario">Usuario</option>
                                                    </select>
                                                </div>
                                                <!-- Campo de Contrase�a -->
                                                <div id="contrasenaDiv" class="form-group" style="display: none;">
                                                    <label for="contrasena">Contrase�a</label>
                                                    <input type="password" class="form-control" id="contrasena" name="contrasena">
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
                                function mostrarModalAgregar() {
                                    $('#usuarioModalLabel').text('Agregar Usuario');
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
                                    if (!confirm("�Est�s seguro de que quieres eliminar este usuario?"))
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
                        <!-- Footer -->
                        <footer class="sticky-footer bg-white">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto">
                                    <span>Copyright &copy; PETLIFE2024</span>
                                </div>
                            </div>
                        </footer>
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

                <!-- Logout Modal-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="login.html">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap core JavaScript-->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="js/sb-admin-2.min.js"></script>

                <!-- Page level plugins -->
                <script src="vendor/datatables/jquery.dataTables.min.js"></script>
                <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="js/demo/datatables-demo.js"></script>

                </body>

                </html>