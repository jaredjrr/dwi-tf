<head>
    <!-- Metadata básica -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Metadata adicional para SEO -->
    <meta name="description" content="Descripción de la página, ajustada dinámicamente para mejorar SEO y proporcionar información precisa.">
    <meta name="keywords" content="palabras, clave, relevantes, para, SEO">
    <meta name="author" content="Nombre del autor o empresa">

    <!-- Título dinámico -->
    <title><%= request.getAttribute("pageTitle") != null ? request.getAttribute("pageTitle") : "Veterinaria PetLife" %></title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">

    <!-- Open Graph para compartir en redes sociales -->
    <meta property="og:title" content="<%= request.getAttribute("pageTitle") != null ? request.getAttribute("pageTitle") : "Título predeterminado - Mi Empresa" %>">
    <meta property="og:description" content="Descripción optimizada para compartir en redes sociales y mejorar la visibilidad.">
    <meta property="og:image" content="${pageContext.request.contextPath}/images/og-image.jpg">
    <meta property="og:url" content="https://miempresa.com">
    <meta name="twitter:card" content="summary_large_image">

    <!-- Estilos externos -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Scripts (defer para mejorar el rendimiento) -->
    <script src="${pageContext.request.contextPath}/js/scripts.js" defer></script>

    <!-- Preconexión a Google Fonts para mejorar el tiempo de carga -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
