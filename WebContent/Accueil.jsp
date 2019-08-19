<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="height:120vh;">

<%
response.setHeader("cache-control", "no-cache, no-store, must-revalidate");

if(session.getAttribute("USER")==null)
response.sendRedirect("./Authentification.jsp");

%>    

<div style="height:100%;background-color:rgb(242,242,242);background-image:url(&quot;assets/img/217 [Converted].png&quot;);background-size:cover;background-repeat:no-repeat;">
        <div class="d-flex flex-wrap" style="width:300px;height:300px;margin:0;position:absolute;top:50%;left:50%;transform:translate(-50%, -50%);background:linear-gradient(229deg, #1f2626, #1d1948, rgb(21,81,101), black);background-size:1000% 1000%;-webkit-animation:AnimationName 14s ease infinite;-moz-animation:AnimationName 14s ease infinite;-o-animation:AnimationName 14s ease infinite;animation:AnimationName 14s ease infinite;">
            <div class="d-flex justify-content-center align-items-center" id="acc-div1" style="width:150px;height:150px;border-bottom:solid 1px rgba(181,181,181,0.56);border-right:solid 1px rgba(181,181,181,0.56);"><a href="#searchmodal" data-toggle="modal" title="Rechercher des biens"><img src="assets/img/magnifier.png" width="80" class="acc-img"><h6 class="text-center" style="color:rgb(255,255,255);margin-top:10px;">Rehercher</h6></a></div>
            <div class="d-flex justify-content-center align-items-center"
                id="acc-div2" style="width:150px;height:150px;border-left:solid 1px rgba(181,181,181,0.56);border-bottom:solid 1px rgba(181,181,181,0.56);"><a href="#termes" data-toggle="modal" title="Ajouter un bien"><img src="assets/img/add-circular-button.png" width="80" class="acc-img"><h6 class="text-center" style="color:rgb(255,255,255);margin-top:10px;">Ajouter</h6></a></div>
            <div class="d-flex justify-content-center align-items-center"
                id="acc-div3" style="width:150px;height:150px;border-top:solid 1px rgba(181,181,181,0.56);border-right:solid 1px rgba(181,181,181,0.56);"><a href="CtrlListeBiens" title="Consulter la liste de ses biens"><img src="assets/img/house-with-dollar-sign-on-a-hand.png" width="80" class="acc-img"><h6 class="text-center" style="color:rgb(255,255,255);margin-top:10px;">Consulter</h6></a></div>
            <div class="d-flex justify-content-center align-items-center"
                id="acc-div4" style="width:150px;height:150px;border-top:solid 1px rgba(181,181,181,0.56);border-left:solid 1px rgba(181,181,181,0.56);"><a href="#usermenu" data-toggle="modal"><img src="assets/img/avatar.png" width="80" class="acc-img"><h6 class="text-center" style="color:rgb(255,255,255);margin-top:10px;">Profil</h6></a></div>
        </div>
    </div>
    <div>
        <div class="modal fade" role="dialog" tabindex="-1" id="searchmodal" style="color:#1d1948;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border:none;"><img src="assets/img/Background - SkyScrapers.png" style="width:90%;"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                    <div class="modal-body">
                        <form class="d-flex justify-content-center" action="http://9270c42e.ngrok.io/Douira/CtrlRecherche" method="get" id="searchbien">
                            <div class="form-group d-inline-block">
                                <h3 style="color:rgb(14,14,91);"><strong>Adresse :</strong></h3>
                                <div class="d-flex justify-content-center align-items-center" style="border:solid 1px rgba(220,220,220,0.67);border-radius:20px 20px;"><span class="d-flex justify-content-center align-items-center align-content-center" style="margin-right:5px;"><img class="img-fluid" src="assets/img/magnifier-tool.png" width="20"></span><input class="form-control" type="text" name="adresse"
                                        required="" placeholder="Quartier, ville, d�partement" autocomplete="off" style="border:none;width:auto;"></div>
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
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Bien meubl� :</strong></h3>
                                <div class="d-table flex-wrap" style="color:rgb(99,99,99);">
                                    <div class="form-check"><input class="form-check-input" type="radio" name="meuble" value="oui" disabled="" id="meubrechoui"><label class="form-check-label" for="meubrechoui" style="color:rgb(27,63,75);">Oui</label></div>
                                    <div class="form-check"><input class="form-check-input" type="radio" name="meuble" value="non" disabled="" checked="" id="meubrechnon"><label class="form-check-label" for="meubrechnon" style="color:rgb(27,63,75);">Non</label></div>
                                </div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Montant :</strong></h3>
                                <div><span style="color:rgb(99,99,99);">Min</span><input class="form-control" type="number" name="prixmin" placeholder="500 $" min="500" max="10000000" step="500" required=""><span style="color:rgb(99,99,99);">Max</span><input class="form-control"
                                        type="number" name="prixmax" placeholder="10000000 $" min="500" max="10000000" step="500" required=""></div>
                                <hr>
                                <h3 style="color:rgb(14,14,91);margin:10px 0px 8px;"><strong>Options Avanc�es :</strong></h3>
                                <hr>
                                <div>
                                    <div><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Surface :&nbsp;</span>
                                        <div style="margin:0px;"><span style="color:rgb(99,99,99);">Min</span><input class="form-control" type="number" name="surfacemin" placeholder="10 m�" min="10" max="100000" step="10" required=""><span style="color:rgb(99,99,99);">Max</span><input class="form-control"
                                                type="number" name="surfacemax" placeholder="100000 m�" min="10" max="100000" step="10" required=""></div>
                                    </div>
                                    <hr>
                                    <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre de pi�ces :&nbsp;</span>
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
                <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre d'�tages :&nbsp;</span>
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
    <div style="margin:40px 0px 0px;"><span style="padding:0px;margin:0px;font-size:24px;color:rgb(110,110,160);">Nombre de fa�ades :&nbsp;</span>
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
                            <div class="modal-header" style="border:none;height:32px;"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                            <div class="modal-body d-flex justify-content-start flex-wrap">
                                <div style="margin:10px;"><a href="CtrlModificationCompte"><img src="assets/img/edit.png" width="30"><span style="color:rgb(0,0,0);font-size:16px;margin:20px;"><strong>Param�tres</strong></span></a></div>
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
                                <h4 class="modal-title">Termes et conditions</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                            <div class="modal-body">
                                <p>Le r�gime de droit commun en mati�re de baux d'habitation est d�fini principalement par la loi du 6 juillet 1989 modifi�e. L'ensemble de ces dispositions �tant d'ordre public, elles s'imposent aux parties qui, en principe,
                                    ne peuvent pas y renoncer. <br>En cons�quence : <br>- le pr�sent contrat type de location contient uniquement les clauses essentielles du contrat dont la l�gislation et la r�glementation en vigueur au jour de sa publication
                                    imposent la mention par les parties dans le contrat. Il appartient cependant aux parties de s'assurer des dispositions applicables au jour de la conclusion du contrat ; <br>- au-del� de ces clauses, les parties sont
                                    �galement soumises � l'ensemble des dispositions l�gales et r�glementaires d'ordre public applicables aux baux d'habitation sans qu'il soit n�cessaire de les faire figurer dans le contrat et qui sont rappel�es utilement
                                    dans la notice d'information qui doit �tre jointe � chaque contrat ; <br>- les parties sont libres de pr�voir dans le contrat d'autres clauses particuli�res, propres � chaque location, dans la mesure o� celles-ci sont
                                    conformes aux dispositions l�gislatives et r�glementaires en vigueur. Les parties peuvent �galement convenir de l'utilisation de tout autre support pour �tablir leur contrat, dans le respect du pr�sent contrat type.</p>
                            </div>
                            <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal" style="border:none;">R�fuser</button><a class="btn btn-primary" role="button" href="AjouterBien.jsp" style="border:none;background:linear-gradient(310deg, rgb(27,19,129), rgb(10,107,153));color:rgb(255,255,255);font-weight:bold;">Accepter</a></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div>
                <div id="signalBien" class="modal fade" role="dialog" tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Signal</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                            <div class="modal-body">
                                <% out.println("<p>" + request.getAttribute("msgSignal") +"</p>"); %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div>
                <div id="ajoutBien" class="modal fade" role="dialog" tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Ajout</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                            <div class="modal-body">
                                <% out.println("<p>" + request.getAttribute("msgAjoutBien") +"</p>"); %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div>
                <div id="ajoutContrat" class="modal fade" role="dialog" tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Location</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button></div>
                            <div class="modal-body">
                                <% out.println("<p>" + request.getAttribute("msgAjoutContrat") + "</p>"); %>
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
            
            <%
            if(request.getAttribute("msgSignal")!=null)
            {
            	out.println("<script>$(document).ready(function(){$(\"#signalBien\").modal('show');});</script>");
            }
            
            if(request.getAttribute("msgAjoutBien")!=null)
            {
            	out.println("<script>$(document).ready(function(){$(\"#ajoutBien\").modal('show');});</script>");
            }
            
            if(request.getAttribute("msgAjoutContrat")!=null)
            {
            	out.println("<script>$(document).ready(function(){$(\"#ajoutContrat\").modal('show');});</script>");
            }
            %>
</body>

</html>