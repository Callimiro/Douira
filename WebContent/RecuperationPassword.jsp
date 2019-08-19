<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Récupérer son mot de passe</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;height:515px;">
    <div class="d-flex justify-content-center login-dark" style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
        <form action="http://9270c42e.ngrok.io/Douira/CtrlPassword" method="get" style="background:linear-gradient(to top, rgb(17,36,55), rgb(13,9,38));position:absolute;top:5%;/*visibility:hidden;*/">
            <h2 class="sr-only">Login Form</h2>
            <div class="d-flex justify-content-center illustration"><a href="index.html"><img src="assets/img/Douira 1 - White.png" width="200"></a></div><span class="d-flex justify-content-center" style="color:rgb(190,190,190);">Faites entrer votre email</span>
            <div class="form-group"><input class="form-control" type="email" name="email" required="" placeholder="Email" pattern=".{6,}"></div>
            <div class="form-group"><button class="btn btn-primary btn-block flex-wrap" type="submit" style="background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));">Récupérer</button></div><span class="d-flex justify-content-center" id="msgErr" style="color:rgb(201,49,49);"><% if(request.getAttribute("emailErr")!=null) out.println(request.getAttribute("emailErr")); %></span></form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/addchecktype.js"></script>
    <script src="assets/js/blankentrycheck.js"></script>
    <script src="assets/js/blanksearchcheck.js"></script>
    <script src="assets/js/currentdateset.js"></script>
    <script src="assets/js/passwordcheck.js"></script>
    <script src="assets/js/passwordconfirmcheck.js"></script>
    <script src="assets/js/searchchecktype.js"></script>
</body>

</html>