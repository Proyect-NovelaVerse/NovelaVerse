<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perfil</title>
    <link rel="stylesheet" href="/css/user_perfil.css" />
    <link rel="icon" href="/img/Logos/Novela.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </head>
  <body>
    <%@ include file="views/navbar.jsp" %>

    <div class="container p-2" style="background-color: rgba(0, 0, 0, 0.432);border-radius: 10px;">
      <%@ include file="views/user_target.jsp" %>
      <div class="container">
        <section id="info">
          <div class="card-info">
            <div class="card-header">Información de perfil</div><hr>
            <div class="card-body">
                <p>
                  <span class="label">Nombre del usuario:</span>
                  <span class="result"><c:out value="${user.nickname}"/></span>
                </p>
                <p>
                  <span class="label">Correo:</span>
                  <span class="result"><c:out value="${user.email}"/></span>
                </p>
                <p>
                  <span class="label">Rango:</span>
                  <span class="result">Lector</span>
                </p>
                <p>
                  <span class="label">Registrado:</span>
                  <span class="result"><fmt:formatDate pattern = "dd-MMMM-yyyy" value = "${user.createAt}" /></span>
                </p>
              
                <div class="mt-5 mb-4 text-center">
                  <a href="/user/logout" class="btn btn-primary ">Cerrar Sesion</a>
                  <a href="/user/${user.id}/edit" class="btn btn-primary">Actualizar perfil</a>
                </div>
              </div>
            </div>
        </section>
      </div>

    </div>
    <%@ include file="views/footer.jsp" %>
  </body>
</html>
