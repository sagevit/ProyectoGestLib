<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="col-auto">
    <div class="container border rounded-3 shadow bg-light mt-5 ms-2">
        <a href="${pageContext.request.contextPath}" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <i class="bi bi-book"></i>
            <span class="fs-3 ms-4">GestLib</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/mvc/bibliotecas" class="nav-link link-dark">
                    Bibliotecas
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/mvc/autores" class="nav-link link-dark">
                    Autores
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/mvc/editoriales" class="nav-link link-dark">
                    Editoriales
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/mvc/libros" class="nav-link link-dark">
                    Libros
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/mvc/usuarios" class="nav-link link-dark">
                    Usuarios
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/menuPrestamos.jsp" class="nav-link link-dark">
                    Préstamos
                </a>
            </li>
        </ul>
    </div>
</div>