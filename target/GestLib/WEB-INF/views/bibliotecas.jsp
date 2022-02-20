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

        var arrayBibliotecas = [];
        <c:forEach var="biblioteca" varStatus="status" items="${bibliotecas}">
            var biblioteca = {
                "id": "${biblioteca.id}",
                "nombre": "${biblioteca.nombre}",
                "direccion": "${biblioteca.direccion}",
                "telefono": "${biblioteca.telefono}",
                "email": "${biblioteca.email}",
                "web": "${biblioteca.web}",
                "nombreGerente": "${biblioteca.gerente.nombreCompleto}"
            };
            arrayBibliotecas.push(biblioteca);
        </c:forEach>

        function verBiblioteca(id) {
            var modalBiblioteca = new bootstrap.Modal(document.getElementById('bibliotecaModal'));
            clickBiblioteca = arrayBibliotecas.find(b => b.id == id);
            document.getElementById("bibliotecaModalLabel").innerHTML = 'Biblioteca #' + clickBiblioteca.id;
            document.getElementById("modalNombre").innerHTML = clickBiblioteca.nombre;
            document.getElementById("modalDireccion").innerHTML = clickBiblioteca.direccion;
            document.getElementById("modalTelefono").innerHTML = clickBiblioteca.telefono;
            document.getElementById("modalEmail").innerHTML = clickBiblioteca.email;
            document.getElementById("modalWeb").innerHTML = clickBiblioteca.web;
            document.getElementById("modalNombreGerente").innerHTML = clickBiblioteca.nombreGerente;
            modalBiblioteca.show();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <h2>Bibliotecas</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Teléfono</th>
                            <th scope="col">Correo electrónico</th>
                            <th scope="col">Gerente</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="biblioteca" varStatus="status" items="${bibliotecas}">
                            <tr>
                                <th scope="row">${biblioteca.id}</th>
                                <td>${biblioteca.nombre}</td>
                                <td>${biblioteca.telefono}</td>
                                <td>${biblioteca.email}</td>
                                <td>${biblioteca.gerente.nombreCompleto}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="verBiblioteca(${biblioteca.id})"><i class="bi bi-eyeglasses"></i></button>
                                    <a href="${pageContext.request.contextPath}/mvc/bibliotecas/editar/${biblioteca.id}" type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                    <a href="${pageContext.request.contextPath}/mvc/ejemplares/${biblioteca.id}" type="button" class="btn btn-warning btn-sm"><i class="bi bi-book"></i></a>
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
                            <th scope="col"></th>
                            <th scope="col">
                                <a href="${pageContext.request.contextPath}/mvc/bibliotecas/nuevo" type="button" class="btn btn-primary btn-sm">
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
<div class="modal fade" id="bibliotecaModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bibliotecaModalLabel"></h5>
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
                        <span>Dirección:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalDireccion" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Teléfono:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalTelefono" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Correo electrónico:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalEmail" class="fw-bold"></span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Sitio web:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalWeb" class="fw-bold"></span>
                    </div>
                </div>
                <hr>
                <div class="row mb-2">
                    <div class="col-4">
                        <span>Nombre del gerente:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalNombreGerente" class="fw-bold"></span>
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