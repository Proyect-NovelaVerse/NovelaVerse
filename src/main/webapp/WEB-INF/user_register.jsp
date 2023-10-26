<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NovelaVerse: Registro</title>
    <link rel="icon" href="/img/Logos/Novela.ico">
    <link rel="stylesheet" href="/css/user_register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
    <style></style>
  </head>
  <body>

    <div class="wrapper">
      <div class="container main">
        <div class="row">
          <div class="col-md-6 side-image">
                       
            <!-------------      image     ------------->
            <!-- <div class="text">
                <p>"La magia de la lectura digital está en cómo las palabras cobran vida en píxeles."</p>
            </div> -->
            
          </div>
          <div class="col-md-6 right">
            <div class="input-box" style="font-size: 15px;">
              <h4 class="card-title text-center">Regístrate</h4>
              <div class="d-flex justify-content-center">
                <p class="text-danger"><form:errors path="user.*"/></p>
              </div>
              <form:form action="/user/register" method="post" modelAttribute="user" class="needs-validation" >
                <div class="mb-3">
                  <form:label path="nickname" for="username" class="form-label">Nombre de usuario:</form:label>
                  <form:input path="nickname" type="text" class="form-control" id="username" placeholder="Ingresa tu nombre de usuario" required="true" />
                  
                </div>
                <div class="mb-3">
                  <form:label path="email" for="email" class="form-label">Correo electrónico:</form:label>
                  <form:input path="email" type="email" class="form-control" id="email" placeholder="Ingresa tu correo electrónico" required="true" />
                 
                </div>
                <div class="mb-3">
                  <form:label path="password" for="password" class="form-label">Contraseña:</form:label>
                  <form:input path="password" type="password" class="form-control" id="password" placeholder="Ingresa tu contraseña" required="true" />
                  
                </div>
                <div class="mb-3">
                  <form:label path="passwordConfirmation" for="confirm-password" class="form-label">Confirmar contraseña:</form:label>
                  <form:input path="passwordConfirmation" type="password" class="form-control" id="confirm-password" placeholder="Confirma tu contraseña" required="true" />
                  
                </div>
                <button type="submit" class="btn btn-primary w-100">Registrarse</button>
              </form:form>
              <div class="text-center mt-4">
                <h6>¿Ya tienes cuenta? Inicia sesión <a href="/user/login">aquí</a></h6>
                <a href="/home" class="btn btn-success">Regresar</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="card shadow-lg">
            <div class="card-body p-5">
              <h2 class="card-title text-center mb-4">Regístrate</h2>
              <div class="d-flex justify-content-center">
                <p class="text-danger"><form:errors path="user.*"/></p>
              </div>
              <form:form action="/user/register" method="post" modelAttribute="user" class="needs-validation" >
                <div class="mb-3">
                  <form:label path="nickname" for="username" class="form-label">Nombre de usuario:</form:label>
                  <form:input path="nickname" type="text" class="form-control" id="username" placeholder="Ingresa tu nombre de usuario" required="true" />
                  
                </div>
                <div class="mb-3">
                  <form:label path="email" for="email" class="form-label">Correo electrónico:</form:label>
                  <form:input path="email" type="email" class="form-control" id="email" placeholder="Ingresa tu correo electrónico" required="true" />
                 
                </div>
                <div class="mb-3">
                  <form:label path="password" for="password" class="form-label">Contraseña:</form:label>
                  <form:input path="password" type="password" class="form-control" id="password" placeholder="Ingresa tu contraseña" required="true" />
                  
                </div>
                <div class="mb-3">
                  <form:label path="passwordConfirmation" for="confirm-password" class="form-label">Confirmar contraseña:</form:label>
                  <form:input path="passwordConfirmation" type="password" class="form-control" id="confirm-password" placeholder="Confirma tu contraseña" required="true" />
                  
                </div>
                <button type="submit" class="btn btn-primary w-100">Registrarse</button>
              </form:form>
              <div class="text-center mt-4">
                <h6>¿Ya tienes cuenta? Inicia sesión <a href="/user/login">aquí</a></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
  </body>
</html>