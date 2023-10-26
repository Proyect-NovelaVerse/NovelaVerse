<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/novel_add.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald&family=Satisfy&display=swap" rel="stylesheet">
    <link rel="icon" href="/img/Logos/Novela.ico">
    <title>Document</title>
</head>
<body>
    <%@ include file="views/navbar.jsp" %>
    <main class="d-flex justify-content-center" >
        <div class="container-total d-flex justify-content-center">
            <div class="container-image col-md-6">
                       
                <!-------------      image     ------------->
                <div class="text">
                  <p style="font-family: 'Oswald', sans-serif;
                  font-family: 'Satisfy', cursive;">"El conocimiento es el antídoto contra la esclavitud mental."</p>
                </div>
              
            </div>
            <section class="col-md-6 right bg-black bg-opacity-75 text-light" >
                <div class="container-novela">
                    <h5 class="text-center">AÑADIR NOVELA</h5>
                    <hr>                
                    <form:form action="/novel/add" method="POST" enctype="multipart/form-data" modelAttribute="novel">
                        <form:hidden path="creator" value="${userId}" />
                        <div class="mb-3">
                            <form:label path="title" class="form-label"><i class="bi bi-journal-text"></i> <span>Título de la novela:</span></form:label>
                            <form:input path="title" type="text" class="form-control" placeholder="Escribe aquí el título..." />
                            <form:errors path="title" style="color: red;" cssClass="error"/>
                            <p style="color: red;">${novelError}</p>
                        </div>
                        <div class="mb-3">
                            <form:label path="description" class="form-label"><i class="bi bi-chat-dots"></i> <span>Sinopsis</span></form:label>
                            <form:textarea path="description" class="form-control" id="description" rows="3" placeholder="Escribe aquí tu resumen..." />
                            <form:errors path="description" style="color: red;" cssClass="error"/>
                        </div>
                        <div class="mb-3">
                            <form:label path="category" class="form-label"><i class="bi bi-tags"></i> <span>Categoría:</span></form:label>
                            <form:select path="category" class="form-select" id="category">
                                <form:option value="aventuras">Aventuras</form:option>
                                <form:option value="ciencia-ficcion">Ciencia Ficción</form:option>
                                <form:option value="terror">Terror</form:option>
                                <form:option value="fantasia">Fantasía</form:option>
                            </form:select>
                            <form:errors path="category" style="color: red;" cssClass="error"/>
                        </div>
                        <div>
                            <label for="img" class="form-label"><i class="bi bi-camera"></i> <span>Añade una imagen de portada:</span></label>
                            <input type="file" class="form-control" id="img" name="img" accept="image/*">
                            <p style="color: red;">${imgError}</p>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <button type="submit" class="btn btn-primary">Crear novela</button>
                            <a href="/home" class="btn btn-danger">Cancelar</a>
                        </div>
                          
                    </form:form>
                      
                </div>
                
            </section>
        </div>
    </main>
</body>
</html>


