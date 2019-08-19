<!DOCTYPE html>
<%@ page import="modele.Bien"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultats</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="height:100%;background:rgb(242,242,242);">
    <nav class="navbar navbar-light navbar-expand-md sticky-top" style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
        <div class="container"><a class="navbar-brand" href="index.html"><img src="assets/img/Douira 1 - White.png" width="100"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon" style="background-image:url(&quot;assets/img/list.png&quot;);"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1"><a class="text-monospace mx-auto" href="#searchmodal" data-toggle="modal"><img src="assets/img/magnifier.png" alt="Chercher un bien" width="35" style="margin:0px 10px 0px;"></a><a class="btn btn-primary" role="button" href="Authentification.jsp"
                    style="background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));border:2px white;color:rgb(255,255,255);"><strong>Mon Compte</strong></a></div>
        </div>
    </nav>
    <%
    
    if(request.getAttribute("recherchevide")!=null)
    	out.println("<div style=\"margin-top:10px;\"> <h4 class=\"text-center\" style=\"color:rgb(12,5,40);\">Aucun résultat trouvé</h4></div>");
    	
    %>
    <div style="margin:15px;">
        <div class="container">
            <div class="row">
                <%
    
	if(request.getAttribute("SearchResult")!=null)
	{
		
	    	ArrayList <Bien> listebiens = new ArrayList<Bien>();
	    	
	    	listebiens = (ArrayList) request.getAttribute("SearchResult");
	    	
	    	for(Bien bien : listebiens)
	    	{
	    		String npieces = "";
	    		
	    		if(bien.getType().equals("appartement")) {bien.setType("Appartement"); npieces=String.valueOf(bien.getNpieces());}
	    		if(bien.getType().equals("villa")) {bien.setType("Villa"); npieces=String.valueOf(bien.getNpieces());}
	    		if(bien.getType().equals("maison")) {bien.setType("Maison"); npieces=String.valueOf(bien.getNpieces());}
	    		if(bien.getType().equals("immeuble")) {bien.setType("Immeuble"); npieces=String.valueOf(bien.getNpieces());}
	    		if(bien.getType().equals("garage")) {bien.setType("Garage"); npieces="/";}
	    		if(bien.getType().equals("lotdeterrain")) {bien.setType("Lot de Terrain"); npieces="/";}
	    		if(bien.getType().equals("localcommercial")) {bien.setType("Local Commercial"); npieces="/";}
	    		
	    		out.println("<div class=\"col-md-3\" style=\"margin:0px 0px 10px;width:100%;height:100%;\">");
	    		
	    		out.println("<div class=\"card\" style=\"border:none;box-shadow:1px 1px 1px grey;\"><img class=\"card-img-top w-100 d-block\"  src=\"CtrlCardImage?idbien=" + bien.getIdbien() + "\"  alt=\"bien\" style=\"width:400px;height:200px;\">");
	    		
	    		out.println("<div class=\"card-body\">");
	    		out.println("<h4 class=\"text-truncate card-title\" id=\"btype\">" + bien.getType() + "</h4>");
	    		out.println("<h6 class=\"text-truncate card-title\" id=\"badress\" style=\"margin:0px 0px 10px;\">" + bien.getAdresse() +"</h6>");
	    		out.println("<p class=\"text-truncate card-text\" style=\"margin:0px 0px 10px;\"><span id=\"npieces\">Pièce(s): " + npieces + "</span><span id=\"surface\" style=\"margin:0px 10px;\">Surface: " + bien.getSurfacemax() +" m²</span></p><span id=\"bprice\" style=\"color:grey;\">"+ bien.getPrixmax() +" D.A</span><span style=\"margin:10px;color:rgb(128,128,128);\">/" + bien.getPayement() + "</span>");
	    		out.println("<form class=\"float-right\" action=\"http://localhost:8080/Douira/CtrlDetailsBien\"><button class=\"btn btn-primary\" type=\"submit\" style=\"background:none;border:none;padding:0;\"><img class=\"float-right\" src=\"assets/img/eye-view.png\" width=\"30\" id=\"bseemore\"></button><input class=\"form-control\" type=\"hidden\" name=\"idbien\" value=\"" + bien.getIdbien() + "\">" + "</form>");
	    		out.println("</div>");
	        	out.println("</div>");
	        	out.println("</div>");
	    	}
	    	
	}%>
            </div>
        </div>
    </div>
    <div>
        <div class="modal fade" role="dialog" tabindex="-1" id="searchmodal" style="color:#1d1948;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border:none;"><img src="assets/img/Background - SkyScrapers.png" style="width:90%;"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                    <div class="modal-body">
                        <form class="d-flex justify-content-center" action="http://localhost:8080/Douira/CtrlRecherche" method="get" id="searchbien">
                            <div class="form-group d-inline-block">
                                <h3 style="color:rgb(14,14,91);"><strong>Adresse :</strong></h3>
                                <div class="d-flex justify-content-center align-items-center" style="border:solid 1px rgba(220,220,220,0.67);border-radius:20px 20px;"><span class="d-flex justify-content-center align-items-center align-content-center" style="margin-right:5px;"><img class="img-fluid" src="assets/img/magnifier-tool.png" width="20"></span><input class="form-control" type="text" name="adresse"
                                        required="" placeholder="Quartier, ville, département" autocomplete="off" style="border:none;width:auto;"></div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Type :</strong></h3>
                                <div class="d-table flex-wrap" style="color:rgb(99,99,99);">
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch1" value="appartement" id="typerech-1"><label class="form-check-label" for="typerech-1" style="color:rgb(27,63,75);">Appartement</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch2" value="villa" id="typerech-2"><label class="form-check-label" for="typerech-2" style="color:rgb(27,63,75);">Villa</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch3" value="maison" id="typerech-3"><label class="form-check-label" for="typerech-3" style="color:rgb(27,63,75);">Maison</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch4" value="immeuble" id="typerech-4"><label class="form-check-label" for="typerech-4" style="color:rgb(27,63,75);">Immeuble</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch5" value="garage" id="typerech-5"><label class="form-check-label" for="typerech-5" style="color:rgb(27,63,75);">Garage</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch6" value="lotdeterrain" id="typerech-6"><label class="form-check-label" for="typerech-6" style="color:rgb(27,63,75);">Lot de terrain</label></div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="ch7" value="localcommercial" id="typerech-7"><label class="form-check-label" for="typerech-7" style="color:rgb(27,63,75);">Local commercial</label></div>
                                </div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Bien en colocation :</strong></h3>
                                <div class="d-table flex-wrap" style="color:rgb(99,99,99);">
                                    <div class="form-check"><input class="form-check-input" type="radio" name="colocation" value="oui" disabled="" id="colrechoui"><label class="form-check-label" for="colrechoui" style="color:rgb(27,63,75);">Oui</label></div>
                                    <div class="form-check"><input class="form-check-input" type="radio" name="colocation" value="non" disabled="" checked="" id="colrechnon"><label class="form-check-label" for="colrechnon" style="color:rgb(27,63,75);">Non</label></div>
                                </div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Bien meublé :</strong></h3>
                                <div class="d-table flex-wrap" style="color:rgb(99,99,99);">
                                    <div class="form-check"><input class="form-check-input" type="radio" name="meuble" value="oui" disabled="" id="meubrechoui"><label class="form-check-label" for="meubrechoui" style="color:rgb(27,63,75);">Oui</label></div>
                                    <div class="form-check"><input class="form-check-input" type="radio" name="meuble" value="non" disabled="" checked="" id="meubrechnon"><label class="form-check-label" for="meubrechnon" style="color:rgb(27,63,75);">Non</label></div>
                                </div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Montant :</strong></h3>
                                <div><span style="color:rgb(99,99,99);">Min</span><input class="form-control" type="number" name="prixmin" placeholder="500 $" min="500" max="10000000" step="500" required=""><span style="color:rgb(99,99,99);">Max</span><input class="form-control"
                                        type="number" name="prixmax" placeholder="10000000 $" min="500" max="10000000" step="500" required=""></div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Options Avancées :</strong></h3>
                                <hr>
                                <div>
                                    <div><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Surface :&nbsp;</span>
                                        <div style="margin:0px;"><span style="color:rgb(99,99,99);">Min</span><input class="form-control" type="number" name="surfacemin" placeholder="10 m²" min="10" max="100000" step="10" required=""><span style="color:rgb(99,99,99);">Max</span><input class="form-control"
                                                type="number" name="surfacemax" placeholder="100000 m²" min="10" max="100000" step="10" required=""></div>
                                    </div>
                                    <hr>
                                    <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre de pièces :&nbsp;</span>
                                        <div class="d-flex justify-content-center" style="margin-top:5px;">
                                            <div class="form-check"><input class="form-check-input" type="radio" name="npieces" value="1" disabled="" checked="" id="piece1" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="piece1" style="width:30px;color:rgb(110,110,160);font-weight:bold;">1</label></div>
                                            <div
                                                class="form-check"><input class="form-check-input" type="radio" name="npieces" value="2" disabled="" id="piece2" style="background-color:#ececec;"><label class="form-check-label" for="piece2" style="width:30px;color:rgb(110,110,160);font-weight:bold;">2</label></div>
                                        <div
                                            class="form-check"><input class="form-check-input" type="radio" name="npieces" value="3" disabled="" id="piece3" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="piece3" style="width:30px;color:rgb(110,110,160);font-weight:bold;">3</label></div>
                                    <div
                                        class="form-check"><input class="form-check-input" type="radio" name="npieces" value="4" disabled="" id="piece4" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="piece4" style="width:30px;color:rgb(110,110,160);font-weight:bold;">4</label></div>
                                <div
                                    class="form-check"><input class="form-check-input" type="radio" name="npieces" value="5+" disabled="" id="piece5" style="background-color:#ececec;"><label class="form-check-label" for="piece5" style="width:30px;color:rgb(110,110,160);font-weight:bold;">5+</label></div>
                    </div>
                </div>
                <hr>
                <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre d'étages :&nbsp;</span>
                    <div class="d-flex justify-content-center" style="margin-top:5px;">
                        <div class="form-check"><input class="form-check-input" type="radio" name="netages" value="1" disabled="" checked="" id="etage1" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="etage1" style="width:30px;color:rgb(110,110,160);font-weight:bold;">1</label></div>
                        <div
                            class="form-check"><input class="form-check-input" type="radio" name="netages" value="2" disabled="" id="etage2" style="background-color:#ececec;"><label class="form-check-label" for="etage2" style="width:30px;color:rgb(110,110,160);font-weight:bold;">2</label></div>
                    <div
                        class="form-check"><input class="form-check-input" type="radio" name="netages" value="3" disabled="" id="etage3" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="etage3" style="width:30px;color:rgb(110,110,160);font-weight:bold;">3</label></div>
                <div
                    class="form-check"><input class="form-check-input" type="radio" name="netages" value="4" disabled="" id="etage4" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="etage4" style="width:30px;color:rgb(110,110,160);font-weight:bold;">4</label></div>
            <div
                class="form-check"><input class="form-check-input" type="radio" name="netages" value="5+" disabled="" id="etage5" style="background-color:#ececec;"><label class="form-check-label" for="etage5" style="width:30px;color:rgb(110,110,160);font-weight:bold;">5+</label></div>
    </div>
    </div>
    <hr>
    <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre de façades :&nbsp;</span>
        <div class="d-flex justify-content-center" style="margin-top:5px;">
            <div class="form-check"><input class="form-check-input" type="radio" name="nfacades" value="1" disabled="" checked="" id="facade1" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="facade-1" style="width:30px;color:rgb(110,110,160);font-weight:bold;">1</label></div>
            <div
                class="form-check"><input class="form-check-input" type="radio" name="nfacades" value="2" disabled="" id="facade2" style="background-color:#ececec;"><label class="form-check-label" for="facade-2" style="width:30px;color:rgb(110,110,160);font-weight:bold;">2</label></div>
        <div
            class="form-check"><input class="form-check-input" type="radio" name="nfacades" value="3" disabled="" id="facade3" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="facade-3" style="width:30px;color:rgb(110,110,160);font-weight:bold;">3</label></div>
    <div
        class="form-check"><input class="form-check-input" type="radio" name="nfacades" value="4" disabled="" id="facade4" style="background-color:rgb(236,236,236);"><label class="form-check-label" for="facade-4" style="width:30px;color:rgb(110,110,160);font-weight:bold;">4</label></div>
        <div
            class="form-check"><input class="form-check-input" type="radio" name="nfacades" value="5+" disabled="" id="facade5" style="background-color:#ececec;"><label class="form-check-label" for="facade-5" style="width:30px;color:rgb(110,110,160);font-weight:bold;">5+</label></div>
            </div>
            </div>
            </div>
            <hr>
            <div class="flex-wrap" style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Accessoires :&nbsp;</span>
                <div class="form-check d-flex"><input class="form-check-input" type="checkbox" name="accessoire1" value="cave" disabled="" id="accrech1"><label class="form-check-label" for="accrech1">Cave</label></div>
                <div class="form-check"><input class="form-check-input" type="checkbox" name="accessoire2" value="garage" disabled="" id="accrech2"><label class="form-check-label" for="accrech2">Garage</label></div>
                <div class="form-check"><input class="form-check-input" type="checkbox" name="accessoire3" value="parking" disabled="" id="accrech3"><label class="form-check-label" for="accrech3">Parking</label></div>
                <div class="form-check"><input class="form-check-input" type="checkbox" name="accessoire4" value="jardin" disabled="" id="accrech4"><label class="form-check-label" for="accrech4">Jardin</label></div>
                <div class="form-check"><input class="form-check-input" type="checkbox" name="accessoire5" value="terasse" disabled="" id="accrech5"><label class="form-check-label" for="accrech5">Terasse</label></div>
            </div><span class="text-danger d-flex justify-content-center" id="checkTypeErr"></span>
            <div class="d-flex justify-content-center" style="margin:40px 0px 0px;"><button class="btn btn-primary d-flex" type="submit" style="background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));color:rgb(255,255,255);font-weight:bold;font-size:24px;">Chercher</button></div>
            </div>
            </form>
            </div>
            </div>
            </div>
            </div>
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