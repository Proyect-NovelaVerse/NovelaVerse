<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Search</title>
            <link rel="stylesheet" href="/css/search.css">
            <link rel="icon" href="/img/Logos/Novela.ico">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"></script>
        </head>

        <body>
            <%@ include file="views/navbar.jsp" %>

                <form class="form-inline" action="/search" method="get">
                    <div class="input-group w-75 container margin-top">
                        <input type="text" id="search" name="q" class="form-control"
                            placeholder="¿Qué quieres leer hoy?">
                        <div class="input-group-append">
                            <button type="submit" class="btn style-button">Explorar</button>
                        </div>
                    </div>
                </form>
                <br>
                <div>
                    <!-- Verificar si la lista de resultados está vacía -->
                    <c:if test="${empty resultados}">
                        <div class="alert alert-warning w-75 container" role="alert">
                            No se encontraron resultados para la búsqueda: ${param.q}
                        </div>
                    </c:if>
                </div>
                <article class="container w-75 py-3 px-5">
                    <div class="row row-cols-1 row-cols-md-4 g-4 d-flex align-items-stretch">
                        <c:forEach items="${resultados}" var="novel">
                            <!-- varStatus="loop" -->
                            <div class="col">
                                <div class="card novel-card" onclick="window.location.href =  '/novel/${novel.id}'">
                                    <img src="img/novel_frontpages/${novel.frontpage}" class="card-img-top"
                                        alt="${novel.title}">
                                    <div class="card-body style_container">
                                        <!-- <span class="style_num">
                                            <c:out value='${loop.index + 1}' />
                                        </span> -->
                                        <h5 class="card-title state_novel_style state">Estado</h5>
                                        <div class="ratings">
                                            <span><i class="bi bi-star-fill star text-warning"></i>5.0 (100)</span>
                                            <span><i class="bi bi-eye"></i>1.000</span>
                                        </div>
                                        <p class="card-text" title="${novel.title}">
                                            <a href="/novel/${novel.id}" class="style_name_novel">
                                                <c:out value='${novel.title}' />
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </article>
            </div>
        </body>

        </html>