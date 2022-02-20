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

                <form method="post" action="${pageContext.request.contextPath}/mvc/libros/actualizar" role="form" class="row p-2">

                    <c:if test="${not empty libro.id}">
                        <input id="id" name="idLibro" type="hidden" value="${libro.id}"/>
                    </c:if>

                    <fieldset>
                        <legend>Datos de libro</legend>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="tituloLibro">Título *</label>
                            <div class="input-group ${not empty error.getMessage('tituloLibro') ? 'has-validation' : ''}">
                                <input type="text" id="tituloLibro" name="tituloLibro" placeholder="Título..."
                                       class="form-control shadow-sm ${not empty error.getMessage('tituloLibro') ? 'is-invalid' : ''}"
                                       spellcheck="false" autofocus value="${libro.titulo}">
                                <div class="invalid-feedback ms-1">${error.getMessage("tituloLibro")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label class="form-label ms-1" for="isbnLibro">ISBN *</label>
                            <div class="input-group ${not empty error.getMessage('isbnLibro') ? 'has-validation' : ''}">
                                <input type="text" id="isbnLibro" name="isbnLibro" placeholder="ISBN..."
                                       class="form-control shadow-sm ${not empty error.getMessage('isbnLibro') ? 'is-invalid' : ''}"
                                       spellcheck="false" value="${libro.isbn}">
                                <div class="invalid-feedback ms-1">${error.getMessage("isbnLibro")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="sinopsisLibro">Sinopsis</label>
                            <div class="input-group ${not empty error.getMessage('sinopsisLibro') ? 'has-validation' : ''}">
                                <textarea type="text" id="sinopsisLibro" name="sinopsisLibro" rows="5"
                                          cols="50" placeholder="Sinopsis..."
                                          class="form-control shadow-sm ${not empty error.getMessage('sinopsisLibro') ? 'is-invalid' : ''}"
                                          spellcheck="false">${libro.sinopsis}</textarea>
                                <div class="invalid-feedback ms-1">${error.getMessage("sinopsisLibro")}</div>
                            </div>
                        </div>

                        <div class="col-6 pb-3">
                            <label for="libroAutorId">Autor *</label>
                            <div class="input-group ${not empty error.getMessage('libroAutorId') ? 'has-validation' : ''}">
                                <select id="libroAutorId" name="libroAutorId"
                                        class="form-select shadow-sm ${not empty error.getMessage('libroAutorId') ? 'is-invalid' : ''}">
                                    <option value="${null}">Seleccione autor...</option>
                                    <c:forEach var="autor" varStatus="status" items="${autores}">
                                        <option value="${autor.id}" ${libro.autor.id == autor.id ? 'selected' : ''}>${autor.nombreCompleto}</option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback ms-1">${error.getMessage("libroAutorId")}</div>
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