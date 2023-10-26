<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/novel_info.css" type="text/css">
    <link rel="stylesheet" href="/css/portada.css" />
    <link rel="icon" href="/img/Logos/Novela.ico">
    <title>Document</title>
</head>
<body>
  <%@ include file="views/navbar.jsp" %>
  <main class="container w-75 py-3 px-5">
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger">${errorMessage}</div>
  </c:if>
      <section class="row" id="section">
          <div class="col-3 mt-2">
            <div class="row bg-black py-0 px-0 rounded-2">
              <img src="/img/novel_frontpages/${novel.frontpage}" alt="img ranking_default" style="min-height: 350px; max-height: 350px; object-fit: cover;" >
            </div>
            <div class="row px-0 py-1">
              <a href="/novel/${novel.id}/chapter/1" class="btn btn-primary my-1"><i class="bi bi-book"></i> Leer</a>
              <c:choose>
                  <c:when test="${sessionScope.userId eq novel.creator.id}">
                      <!-- Contenido si userId de la sesión es igual a novel.creator.id -->
                      
                      <a href="/novel/${novel.id}/chapter/new" class="btn btn-primary my-1"><i class="bi bi-file-earmark-plus-fill"></i> Agregar Nuevo Capitulo</a>
                      <a href="/novel/delete/${novel.id}" onclick="return confirm('¿Estás seguro de que deseas eliminar esta novela?')" class="btn btn-danger my-1"><i class="bi bi-trash3-fill"></i> Eliminar novela</a>                    </c:when>
                  <c:otherwise>
                    <!-- Contenido si userId de la sesión no es igual a novel.creator.id -->
                    <a href="/novel/${novel.id}/add/biblioteca" class="btn btn-primary my-1">Agregar a Mi Biblioteca</a>
                    <div class="container bg-black bg-opacity-50 text-center pb-2 rounded-3">
                      <form action="/rating/${novel.id}/add" method="post">
                          <!-- Estrellas de rating -->
                          <div class="form-group">
                              <label for="rating" class="text-light">Califica:</label>
                              <div class="rating">
                                  <input type="radio" id="star5" name="rating" value="1" />
                                  <label for="star5" title="Excelente">&#9733;</label>
                                  <input type="radio" id="star4" name="rating" value="2" />
                                  <label for="star4" title="Muy bueno">&#9733;</label>
                                  <input type="radio" id="star3" name="rating" value="3" />
                                  <label for="star3" title="Bueno">&#9733;</label>
                                  <input type="radio" id="star2" name="rating" value="4" />
                                  <label for="star2" title="Regular">&#9733;</label>
                                  <input type="radio" id="star1" name="rating" value="5" />
                                  <label for="star1" title="Malo">&#9733;</label>
                              </div>
                              <button type="submit" class="btn btn-warning align-self-center px-2 mb-1 m">Enviar</button>
                          </div>
                      </form>
                    </div>
                  </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="col d-block text-light mt-0 mx-2">
            <div class="row p-2">
              <p class="col rounded-2 bg-warning text-black ms-2 m-auto text-center">
                <c:if test="${sessionScope.userId eq novel.creator.id}">
                  <strong>Eres el creador</strong>
                </c:if>
              </p>
              <h1 class="text-start display-5 h1">${novel.title}</h1>
              <h1>${novel.category}</h1>
              <h3>${novel.creator.nickname}</h3>
              <div class="d-flex flex-fill column-gap-2 ">        
                <i class="bi bi-star-fill star text-warning"></i>
                <span>${novel.avgRating}</span>
              </div>
              <div class="d-flex flex-fill column-gap-2 my-1">
                <i class="bi bi-eye"></i><span>1.000</span>
              </div>
            </div>
            <div style="display: flex; justify-content: center; align-items: center;">
              <hr style="height:2px; width:90%; border-width:1; color: aliceblue;">
            </div>
              <div class="row p-2">
                <h4 class="align-bottom">Resumen:</h4>
                <p class="align-text-bottom">${novel.description}</p>
              </div>
          </div>
      </section>
      <div class="container p-0">
        <article class="row rounded-3 p-1">
          <h4 class="text-light d-flex px-3 mt-1 justify-content-center">Etiquetas</h4>
          <hr style="height:2px; width:100%; border-width:1; color: aliceblue;">
          <div class="col">
            <ul class="list-unstyled d-flex flex-wrap">
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50 "><a href="">#AmorPorLosDeportes</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#IncreibleMomento</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#DiversiónSinFin</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#MomentosInolvidables</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#LaVidaEsUnJuego</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#MaravillasDelMundo</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#ArteYMagia</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#ViajesAsombrosos</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#SaboresDeliciosos</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#AventurasIncreibles</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#RisasContagiosas</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#ExperienciasUnicas</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#AmigosParaSiempre</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#CinefilosUnidos</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#VidaSalvaje</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#ModaElegante</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#InspiracionDiaria</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#MenteCreativa</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#MomentosRelajantes</a></li>
              <li class="mx-1 bg-black rounded-1 my-1 px-1 bg-opacity-50"><a href="">#DeportesExtremos</a></li>
            </ul>
          </div>
        </article>
        <c:if test="${!empty sessionScope}">
          <hr style="height:2px; width:100%; border-width:0">
          <article class="row bg-black bg-opacity-75 rounded-3 p-1">
            <h5 class="text-light d-flex px-3 mt-1">Comparte tu opinión</h5>
            <hr style="height:2px; width:100%; border-width:1; color: aliceblue;">
            <div class="col">
              <div class="m-3 mt-0 bg-gradient rounded-4 p-2 bg-white bg-opacity-50 "> 
                <div class="row text-black mt-3 mb-2 mx-3">
                  <textarea class="py-2 rounded-4" placeholder="Escribe tu opinión aqui..." id="floatingTextarea" style="resize: none; height: 100px;" value="Comenta aqui"></textarea>
                </div>
                <div class="row mx-1">
                  <div class="col-md-12 d-flex justify-content-end">
                    <button type="button" class="btn btn-warning m-0">Publicar</button>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </c:if>
        <hr style="height:2px; width:100%; border-width:0">
        <article class="row bg-black bg-opacity-75 rounded-3 p-1 pb-4 mb-3">
          <h5 class="text-light d-flex px-3 mt-1">Opiniones de los lectores</h5>
          <hr style="height:2px; width:100%; border-width:1; color: aliceblue;">
          <div class="col">
            <div class="row mx-3 bg-gradient rounded-4 p-2 bg-white bg-opacity-50 ">
              <div class="container d-flex align-items-center">
                <img class="rounded-circle shadow-1-strong me-3" src="/img/user_image.jpg" alt="user_image" width="50">
                <div>
                  <h6 class="fw-bold text-dark mb-1">Jorge El Curioso</h6>
                  <p class=" text-primary-emphasis small mb-0 font-monospace">Jan 2020</p>
                </div>
              </div>
              <div>
                <p class="row text-black mt-3 mb-2 mx-3 p-3 rounded-4 bg-light ">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde expedita quaerat vitae fuga maiores, rem itaque iste reiciendis placeat necessitatibus, eveniet dolores deleniti id quam fugit. Delectus nostrum nulla reprehenderit ullam consequatur cum dolore ipsam cumque blanditiis, dolorem praesentium quam quisquam consectetur minus? Iste, suscipit reprehenderit eius enim voluptas beatae asperiores laboriosam expedita, ex recusandae repellendus molestiae deserunt, necessitatibus impedit ratione tenetur autem porro! Cum repellat accusamus ut. Sunt quidem recusandae beatae nisi unde consectetur corporis praesentium. Ad quas, consequatur rem blanditiis non eius a obcaecati tenetur soluta et saepe.</p>
              </div>
            </div>
            <hr style="height:2px; width:100%; border-width:0">
            <div class="row mx-3 bg-gradient rounded-4 p-2 bg-white bg-opacity-50 ">
              <div class="container d-flex align-items-center">
                <img class="rounded-circle shadow-1-strong me-3" src="/img/user_image.jpg" alt="user_image" width="50">
                <div>
                  <h6 class="fw-bold text-dark mb-1">Jorge El Curioso</h6>
                  <p class=" text-primary-emphasis small mb-0 font-monospace">Jan 2020</p>
                </div>
              </div>
              <div>
                <p class="row text-black mt-3 mb-2 mx-3 p-3 rounded-4 bg-light ">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde expedita quaerat vitae fuga maiores, rem itaque iste reiciendis placeat necessitatibus, eveniet dolores deleniti id quam fugit. Delectus nostrum nulla reprehenderit ullam consequatur cum dolore ipsam cumque blanditiis, dolorem praesentium quam quisquam consectetur minus? Iste, suscipit reprehenderit eius enim voluptas beatae asperiores laboriosam expedita, ex recusandae repellendus molestiae deserunt, necessitatibus impedit ratione tenetur autem porro! Cum repellat accusamus ut. Sunt quidem recusandae beatae nisi unde consectetur corporis praesentium. Ad quas, consequatur rem blanditiis non eius a obcaecati tenetur soluta et saepe.</p>
              </div>
            </div>
          </div>
        </article>
      </div>
  </main>
  <%@ include file="views/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</html>
