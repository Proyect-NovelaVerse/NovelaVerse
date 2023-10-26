<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chapter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/chapter.css">
    <link rel="icon" href="/img/Logos/Novela.ico">
</head>
<body>
    <a href="/novel/${novel.id}" class="btn btn-primary m-2">Cancelar</a>
    <div class="m-5 d-flex justify-content-center">
        <section class="form-container">
            <p class="text-danger"><form:errors path="chapter.*"/></p>
            <form:form action="/novel/chapter/new" method="post" modelAttribute="chapter" class="form" >
                <input type="hidden" name="novelId" value="${novel.id}"/>
                <div class="form-group centered-title d-flex justify-content-center">
                    <form:input path="title" type="text" class="form-control fs-3" id="titleInput" value="'Titulo por defecto'"/>
                </div>
                <div class="form-group content-editor">
                    <form:textarea path="description" id="editor" cols="30" rows="20" class="form-control editor"/>
                </div>
                <div class="button">
                    <input type="submit" value="Agregar Capitulo" class="btn btn-success" >
                </div>
            </form:form>
        </section>     
    </div>
</body>
<script src="/js/chapter.js"></script>
</html>
