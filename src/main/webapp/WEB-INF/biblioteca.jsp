<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/biblioteca.css">
    <link rel="icon" href="/img/Logos/Novela.ico">
    
</head>

<body>
    <a href="/home" class="btn btn-success m-3">Atras</a>
    <div class="m-5 d-flex justify-content-center flex-column align-items-center">
        <section class="mb-3">
            <label class="switch-label switch-label-left fs-4 text-success">Novelas Añadidas</label>
            <label class="switch">
                <input type="checkbox" id="toggleSwitch">
                <span class="slider"></span>
            </label>
            <label class="switch-label fs-4 text-primary">Mis Novelas</label>
        </section>
        <section>
            <section class="face-two">
                <c:forEach var="novel" items="${user.biblioNovel}">
                    <div class="card mb-3 carta " onclick="window.location.href =  '/novel/${novel.id}'">
                        <div class="row g-0">
                            <div class="col-md-3  max-fluid">
                                <img src="/img/novel_frontpages/${novel.frontpage}" class="img-fluid rounded-start card-img-top" style="min-height: 250px; max-height: 250px; object-fit: cover;"/>
                            </div>
                            <div class="col-md-8  d-flex  align-items-center ">
                                <div class="card-body  d-flex justify-content-around">
                                    <div class="d-flex flex-column align-items-center  ">
                                        <span><small>Novela</small></span>
                                        <p class="fs-5"><c:out value="${novel.title}"/>sdfasf asdfsagasdgasg  asgasdfasdfs</p>
                                    </div>
                                    <div class="d-flex flex-column align-items-center">
                                        <span><small>N° Capitulos</small></span>
                                        <p class=" fs-4"><c:out value="${novel.chapters.size()}"/></p>
                                    </div>
                                    <div class="d-flex flex-column align-items-center">
                                        <span><small>Actulizacion</small></span>
                                        <p class=" fs-4"><fmt:formatDate pattern = "MMMM-dd" value = "${novel.update_at}" /></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
            </section>
            
            <section class="face-one">
                <c:forEach items="${novels}" var="novel">
                    <c:if test="${novel.creator.id == sessionScope.userId}">
                        <div class="card mb-3 carta" onclick="window.location.href =  '/novel/${novel.id}'">
                            <div class="row g-0">
                                <div class="col-md-3 max-fluid ">
                                    <img src="/img/novel_frontpages/${novel.frontpage}" class="img-fluid rounded-start card-img-top" style="min-height: 250px; max-height: 250px; object-fit: cover;"/>
                                </div>
                                <div class="col-md-8  d-flex  align-items-center ">
                                    <div class="card-body  d-flex justify-content-between">
                                        <div class="d-flex flex-column align-items-center">
                                            <span><small>Novela</small></span>
                                            <p class="fs-3"><c:out value="${novel.title}"/></p>
                                        </div>
                                        <div class="d-flex flex-column align-items-center">
                                            <span><small>N° Capitulos</small></span>
                                            <p class=" fs-4"><c:out value="${novel.chapters.size()}"/></p>
                                        </div>
                                        <div class="d-flex flex-column align-items-center">
                                            <span><small>Actulizacion</small></span>
                                            <p class=" fs-4"><fmt:formatDate pattern = "MMMM-dd" value = "${novel.update_at}" /></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach> 
            </section>
        </section>
    </div>
</body>
<script src="/js/biblioteca.js"></script>
</html>