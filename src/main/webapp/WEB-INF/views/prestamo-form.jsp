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

                <form method="post" action="${pageContext.request.contextPath}/mvc/creacionPrestamos/actualizar" role="form" class="row p-2">

                    <input id="bibliotecaPrestamoId" name="bibliotecaPrestamoId" type="hidden" value="${idBiblioteca}"/>
                    <input id="usuarioPrestamoId" name="usuarioPrestamoId" type="hidden" value="${idUsuario}"/>

                    <fieldset>
                        <legend>Ejemplares disponibles</legend>

                        <div class="list-group mx-0">
                            <c:forEach var="ejemplar" varStatus="status" items="${ejemplares}">
                                <label class="list-group-item d-flex gap-2 form-check-label">
                                    <input type="checkbox" class="form-check-input" id="check${status.index}" name="ejemplarPrestamoId" value="${ejemplar.id}">
                                    <span>#${ejemplar.id} - ${ejemplar.edicion.libro.titulo}
                                        <small class="d-block text-muted">ISBN: ${ejemplar.edicion.libro.isbn}</small>
                                    </span>
                                </label>
                            </c:forEach>
                            <c:if test="${not empty error.getMessage('ejemplarPrestamoId')}">
                                <div class="text-danger ms-1">${error.getMessage("ejemplarPrestamoId")}</div>
                            </c:if>
                    </fieldset>

                    <fieldset>
                        <legend>Datos del préstamo</legend>

                        <div class="col-3 pb-3">
                            <label class="form-label ms-1" for="fechaCreacionPrestamo">Fecha de préstamo *</label>
                            <div class="input-group ${not empty error.getMessage('fechaCreacionPrestamo') ? 'has-validation' : ''}">
                                <input type="date" id="fechaCreacionPrestamo" name="fechaCreacionPrestamo"
                                       class="form-control shadow-sm ${not empty error.getMessage('fechaCreacionPrestamo') ? 'is-invalid' : ''}"
                                       value="${fechaCreacion}">
                                <div class="invalid-feedback ms-1">${error.getMessage("fechaCreacionPrestamo")}</div>
                            </div>
                        </div>

                        <div class="col-3 pb-3">
                            <label class="form-label ms-1" for="fechaDevolucionPrestamo">Fecha de devolución *</label>
                            <div class="input-group ${not empty error.getMessage('fechaDevolucionPrestamo') ? 'has-validation' : ''}">
                                <input type="date" id="fechaDevolucionPrestamo" name="fechaDevolucionPrestamo"
                                       class="form-control shadow-sm ${not empty error.getMessage('fechaDevolucionPrestamo') ? 'is-invalid' : ''}"
                                       value="${fechaDevolucion}">
                                <div class="invalid-feedback ms-1">${error.getMessage("fechaDevolucionPrestamo")}</div>
                            </div>
                        </div>

                    </fieldset>

                    <div class="col-1 pb-3">
                        <button type="submit" class="btn btn-primary mb-3">Aceptar</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>