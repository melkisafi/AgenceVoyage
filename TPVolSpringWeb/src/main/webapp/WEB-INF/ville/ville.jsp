<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <title><spring:message code="ville.list.title" /></title>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Liste des villes</title>
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
      <li><a href="../client/list"><spring:message code="MenuNav.client" /></a></li>
      <li class="active"><a href="../ville/list"><b><spring:message code="MenuNav.ville" /></b></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
	<div class="container">
		<fieldset>
			<legend>Liste des villes</legend>
			<table class="table table-striped">
				<tr>
					<th>Id</th>
					<th>Version</th>
					<th>Nom</th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${villes}" var="ville">
					<tr>
						<td>${ville.id}</td>
						<td>${ville.version}</td>
						<td>${ville.nom}</td>
						
						<c:choose>
						    <c:when test="${ville.aeroports == null}">
						        <td>al</td>
						    </c:when>    
<%-- 						    <c:otherwise> --%>
<%-- 						    	<c:forEach items="${ville.aeroports}" var="aeroport"> --%>
<%-- 									<c:if test="${aeroport.ville.id == ville.id}"> --%>
<%-- 									    <td>${aeroport.aeroport.nom}</td> --%>
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
<%-- 						    </c:otherwise> --%>
						</c:choose>
						
						<td><a href="edit?id=${ville.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${ville.id}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="6"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>
<!--<c:forEach items="${ville.aeroports}" var="aeroport">
							<c:if test="${aeroport.ville.id == ville.id}">
							    <td>${aeroport.aeroport.nom}</td>
							</c:if>
						</c:forEach> -->