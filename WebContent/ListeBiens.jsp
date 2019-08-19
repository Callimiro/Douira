<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modele.Bien"%>
<%@ page import="modele.Client"%>
<%@ page import="modele.Contrat"%>
<%@ page import="modele.Facture"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Date"%>
<%--
  Created by IntelliJ IDEA.
  User: racim
  Date: 07/05/18
  Time: 11:50 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liste de ses biens</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Andika">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body
	style="background-color: rgb(242, 242, 242); background-image: url(&amp;quot;assets/img/217 [Converted].png&amp;quot;); background-size: auto; background-position: center;">
	<nav class="navbar navbar-light navbar-expand-md sticky-top"
		style="background: linear-gradient(229deg, #1f2626, #1d1948, rgb(21, 81, 101), black); background-size: 1000% 1000%; -webkit-animation: AnimationName 14s ease infinite; -moz-animation: AnimationName 14s ease infinite; -o-animation: AnimationName 14s ease infinite; animation: AnimationName 14s ease infinite;">

		<div class="container">
			<a class="navbar-brand" href="Accueil.jsp"><img
				src="assets/img/Douira 1 - White.png" width="100"></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span
					class="navbar-toggler-icon"
					style="background-image: url(&amp;quot;assets/img/list.png&amp;quot;);"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">
				<a class="text-monospace mx-auto" href="#searchmodal"
					data-toggle="modal"><img src="assets/img/magnifier.png"
					alt="Chercher un bien" width="35" style="margin: 0px 10px 0px;"></a><a
					href="#termes" data-toggle="modal"><img
					src="assets/img/add-circular-button.png" alt="Ajouter un bien"
					width="35" style="margin: 0px 10px 0px;"></a> <a href="#usermenu"
					data-toggle="modal"><img src="assets/img/avatar.png"
					alt="Profil" width="35" style="margin: 0px 10px 0px;"></a>
			</div>
		</div>
	</nav>
	<div style="margin-top: 2px;">
		<div>
			<ul class="nav nav-tabs d-flex justify-content-center"
				style="border: none; background-color: rgba(255, 255, 255, 0.43);">
				<li class="nav-item"><a class="nav-link" role="tab"
					data-toggle="tab" href="#tab-1">Biens loués</a></li>
				<li class="nav-item"><a class="nav-link active" role="tab"
					data-toggle="tab" href="#tab-2">Biens en attente de location</a></li>
				<li class="nav-item"><a class="nav-link" role="tab"
					data-toggle="tab" href="#tab-3">Locations</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade" role="tabpanel" id="tab-1">
					<!---- liste des biens loués ---->
					<%
						ArrayList<Bien> ListBienLoues = (ArrayList<Bien>) (session
								.getAttribute("ListBienLoues"));
						pageContext.setAttribute("ListBienLoues", ListBienLoues);

						ArrayList<Contrat> ListContratLoues = (ArrayList<Contrat>) (session
								.getAttribute("ListContratLoues"));
						pageContext.setAttribute("ListContratLoues", ListContratLoues);

						ArrayList<Facture> ListLocataire = (ArrayList<Facture>) (session
								.getAttribute("ListLocataire"));
						pageContext.setAttribute("ListLocataire", ListLocataire);
					%>
					<c:forEach items="${ListBienLoues}" var="bien" varStatus="loop">

						<div style="margin: 5px; margin-top: 20px;">
							<div
								style="height: auto; padding: 15px; background-color: white; border-radius: 10px; box-shadow: 1px 1px 4px rgba(128, 128, 128, 0.23); margin-bottom: 10px;">
								<h4 id="bltype"
									style="font-weight: bold; color: rgb(14, 14, 91);">
									<c:out value="${bien.getType()}" />
								</h4>
								<h6 id="bladresse" style="color: rgb(27, 63, 75);">
									Adresse: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${bien.getAdresse()}" /></span>
								</h6>
								<h6 id="blprix" style="color: rgb(27, 63, 75);">
									Prix: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${bien.getPrixmax()}" />DA</span>
								</h6>
								<h6 id="bldatedebut">
									Date de début de location: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${ListContratLoues[loop.index].getDatedebut()}" /></span>
								</h6>
								<h6 id="bldatefin" style="color: rgb(27, 63, 75);">
									Date de fin de location: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value='${ListContratLoues[loop.index].getDatecontrat()}' /></span>
								</h6>
								<h6 id="blnlocataire" style="color: rgb(27, 63, 75);">
									Numéro de locataire: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${ListLocataire[loop.index].getIdlocataire()}" /></span>
								</h6>
							</div>
						</div>

					</c:forEach>


				</div>

				<div class="tab-pane fade show active" role="tabpanel" id="tab-2">
					<!---- liste des biens en attente de location ---->
					<%
						ArrayList<Bien> ListBienEnAtt = (ArrayList<Bien>) (session
								.getAttribute("ListBienEnAtt"));
						pageContext.setAttribute("ListBienEnAtt", ListBienEnAtt);
					%>
					<c:forEach items="${ListBienEnAtt}" var="bien1" varStatus="loop">

						<div style="margin: 5px; margin-top: 20px;"
							class="<c:out value="${loop.index }"/>">
							<div
								style="height: auto; padding: 15px; background-color: white; border-radius: 10px; box-shadow: 1px 1px 4px rgba(128, 128, 128, 0.23); margin-bottom: 10px;">
								<h4 id="batype"
									style="font-weight: bold; color: rgb(14, 14, 91);">
									<c:out value="${bien1.getType()}" />
								</h4>
								<h6 id="baadresse" style="color: rgb(27, 63, 75);">
									Adresse: <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${bien1.getAdresse()}" /></span>
								</h6>
								<h6 id="baprix" style="color: rgb(27, 63, 75);">
									Prix : <span
										style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
											value="${bien1.getPrixmax()}" /> DA</span>
								</h6>
								<div class="d-flex">
									<a class="btn btn-primary" role="button" href="#deletebien<c:out value="${loop.index}"/>"
										style="margin-right: 10px; background-color: red; border: none;"
										data-toggle="modal">Supprimer</a><a class="btn btn-primary"
										role="button" href="#modifyprice<c:out value="${loop.index}"/>"
										style="background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153));"
										data-toggle="modal">Modifier le montant</a>
								</div>
								<div>
									<div class="modal fade" role="dialog" tabindex="-1"
										id="modifyprice<c:out value="${loop.index}"/>">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header" style="border: none;">
													<h4 class="modal-title"
														style="font-weight: bold; color: rgb(14, 14, 91);">Modifer
														le montant de bien</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<div class="modal-body">
													<form
														action="http://9270c42e.ngrok.io/Douira/CtrlModifierMontantBien">
														<input class="form-control" type="number" name="montant"
															required="" placeholder="500 D.A" min="500"
															max="1000000000"> <input hidden="" type="number"
															value=<c:out value="${loop.index}"/> name="loopNum">
														<input hidden="" type="number"
															value=<c:out value="${bien1.getIdbien()}"/> name="idbien" />

														<hr>
														<div class="d-flex float-right">
															<button class="btn btn-light" type="button"
																data-dismiss="modal" style="margin-right: 10px;">Fermer</button>

															<button class="btn btn-primary" type="submit"
																style="background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153));">Modifier</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div>
									<div class="modal fade" role="dialog" tabindex="-1"
										id="deletebien<c:out value="${loop.index}"/>">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Supprimer</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<div class="modal-body">

													<form
														action="http://9270c42e.ngrok.io/Douira/CtrlSuppressionBien">
														<div>
															<p>Etes-vous sûr(e) de vouloir supprimer ce bien ?</p>
															<input class="form-control" type="hidden" name="idbien"
																value=<c:out value="${bien1.getIdbien()}"/>>
															<hr style="border: none;">
															<div class="d-flex float-right">

																<button class="btn btn-light" type="button"
																	data-dismiss="modal" style="margin-right: 15px;">Non</button>
																<button class="btn btn-primary" type="submit"
																	style="background-color: red; border: none;">Oui</button>
															</div>
														</div>
													</form>

												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane fade" role="tabpanel" id="tab-3">
					<!---- Locations ---->
					<%
						ArrayList<Bien> ListLocation = (ArrayList<Bien>) (session
								.getAttribute("ListLocation"));
						pageContext.setAttribute("ListLocation", ListLocation);

						ArrayList<Contrat> ContratLocation = (ArrayList<Contrat>) (session
								.getAttribute("ContratLocation"));
						pageContext.setAttribute("ContratLocation", ContratLocation);
					%>

					<c:forEach items="${ListLocation}" var="bien" varStatus="loop">

						<div class="d-flex justify-content-center">
							<span class="text-danger" id="cmntErr"></span>
						</div>
						<div
							style="height: auto; padding: 15px; background-color: white; border-radius: 10px; box-shadow: 1px 1px 4px rgba(128, 128, 128, 0.23); margin-bottom: 10px;">
							<h4 id="bltype"
								style="font-weight: bold; color: rgb(14, 14, 91);">
								<c:out value="${bien.getType()}" />
							</h4>
							<h6 id="bladresse" style="color: rgb(27, 63, 75);">
								Adresse: <span
									style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
										value="${bien.getAdresse()}" /></span>
							</h6>
							<h6 id="blprix" style="color: rgb(27, 63, 75);">
								Prix: <span style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
										value="${bien.getPrixmax()}" />DA</span>
							</h6>
							<h6 id="bldatedebut">
								Date de début de location: <span
									style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
										value="${ContratLocation[loop.index].getDatedebut()}" /></span>
							</h6>
							<h6 id="bldatefin" style="color: rgb(27, 63, 75);">
								Date de fin de location: <span
									style="margin-left: 5px; color: rgb(195, 195, 195);"><c:out
										value="${ContratLocation[loop.index].getDatecontrat()}" /></span>
							</h6>
							<div class="d-flex">
								<a class="btn btn-primary" role="button"
									href="#donneravis<c:out value="${loop.index}"/>"
									data-toggle="modal"
									style="background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153));">Donner
									ses avis</a>
							</div>
						</div>

						<div class="modal fade" role="dialog" tabindex="-1"
							id="donneravis<c:out value="${loop.index}"/>">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header" style="border: none;">
										<h4 class="modal-title"
											style="color: rgb(14, 14, 91); font-weight: bold;">Donner
											ses avis sur la location</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
										<form
											action="http://9270c42e.ngrok.io/Douira/CtrlAjoutCommentaire">
											<div class="form-group">
												<textarea class="form-control form-control-lg"
													spellcheck="true" name="commentaire" required=""
													maxlength="1000" minlength="10" autocomplete="off"></textarea>
											</div>
											<hr>
											<input class="form-control" type="hidden" name="idbien"
												value="<c:out value="${bien.getIdbien()}"/>"> <input
												hidden="" name="EMAIL"
												value=<%out.print(session.getAttribute("EMAIL"));%>>

											<div class="d-flex float-right">
												<button class="btn btn-light" type="button"
													data-dismiss="modal" style="margin-right: 10px;">Fermer</button>
												<button class="btn btn-primary" type="submit"
													style="background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153));">Envoyer</button>
											</div>

										</form>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>








			</div>
		</div>

		<div>
			<div class="modal fade" role="dialog" tabindex="-1" id="searchmodal"
				style="color: #1d1948;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header" style="border: none;">
							<img src="assets/img/Background - SkyScrapers.png"
								style="width: 90%;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<form class="d-flex justify-content-center"
								action="http://9270c42e.ngrok.io/Douira/CtrlRecherche" method="get"
								id="searchbien">
								<div class="form-group d-inline-block">
									<h3 style="color: rgb(14, 14, 91);">
										<strong>Adresse :</strong>
									</h3>
									<div class="d-flex justify-content-center align-items-center"
										style="border: solid 1px rgba(220, 220, 220, 0.67); border-radius: 20px 20px;">
										<span
											class="d-flex justify-content-center align-items-center align-content-center"
											style="margin-right: 5px;"><img class="img-fluid"
											src="assets/img/magnifier-tool.png" width="20"></span><input
											class="form-control" type="text" name="adresse" required=""
											placeholder="Quartier, ville, département" autocomplete="off"
											style="border: none; width: auto;">
									</div>
									<hr>
									<h3 style="color: rgb(14, 14, 91); margin: 10px 0px 8px;">
										<strong>Type :</strong>
									</h3>
									<div class="d-table flex-wrap" style="color: rgb(99, 99, 99);">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch1"
												value="appartement" id="typerech-1"><label
												class="form-check-label" for="typerech-1"
												style="color: rgb(27, 63, 75);">Appartement</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch2"
												value="villa" id="typerech-2"><label
												class="form-check-label" for="typerech-2"
												style="color: rgb(27, 63, 75);">Villa</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch3"
												value="maison" id="typerech-3"><label
												class="form-check-label" for="typerech-3"
												style="color: rgb(27, 63, 75);">Maison</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch4"
												value="immeuble" id="typerech-4"><label
												class="form-check-label" for="typerech-4"
												style="color: rgb(27, 63, 75);">Immeuble</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch5"
												value="garage" id="typerech-5"><label
												class="form-check-label" for="typerech-5"
												style="color: rgb(27, 63, 75);">Garage</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch6"
												value="lotdeterrain" id="typerech-6"><label
												class="form-check-label" for="typerech-6"
												style="color: rgb(27, 63, 75);">Lot de terrain</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="ch7"
												value="localcommercial" id="typerech-7"><label
												class="form-check-label" for="typerech-7"
												style="color: rgb(27, 63, 75);">Local commercial</label>
										</div>
									</div>
									<hr>
									<h3 style="color: rgb(14, 14, 91); margin: 10px 0px 8px;">
										<strong>Bien en colocation :</strong>
									</h3>
									<div class="d-table flex-wrap" style="color: rgb(99, 99, 99);">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="colocation" value="oui" disabled="" id="colrechoui"><label
												class="form-check-label" for="colrechoui"
												style="color: rgb(27, 63, 75);">Oui</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="colocation" value="non" disabled="" checked=""
												id="colrechnon"><label class="form-check-label"
												for="colrechnon" style="color: rgb(27, 63, 75);">Non</label>
										</div>
									</div>
									<hr>
									<h3 style="color: rgb(14, 14, 91); margin: 10px 0px 8px;">
										<strong>Bien meublé :</strong>
									</h3>
									<div class="d-table flex-wrap" style="color: rgb(99, 99, 99);">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="meuble"
												value="oui" disabled="" id="meubrechoui"><label
												class="form-check-label" for="meubrechoui"
												style="color: rgb(27, 63, 75);">Oui</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="meuble"
												value="non" disabled="" checked="" id="meubrechnon"><label
												class="form-check-label" for="meubrechnon"
												style="color: rgb(27, 63, 75);">Non</label>
										</div>
									</div>
									<hr>
									<h3 style="color: rgb(14, 14, 91); margin: 10px 0px 8px;">
										<strong>Montant :</strong>
									</h3>
									<div>
										<span style="color: rgb(99, 99, 99);">Min</span><input
											class="form-control" type="number" name="prixmin"
											placeholder="500 $" min="500" max="10000000" step="500"
											required=""><span style="color: rgb(99, 99, 99);">Max</span><input
											class="form-control" type="number" name="prixmax"
											placeholder="10000000 $" min="500" max="10000000" step="500"
											required="">
									</div>
									<hr>
									<h3 style="color: rgb(14, 14, 91); margin: 10px 0px 8px;">
										<strong>Options Avancées :</strong>
									</h3>
									<hr>
									<div>
										<div>
											<span
												style="padding: 0px; margin: 0px; font-size: 24px; color: rgb(110, 110, 160);">Surface
												:&nbsp;</span>
											<div style="margin: 0px;">
												<span style="color: rgb(99, 99, 99);">Min</span><input
													class="form-control" type="number" name="surfacemin"
													placeholder="10 m²" min="10" max="100000" step="10"
													required=""><span style="color: rgb(99, 99, 99);">Max</span><input
													class="form-control" type="number" name="surfacemax"
													placeholder="100000 m²" min="10" max="100000" step="10"
													required="">
											</div>
										</div>
										<hr>
										<div style="margin: 40px 0px 0px;">
											<span
												style="padding: 0px; margin: 0px; font-size: 24px; color: rgb(110, 110, 160);">Nombre
												de pièces :&nbsp;</span>
											<div class="d-flex justify-content-center"
												style="margin-top: 5px;">
												<div class="form-check">
													<input class="form-check-input" type="radio" name="npieces"
														value="1" disabled="" checked="" id="piece1"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="piece1"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">1</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="npieces"
														value="2" disabled="" id="piece2"
														style="background-color: #ececec;"><label
														class="form-check-label" for="piece2"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">2</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="npieces"
														value="3" disabled="" id="piece3"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="piece3"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">3</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="npieces"
														value="4" disabled="" id="piece4"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="piece4"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">4</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="npieces"
														value="5+" disabled="" id="piece5"
														style="background-color: #ececec;"><label
														class="form-check-label" for="piece5"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">5+</label>
												</div>
											</div>
										</div>
										<hr>
										<div style="margin: 40px 0px 0px;">
											<span
												style="padding: 0px; margin: 0px; font-size: 24px; color: rgb(110, 110, 160);">Nombre
												d'étages :&nbsp;</span>
											<div class="d-flex justify-content-center"
												style="margin-top: 5px;">
												<div class="form-check">
													<input class="form-check-input" type="radio" name="netages"
														value="1" disabled="" checked="" id="etage1"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="etage1"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">1</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="netages"
														value="2" disabled="" id="etage2"
														style="background-color: #ececec;"><label
														class="form-check-label" for="etage2"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">2</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="netages"
														value="3" disabled="" id="etage3"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="etage3"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">3</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="netages"
														value="4" disabled="" id="etage4"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="etage4"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">4</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="netages"
														value="5+" disabled="" id="etage5"
														style="background-color: #ececec;"><label
														class="form-check-label" for="etage5"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">5+</label>
												</div>
											</div>
										</div>
										<hr>
										<div style="margin: 40px 0px 0px;">
											<span
												style="padding: 0px; margin: 0px; font-size: 24px; color: rgb(110, 110, 160);">Nombre
												de façades :&nbsp;</span>
											<div class="d-flex justify-content-center"
												style="margin-top: 5px;">
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="nfacades" value="1" disabled="" checked=""
														id="facade1" style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="facade-1"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">1</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="nfacades" value="2" disabled="" id="facade2"
														style="background-color: #ececec;"><label
														class="form-check-label" for="facade-2"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">2</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="nfacades" value="3" disabled="" id="facade3"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="facade-3"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">3</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="nfacades" value="4" disabled="" id="facade4"
														style="background-color: rgb(236, 236, 236);"><label
														class="form-check-label" for="facade-4"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">4</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="nfacades" value="5+" disabled="" id="facade5"
														style="background-color: #ececec;"><label
														class="form-check-label" for="facade-5"
														style="width: 30px; color: rgb(110, 110, 160); font-weight: bold;">5+</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="flex-wrap" style="margin: 40px 0px 0px;">
										<span
											style="padding: 0px; margin: 0px; font-size: 24px; color: rgb(110, 110, 160);">Accessoires
											:&nbsp;</span>
										<div class="form-check d-flex">
											<input class="form-check-input" type="checkbox"
												name="accessoire1" value="cave" disabled="" id="accrech1"><label
												class="form-check-label" for="accrech1">Cave</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="accessoire2" value="garage" disabled="" id="accrech2"><label
												class="form-check-label" for="accrech2">Garage</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="accessoire3" value="parking" disabled="" id="accrech3"><label
												class="form-check-label" for="accrech3">Parking</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="accessoire4" value="jardin" disabled="" id="accrech4"><label
												class="form-check-label" for="accrech4">Jardin</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="accessoire5" value="terasse" disabled="" id="accrech5"><label
												class="form-check-label" for="accrech5">Terasse</label>
										</div>
									</div>
									<span class="text-danger d-flex justify-content-center"
										id="checkTypeErr"></span>
									<div class="d-flex justify-content-center"
										style="margin: 40px 0px 0px;">
										<button class="btn btn-primary d-flex" type="submit"
											style="background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153)); color: rgb(255, 255, 255); font-weight: bold; font-size: 24px;">Chercher</button>
									</div>
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
						<div class="modal-header" style="border: none; height: 32px;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body d-flex justify-content-start flex-wrap">
							<div style="margin: 10px;">
								<a href="CtrlModificationCompte"><img
									src="assets/img/edit.png" width="30"><span
									style="color: rgb(0, 0, 0); font-size: 16px; margin: 20px;"><strong>Paramètres</strong></span></a>
							</div>
							<div style="margin: 10px;">
								<a href="Logout"><img src="assets/img/logout.png" width="30"><span
									style="color: rgb(0, 0, 0); font-size: 16px; margin: 20px;"><strong>Logout</strong></span></a>
							</div>
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
							<h4 class="modal-title">Termes et conditions</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<p>
								Le régime de droit commun en matière de baux d'habitation est
								défini principalement par la loi du 6 juillet 1989 modifiée.
								L'ensemble de ces dispositions étant d'ordre public, elles
								s'imposent aux parties qui, en principe, ne peuvent pas y
								renoncer. <br>En conséquence : <br>- le présent
								contrat type de location contient uniquement les clauses
								essentielles du contrat dont la législation et la réglementation
								en vigueur au jour de sa publication imposent la mention par les
								parties dans le contrat. Il appartient cependant aux parties de
								s'assurer des dispositions applicables au jour de la conclusion
								du contrat ; <br>- au-delà de ces clauses, les parties sont
								également soumises à l'ensemble des dispositions légales et
								réglementaires d'ordre public applicables aux baux d'habitation
								sans qu'il soit nécessaire de les faire figurer dans le contrat
								et qui sont rappelées utilement dans la notice d'information qui
								doit être jointe à chaque contrat ; <br>- les parties sont
								libres de prévoir dans le contrat d'autres clauses
								particulières, propres à chaque location, dans la mesure où
								celles-ci sont conformes aux dispositions législatives et
								réglementaires en vigueur. Les parties peuvent également
								convenir de l'utilisation de tout autre support pour établir
								leur contrat, dans le respect du présent contrat type.
							</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-light" type="button" data-dismiss="modal"
								style="border: none;">Réfuser</button>
							<a class="btn btn-primary" role="button" href="AjouterBien.jsp"
								style="border: none; background: linear-gradient(310deg, rgb(27, 19, 129), rgb(10, 107, 153)); color: rgb(255, 255, 255); font-weight: bold;">Accepter</a>
						</div>
					</div>
				</div>
			</div>
		</div>



		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/montant.js" type="text/javascript"></script>
		<script src="assets/js/addchecktype.js"></script>
		<script src="assets/js/blankentrycheck.js"></script>
		<script src="assets/js/blanksearchcheck.js"></script>
		<script src="assets/js/currentdateset.js"></script>
		<script src="assets/js/passwordcheck.js"></script>
		<script src="assets/js/passwordconfirmcheck.js"></script>
		<script src="assets/js/searchchecktype.js"></script>
</body>

</html>