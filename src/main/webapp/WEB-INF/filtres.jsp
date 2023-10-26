<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-
    9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous">
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/filtres.css">
    <link rel="stylesheet" href="/css/ranking.css">
    <link rel="icon" href="/img/Logos/Novela.ico">

    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  </head>
  <body>
    <%@ include file="views/navbar.jsp" %>
    <div style="min-height: 100vh;display: flex;flex-direction: column;position: relative;">
      
      <div class="container p-3" style="background-color: rgba(0, 0, 0, 0.432);border-radius: 10px;">
        <h4 class="mx-3 text-light"><i class="bi bi-book"></i> Busca novelas que sean de tu preferencia:</h4>
        <div class="row justify-content-between filters-cont">
  
          <aside class="col-3">
            <div class="container-fluid">
              <form action="/novel/filtres" method="post" class="bg-dark text-light">
      
                <div class="adv-select">
                  <label for="">CATEGORIAS</label>
                  <select style="width:100%" class="d-block form-select mt-1 mb-3"
                    name="category">
                    <option name="category">Aventuras</option>
                    <option name="category">Ciencia-Ficcion</option>
                    <option name="category">Terror</option>
                    <option name="category">Fantasia</option>
                  </select>
                </div>
                <!-- <div class="adv-select">
                  <label for="">ETIQUETAS</label>
                  <div class="form-floating mt-1 mb-2 text-black">
                    <input type="text" class="form-control" name="etiqueta"
                      placeholder="Leave a comment here">
                    <label>Escriba o Seleccione</label>
                  </div>
                </div> -->
      
                <div class="short-fields">
                  <div class="adv-select">
                    <label for="">RATING</label>
                    <select style="width:100%" class="d-block form-select mt-1 mb-3"
                      name="rating">
                      <option name="rating" selected="selected" value="0" >none</option>
                      <option name="rating">1</option>
                      <option name="rating">2</option>
                      <option name="rating">3</option>
                      <option name="rating">4</option>
                      <option name="rating">5</option>
                    </select>
                  </div>
                </div>
                <input type="submit" class="btn btn-success" value="Apply Filters" />
              </form>
            </div>
            
          </aside>
          <main class="col-9">
            <div class="row row-cols-1 row-cols-md-4 g-3 d-flex align-items-stretch">
              <c:choose>
                  <c:when test="${not empty novels}">
                      <c:forEach items="${novels}" var="novel" varStatus="loop">
                          <div class="col-3">
                              <div class="card novel-card" onclick="window.location.href =  '/novel/${novel.id}'">
                                  <img src="/img/novel_frontpages/${novel.frontpage}" alt="..." style="width: 100%;height:200px;">
                                  <div class="card-body style_container" style="font-size: 0.75rem;">
                                      <span class="style_num">
                                          <c:out value='${loop.index + 1}' />
                                      </span>
                                      <h5 class="card-title state_novel_style state">Estado</h5>
                                      <div class="ratings">
                                          <span><i class="bi bi-star-fill star text-warning"></i>${novel.avgRating}</span>
                                      </div>
                                      <p class="card-text"><a href="/novel/${novel.id}" class="style_name_novel">${novel.title}</a></p>
                                  </div>
                              </div>
                          </div>
                      </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <div class="col-12 d-flex align-items-center justify-content-center text-light" style="min-height: 300px;min-width: 800px;">
                      <p>No se encontraron novelas.</p>
                    </div>  
                  </c:otherwise>
              </c:choose>
            </div>
          </main>
  
        </div>
      </div>
    </div>
    <%@ include file="views/footer.jsp" %>
  </body>
</html>