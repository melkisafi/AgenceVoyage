<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <title><spring:message code="client.list.title" /></title>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Liste des clients</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" ><spring:message code="accueil.title2" /></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="../accueil"><spring:message code="MenuNav.accueil" /></a></li>
      <li><a href="../aeroport/list"><spring:message code="MenuNav.aeroport" /></a></li>
      <li><a href="../vol/list"><spring:message code="MenuNav.vol" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.passager" /></a></li>
      <li><a href="../escale/list"><spring:message code="MenuNav.escale" /></a></li>
      <li class="active"><a href="../client/list"><b><spring:message code="MenuNav.client" /></b></a></li>
      <li><a href="../ville/list"><spring:message code="MenuNav.ville" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
	<div class="container">
		<fieldset>
			<legend>Liste des clients</legend>
			<table class="table table-striped">
				<tr>
					<th>Id</th>
					<th>Version</th>
					<th>Titre</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Siret</th>
					<th>Email</th>
					<th>Adresse</th>
					<th>Code Postal</th>
					<th>Pays</th>
					<th>Ville</th>
					<th>Numero Fax</th>
					<th>Numero Tel</th>
					<th>Login(Id)</th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${clients}" var="client">
					<tr>
						<td>${client.id}</td>
						<td>${client.version}</td>
							<c:catch var="exception">
						<c:catch var="exception0">
						<td>${client.titre}</td>
						</c:catch>
						</c:catch>
						
						<td>${client.nom}</td>
						<c:catch var="exception1">
						<td>${client.prenom}</td>
						</c:catch>
						
						<c:catch var="exception2">
							<td>${client.siret}</td>
						</c:catch>
	
						<td>${client.email}</td>
						<td>${client.adresse.rue}</td>
						<td>${client.adresse.codePostal}</td>
						<td>${client.adresse.pays}</td>
						<td>${client.adresse.ville}</td>
						<td>${client.numeroFax}</td>
						<td>${client.numeroTel}</td>
						<td>${client.login.id}</td>
						<td><a href="edit?id=${client.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${client.id}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="5"><a href="addMoral" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus">Client Moral</span></a></td>
					<td colspan="5"><a href="addPhysique" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus">Client Physique</span></a></td>
					<td colspan="5"><a href="addEI" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span>Client EI</a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>