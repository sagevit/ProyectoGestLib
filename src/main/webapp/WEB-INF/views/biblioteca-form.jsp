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

                <form method="post" action="${pageContext.request.contextPath}/mvc/bibliotecas/actualizar" role="form" class="row p-2">

                    <c:if test="${not empty biblioteca.id}">
                        <input id="id" name="idBiblioteca" type="hidden" value="${biblioteca.id}"/>
                    </c:if>
                    <c:if test="${not empty gerente.id}">
                        <input id="id" name="idGerente" type="hidden" value="${gerente.id}"/>
                    </c:if>

                    <fieldset>
                        <legend>Datos de biblioteca</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="nombreBiblioteca">Nombre *</label>
                            <div class="input-group ${not empty error.getMessage('nombreBiblioteca') ? 'has-validation' : ''}">
                                <input type="text" id="nombreBiblioteca" name="nombreBiblioteca" placeholder="Nombre..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombreBiblioteca') ? 'is-invalid' : ''}"
                                       spellcheck="false" autofocus value="${biblioteca.nombre}">
                                <div class="invalid-feedback ms-1">${error.getMessage("nombreBiblioteca")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="direccionBiblioteca">Dirección</label>
                            <div class="input-group ${not empty error.getMessage('direccionBiblioteca') ? 'has-validation' : ''}">
                                <textarea type="text" id="direccionBiblioteca" name="direccionBiblioteca" rows="5"
                                          cols="50" placeholder="Dirección..."
                                          class="form-control shadow-sm ${not empty error.getMessage('direccionBiblioteca') ? 'is-invalid' : ''}"
                                          spellcheck="false">${biblioteca.direccion}</textarea>
                                <div class="invalid-feedback ms-1">${error.getMessage("direccionBiblioteca")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="telefonoBiblioteca">Teléfono</label>
                            <div class="input-group ${not empty error.getMessage('telefonoBiblioteca') ? 'has-validation' : ''}">
                                <input type="text" id="telefonoBiblioteca" name="telefonoBiblioteca"
                                       placeholder="Teléfono..."
                                       class="form-control shadow-sm ${not empty error.getMessage('telefonoBiblioteca') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${biblioteca.telefono}">
                                <div class="invalid-feedback ms-1">${error.getMessage("telefonoBiblioteca")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="emailBiblioteca">Correo electrónico</label>
                            <div class="input-group ${not empty error.getMessage('emailBiblioteca') ? 'has-validation' : ''}">
                                <input type="text" id="emailBiblioteca" name="emailBiblioteca"
                                       placeholder="Correo electrónico..."
                                       class="form-control shadow-sm ${not empty error.getMessage('emailBiblioteca') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${biblioteca.email}">
                                <div class="invalid-feedback ms-1">${error.getMessage("emailBiblioteca")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="webBiblioteca">Sitio web</label>
                            <div class="input-group ${not empty error.getMessage('webBiblioteca') ? 'has-validation' : ''}">
                                <input type="text" id="webBiblioteca" name="webBiblioteca" placeholder="Sitio web..."
                                       class="form-control shadow-sm ${not empty error.getMessage('webBiblioteca') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${biblioteca.web}">
                                <div class="invalid-feedback ms-1">${error.getMessage("webBiblioteca")}</div>
                            </div>
                        </div>

                    </fieldset>

                    <fieldset>
                        <legend>Datos de Gerente</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="nombreGerente">Nombre *</label>
                            <div class="input-group ${not empty error.getMessage('nombreGerente') ? 'has-validation' : ''}">
                                <input type="text" id="nombreGerente" name="nombreGerente" placeholder="Nombre..."
                                       class="form-control shadow-sm ${not empty error.getMessage('nombreGerente') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${gerente.nombre}">
                                <div class="invalid-feedback ms-1">${error.getMessage("nombreGerente")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido1Gerente">Primer apellido *</label>
                            <div class="input-group ${not empty error.getMessage('apellido1Gerente') ? 'has-validation' : ''}">
                                <input type="text" id="apellido1Gerente" name="apellido1Gerente" placeholder="Primer apellido..."
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido1Gerente') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${gerente.apellido1}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido1Gerente")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="apellido2Gerente">Segundo apellido</label>
                            <div class="input-group ${not empty error.getMessage('apellido2Gerente') ? 'has-validation' : ''}">
                                <input type="text" id="apellido2Gerente" name="apellido2Gerente" placeholder="Segundo apellido..."
                                       class="form-control shadow-sm ${not empty error.getMessage('apellido2Gerente') ? 'is-invalid' : ''}"
                                       spellcheck="false"
                                       value="${gerente.apellido2}">
                                <div class="invalid-feedback ms-1">${error.getMessage("apellido2Gerente")}</div>
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