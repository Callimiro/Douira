<!DOCTYPE html>
<%@ page import="modele.Bien"%>
<%@ page import="modele.Commentaire"%>
<%@ page import="modele.Utilisateur"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du bien</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background-color:rgb(242,242,242);">
<%
response.setHeader("cache-control", "no-cache, no-store, must-revalidate");

if(session.getAttribute("USER")==null)
response.sendRedirect("Authentification.jsp");

%>   
    <nav class="navbar navbar-light navbar-expand-md sticky-top" style="background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
        <div class="container"><a class="navbar-brand" href="Accueil.jsp"><img src="assets/img/Douira 1 - White.png" width="100"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon" style="background-image:url(&quot;assets/img/list.png&quot;);"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1"><a class="text-monospace mx-auto" href="#searchmodal" data-toggle="modal"><img src="assets/img/magnifier.png" alt="Chercher un bien" width="35" style="margin:0px 10px 0px;"></a><a href="#termes" data-toggle="modal"><img src="assets/img/add-circular-button.png" alt="Ajouter un bien" width="35" style="margin:0px 10px 0px;"></a>
                <a
                    href="CtrlListeBiens"><img src="assets/img/house-with-dollar-sign-on-a-hand.png" alt="Consulter ses bien" width="40" style="margin:0px 10px 0px;"></a><a href="#usermenu" data-toggle="modal"><img src="assets/img/avatar.png" alt="Profil" width="35" style="margin:0px 10px 0px;"></a></div>
        </div>
    </nav>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6" style="padding:2px;margin-top:30px;margin-bottom:30px;">
                    <div>
                        <div class="float-left" style="width:auto;">
                            <div class="carousel slide carousel-fade" data-ride="carousel" id="carousel-1" style="border:solid 5px rgba(197,197,197,0.39);">
                                <div class="carousel-inner" role="listbox" style="height:300px;">
                                
                                <% 
                                ArrayList<Long> count = (ArrayList) request.getAttribute("nombreimages");
                                
                                Bien bien2 = (Bien) request.getAttribute("DetailsBien");
                                
                                int c=0;
                                
                                for(long id : count)
                                {
                                	if(c==0)
                                		out.println("<div class=\"carousel-item active\" style=\"height:300px;\"><img class=\"w-100 d-block\" src=\"CtrlImagesDetailsBien?idbien=" + bien2.getIdbien() + "&idimage=" + id + "\" alt=\"Slide Image\" height=\"300\"></div>");
                                	else
                                		out.println("<div class=\"carousel-item\" style=\"height:300px;\"><img class=\"w-100 d-block\" src=\"CtrlImagesDetailsBien?idbien=" + bien2.getIdbien() + "&idimage=" + id + "\" alt=\"Slide Image\" height=\"300\"></div>");
                                	c++;
                                }
                                %>

                                </div>
                                <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon" style="width:50px;height:50px;"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next"
                                        href="#carousel-1" role="button" data-slide="next"><span class="carousel-control-next-icon" style="width:50px;height:50px;"></span><span class="sr-only">Next</span></a></div>
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-1" data-slide-to="1"></li>
                                    <li data-target="#carousel-1" data-slide-to="2"></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    
                    <%
                    Bien bien = (Bien) request.getAttribute("DetailsBien");
                    
                    String npieces = "";
                    
                    String netages = "";
                    
                    String nfacades = "";
                    
    	    		if(bien.getType().equals("appartement")) {bien.setType("Appartement"); npieces=String.valueOf(bien.getNpieces()); netages=String.valueOf(bien.getNetages()); nfacades=String.valueOf(bien.getNfacades());}
    	    		if(bien.getType().equals("villa")) {bien.setType("Villa"); npieces=String.valueOf(bien.getNpieces()); netages=String.valueOf(bien.getNetages()); nfacades=String.valueOf(bien.getNfacades());}
    	    		if(bien.getType().equals("maison")) {bien.setType("Maison"); npieces=String.valueOf(bien.getNpieces()); netages=String.valueOf(bien.getNetages()); nfacades=String.valueOf(bien.getNfacades());}
    	    		if(bien.getType().equals("immeuble")) {bien.setType("Immeuble"); npieces=String.valueOf(bien.getNpieces()); netages=String.valueOf(bien.getNetages()); nfacades=String.valueOf(bien.getNfacades());}
    	    		if(bien.getType().equals("garage")) {bien.setType("Garage"); npieces="/"; netages="/"; nfacades="/";}
    	    		if(bien.getType().equals("lotdeterrain")) {bien.setType("Lot de Terrain"); npieces="/"; netages="/"; nfacades="/";}
    	    		if(bien.getType().equals("localcommercial")) {bien.setType("Local Commercial"); npieces="/"; netages="/"; nfacades="/";}
                    	
                    out.println("<div class=\"d-inline-block\" style=\"margin-top:5px;\"><h3 style=\"color:rgb(27,63,75);\">" + bien.getPrixmax() + "<span class=\"text-monospace\" style=\"color:rgb(27,63,75);margin-left:15px;\">D.A/</span><span style=\"font-size:16px;\">"+ bien.getPayement() +"</span></h3></div>");
                    	
                    out.println("<div class=\"d-inline-block float-right\" style=\"margin-left:10px;margin-top:5px;\"><a class=\"btn btn-warning\" role=\"button\" href=\"#signalbien\" style=\"margin-right:10px;border:none;\" data-toggle=\"modal\"><img src=\"assets/img/flag (white).png\" width=\"20\"></a><button class=\"btn btn-primary\" type=\"button\" style=\"background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));\"data-toggle=\"modal\" data-target=\"#contrat\">Louer</button></div><div>");
                    	
                    out.println("<h4 style=\"color:rgb(27,63,75);\">" + bien.getType() + "</h4>");
                    
                    out.println("</div>");
                    
                    out.println("<div style=\"border-bottom:rgb(225,225,225) solid 1px;\"><h5 class=\"text-truncate\" style=\"color:rgb(27,63,75);\">" + bien.getAdresse() + "</h5></div>");
                    
                    out.println("<div><h1 style=\"color:rgb(29,25,72);\"><strong>Descriptif</strong><br></h1><p style=\"color:rgb(29,25,72);\">" + bien.getDescription() + "<br></p></div>");
                    
                    out.println("<div class=\"d-inline-block\" style=\"\"><h4 style=\"color:rgb(29,25,72);\"><span class=\"text-monospace\" style=\"font-size:15px;color:rgb(29,25,72);\"><em>référence annonce:&nbsp;</em></span>" + bien.getIdbien() + "</h4></div><br>");
                    
                    String col = bien.getColocation();
                    if(col==null)col="non";
                    String me = bien.getMeuble();
                    if(me==null)me="non";
                    
                    out.println("<div class=\"d-inline-block\" style=\"\"><h4 style=\"color:rgb(29,25,72);\"><span class=\"text-monospace\" style=\"font-size:15px;color:rgb(29,25,72);\"><em>colocation:&nbsp;</em></span>" + col + "</h4></div><br>");
                    
                    out.println("<div class=\"d-inline-block\" style=\"border-bottom:rgb(225,225,225) solid 1px;\"><h4 style=\"color:rgb(29,25,72);\"><span class=\"text-monospace\" style=\"font-size:15px;color:rgb(29,25,72);\"><em>meublé:&nbsp;</em></span>" + me + "</h4></div>");
                    
                    out.println("<div style=\"margin-top:10px;\">");
                    
                    out.println("<div class=\"d-inline-block\" style=\"width:100%;\">");
                    
                    out.println("<table class=\"table\">");
                    
                    out.println("<tbody style=\"background-color:#ffffff;\">");
                    
                    out.println("<tr>");
                    
                    out.println("<td style=\"border:1px solid #dee2e6;\">Surface:<span style=\"margin:5px;\">"+ bien.getSurfacemax() +" m²</span></td>");
                    
                    out.println("<td>Pièce(s):<span style=\"margin:5px;\">" + npieces + "</span></td>");
                    
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    
                    out.println("<td style=\"border:1px solid #dee2e6;\">Etage(s):<span style=\"margin:5px;\">" + netages + "</span></td>");
                    
                    out.println("<td style=\"border:1px solid #dee2e6;\">Façade(s):<span style=\"margin:5px;\">" + nfacades + "</span></td>");
                    
                    out.println("</tr>");
                    
                    out.println("</tbody>");
                    
                    out.println("</table>");
                    
                    out.println("</div>");
                    
                    out.println("</div>");
                    
                    ArrayList<Commentaire> commentaires = (ArrayList)  request.getAttribute("CommentairesBien");
                    
                    ArrayList<Utilisateur> commentateurs = (ArrayList) request.getAttribute("Commentateurs");
                    
                    int co = 0;
                    
                    if(commentaires.isEmpty()==false)
                    {
                    	out.println("<div>");
                    	
                    	out.println("<h1 style=\"color:rgb(29,25,72);margin-bottom:30px;\">Avis des locataires</h1>");
                    	
                    	for(Commentaire commentaire : commentaires)
                    	{
                    		out.println("<div style=\"border-bottom:2px solid #dee2e6;border-radius:15px;background-color:white;padding:10px;margin-bottom:10px;\">");
                    		
                    		out.println("<div><i class=\"fa fa-user-circle\"></i><span style=\"margin:5px;\">" + commentateurs.get(co).getPrenom() + "</span></div>");
                    		
                    		out.println("<div>");
                    		
                    		out.println("<p>" + commentaire.getContenu() + "</p>");
                    		
                    		out.println("</div>");
                    		
                    		out.println("<div><span style=\"color:rgb(139,139,139);\">" + commentaire.getDatepub() + "</span><span class=\"float-right\"><a href=\"#signalcommentaire" + co + "\" data-toggle=\"modal\"><img src=\"assets/img/flag.png\" width=\"20\"></a></span></div>");
                    		
                    		out.println("</div>");
                    		
                    		out.println("<div>");
                    		out.println("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"signalcommentaire"+ co + "\">");
                    		out.println("<div class=\"modal-dialog\" role=\"document\">");
                    		out.println("<div class=\"modal-content\">");
                    		out.println("<div class=\"modal-header\">");
                    		out.println("<h4 class=\"modal-title\">Signaler ce commentaire</h4><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
                    		out.println("<div class=\"modal-body\">");
                    		out.println("<form action=\"http://localhost:8080/Douira/CtrlSignalCommentaire\" method=\"post\">");
                    		out.println("<div class=\"form-group\">");
                    		out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"violence\" required=\"\" id=\"signalcmnt-1\"><label class=\"form-check-label\" for=\"signalcmnt-1\">Violence</label></div>");
                    		out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"hareclement\" required=\"\" id=\"signalcmnt-2\"><label class=\"form-check-label\" for=\"signalcmnt-2\">Harèclement</label></div>");
                    		out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"haine\" required=\"\" id=\"signalcmnt-3\"><label class=\"form-check-label\" for=\"signalcmnt-3\">Discours incitant à la haine</label></div>");
                    		out.println("</div><input class=\"form-control\" type=\"hidden\" name=\"idcomment\" value=\"" + commentaire.getIdcomment() +"\">");
                    		out.println("<hr>");
                    		out.println("<div class=\"d-flex float-right\"><button class=\"btn btn-light\" type=\"button\" data-dismiss=\"modal\" style=\"margin-right:15px;\">Fermer</button><button class=\"btn btn-primary\" type=\"submit\">Signaler</button></div>");
                    		out.println("</form>");
                    		out.println("</div>");
                    		out.println("</div>");
                    		out.println("</div>");
                    		out.println("</div>");
                    		out.println("</div>");
                    		
                    		co++;
                    		
                    	}
                    	
                    	out.println("</div>");
                    	
                    }
                    
                    out.println("</div>");
                    
                    out.println("<div class=\"col-md-6 justify-content-center\" style=\"margin-top:30px;margin-bottom:30px;padding:2px;padding-left:10px;padding-right:10px;\">");
                    
                    System.out.println("adresse :" + bien.getAdresse());
                    out.println("<div style=\"border:solid 5px rgba(197,197,197,0.39);\">" + "<iframe allowfullscreen=\"\" frameborder=\"0\" width=\"100%\" height=\"400\" src=\"https://www.google.com/maps/embed/v1/search?key=AIzaSyAT0FCufojOfcV9jhhZhi64omS_4QxLhU8&amp;q=" + bien.getAdresse() + "&amp;zoom=11\" style=\"height:400px;\"></iframe></div>");
                    
                    out.println("<div class=\"d-flex justify-content-center align-items-center\" style=\"margin-top:100px;\">");
                    
                    out.println("<div class=\"d-flex justify-content-center align-items-center\" style=\"height:auto;width:70%;border:solid 5px rgba(197,197,197,0.39);background-color:white;background-size:contain;\">");
                    
                    out.println("<form class=\"justify-content-center\" action=\"http://localhost:8080/Douira/CtrlTopAnnonce\" method=\"get\">");
                    
                    out.println("<div class=\"d-flex justify-content-center align-items-center\" style=\"margin-top:50px;\"><button class=\"btn btn-primary\" type=\"submit\" style=\"background:none;border:none;\"><img src=\"assets/img/favorite-place.png\" width=\"100\"></button></div>");
                    
                    System.out.println(bien.getAdresse());
                    
                    out.println("<h2 class=\"text-center\" style=\"color:rgb(29,25,72);padding:25px;font-weight:bold;text-shadow:2px 2px 2px rgba(129,128,128,0.35);\">Découvrir les Top annonces à&nbsp; <span id=\"adrbien\">" + bien.getAdresse() +"</span></h2><input class=\"form-control\" type=\"hidden\" name=\"topplace\" value=\"" + bien.getAdresse() + "\"><input class=\"form-control\" type=\"hidden\" name=\"idprop\" value=\"" + session.getAttribute("USER") + "\"></form>");
                    
                    out.println("</div>");
                    
                    out.println("</div>");
                    
                    out.println("<div>");
                    out.println("<div class=\"modal fade\" role=\"dialog\" tabindex=\"-1\" id=\"signalbien\">");
                    out.println("<div class=\"modal-dialog\" role=\"document\">");
                    out.println("<div class=\"modal-content\">");
                    out.println("<div class=\"modal-header\">");
                    out.println("<h4 class=\"modal-title\">Signaler le bien</h4><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
                    out.println("<div class=\"modal-body\">");
                    out.println("<p>Veuillez préciser pourquoi vous voudrez signaler ce bien:</p>");
                    out.println("<form action=\"http://localhost:8080/Douira/CtrlSignalBien\" method=\"post\">");
                    out.println("<div class=\"form-group\">");
                    out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"fausseinformation\" required=\"\" id=\"signalbien-1\"><label class=\"form-check-label\" for=\"signalbien-1\">Fausse information</label></div>");
                    out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"contenuindesirable\" required=\"\" id=\"signalbien-2\"><label class=\"form-check-label\" for=\"signalbien-2\">Contenu indésirable</label></div>");
                    out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"locationinterdite\" required=\"\" id=\"signalbien-3\"><label class=\"form-check-label\" for=\"signalbien-3\">Location interdite</label></div>");
                    out.println("<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"raisonsignal\" value=\"nudite\" required=\"\" id=\"signalbien-4\"><label class=\"form-check-label\" for=\"signalbien-4\">Nudité</label></div>");
                    out.println("</div>");
                    out.println("<input class=\"form-control\" type=\"hidden\" name=\"idbien\" value=\"" + bien.getIdbien() + "\">");
                    out.println("<hr>");
                    out.println("<div class=\"d-flex float-right\"><button class=\"btn btn-light\" type=\"button\" data-dismiss=\"modal\" style=\"margin-right:15px;\">Fermer</button><button class=\"btn btn-primary\" type=\"submit\">Signaler</button></div>");
                    out.println("</form>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                	out.println("</div>");
                	out.println("</div>");
                    
                    %>
                   
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
            <div>
                <div class="modal fade" role="dialog" tabindex="-1" id="usermenu">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="border:none;height:32px;"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                            <div class="modal-body d-flex justify-content-start flex-wrap">
                                <div style="margin:10px;"><a href="CtrlModificationCompte"><img src="assets/img/edit.png" width="30"><span style="color:rgb(0,0,0);font-size:16px;margin:20px;"><strong>Paramètres</strong></span></a></div>
                                <div style="margin:10px;"><a href="Logout"><img src="assets/img/logout.png" width="30"><span style="color:rgb(0,0,0);font-size:16px;margin:20px;"><strong>Logout</strong></span></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="modal fade" role="dialog" tabindex="-1" id="termes">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Termes et conditions</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                            <div class="modal-body">
                                <p>Le régime de droit commun en matière de baux d'habitation est défini principalement par la loi du 6 juillet 1989 modifiée. L'ensemble de ces dispositions étant d'ordre public, elles s'imposent aux parties qui, en principe,
                                    ne peuvent pas y renoncer. <br>En conséquence : <br>- le présent contrat type de location contient uniquement les clauses essentielles du contrat dont la législation et la réglementation en vigueur au jour de sa publication
                                    imposent la mention par les parties dans le contrat. Il appartient cependant aux parties de s'assurer des dispositions applicables au jour de la conclusion du contrat ; <br>- au-delà de ces clauses, les parties sont
                                    également soumises à l'ensemble des dispositions légales et réglementaires d'ordre public applicables aux baux d'habitation sans qu'il soit nécessaire de les faire figurer dans le contrat et qui sont rappelées utilement
                                    dans la notice d'information qui doit être jointe à chaque contrat ; <br>- les parties sont libres de prévoir dans le contrat d'autres clauses particulières, propres à chaque location, dans la mesure où celles-ci sont
                                    conformes aux dispositions législatives et réglementaires en vigueur. Les parties peuvent également convenir de l'utilisation de tout autre support pour établir leur contrat, dans le respect du présent contrat type.</p>
                            </div>
                            <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal" style="border:none;">Réfuser</button><a class="btn btn-primary" role="button" href="AjouterBien.jsp" style="border:none;background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));color:rgb(255,255,255);font-weight:bold;">Accepter</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="modal fade" role="dialog" tabindex="-1" id="contrat">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Contrat de location</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                            <div class="modal-body">
                                <p>Le régime de droit commun en matière de baux d'habitation est défini principalement par la loi du 6 juillet 1989 modifiée. L'ensemble de ces dispositions étant d'ordre public, elles s'imposent aux parties qui, en principe,
                                    ne peuvent pas y renoncer. <br>En conséquence : <br>- le présent contrat type de location contient uniquement les clauses essentielles du contrat dont la législation et la réglementation en vigueur au jour de sa publication
                                    imposent la mention par les parties dans le contrat. Il appartient cependant aux parties de s'assurer des dispositions applicables au jour de la conclusion du contrat ; <br>- au-delà de ces clauses, les parties sont
                                    également soumises à l'ensemble des dispositions légales et réglementaires d'ordre public applicables aux baux d'habitation sans qu'il soit nécessaire de les faire figurer dans le contrat et qui sont rappelées utilement
                                    dans la notice d'information qui doit être jointe à chaque contrat ; <br>- les parties sont libres de prévoir dans le contrat d'autres clauses particulières, propres à chaque location, dans la mesure où celles-ci sont
                                    conformes aux dispositions législatives et réglementaires en vigueur. Les parties peuvent également convenir de l'utilisation de tout autre support pour établir leur contrat, dans le respect du présent contrat type.</p>
                                <% 
                               		Bien bien3 = (Bien) request.getAttribute("DetailsBien");
                                
                                	System.out.println("idbien: " + bien3.getIdbien());
                                	
                                	out.println("<form action=\"http://localhost:8080/Douira/CtrlAjoutContrat\" method=\"post\"><input class=\"form-control\" type=\"hidden\" name=\"idbien\" value=\""+ bien3.getIdbien() +"\"><input class=\"form-control\" type=\"hidden\" name=\"payement\" value=\""+ bien3.getPayement() +"\">");
                                	out.println("<div class=\"form-group\">");
                                	out.println("<h4>Durée du bail:<span style=\"font-size:16px;\">&nbsp;(en jours)</span></h4><input class=\"form-control\" type=\"number\" name=\"dureebail\" required=\"\" placeholder=\"7 jours\" min=\"7\" max=\"365\" step=\"1\"></div>");
                                	out.println("<div class=\"form-group\">");
                                	out.println("<h4>Date de début:</h4><input class=\"form-control\" type=\"date\" name=\"datedebut\" required=\"\" id=\"datedebutlocation\"></div>");
                                	out.println("<hr>");
                                	out.println("<div class=\"d-flex float-right\"><button class=\"btn btn-light\" type=\"button\" data-dismiss=\"modal\" style=\"border:none;margin-right:10px;\">Réfuser</button><button class=\"btn btn-primary\" type=\"submit\" style=\"border:none;background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));color:rgb(255,255,255);font-weight:bold;\">Accepter</button></div>");
                                	out.println("</form>");
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div>
                <div id="signalComment" class="modal fade" role="dialog" tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Succès</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                            <div class="modal-body">
                                <% out.println("<p>" + session.getAttribute("msgSignalCommentaire") +"</p>"); %>
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
            <!--  -->
            <%
            if(session.getAttribute("msgSignalCommentaire")!=null)
            {
            	out.println("<script>$(document).ready(function(){$(\"#signalComment\").modal('show');});</script>");
            	
            	session.removeAttribute("msgSignalCommentaire");
            }
            
            %>
            
</body>

</html>