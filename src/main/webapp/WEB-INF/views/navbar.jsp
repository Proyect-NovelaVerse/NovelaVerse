<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
    <link rel="stylesheet" href="/css/portada.css" />
    <link rel="icon" href="/img/Logos/Novela.ico">
    <script src="src\main\resources\static\js\navbar.js"></script>

    <title>Document</title>
</head>
<body>
  <nav class="nav">
    <div class="nav-logo mb-2">
        <!-- <p>NOVELVERSE</p> -->
        <a href="/"><img src="/img/Logos/Novela.png" width="150" alt="img"></a>
    </div>
    <div class="nav-menu" id="navMenu">
        <ul class="nav-list">
            <li><a href="/search?q=" class="link active"><i class="bi bi-search"></i> Buscar</a></li>
            <li><a href="#" class="link"><i class="bi bi-list"></i> Categorias</a></li>
            <li><a class="link" href="/ranking"><i class="bi bi-bar-chart-line"></i> Ranking</a></li>
            <li><a class="link" href="/novel/filtres"><i class="bi bi-funnel-fill" ></i> Filtrar</a></li>
            <li>
              <c:if test="${empty sessionScope}">
                <div class="nav-button">
                  <a href="/user/login"><button class="btn white-btn">Sign In</button></a>
                </div>
                <!-- <button class="btn" id="registerBtn">Sign Up</button> -->
              </c:if>
            </li>
            <c:if test="${!empty sessionScope}">
              <li class="dropdown">
                <a href="#" class="link dropdown-toggle" role="button" id="categoriasDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="bi bi-person"></i> <c:out value="${user.nickname}"/>
                </a>
                <div class="dropdown-menu dropdown-menu-dark" aria-labelledby="categoriasDropdown" style="background-color: rgba(0, 0, 0, 0.5);">
                    <!-- Opciones del menú desplegable -->
                    <a class="dropdown-item" href="/user/perfil" ><i class="bi bi-person-gear"></i> Perfil</a>
                    <a class="dropdown-item" href="/user/biblioteca"><i class="bi bi-collection"></i> Mi Biblioteca</a>
                    <a class="dropdown-item" href="/novel/add"><i class="bi bi-book"></i> Publicar</a></a>
                </div>
              </li>
            </c:if>
        </ul>
    </div>
    <div class="nav-menu-btn">
      <div class="burger"><i class="bi bi-list"></i></div>
    </div>       
  </nav>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      const nav = document.querySelector(".nav");
      const navMenuBtn = document.querySelector(".nav-menu-btn");
      const navMenu = document.querySelector(".nav-menu ul");

      window.addEventListener("scroll", function() {
        if (window.scrollY > 0) {
          nav.classList.add("hidden");
        } else {
          nav.classList.remove("hidden");
        }
      });

      navMenuBtn.addEventListener("click", () => {
        navMenu.classList.toggle("show");
      });
    });
  </script>
</body>
</html>

