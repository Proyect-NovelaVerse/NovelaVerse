<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Capítulo ${chapter.order} ${chapter.title}</title>
    <link rel="icon" href="/img/Logos/Novela.ico">
    <link rel="stylesheet" href="/css/view_novel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>

<body>
    <%@ include file="views/navbar.jsp" %>

        <body>
            <div class="container mt-5">
                <div class="transparent-box">
                    <c:if test="${empty errorMessage}">
                        <h1 class="display-4 color-order">Capítulo ${chapter.order}</h1>
                    </c:if>
                    <h2 class="color-text">${chapter.title}</h2>
                    <hr>

                    <p class="color-text  no-select">${chapter.description}</p>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-warning w-75 container error-message-dark" role="alert">
                            <p>${errorMessage}</p>
                        </div>
                    </c:if>

                    <hr>
                    <div class="row justify-content-center">
                        <div class="col-6 text-center">
                            <c:if test="${hasPrevious}">
                                <a href="/novel/${novelId}/chapter/${previousChapterOrder}"
                                    class="btn btn-primary">Capítulo Anterior</a>
                            </c:if>
                        </div>
                        <div class="col-6 text-center">
                            <c:if test="${hasNext}">
                                <a href="/novel/${novelId}/chapter/${nextChapterOrder}" class="btn btn-primary">Capítulo
                                    Siguiente</a>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${empty errorMessage}">
                        <a href="/novel/${novelId}" class="btn btn-secondary btn-block">Volver a la
                            Novela</a>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <a href="/home" class="btn btn-secondary btn-block">Volver al home</a>
                    </c:if>
                </div>
            </div>
            </div>

            <c:if test="${empty errorMessage}">
                <form id="commentForm" action="/novel/${novelId}/chapter/${chapterOrder}" method="post">
                    <div class="comment-popup" id="commentPopup">
                        <div class="comment-popup-content bg-dark text-white">

                            <span class="close-popup" id="closePopup" style="color: white;">&times;</span>
                            <h2 class="text-white">Escribir Comentario</h2>

                            <textarea id="commentText" name="texto" class="form-control bg-dark text-white"
                                placeholder="Escribe tu comentario aquí..." rows="10"></textarea>

                            <button id="markSpoiler" class="btn btn-secondary mt-2">Marcar como Spoiler</button>

                            <button type="submit" id="closePopupAndPublish" class="btn btn-primary mt-2">Publicar
                                Comentario</button>
                        </div>
                    </div>
                </form>
            </c:if>

            <div class="comment-button" id="openPopup">
                <span>&#128172;</span>
                <span>Escribir Comentario</span>
            </div>

            <div class="comments container col-10" id="comments">
                <c:forEach items="${comentarios}" var="comentario">
                    <div class="comment">
                        <div class="user-info">
                            <img class="rounded-circle shadow-1-strong" src="/img/ranking/ranking_2.jpg" alt="user_image"
                                width="50">
                            <div>
                                <p class="fw-bold">${comentario.user.nickname}</p>
                                <fmt:formatDate value="${comentario.createAt}" pattern="dd/MM/yyyy"
                                    var="fechaFormateada" />
                                <p class="text-primary-emphasis small font-monospace">${fechaFormateada}</p>
                            </div>
                        </div>
                        <p class="mt-2">${comentario.comment}</p>
                    </div>
                </c:forEach>
            </div>


            <script src="/js/chapterCommentary.js"></script>
        </body>

</html>
