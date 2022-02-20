<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
    <meta http-equiv="content-type" content="text/html; utf-8">
    <title>Proyecto GestLib</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/webjars/bootstrap-icons/1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">
                <h4 class="border-bottom">Préstamos pendientes de devolver</h4>
                <div class="row row-cols-1">
                    <!-- Un card por cada préstamo pendiente de devolver existente en bd -->
                    <c:forEach var="prestamo" varStatus="status" items="${prestamos}">
                        <c:if test="${prestamo.estado == 'PRESTADO'}">
                            <div class="col pb-2">
                                <a href="${pageContext.request.contextPath}/mvc/devolucionPrestamos/prestamo/${prestamo.id}"
                                   class="text-decoration-none">
                                    <div class="card shadow-sm h-100">
                                        <div class="card-header d-flex">
                                            <i class="bi bi-basket me-auto"></i>
                                            <strong>#${prestamo.id}</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-title me-auto">${prestamo.estado}</div>
                                            <div class="card-text text-secondary">
                                                <div class="row">
                                                    <div class="col-6">
                                                        Fecha de préstamo: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prestamo.fechaPrestamo}"></fmt:formatDate>
                                                    </div>
                                                    <div class="col-6">
                                                        Fecha de devolución: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prestamo.fechaDevolucion}"></fmt:formatDate>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <h4 class="border-bottom">Préstamos devueltos</h4>
                <div class="row row-cols-1">
                    <!-- Un card por cada préstamo pendiente de devolver existente en bd -->
                    <c:forEach var="prestamo" varStatus="status" items="${prestamos}">
                        <c:if test="${prestamo.estado != 'PRESTADO'}">
                            <div class="col pb-2">
                                <div class="card shadow-sm h-100">
                                    <div class="card-header d-flex">
                                        <i class="bi bi-basket me-auto"></i>
                                        <strong>#${prestamo.id}</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-title me-auto">${prestamo.estado}</div>
                                        <div class="card-text text-secondary">
                                            <div class="row">
                                                <div class="col-6">
                                                    Fecha de préstamo: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prestamo.fechaPrestamo}"></fmt:formatDate>
                                                </div>
                                                <div class="col-6">
                                                    Fecha de devolución: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prestamo.fechaDevolucion}"></fmt:formatDate>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>