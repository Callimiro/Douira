<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Douira</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;height:515px;">
    <div class="d-flex justify-content-center login-dark" style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
        <form action="http://localhost:8080/Douira/CtrlAdministration" method="get" style="background:linear-gradient(to top, rgb(17,36,55), rgb(13,9,38));position:absolute;top:5%;/*visibility:hidden;*/">
            <h2 class="sr-only">Login Form</h2>
            <div class="d-flex justify-content-center illustration"><a href="index.html"><img src="assets/img/Douira 1 - White.png" width="200"></a></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Mot de passe"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));">Se connecter</button></div>
            <div
                class="d-flex justify-content-center" style="margin:15px 0px;"></div><span class="d-flex justify-content-center" id="msgErr"
        style="color:rgb(201,49,49);"><% if(request.getAttribute("msgErr")!=null) out.println(request.getAttribute("msgErr")); %></span></form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/addchecktype.js"></script>
    <script src="assets/js/blankentrycheck.js"></script>
    <script src="assets/js/passwordconfirmcheck.js"></script>
    <script src="assets/js/searchchecktype.js"></script>
</body>
</html>