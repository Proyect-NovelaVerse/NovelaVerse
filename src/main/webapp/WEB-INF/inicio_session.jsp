<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NovelaVerse: Iniciar Sesion</title>
    <link rel="stylesheet" href="/css/inicio_session.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
    <link rel="icon" href="/img/Logos/Novela.ico">
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
            <div class="input-box">
              <h2 class="card-title text-center">Iniciar Sesión</h2>
              <div class="d-flex justify-content-center">
                <p style="color: red;"><c:out value="${error}" /></p>
              </div>

              <form action="/user/login" method="post">
                <div class=" mb-3">
                  <label for="username" class="form-label">Correo de Usuario:</label>
                  <input type="text" class="form-control" name="email" id="username" placeholder="Ingresa tu nombre de usuario">
                </div>
                <div class=" mb-3">
                  <label for="password" class="form-label">Contraseña:</label>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Ingresa tu contraseña">
                </div>
                <button type="submit" class="btn btn-primary w-100">Iniciar sesión</button>
              </form>

              <div class="text-center mt-4">
                <h6>¿No estás registrado? Haz clic <a href="/user/register">aquí</a></h6>
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
              <h2 class="card-title text-center mb-4">Iniciar Sesión</h2>
              <div class="d-flex justify-content-center">
                <p style="color: red;"><c:out value="${error}" /></p>
              </div>
              <form action="/user/login" method="post">
                <div class="mb-3">
                  <label for="username" class="form-label">Correo de Usuario:</label>
                  <input type="text" class="form-control" name="email" id="username" placeholder="Ingresa tu nombre de usuario">
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Contraseña:</label>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Ingresa tu contraseña">
                </div>
                <button type="submit" class="btn btn-primary w-100">Iniciar sesión</button>
              </form>
              <div class="text-center mt-4">
                <h6>¿No estás registrado? Haz clic <a href="/user/register">aquí</a></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    
  </body>
</html>
