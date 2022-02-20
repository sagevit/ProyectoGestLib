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

        var arrayLibros = [];
        <c:forEach var="libro" varStatus="status" items="${libros}">
            var libro = {
                "id": "${libro.id}",
                "titulo": "${libro.titulo}",
                "isbn": "${libro.isbn}",
                "sinopsis": "${libro.sinopsis}",
                "autor": "${libro.autor.nombreCompleto}"
            };
            arrayLibros.push(libro);
        </c:forEach>

        function verLibro(id) {
            var modalLibro = new bootstrap.Modal(document.getElementById('libroModal'));
            clickLibro = arrayLibros.find(b => b.id == id);
            document.getElementById("libroModalLabel").innerHTML = 'Libro #' + clickLibro.id;
            document.getElementById("modalTitulo").innerHTML = clickLibro.titulo;
            document.getElementById("modalIsbn").innerHTML = clickLibro.isbn;
            document.getElementById("modalSinopsis").innerHTML = clickLibro.sinopsis;
            document.getElementById("modalAutor").innerHTML = clickLibro.autor;
            modalLibro.show();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <h2>Libros</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Título</th>
                            <th scope="col">ISBN</th>
                            <th scope="col">Autor</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="libro" varStatus="status" items="${libros}">
                            <tr>
                                <th scope="row">${libro.id}</th>
                                <td>${libro.titulo}</td>
                                <td>${libro.isbn}</td>
                                <td>${libro.autor.nombreCompleto}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="verLibro(${libro.id})"><i class="bi bi-eyeglasses"></i></button>
                                    <a href="${pageContext.request.contextPath}/mvc/libros/editar/${libro.id}" type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                    <a href="${pageContext.request.contextPath}/mvc/ediciones/${libro.id}" type="button" class="btn btn-warning btn-sm"><i class="bi bi-book"></i></a>
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
                                <a href="${pageContext.request.contextPath}/mvc/libros/nuevo" type="button" class="btn btn-primary btn-sm">
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
<div class="modal fade" id="libroModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="libroModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Título:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalTitulo" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>ISBN:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalIsbn" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Sinopsis:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalSinopsis" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Autor:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalAutor" class="fw-bold"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>