<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario de Actualización</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/update.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Oswald&family=Satisfy&display=swap" rel="stylesheet">
</head>
<body>
  <%@ include file="views/navbar.jsp" %>
  <div class="fixed-height-container">
    <div class="container main">
        <div class="row">

            <div class="col-md-6 side-image">
                       
              <!-------------      image     ------------->
              <div class="text">
                <p style="font-family: 'Oswald', sans-serif;
                font-family: 'Satisfy', cursive;">"La verdadera sabiduría consiste en saber que no se sabe nada."</p>
              </div>
            
            </div>

            <div class="col-md-6 right">
              <div class="input-box">

                <h3 class="text-center mb-5">Actualizar Datos</h3>
                <form:form action="/user/${id}/edit" method="post" modelAttribute="user">
                  <div class="form-group mt-3">
                    <form:label path="nickname" for="nombre">Nombre:</form:label>
                    <form:input path="nickname" type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre"/>
                  </div>
                  <div class="form-group mt-3">
                    <form:label path="email" for="correo">Correo Electrónico:</form:label>
                    <form:input path="email" type="email" class="form-control" id="correo" placeholder="Ingrese su correo electrónico"/>
                  </div>
                  <div class="form-group mt-3">
                    <form:label path="password" for="contrasena">Contraseña:</form:label>
                    <form:input path="password" type="password" class="form-control" id="contrasena" placeholder="Ingrese su contraseña"/>
                  </div>
                  
                  <div class="input-field mt-3">
                    <button type="submit" class="submit">Actualizar</button>
                  </div>
                  <div class="input-field mt-3">
                    <a href="/user/perfil#info"><button class="submit-a" style="width: 330px;">Cancelar</button></a>
                  </div>
                  
                </form:form>
                
              </div>
            </div>

        </div>
      </div>
    </div>
  </div> 
</body>
</html>
