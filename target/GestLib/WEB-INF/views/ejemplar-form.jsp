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

    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

    <script>

        var arrayEdiciones = [];
        <c:forEach var="edicion" varStatus="status" items="${ediciones}">
            var edicion = {
                "index": ${status.index},
                "editorialId": "${edicion.editorial.id}",
                "libroId": "${edicion.libro.id}",
                "tituloLibro": "${edicion.libro.titulo}",
                "isbnLibro": "${edicion.libro.isbn}"
            };
            arrayEdiciones.push(edicion);
        </c:forEach>

        //Búsqueda de ediciones
        $(document).ready(function () {

            $('#edicion').on('keyup', function () {

                var searching = $(this).val();
                var salida = "";

                $('#listaEdiciones').css('display', 'inline');

                if (searching.length !== 0) {
                    arrayEdiciones.forEach(edicion => {

                        var inLowerValueTitulo = edicion['tituloLibro'].toLowerCase();
                        var inLowerValueIsbn = edicion['isbnLibro'].toLowerCase();
                        var inLowerSearch = searching.toLowerCase();

                        if (inLowerValueTitulo.includes(inLowerSearch) || inLowerValueIsbn.includes(inLowerSearch)) {
                            var textoLibro = edicion['tituloLibro'] + ' - ' + edicion['isbnLibro'];
                            salida += '<li class="list-group-item" data-libro="' + edicion['libroId'] + '" data-editorial="' + edicion['editorialId'] + '"><a href="javascript:void(0)" class="text-decoration-none" id="rowEdicion">' + textoLibro + '</a></li>';
                        }
                    });
                    if (salida == "") {
                        salida = '<li class="list-group-item fst-italic">No se localizan registros.</li>';
                    }
                }

                $('#listaEdiciones').html(salida);
            });
        });

        $(document).on('click', '#rowEdicion', function () {
            $('#edicion').val($(this).text());
            $('#libroEjemplarId').val($(this).parent().attr('data-libro'));
            $('#editorialEjemplarId').val($(this).parent().attr('data-editorial'));
            $('#listaEdiciones').css('display', 'none');
        });

    </script>

</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <form method="post" action="${pageContext.request.contextPath}/mvc/ejemplares/actualizar" accept-charset="utf-8" role="form" class="row p-2">

                    <c:if test="${not empty biblioteca.id}">
                        <input id="bibliotecaEjemplarId" name="bibliotecaEjemplarId" type="hidden" value="${biblioteca.id}"/>
                    </c:if>
                    <input id="libroEjemplarId" name="libroEjemplarId" type="hidden" value="${ejemplarForm.libroId}"/>
                    <input id="editorialEjemplarId" name="editorialEjemplarId" type="hidden" value="${ejemplarForm.editorialId}"/>

                    <fieldset class="mb-3">
                        <legend>Datos de Biblioteca</legend>

                        <div class="row">
                            <div class="col-4">
                                <span class="fs-6">Id:</span>
                                <span class="fs-5 fw-bold">#${biblioteca.id}</span>
                            </div>
                            <div class="col-8">
                                <span class="fs-6">Nombre:</span>
                                <span class="fs-5 fw-bold">${biblioteca.nombre}</span>
                            </div>
                        </div>

                    </fieldset>

                    <hr>

                    <fieldset class="mb-3">
                        <legend>Buscar ejemplares</legend>
                        <div class="col-12 pb-3">
                            <label class="form-label ms-1">Edición *</label>
                            <div class="input-group ${not empty error.getMessage('libroEjemplarId') ? 'has-validation' : ''}">
                                <input type="text" id="edicion" name="nombreLibro" placeholder="Introduce título de libro o ISBN..."
                                       class="form-control shadow-sm ${not empty error.getMessage('libroEjemplarId') ? 'is-invalid' : ''}"
                                       value="${ejemplarForm.nombreLibro}" autofocus>
                                <div class="invalid-feedback ms-1">${error.getMessage("libroEjemplarId")}</div>
                            </div>
                            <ol id="listaEdiciones" class="list-group"></ol>
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

</body>
</html>