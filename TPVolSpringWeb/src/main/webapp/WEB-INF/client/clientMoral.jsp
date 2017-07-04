<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title><spring:message code="aeroport.edit.title" /></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" ><spring:message code="accueil.title2" /></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="../accueil"><spring:message code="MenuNav.accueil" /></a></li>
      <li><a href="../aeroport/list"><spring:message code="MenuNav.aeroport"/></a></li>
      <li><a href="../vol/list"><spring:message code="MenuNav.vol" /></a></li>
      <li><a href="../reservation/list"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="../passager/list"><spring:message code="MenuNav.passager" /></a></li>
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
			<legend>Edition Client Moral</legend>
			<form:form modelAttribute="client" action="saveMor" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<form:hidden path="adresse" />
				<div class="form-group">
					<form:label path="titre">Titre</form:label>
					<form:select path="titre" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="${null}">Choisir</form:option>
						<form:options items="${titreMoral}"></form:options>
					</form:select>
					<form:errors path="titre" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
		        <div class="form-group">
					<form:label path="siret">Siret</form:label>
					<form:input path="siret" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>		
				
				<div class="form-group">
					<form:label path="numeroTel">numeroTel</form:label>
					<form:input path="numeroTel" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
			
				<div class="form-group">
					<form:label path="numeroFax">numeroFax</form:label>
					<form:input path="numeroFax" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button class="btn btn-warning">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</button>
			</form:form>
		</fieldset>
	</div>
</body>
</html>