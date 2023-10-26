<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovelaVerse: Home</title>
    <!-- <link rel="stylesheet" href="css/index.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/portada.css" />
</head>
<body>
  <%@ include file="views/navbar.jsp" %>

  <div class="container">
    <section class="home container d-flex justify-content-center align-items-center">
      <div class="background-image"></div>
      <div class="home-content text-white text-center p-4">
        <h1>Bienvenidos a NovelVerse</h1>
        <h5>Despierta tu imaginación a cada palabra</h5>
        <br>
        <p>Estás en busca de un lugar ideal para disfrutar de novelas ligeras? NovelVerse te ofrece una plataforma única que brinda acceso a versiones traducidas al inglés de renombradas novelas ligeras japonesas, chinas y coreanas.</p>
        <p>Empieza a leer ahora para explorar este misterioso mundo de fantasía.</p>
      </div>
    </section>      
    <div class="box">
      <h4 class="mx-4 pt-3"><i class="bi bi-book-half"></i> Libros</h4>
      <div class="row">
        <c:forEach items="${firstNovels}" var="novel" varStatus="loop">
          <div class="col-md-3 p-5" id="prueba" onclick="window.location.href =  '/novel/${novel.id}'" style="cursor: pointer;">
            <div class="card bg-black card-project text-bg-primary border-light">  
              <div class="card-text text-center">
                <img src="img/novel_frontpages/${novel.frontpage}" class="card-img-top" id="size"/>
                <p class="pt-2" style="font-size: 0.80rem;">${novel.title}</p>
              </div>
            </div>
          </div>
        </c:forEach>
        
      </div>
    </div>
    <!-- otro cuadrado -->
    <div class="box ">
      <h4 class="mx-4 pt-3"><i class="bi bi-file-earmark-bar-graph"></i>Ranking</h4>
      <div class="row">
        <div class="col-md-6">
          <div class="box-container">
            <h5 class="text-center">MAS LEIDOS</h5>

            <div class="col-md-4 p-3">
              <div class="card bg-black text-bg-primary d-flex flex-row">
                <img src="/img/navFondo/libro.jpg" class="card-img-top" />      
                <div class="card-body align-self-center">
                  <p style="width: 320px;">nombre de libro vamos ahaber si esto se ancha  </p>
                  <p>descripcion y los demas tambkien  van aqui</p>
                </div>
              </div>
            </div>
            
          </div>
        </div>
        <div class="col-md-6">
          <div class="box-container">
            <h5 class="text-center">Calificado por el usuario</h5>

            <div class="col-md-4 p-3">
              <div class="card bg-black text-bg-primary d-flex flex-row">
                <img src="/img/navFondo/libro.jpg" class="card-img-top" />      
                <div class="card-body align-self-center">
                  <p style="width: 300px;">nombre de libro vamos ahaber si esto se ancha  </p>
                  <p>descripcion y los demas tambkien  van aqui</p>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    <div class="box">
      <h4 class="mx-4 pt-3"><i class="bi bi-arrow-down-up"></i> Últimas actualizaciones</h4>
      <div class="row">
          <c:forEach items="${latestNovels}" var="novel">
              <div class="col-md-3 p-5" id="prueba" onclick="window.location.href =  '/novel/${novel.id}'" style="cursor: pointer;">
                  <div class="card bg-black card-project text-bg-primary border-light text-center"> 
                      <img src="img/novel_frontpages/${novel.frontpage}" class="card-img-top" id="size" />
                      <p class="pt-2" style="font-size: 0.80rem;">${novel.title}</p>
                  </div>
              </div>
          </c:forEach>
      </div>
    </div>
  </div>
  <%@ include file="views/footer.jsp" %>
</body>
</html>
