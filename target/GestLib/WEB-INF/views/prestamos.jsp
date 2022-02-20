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
                    <div class="row row-cols-2">
                        <!-- Un card por cada biblioteca existente en bd -->
                        <c:forEach var="biblioteca" varStatus="status" items="${bibliotecas}">
                            <div class="col pb-2">
                                <a href="${pageContext.request.contextPath}/mvc/creacionPrestamos/${biblioteca.id}" class="text-decoration-none">
                                    <div class="card shadow-sm h-100">
                                        <div class="card-header d-flex">
                                            <i class="bi bi-building me-auto"></i>
                                            <strong>#${biblioteca.id}</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-title">${biblioteca.nombre}</div>
                                            <div class="d-flex">
                                                <div class="card-text text-secondary me-auto">${biblioteca.direccion}</div>
                                            </div>
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
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>