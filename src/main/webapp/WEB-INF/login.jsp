<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!doctype html>
<html lang="en">
<head>
  <title>Webleb</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/login.css">
<link rel="icon" href="/img/Logos/Novela.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 
<div id="stars"></div>
<div id="stars2"></div>
<div id="stars3"></div>
<div class="section">
  <div class="container">
    <div class="row full-height justify-content-center">
      <div class="col-12 text-center align-self-center py-5">
        <div class="section pb-5 pt-5 pt-sm-2 text-center">
          <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" value="true"/>
                <label for="reg-log"></label>
          <div class="card-3d-wrap mx-auto">
            <div class="card-3d-wrapper">
              <div class="card-front">
                <div class="center-wrap">
                  <div class="section text-center">
                    <h4 class="mb-4 pb-3">Log In</h4>
                    <p style="color: red;"><c:out value="${error}" /></p>
                    <form action="/user/login" method="post">
                        <div class="form-group">
                            <input type="email" name="email" class="form-style" placeholder="Email">
                            <i class="input-icon uil uil-at"></i>
                        </div>	
                        <div class="form-group mt-2">
                            <input type="password" name="password" class="form-style" placeholder="Password">
                            <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                        <button type="submit" class="btn mt-4">Login</button>
                    </form>
                    
                    <!-- <a href="https://www.web-leb.com/code" class="btn mt-4">Login</a> -->
                    <p class="mb-0 mt-4 text-center"><a href="https://www.web-leb.com/code" class="link">Forgot your password?</a></p>
                      </div>
                    </div>
                  </div>
              <div class="card-back">
                <div class="center-wrap">
                  <div class="section text-center">
                    <h4 class="mb-3 pb-3">Sign Up</h4>
                    
                      <!-- <p class="text-danger"><form:errors path="user.*"/></p> -->
                      <div id="error-popup" class="error-popup">
                        <p class="text-danger" id="error-messages"></p>
                      </div>
                      <p class="text-danger"><form:errors path="user.*"/></p>
                    <form:form id="registration-form" action="/user/register" method="post" modelAttribute="user">
                        <div class="form-group">
                            <form:input path="nickname" type="text" class="form-style" placeholder="Full Name"/>
                            <i class="input-icon uil uil-user"></i>
                        </div>		
                        <div class="form-group mt-2">
                            <form:input path="email" type="email" class="form-style" placeholder="Email"/>
                            <i class="input-icon uil uil-at"></i>
                        </div>
                        <div class="form-group mt-2">
                            <form:input path="password" type="password" class="form-style" placeholder="Password"/>
                            <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                        <div class="form-group mt-2">
                              <form:input path="passwordConfirmation" type="password" class="form-style" placeholder="PasswordConfirmation"/>
                              <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                       
                        <button type="submit" class="btn mt-4">Registrarse</button>
                    </form:form>
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- <div class="alert alert-danger">
                <ul>
                   
                  <p class="text-danger"><form:errors path="user.*"/></p>
                    
                </ul>
            </div> -->
            </div>
          </div>
        </div>
    </div>
</div>

</body>
</html>
