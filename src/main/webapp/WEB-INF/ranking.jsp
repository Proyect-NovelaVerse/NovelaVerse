<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Top rated Novels</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="/css/ranking.css">
  <link rel="icon" href="/img/Logos/Novela.ico">
  <script src="src\main\resources\static\js\navbar.js"></script>
</head>
<body>
  <%@ include file="views/navbar.jsp" %>
  <article class="container">
    <div class="row row-cols-1 row-cols-md-4 g-4 d-flex align-items-stretch">
      <c:forEach items="${novels}" var="novel" varStatus="loop">
        <div class="col">
          <div class="card novel-card" onclick="window.location.href =  '/novel/${novel.id}'">
            <img src="/img/novel_frontpages/${novel.frontpage}" class="card-img-top" alt="...">
            <div class="card-body style_container">
              <span class="style_num">
                <c:out value='${loop.index + 1}' />
              </span>
              <h5 class="card-title state_novel_style state">Estado</h5>
              <div class="ratings">
                <span><i class="bi bi-star-fill star text-warning"></i>${novel.avgRating}</span>
                <span><i class="bi bi-eye"></i>1.000</span>
              </div>
              <p class="card-text"><a href="/novel/${novel.id}" class="style_name_novel">${novel.title}</a></p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </article>
  <%@ include file="views/footer.jsp" %>
</body>
</html>
