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

        var arrayUsuarios = [];

        <c:forEach var="usuario" items="${usuarios}">
            var prestamos = [];

            <c:forEach var="prestamo" items="${usuario.prestamos}">
                var prestamo = {
                    "id": "${prestamo.id}",
                    "fechaPrestamo": "${prestamo.fechaPrestamo}",
                    "fechaDevolucion": "${prestamo.fechaDevolucion}"
                }
                prestamos.push(prestamo);
            </c:forEach>

            var usuario = {
                "id": "${usuario.id}",
                "nombre": "${usuario.nombre}",
                "apellido1": "${usuario.apellido1}",
                "apellido2": "${usuario.apellido2}",
                "dni": "${usuario.dni}",
                "direccion": "${usuario.direccion}",
                "prestamos": prestamos
            };
            arrayUsuarios.push(usuario);
        </c:forEach>

        function verUsuario(id, eliminar) {

            var modalUsuario = new bootstrap.Modal(document.getElementById('usuarioModal'));
            clickUsuario = arrayUsuarios.find(b => b.id == id);
            document.getElementById("usuarioModalLabel").innerHTML = 'Usuario #' + clickUsuario.id;
            document.getElementById("modalNombre").innerHTML = clickUsuario.nombre;
            document.getElementById("modalApellido1").innerHTML = clickUsuario.apellido1;
            document.getElementById("modalApellido2").innerHTML = clickUsuario.apellido2;
            document.getElementById("modalDni").innerHTML = clickUsuario.dni;
            document.getElementById("modalDireccion").innerHTML = clickUsuario.direccion;

            //Monta la tabla de préstamos del usuario
            const $tablaPrestamos = document.querySelector("#tablaPrestamos");

            //Primero borra los elementos que tuviera previamente
            while ($tablaPrestamos.firstChild){
                $tablaPrestamos.removeChild($tablaPrestamos.firstChild);
            };

            clickUsuario.prestamos.forEach(prestamo => {
                const $tr = document.createElement('tr');

                let $tdId = document.createElement('td');
                $tdId.textContent = prestamo.id;
                $tr.append($tdId);

                let $tdTitulo = document.createElement('td');
                $tdTitulo.textContent = prestamo.fechaPrestamo;
                $tr.append($tdTitulo);

                let $tdIsbn = document.createElement('td');
                $tdIsbn.textContent = prestamo.fechaDevolucion;
                $tr.append($tdIsbn);

                $tablaPrestamos.appendChild($tr);
            })

            //Borra el boton eliminar siempre
            const $botonEliminar = document.querySelector("#botonEliminar");
            while ($botonEliminar.firstChild){
                $botonEliminar.removeChild($botonEliminar.firstChild);
            };

            // Si hay que eliminar el usuario se muestra botón para ello
            if (eliminar) {

                var $form = document.createElement('form');
                $form.action = "${pageContext.request.contextPath}/mvc/usuarios/eliminar/";
                $form.method = "post";
                $form.setAttribute("role", "form");

                var $div = document.createElement('div');
                $div.classList = "col-1 pb-3";

                var $input = document.createElement('input');
                $input.type = "hidden";
                $input.name = "idUsuario";
                $input.value = id;

                var $button = document.createElement('button');
                $button.type = "submit";
                $button.classList = "btn btn-danger mb-3";
                $button.textContent = "Eliminar"

                $div.appendChild($input);
                $div.appendChild($button);
                $form.appendChild($div);
                $botonEliminar.appendChild($form);
            }

            modalUsuario.show();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-5">
        <c:import url="/templates/menu.jsp" charEncoding="UTF-8"/>

        <div class="col">
            <div class="container bg-light border rounded-3 shadow p-2 py-5">

                <h2>Usuarios</h2>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Primer apellido</th>
                            <th scope="col">Segundo apellido</th>
                            <th scope="col">DNI</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${usuarios}">
                            <tr>
                                <th scope="row">${usuario.id}</th>
                                <td>${usuario.nombre}</td>
                                <td>${usuario.apellido1}</td>
                                <td>${usuario.apellido2}</td>
                                <td>${usuario.dni}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="verUsuario(${usuario.id}, ${false})"><i class="bi bi-eyeglasses"></i></button>
                                    <a href="${pageContext.request.contextPath}/mvc/usuarios/editar/${usuario.id}" type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil"></i></a>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="verUsuario(${usuario.id}, ${true})"><i class="bi bi-x-circle"></i></button>
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
                                <a href="${pageContext.request.contextPath}/mvc/usuarios/nuevo" type="button" class="btn btn-primary btn-sm">
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
<div class="modal fade" id="usuarioModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="usuarioModalLabel"></h5>
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
                <div class="row mb-2">
                    <div class="col-4">
                        <span>DNI:</span>
                    </div>
                    <div class="col-8">
                        <span id="modalDni" class="fw-bold"></span>
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
                <hr>
                <table class="table caption-top">
                    <caption>Lista de préstamos:</caption>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha de préstamo</th>
                            <th scope="col">Fecha de devolución</th>
                        </tr>
                    </thead>
                    <tbody id="tablaPrestamos">
                        <!-- Aqui irán los préstamos del usuario seleccionado -->
                    </tbody>
                </table>

                <div id="botonEliminar">
                    <!-- Se mostrará el botón eliminar si el usuario ha eligido esa opción -->
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

</body>
</html>