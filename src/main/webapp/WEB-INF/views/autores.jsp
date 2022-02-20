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

    <script>

        var arrayAutores = [];

        <c:forEach var="autor" items="${autores}">
            var libros = [];

            <c:forEach var="libro" items="${autor.libros}">
                var libro = {
                    "id": "${libro.id}",
                    "titulo": "${libro.titulo}",
                    "isbn": "${libro.isbn}"
                }
                libros.push(libro);
            </c:forEach>

            var autor = {
                "id": "${autor.id}",
                "nombre": "${autor.nombre}",
                "apellido1": "${autor.apellido1}",
                "apellido2": "${autor.apellido2}",
                "libros": libros
            };
            arrayAutores.push(autor);
        </c:forEach>

        function verAutor(id) {
            var modalAutor = new bootstrap.Modal(document.getElementById('autorModal'));
            clickAutor = arrayAutores.find(b => b.id == id);
            document.getElementById("autorModalLabel").innerHTML = 'Autor #' + clickAutor.id;
            document.getElementById("modalNombre").innerHTML = clickAutor.nombre;
            document.getElementById("modalApellido1").innerHTML = clickAutor.apellido1;
            document.getElementById("modalApellido2").innerHTML = clickAutor.apellido2;

            //Monta la tabla de libros del autor
            const $tablaLibros = document.querySelector("#tablaLibros");

            //Primero borra los elementos que tuviera previamente
            while ($tablaLibros.firstChild){
                $tablaLibros.removeChild($tablaLibros.firstChild);
            };

            clickAutor.libros.forEach(libro => {
                const $tr = document.createElement('tr');

                let $tdId = document.createElement('td');
                $tdId.textContent = libro.id;
                $tr.append($tdId);

                let $tdTitulo = document.createElement('td');
                $tdTitulo.textContent = libro.titulo;
                $tr.append($tdTitulo);

                let $tdIsbn = document.createElement('td');
                $tdIsbn.textContent = libro.isbn;
                $tr.append($tdIsbn);

                $tablaLibros.appendChild($tr);
            })

            modalAutor.show();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <h2>Autores</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Primer apellido</th>
                            <th scope="col">Segundo apellido</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="autor" items="${autores}">
                            <tr>
                                <th scope="row">${autor.id}</th>
                                <td>${autor.nombre}</td>
                                <td>${autor.apellido1}</td>
                                <td>${autor.apellido2}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="verAutor(${autor.id})"><i class="bi bi-eyeglasses"></i></button>
                                    <a href="${pageContext.request.contextPath}/mvc/autores/editar/${autor.id}" type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col">
                                <a href="${pageContext.request.contextPath}/mvc/autores/nuevo" type="button" class="btn btn-primary btn-sm">
                                    <i class="bi bi-node-plus"></i>
                                </a>
                            </th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="autorModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="autorModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Nombre:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalNombre" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Primer apellido:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalApellido1" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Segundo apellido:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalApellido2" class="fw-bold"></span>
                    </div>
                </div>
                <hr>
                <table class="table caption-top">
                    <caption>Lista de libros:</caption>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Título</th>
                            <th scope="col">ISBN</th>
                        </tr>
                    </thead>
                    <tbody id="tablaLibros">
                        <!-- Aqui irán los libros del autor seleccionado -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>