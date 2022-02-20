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

        var arrayEditoriales = [];
        <c:forEach var="editorial" varStatus="status" items="${editoriales}">
            var editorial = {
                "id": "${editorial.id}",
                "nombre": "${editorial.nombre}",
                "sede": "${editorial.sede}",
                "pais": "${editorial.pais.nombre}"
            };
            arrayEditoriales.push(editorial);
        </c:forEach>

        function verEditorial(id) {
            var modalEditorial = new bootstrap.Modal(document.getElementById('editorialModal'));
            clickEditorial = arrayEditoriales.find(b => b.id == id);
            document.getElementById("editorialModalLabel").innerHTML = 'Editorial #' + clickEditorial.id;
            document.getElementById("modalNombre").innerHTML = clickEditorial.nombre;
            document.getElementById("modalSede").innerHTML = clickEditorial.sede;
            document.getElementById("modalPais").innerHTML = clickEditorial.pais;
            modalEditorial.show();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <h2>Editoriales</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Ubicación</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="editoral" varStatus="status" items="${editoriales}">
                            <tr>
                                <th scope="row">${editoral.id}</th>
                                <td>${editoral.nombre}</td>
                                <td>${editoral.pais.nombre}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="verEditorial(${editoral.id})"><i class="bi bi-eyeglasses"></i></button>
                                    <a href="${pageContext.request.contextPath}/mvc/editoriales/editar/${editoral.id}" type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col">
                                <a href="${pageContext.request.contextPath}/mvc/editoriales/nuevo" type="button" class="btn btn-primary btn-sm">
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
<div class="modal fade" id="editorialModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editorialModalLabel"></h5>
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
                        <span>Sede:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalSede" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>País:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalPais" class="fw-bold"></span>
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