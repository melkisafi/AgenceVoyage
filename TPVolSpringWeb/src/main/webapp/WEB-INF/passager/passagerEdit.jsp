<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="passager.list.title.edit"/></title>
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
      <li class="active"><a href="../passager/list"><b><spring:message code="MenuNav.passager" /></b></a></li>
      <li><a href="../escale/list"><spring:message code="MenuNav.escale" /></a></li>
      <li><a href="../client/list"><spring:message code="MenuNav.client" /></a></li>
      <li><a href="../ville/list"><spring:message code="MenuNav.ville" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
	<div class="container">
		<fieldset>
			<legend><spring:message code="passager.list.title.edit"/></legend>
			<form:form modelAttribute="passager" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="nom"><spring:message code="passager.list.nom"/></form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="nom" cssStyle="color:red"/>
				</div>
				<div class="form-group">
					<form:label path="prenom"><spring:message code="passager.list.prenom"/></form:label>
					<form:input path="prenom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="prenom" cssStyle="color:red"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.rue"><spring:message code="passager.list.adresse.rue"/></form:label>
					<form:input path="adresse.rue" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="adresse.rue" cssStyle="color:red"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.codePostal"><spring:message code="passager.list.adresse.codePostal"/></form:label>
					<form:input path="adresse.codePostal" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="adresse.codePostal" cssStyle="color:red"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.ville"><spring:message code="passager.list.adresse.ville"/></form:label>
					<form:input path="adresse.ville" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="adresse.ville" cssStyle="color:red"/>
				</div>
				<div class="form-group">
					<form:label path="adresse.pays"><spring:message code="passager.list.adresse.pays"/></form:label>
					<form:input path="adresse.pays" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path ="adresse.pays" cssStyle="color:red"/>
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