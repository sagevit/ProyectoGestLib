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

                <form method="post" action="${pageContext.request.contextPath}/mvc/ediciones/actualizar" accept-charset="utf-8" role="form" class="row p-2">

                    <c:if test="${not empty edicion.id}">
                        <input id="id" name="idEdicion" type="hidden" value="${edicion.id}"/>
                    </c:if>
                    <c:if test="${not empty edicion.editorial.id}">
                        <input id="id" name="editorialEdicionId" type="hidden" value="${edicion.editorial.id}"/>
                    </c:if>
                    <c:if test="${not empty edicion.libro.id}">
                        <input id="id" name="libroEdicionId" type="hidden" value="${edicion.libro.id}"/>
                    </c:if>

                    <fieldset class="mb-3">
                        <legend>Datos de Libro</legend>

                        <div class="row">
                            <div class="col-4">
                                <span class="fs-6">Id:</span>
                                <span class="fs-5 fw-bold">#${edicion.libro.id}</span>
                            </div>
                            <div class="col-4">
                                <span class="fs-6">Título:</span>
                                <span class="fs-5 fw-bold">${edicion.libro.titulo}</span>
                            </div>
                            <div class="col-4">
                                <span class="fs-6">ISBN:</span>
                                <span class="fs-5 fw-bold">${edicion.libro.isbn}</span>
                            </div>
                        </div>

                        <table class="table caption-top">
                            <caption>Ediciones:</caption>
                            <thead>
                            <tr>
                                <th scope="col">Editorial</th>
                                <th scope="col">Año de edición</th>
                            </tr>
                            </thead>
                            <tbody id="tablaEdiciones">
                                <c:forEach var="edicion" varStatus="status" items="${edicion.libro.ediciones}">
                                    <tr>
                                        <td>
                                            ${edicion.editorial.nombre}
                                        </td>
                                        <td>
                                            ${edicion.anio}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </fieldset>

                    <fieldset class="mb-3">
                        <legend>Datos de Editorial</legend>
                        <div class="col-6 pb-3">
                            <label for="editorialEdicionId">Editorial *</label>
                            <div class="input-group ${not empty error.getMessage('editorialEdicionId') ? 'has-validation' : ''}">
                                <select id="editorialEdicionId" name="editorialEdicionId" autofocus
                                        class="form-select shadow-sm ${not empty error.getMessage('editorialEdicionId') ? 'is-invalid' : ''}">
                                    <option value="${null}">Seleccione editorial...</option>
                                    <c:forEach var="editorial" varStatus="status" items="${editoriales}">
                                        <option value="${editorial.id}" ${edicion.editorial.id == editorial.id ? 'selected' : ''}>${editorial.nombre}</option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback ms-1">${error.getMessage("editorialEdicionId")}</div>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset class="mb-3">
                        <legend>Datos de Edición</legend>

                        <div class="col-2 pb-3">
                            <label class="form-label ms-1" for="anioEdicion">Año de edición *</label>
                            <div class="input-group ${not empty error.getMessage('anioEdicion') ? 'has-validation' : ''}">
                                <input type="number" id="anioEdicion" name="anioEdicion" min="1800" max="2099" step="1"
                                       class="form-control shadow-sm ${not empty error.getMessage('anioEdicion') ? 'is-invalid' : ''}"
                                       value="${edicion.anio}">
                                <div class="invalid-feedback ms-1">${error.getMessage("anioEdicion")}</div>
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