# Sistema de Gestión para Veterinarias

Este proyecto consiste en el desarrollo de un sistema integral para la administración de una clínica veterinaria. Su objetivo es automatizar las tareas clave del negocio, mejorando la eficiencia en la gestión de citas, clientes, productos, servicios y el seguimiento médico de las mascotas. El sistema facilita la generación de reportes financieros, gestión de inventario y la atención médica personalizada, optimizando el flujo de trabajo dentro de la clínica.

## Objetivos del Proyecto

- **Automatización de Procesos:** Minimizar tareas manuales, permitiendo una mejor organización y optimización de los recursos.
- **Atención al Cliente:** Ofrecer un sistema eficiente para el registro de mascotas, agendamiento de citas y control de servicios prestados.
- **Control de Inventario:** Mantener actualizado el stock de productos, asegurando que los suministros necesarios estén siempre disponibles.
- **Gestión Financiera:** Generar reportes de ventas, compras y pagos de manera rápida y precisa para facilitar la toma de decisiones.

## Funcionalidades Principales

- **Generación de Boletas y Facturas:** El sistema permite emitir boletas y facturas para todas las transacciones, facilitando el control de las ventas y servicios prestados a los clientes.
- **Gestión de Citas:** Los usuarios pueden agendar, modificar y cancelar citas fácilmente, asegurando un flujo de trabajo ordenado dentro de la clínica veterinaria.
- **Reportes de Ventas:** El administrador puede generar reportes de ventas detallados en función de un período de tiempo específico.
- **Gestión de Inventario:** El sistema incluye una función para el manejo de inventario, permitiendo agregar, modificar o eliminar productos de manera sencilla.
- **Agregar Nuevos Productos o Servicios:** Se pueden añadir nuevos productos y servicios a la clínica, manteniendo el catálogo actualizado.
- **Registro de Historial Clínico:** El sistema almacena el historial médico de las mascotas, permitiendo a los veterinarios acceder a los antecedentes clínicos y agregar nueva información.
- **Registro de Compras:** La plataforma permite registrar todas las compras a proveedores, facilitando el seguimiento del inventario.
- **Gestión de Usuarios:** Se incluyen diferentes roles y permisos para empleados y administradores, permitiendo un control adecuado del acceso a las funciones del sistema.

## Tecnologías Utilizadas

- **Lenguaje de programación:** Jakarta EE
- **Base de datos:** MySQL
- **Frontend:** JSP, CSS, Bootstrap
- **Servidor de Aplicaciones:** GlassFish

# Estructura del Proyecto
## Carpetas
### Web Pages (Páginas Web)

- **WEB-INF**:
  - web.xml: Archivo de configuración de despliegue para aplicaciones Jakarta EE, donde se definen mapeos de servlets, configuraciones de seguridad, y parámetros necesarios para la ejecución de la aplicación.
  - glassfish-web.xml: Archivo de configuración específico para GlassFish, donde se definen los recursos y configuraciones necesarias del servidor.

- **Componentes**:
  - footer.jsp: Archivo JSP para el pie de página que se reutiliza en las distintas páginas del proyecto.
  - header.jsp: Archivo JSP que contiene el encabezado de la aplicación.
  - head.jsp: Archivo JSP para incluir las configuraciones del <head> de las páginas (metadatos, enlaces a archivos CSS y JS).

- **CSS**:
  - nosotros.css: Hoja de estilos personalizada para la página "Nosotros".
  - styles.css: Hoja de estilos generales utilizada en todas las páginas del proyecto.

- **Imágenes**:
  - Carpeta que contiene las imágenes utilizadas en diferentes partes de la aplicación.

- **JSP Pages**:
  - cita.jsp: Página JSP que gestiona la funcionalidad de citas en la aplicación.
  - index.jsp: Página principal de la aplicación.
  - inicio.jsp: Página de inicio que presenta las principales funcionalidades.
  - login.jsp: Página JSP que gestiona el inicio de sesión.
  - nosotros.jsp: Página de información sobre la empresa o equipo.
  - productos.jsp: Página JSP que muestra la lista de productos disponibles en la aplicación.
  - servicio.jsp: Página JSP para gestionar y mostrar los servicios ofrecidos.

### Archivos Remotos (Remote Files)

- bootstrap.bundle.min.js, bootstrap.min.css, jquery-3.5.1.slim.min.js: Estas librerías son utilizadas para mejorar el diseño visual y la interactividad de la aplicación.
- popper.min.js, boxicons.min.css: Herramientas adicionales para el manejo de interactividad y diseño.

### Source Packages (Paquetes Fuente)

- **Paquete: org.eclipse.jakarta.hello**
  - Hello.java: Clase que define la lógica principal o el servlet en la aplicación.
  - HelloApplication.java: Clase que define la configuración principal de la aplicación JakartaEE y las rutas de la API.
  - HelloWorldResource.java: Recurso RESTful que gestiona las solicitudes HTTP y devuelve las respuestas.

### Dependencias

- **Java Dependencies**: Librerías necesarias para la ejecución del proyecto JakartaEE.
- **Bootstrap & jQuery**: Librerías de diseño visual y funcionalidad que mejoran la experiencia del usuario.


# Base de Datos

El sistema cuenta con una base de datos estructurada que incluye las siguientes tablas:

create database veterinaria;
use veterinaria;
CREATE TABLE citas (
  id_cita int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  fecha_hora datetime NOT NULL,
  descripcion text,
  estado enum('pendiente','confirmada','cancelada','completada') NOT NULL DEFAULT 'pendiente',
  servicio varchar(50) DEFAULT NULL,
  id_mascota int DEFAULT NULL,
  PRIMARY KEY (id_cita),
  KEY id_cliente (id_cliente),
  KEY idx_cita_estado (estado),
  CONSTRAINT citas_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE clientes (
  id_cliente int NOT NULL AUTO_INCREMENT,
  id_usuario int NOT NULL,
  direccion varchar(255) DEFAULT NULL,
  telefono varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_cliente),
  KEY id_usuario (id_usuario),
  CONSTRAINT clientes_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE compras (
  id_compra int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  fecha datetime NOT NULL,
  total decimal(10,2) NOT NULL,
  estado enum('pendiente','pagada','cancelada') NOT NULL DEFAULT 'pendiente',
  id_promocion int DEFAULT NULL,
  PRIMARY KEY (id_compra),
  KEY id_cliente (id_cliente),
  KEY id_promocion (id_promocion),
  KEY idx_compra_estado (estado),
  CONSTRAINT compras_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE CASCADE,
  CONSTRAINT compras_ibfk_2 FOREIGN KEY (id_promocion) REFERENCES promociones (id_promocion) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE contactos (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  telefono varchar(20) DEFAULT NULL,
  reclamo text,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_compras (
  id_detalle int NOT NULL AUTO_INCREMENT,
  id_compra int NOT NULL,
  id_producto int NOT NULL,
  cantidad int NOT NULL,
  precio_unitario decimal(10,2) NOT NULL,
  subtotal decimal(10,2) NOT NULL,
  PRIMARY KEY (id_detalle),
  KEY id_compra (id_compra),
  KEY id_producto (id_producto),
  CONSTRAINT detalle_compras_ibfk_1 FOREIGN KEY (id_compra) REFERENCES compras (id_compra) ON DELETE CASCADE,
  CONSTRAINT detalle_compras_ibfk_2 FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE CASCADE,
  CONSTRAINT chk_detalle_compras_cantidad CHECK ((cantidad > 0)),
  CONSTRAINT chk_detalle_compras_subtotal CHECK ((subtotal = (cantidad * precio_unitario)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE empleados (
  id_empleado int NOT NULL AUTO_INCREMENT,
  id_usuario int NOT NULL,
  cargo varchar(100) DEFAULT NULL,
  salario decimal(10,2) DEFAULT NULL,
  fecha_contratacion date DEFAULT NULL,
  PRIMARY KEY (id_empleado),
  KEY id_usuario (id_usuario),
  CONSTRAINT empleados_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE facturas_boletas (
  id_documento int NOT NULL AUTO_INCREMENT,
  id_compra int NOT NULL,
  tipo_documento enum('boleta','factura') NOT NULL,
  fecha_emision datetime NOT NULL,
  total decimal(10,2) NOT NULL,
  estado enum('emitida','anulada') NOT NULL DEFAULT 'emitida',
  PRIMARY KEY (id_documento),
  KEY id_compra (id_compra),
  KEY idx_factura_estado (estado),
  CONSTRAINT facturas_boletas_ibfk_1 FOREIGN KEY (id_compra) REFERENCES compras (id_compra) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE historial_empleados (
  id_historial int NOT NULL AUTO_INCREMENT,
  id_empleado int NOT NULL,
  accion varchar(255) NOT NULL,
  fecha datetime NOT NULL,
  PRIMARY KEY (id_historial),
  KEY id_empleado (id_empleado),
  CONSTRAINT historial_empleados_ibfk_1 FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE historial_mascota (
  id_historial int NOT NULL AUTO_INCREMENT,
  id_mascota int NOT NULL,
  id_empleado int NOT NULL,
  descripcion text,
  fecha_visita datetime NOT NULL,
  PRIMARY KEY (id_historial),
  KEY id_mascota (id_mascota),
  KEY id_empleado (id_empleado),
  CONSTRAINT historial_mascota_ibfk_1 FOREIGN KEY (id_mascota) REFERENCES mascotas (id_mascota) ON DELETE CASCADE,
  CONSTRAINT historial_mascota_ibfk_2 FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE insumos_medicos (
  id_insumo int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  descripcion text,
  cantidad int NOT NULL,
  fecha_vencimiento date DEFAULT NULL,
  proveedor varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_insumo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE mascotas (
  id_mascota int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  nombre varchar(100) NOT NULL,
  especie varchar(50) DEFAULT NULL,
  raza varchar(50) DEFAULT NULL,
  edad int DEFAULT NULL,
  peso decimal(5,2) DEFAULT NULL,
  fecha_registro date DEFAULT NULL,
  PRIMARY KEY (id_mascota),
  KEY id_cliente (id_cliente),
  CONSTRAINT mascotas_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE notificaciones (
  id_notificacion int NOT NULL AUTO_INCREMENT,
  id_usuario int NOT NULL,
  mensaje text,
  fecha datetime NOT NULL,
  leida tinyint(1) DEFAULT '0',
  PRIMARY KEY (id_notificacion),
  KEY id_usuario (id_usuario),
  CONSTRAINT notificaciones_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE pagos (
  id_pago int NOT NULL AUTO_INCREMENT,
  id_compra int NOT NULL,
  metodo_pago enum('tarjeta_credito','tarjeta_debito','transferencia','paypal') NOT NULL,
  fecha_pago datetime NOT NULL,
  monto decimal(10,2) NOT NULL,
  PRIMARY KEY (id_pago),
  KEY id_compra (id_compra),
  KEY idx_pago_metodo (metodo_pago),
  CONSTRAINT pagos_ibfk_1 FOREIGN KEY (id_compra) REFERENCES compras (id_compra) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE productos (
  id_producto int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  descripcion text,
  precio decimal(10,2) NOT NULL,
  stock int NOT NULL,
  categoria varchar(100) DEFAULT NULL,
  id_proveedor int DEFAULT NULL,
  PRIMARY KEY (id_producto),
  KEY id_proveedor (id_proveedor),
  KEY idx_producto_categoria (categoria),
  CONSTRAINT productos_ibfk_1 FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE promociones (
  id_promocion int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  descripcion text,
  porcentaje_descuento decimal(5,2) DEFAULT NULL,
  fecha_inicio date DEFAULT NULL,
  fecha_fin date DEFAULT NULL,
  PRIMARY KEY (id_promocion),
  KEY idx_promocion_fecha (fecha_inicio,fecha_fin)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE proveedores (
  id_proveedor int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  contacto varchar(100) DEFAULT NULL,
  telefono varchar(20) DEFAULT NULL,
  correo varchar(100) DEFAULT NULL,
  direccion varchar(255) DEFAULT NULL,
  PRIMARY KEY (id_proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE reseñas (
  id_reseña int NOT NULL AUTO_INCREMENT,
  id_producto int DEFAULT NULL,
  id_cliente int DEFAULT NULL,
  calificacion int DEFAULT NULL,
  comentario text,
  fecha datetime DEFAULT NULL,
  PRIMARY KEY (id_reseña),
  KEY id_producto (id_producto),
  KEY id_cliente (id_cliente),
  KEY idx_reseña_calificacion (calificacion),
  CONSTRAINT reseñas_ibfk_1 FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE CASCADE,
  CONSTRAINT reseñas_ibfk_2 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE CASCADE,
  CONSTRAINT chk_reseñas_calificacion CHECK ((calificacion between 1 and 5)),
  CONSTRAINT reseñas_chk_1 CHECK ((calificacion between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE usuarios (
  id_usuario int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) NOT NULL,
  correo varchar(100) NOT NULL,
  contrasena varchar(255) DEFAULT NULL,
  rol varchar(10) DEFAULT NULL,
  auth_code varchar(6) DEFAULT NULL,
  auth_enabled tinyint(1) DEFAULT '0',
  PRIMARY KEY (id_usuario),
  UNIQUE KEY correo (correo),
  KEY idx_usuario_correo (correo)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



## Contribuciones

Si deseas contribuir al desarrollo de este proyecto, por favor sigue los lineamientos para crear un fork y enviar un pull request.

 
