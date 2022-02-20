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

                <form method="post" action="${pageContext.request.contextPath}/mvc/devolucionPrestamos/actualizar" role="form" class="row p-2">

                    <input id="devolucionId" name="devolucionId" type="hidden" value="${prestamo.id}"/>

                    <fieldset>
                        <legend>Datos del préstamo</legend>

                        <h6>Libros</h6>

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Título</th>
                                <th scope="col">ISBN</th>
                                <th scope="col">Autor</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="ejemplar" varStatus="status" items="${prestamo.ejemplares}">
                                <tr>
                                    <th scope="row">${ejemplar.edicion.libro.id}</th>
                                    <td>${ejemplar.edicion.libro.titulo}</td>
                                    <td>${ejemplar.edicion.libro.isbn}</td>
                                    <td>${ejemplar.edicion.libro.autor.nombreCompleto}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="col-3 pb-3">
                            <label class="form-label ms-1" for="fechaCreacionPrestamo">Fecha de préstamo *</label>
                            <div class="input-group">
                                <input type="date" id="fechaCreacionPrestamo" name="fechaCreacionPrestamo" disabled
                                       class="form-control shadow-sm" value="${prestamo.fechaPrestamo}">
                            </div>
                        </div>

                        <div class="col-3 pb-3">
                            <label class="form-label ms-1" for="fechaDevolucionDevolucion">Fecha de devolución *</label>
                            <div class="input-group ${not empty error.getMessage('fechaDevolucionDevolucion') ? 'has-validation' : ''}">
                                <input type="date" id="fechaDevolucionDevolucion" name="fechaDevolucionDevolucion"
                                       class="form-control shadow-sm ${not empty error.getMessage('fechaDevolucionDevolucion') ? 'is-invalid' : ''}"
                                       value="${prestamo.fechaDevolucion}">
                                <div class="invalid-feedback ms-1">${error.getMessage("fechaDevolucionDevolucion")}</div>
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