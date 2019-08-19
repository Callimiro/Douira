<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S'inscrire</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;/*-o-animation:AnimationName 14s ease infinite;*//*animation:AnimationName 14s ease infinite;*/">
    <div class="d-flex justify-content-center login-dark" style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
        <form action="http://9270c42e.ngrok.io/Douira/CtrlInscription" method="get" id="signupform" style="background:linear-gradient(to top, rgb(17,36,55), rgb(13,9,38));">
            <h2 class="sr-only">Login Form</h2>
            <div class="d-flex justify-content-center illustration"><a href="index.html"><img src="assets/img/Douira 1 - White.png" width="200"></a></div>
            <div class="form-group"><input class="form-control" type="text" name="nom" required="" placeholder="Nom" pattern="[A-Za-z]{3,}"></div>
            <div class="form-group"><input class="form-control" type="text" name="prenom" required="" placeholder="Prénom" pattern="[A-Za-z]{3,}"></div>
            <div class="form-group"><input class="form-control" type="email" name="email" required="" placeholder="Email"></div>
            <div class="form-group"><input class="form-control" type="text" name="ntel" required="" placeholder="Numéro de téléphone" pattern="^(?:0|\(?\+213\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$" inputmode="tel"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" required="" placeholder="Mot de passe" pattern=".{6,}" id="password"></div>
            <div class="form-group"><input class="form-control" type="password" name="passwordc" required="" placeholder="Confirmer le mot de passe" pattern=".{6,}" id="confirm_password"><span class="d-flex justify-content-center" id="match"></span></div>
            <div class="form-group"><span class="d-flex justify-content-center" style="color:rgba(255,255,255,0.24);">Date de naissance</span><input class="form-control form-control-lg" type="date" name="daten" required="" min="1900-01-01" max="2000-12-31"></div>
            <div class="form-group">
                <div class="d-flex justify-content-center">
                    <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="sexe" value="homme" required="" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Homme</label></div>
                    <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="sexe" value="femme" required="" id="formCheck-2"><label class="form-check-label" for="formCheck-2">Femme</label></div>
                </div>
            </div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));">Incription</button></div>
            <div class="d-flex justify-content-center" style="margin:15px 0px;"><a class="justify-content-center" href="Authentification.jsp"><span style="font-size:12px;margin:0px 5px;color:rgb(111,122,133);">Vous avez un compte ?</span>Connectez-vous</a></div>
            <span class="d-flex justify-content-center" id="msgErr" style="color:rgb(201,49,49);">
                <%
                if(request.getAttribute("msgErr")!=null)
                	out.println(request.getAttribute("msgErr"));
                %>
                </span></form>
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