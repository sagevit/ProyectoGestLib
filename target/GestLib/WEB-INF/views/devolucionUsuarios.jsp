<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
    <meta http-equiv="content-type" content="text/html; utf-8">
    <title>Proyecto GestLib</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-icons/1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">
                <h4 class="border-bottom">Usuarios que tienen préstamos pendientes de devolución</h4>
                <div class="row row-cols-4">
                    <!-- Un card por cada usuario con prestamos pendientes -->
                    <c:forEach var="usuario" varStatus="status" items="${usuarios}">
                        <div class="col pb-2">
                            <a href="${pageContext.request.contextPath}/mvc/devolucionPrestamos/${usuario.id}" class="text-decoration-none">
                                <div class="card shadow-sm h-100">
                                    <div class="card-header d-flex">
                                        <i class="bi bi-person me-auto"></i>
                                        <strong>#${usuario.id}</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-title me-auto">${usuario.nombreCompleto}</div>
                                        <div class="card-text text-secondary">${usuario.dni}</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>