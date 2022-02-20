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

                <form method="post" action="${pageContext.request.contextPath}/mvc/autores/actualizar" role="form" class="row p-2">

                    <c:if test="${not empty autor.id}">
                        <input id="id" name="idAutor" type="hidden" value="${autor.id}"/>
                    </c:if>

                    <fieldset>
                        <legend>Datos de autor</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="nombreAutor">Nombre *</label>
                            <div class="input-group ${not empty error.getMessage('nombreAutor') ? 'has-validation' : ''}">
                                <input type="text" id="nombreAutor" name="nombreAutor" placeholder="Nombre..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombreAutor') ? 'is-invalid' : ''}"
                                       spellcheck="false" autofocus value="${autor.nombre}">
                                <div class="invalid-feedback ms-1">${error.getMessage("nombreAutor")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido1Autor">Primer apellido *</label>
                            <div class="input-group ${not empty error.getMessage('apellido1Autor') ? 'has-validation' : ''}">
                                <input type="text" id="apellido1Autor" name="apellido1Autor"
                                       placeholder="Primer apellido..." spellcheck="false"
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido1Autor') ? 'is-invalid' : ''}"
                                       value="${autor.apellido1}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido1Autor")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido2Autor">Segundo apellido</label>
                            <div class="input-group ${not empty error.getMessage('apellido2Autor') ? 'has-validation' : ''}">
                                <input type="text" id="apellido2Autor" name="apellido2Autor"
                                       placeholder="Segundo apellido..." spellcheck="false"
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido2Autor') ? 'is-invalid' : ''}"
                                       value="${autor.apellido2}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido2Autor")}</div>
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