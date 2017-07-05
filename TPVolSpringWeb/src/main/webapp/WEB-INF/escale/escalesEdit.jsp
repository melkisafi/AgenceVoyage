<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="escale.add.title" /></title>
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
      <li class="active"><a href="../escale/list"><b><spring:message code="MenuNav.escale" /></b></a></li>
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
			<legend><spring:message code="escale.add.fieldset" /></legend>
			<form:form modelAttribute="escale" action="save" method="post">
				<%-- 				<form:hidden path="id" /> --%>
				<%-- 				<form:hidden path="version" /> --%>
				<input type="hidden" name="mode" value="${mode}"/>
				<div class="form-group">
					<form:label path="vol"><spring:message code="escale.add.vol" /></form:label>
					<form:select path="vol.id" id="vol" cssClass="form-control" cssStyle="width: 400px" >
						<form:option value="${null}">Veuillez choisir un vol</form:option>
						<c:forEach items="${vols}" var="vol">
							<form:option value="${vol.id}">${vol.depart.nom} --> ${vol.arrivee.nom}</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="vol.id" cssStyle="color:red" />
				</div>

				<div class="form-group">
					<form:label path="aeroport.id"><spring:message code="escale.add.aeroport" /></form:label>
					<form:select path="aeroport.id" id="aeroport.id" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="${null}">Veuillez choisir l'aéroport d'escale</form:option>
						<c:forEach items="${aeroports}" var="aeroport">
							<form:option value="${aeroport.id}">${aeroport.nom}</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="aeroport.id" cssStyle="color:red" />
				</div>

				<div class="form-group">
					<form:label path="heureArrivee"><spring:message code="escale.add.heureArrivee" /></form:label>
					<form:input path="heureArrivee" type="Time" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="heureArrivee" cssStyle="color:red" />
				</div>
				<div class="form-group">
					<form:label path="heureDepart"><spring:message code="escale.add.heureDepart" /></form:label>
					<form:input path="heureDepart" type="Time" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="heureDepart" cssStyle="color:red" />
				</div>
				<button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-ok"></span></button>
				<button class="btn btn-warning"><span class="glyphicon glyphicon-arrow-left"></span></button>
			</form:form>
		</fieldset>
	</div>

</body>
</html>