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

                <form method="post" action="${pageContext.request.contextPath}/mvc/usuarios/actualizar" role="form" class="row p-2">

                    <c:if test="${not empty usuario.id}">
                        <input id="id" name="idUsuario" type="hidden" value="${usuario.id}"/>
                    </c:if>

                    <fieldset>
                        <legend>Datos de usuario</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="nombreUsuario">Nombre *</label>
                            <div class="input-group ${not empty error.getMessage('nombreUsuario') ? 'has-validation' : ''}">
                                <input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombreUsuario') ? 'is-invalid' : ''}"
                                       spellcheck="false" autofocus value="${usuario.nombre}">
                                <div class="invalid-feedback ms-1">${error.getMessage("nombreUsuario")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido1Usuario">Primer apellido *</label>
                            <div class="input-group ${not empty error.getMessage('apellido1Usuario') ? 'has-validation' : ''}">
                                <input type="text" id="apellido1Usuario" name="apellido1Usuario"
                                       placeholder="Primer apellido..." spellcheck="false"
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido1Usuario') ? 'is-invalid' : ''}"
                                       value="${usuario.apellido1}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido1Usuario")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido2Usuario">Segundo apellido</label>
                            <div class="input-group ${not empty error.getMessage('apellido2Usuario') ? 'has-validation' : ''}">
                                <input type="text" id="apellido2Usuario" name="apellido2Usuario"
                                       placeholder="Segundo apellido..." spellcheck="false"
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido2Usuario') ? 'is-invalid' : ''}"
                                       value="${usuario.apellido2}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido2Usuario")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="dniUsuario">D.N.I.</label>
                            <div class="input-group ${not empty error.getMessage('dniUsuario') ? 'has-validation' : ''}">
                                <input type="text" id="dniUsuario" name="dniUsuario"
                                       placeholder="DNI..."
                                       class="form-control shadow-sm ${not empty error.getMessage('dniUsuario') ? 'is-invalid' : ''}"
                                       value="${usuario.dni}">
                                <div class="invalid-feedback ms-1">${error.getMessage("dniUsuario")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="direccionUsuario">Dirección</label>
                            <div class="input-group ${not empty error.getMessage('direccionUsuario') ? 'has-validation' : ''}">
                                <textarea type="text" id="direccionUsuario" name="direccionUsuario" rows="5"
                                          cols="50" placeholder="Dirección..."
                                          class="form-control shadow-sm ${not empty error.getMessage('direccionUsuario') ? 'is-invalid' : ''}"
                                          spellcheck="false">${usuario.direccion}</textarea>
                                <div class="invalid-feedback ms-1">${error.getMessage("direccionUsuario")}</div>
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