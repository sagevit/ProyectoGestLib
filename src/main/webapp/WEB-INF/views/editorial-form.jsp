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

                <form method="post" action="${pageContext.request.contextPath}/mvc/editoriales/actualizar" accept-charset="utf-8" role="form" class="row p-2">

                    <c:if test="${not empty editorial.id}">
                        <input id="id" name="idEditorial" type="hidden" value="${editorial.id}"/>
                    </c:if>

                    <fieldset>
                        <legend>Datos de editorial</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="nombreEditorial">Nombre *</label>
                            <div class="input-group ${not empty error.getMessage('nombreEditorial') ? 'has-validation' : ''}">
                                <input type="text" id="nombreEditorial" name="nombreEditorial" placeholder="Nombre..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombreEditorial') ? 'is-invalid' : ''}"
                                       spellcheck="false" autofocus value="${editorial.nombre}">
                                <div class="invalid-feedback ms-1">${error.getMessage("nombreEditorial")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="sedeEditorial">Sede</label>
                            <div class="input-group ${not empty error.getMessage('sedeEditorial') ? 'has-validation' : ''}">
                                <textarea type="text" id="sedeEditorial" name="sedeEditorial" rows="5"
                                          cols="50" placeholder="Dirección de la sede..."
                                          class="form-control shadow-sm ${not empty error.getMessage('sedeEditorial') ? 'is-invalid' : ''}"
                                          spellcheck="false">${editorial.sede}</textarea>
                                <div class="invalid-feedback ms-1">${error.getMessage("sedeEditorial")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="nombrePais">País *</label>
                            <div class="input-group ${not empty error.getMessage('nombrePais') ? 'has-validation' : ''}">
                                <input type="text" list="paisOptions" id="nombrePais" name="nombrePais" placeholder="País de ubicación..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombrePais') ? 'is-invalid' : ''}"
                                       value="${editorial.pais.nombre}">
                                <datalist id="paisOptions">
                                    <c:forEach var="pais" varStatus="status" items="${paises}">
                                        <option value="${pais.nombre}" />
                                    </c:forEach>
                                </datalist>
                                <div class="invalid-feedback ms-1">${error.getMessage("nombrePais")}</div>
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