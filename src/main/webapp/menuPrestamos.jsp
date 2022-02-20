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
            <div class="row align-items-stretch">
                <div class="col-6">
                    <a href="${pageContext.request.contextPath}/mvc/creacionPrestamos" class="text-decoration-none">
                        <div class="h-100 p-5 bg-light border rounded-3 text-center">
                            <h1>Creación de préstamos</h1>
                        </div>
                    </a>
                </div>
                <div class="col-6">
                    <a href="${pageContext.request.contextPath}/mvc/devolucionPrestamos" class="text-decoration-none">
                        <div class="h-100 p-5 bg-light border rounded-3 text-center">
                            <h1>Devolución de préstamos</h1>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/dist/jquery.min.js"></script>
</body>
</html>