<%@ page import="java.util.ArrayList" %>
<%@ page import="modele.Bien" %>
<%@ page import="modele.Client" %>
<%@ page import="modele.Commentaire" %>
<%@ page import="modele.Contrat"%>
<%--
  Created by IntelliJ IDEA.
  User: racim
  Date: 07/05/18
  Time: 11:50 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
     <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Bhai">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
  
<div>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean">
        <div class="container"><a class="navbar-brand" href="#">Douira</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                 id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    
                </ul>
            </div>
        </div>
        <div class="collapse navbar-collapse"
                 id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    
                </ul>
                
                <div id="navcol-1" class="collapse navbar-collapse">
        <ul class="nav navbar-nav ml-auto">
        </ul>
        <form action="http://9270c42e.ngrok.io/Douira/Logout" method="post">
        <button class="btn btn-secondary" type="submit">Logout</button>
        </form>
            </div>
        </div>
    </nav>
</div>

    <div class="container">
        <div class="row">
            <div class="col-md-12" style="height:300px;">
                <div>
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1">Gestion des signaux des client</a></li>
                        <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-2">Gestion des signaux des biens</a></li>
                        <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-3">Gestion des signaux des commentaire</a></li>
						<li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-4">Approuver les Contrats</a></li>
                    </ul>
                    <div class="tab-content">
                            <div class="tab-pane active" role="tabpanel" id="tab-1">
                                <div class="table-responsive">
                                    <table class="table">
                                     <%
                                ArrayList<Client> ListClient = (ArrayList<Client>)(session.getAttribute("ListSignalClient"));
                                pageContext.setAttribute("ListClient", ListClient);
                               		%>
                             
                                        <thead>
                                            <tr>
                                                <th>id user </th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            
                                            <c:forEach items="${ListClient}" var="client" >
                        					<tr>
												<td><span><c:out value="${client.getIdusr() }"/></span></td>
												<td>
													<form method="get" action="http://9270c42e.ngrok.io/Douira/CtrlCompte">
													
													<input type="hidden" name="idUsr" value="<c:out value="${client.getIdusr() }"/>">
													
                                                    <div class="btn-group" role="group">
                                                    
                                                    <button class="btn btn-outline-danger" type="submit" name="sub" value="delete">Supprimer</button>
                                                    
                                                    <button class="btn btn-outline-success" type="submit" name="sub" value="ignore">Anuler</button>
                                                    
                                                    </div>
                                                    </form>
                                                
                                                </td>
                                            </tr>
								
                        					</c:forEach>
                        					
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                        <div class="tab-pane" role="tabpanel" id="tab-2">
                        
                        
                        	<div class="table-responsive">
                                    <table class="table">
                                    <thead>
                                            <tr>
                                                <th>id bien </th>
                                                <th>id propietaire</th>
                                                <th>Action</th>
                                            </tr>
                            </thead>
                            
                            
                            
                            
                            <tbody>
                            <%
                                ArrayList<Bien> ListBien = ((ArrayList<Bien>) session.getAttribute("ListSignalBien"));
                               pageContext.setAttribute("ListBien", ListBien);
                            %>
                            <c:forEach items="${ListBien }" var="bien">
                            <tr>
                            
                             		
                                    <td><span><c:out value="${bien.getIdbien() }"/></span></td>
                                     <td><span><c:out value="${bien.getIdproprietaire() }"/></span></td>
                                    
                                     <td><form method="get" action="http://9270c42e.ngrok.io/Douira/CtrlBien">
													
													<input type="hidden" name="idbien" value="<c:out value="${bien.getIdbien() }"/>">
													
                                                    <div class="btn-group" role="group">
                                                    
                                                    <button class="btn btn-outline-danger" type="submit" name="sub" value="delete">Supprimer</button>
                                                    
                                                    <button class="btn btn-outline-success" type="submit" name="sub" value="ignore">Anuler</button>
                                                    
                                                    </div>
									</form></td>
                                    
                              </tr>
                            </c:forEach>
                            </tbody>
                                    </table>
                                </div>
                            </div>

                        <div class="tab-pane" role="tabpanel" id="tab-3">
                       <div class="table-responsive">
                                    <table class="table">
                        
                            <%
                                ArrayList<Commentaire> ListCommentaire = ((ArrayList<Commentaire>) session.getAttribute("ListSignalCommentaire"));
                                pageContext.setAttribute("ListCommentaire", ListCommentaire);
                            %>
                            
                            <thead>
                                            <tr>
                                                <th>id commentaire </th>
                                                <th>id bien</th>
                                                <th>id client</th>
                                                <th>Action</th>
                                            </tr>
                            </thead>
                            
                            <tbody>
                            <c:forEach items="${ListCommentaire }" var="commentaire">
                            	<tr>
                            	    
									<td><span><c:out value="${commentaire.getIdcomment() }"/></span></td>
                                   <td> <span><c:out value="${commentaire.getIdbien() }"/></span></td>
                                    <td><span><c:out value="${ commentaire.getIdclient()}"/></span></td>
                                    
                                    <td><form method="get" action="http://9270c42e.ngrok.io/Douira/CtrlCommentaire">
													
													<input type="hidden" name="idcomment" value="<c:out value="${commentaire.getIdcomment() }"/>">
													
                                                    <div class="btn-group" role="group">
                                                    
                                                    <button class="btn btn-outline-danger" type="submit" name="sub" value="delete">Supprimer</button>
                                                    
                                                    <button class="btn btn-outline-success" type="submit" name="sub" value="ignore">Anuler</button>
                                                    
                                                    </div>
									</form></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                       </table>
                     </div>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="tab-4">
                                <div class="table-responsive">
                                    <table class="table">
                                     <%
                                ArrayList<Contrat> ListContrat = (ArrayList<Contrat>)(session.getAttribute("ListAprContrat"));
                                pageContext.setAttribute("ListContrat", ListContrat);
                               		%>
                             
                                        <thead>
                                            <tr>
                                                <th>id bien</th>
                                                <th>id contrat</th>
                                                <th>date contrat</th>
                                                <th>Contenu</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            
                                            <c:forEach items="${ListContrat}" var="contrat" >
                        					<tr>
                        						<td><span><c:out value="${contrat.getIdbien()}"/></span></td>
												<td><span><c:out value="${contrat.getIdcontrat()}"/></span></td>
												<td><span><c:out value="${contrat.getDatecontrat()}"/></span></td>
												<td><span><c:out value="${contrat.getContenu()}"/></span></td>
												<td>
													<form method="get" action="http://9270c42e.ngrok.io/Douira/CtrlContrat">
													
													<input type="hidden" name="idContrat" value="<c:out value="${contrat.getIdcontrat() }"/>">
													
                                                    <div class="btn-group" role="group">
                                                    
                                                    <button class="btn btn-outline-danger" type="submit" name="sub" value="delete">Anuler</button>
                                                    
                                                    <button class="btn btn-outline-success" type="submit" name="sub" value="ignore">Approuver</button>
                                                    
                                                    </div>
                                                    </form>
                                                
                                                </td>
                                            </tr>
								
                        					</c:forEach>
                        					
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
