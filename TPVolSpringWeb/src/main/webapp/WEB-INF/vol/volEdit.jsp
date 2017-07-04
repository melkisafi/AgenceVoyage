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
	<title><spring:message code="vol.edit.title" /></title>
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
      <li><a href="../aeroport/list"><spring:message code="MenuNav.aeroport" /></a></li>
      <li class="active"><a href="../vol/list"><b><spring:message code="MenuNav.vol" /></b></a></li>
      <li><a href="../reservation/list"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="../passager/list"><spring:message code="MenuNav.passager" /></a></li>
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
			<legend><spring:message code="vol.edit.fieldset" /></legend>
			<form:form modelAttribute="vol" action="save" method="post">
				<input type="hidden" name="mode" value="${mode}"/>
				<form:hidden path="id" />
				<form:hidden path="version" />
				<%-- <div class="form-group">
					<form:label path="nom"><spring:message code="vol.edit.nom" /></form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="nom" cssStyle="color:red"/>
				</div> --%>
				
				<%-- <div class="form-group">
					<form:label path="depart"><spring:message code="vol.edit.AeroportDep" /></form:label>
					<form:input path="depart" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="depart" cssStyle="color:red"/>
				</div> --%>
				
				<div class="form-group">
					<form:label path="depart"><spring:message code="vol.edit.AeroportDep" /></form:label>
					<form:select path="depart" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="${null}"><spring:message code="vol.edit.choixAeroportD" /></form:option>
						<c:forEach items="${departs}" var="depart">
							<form:option value="${depart.nom}">${depart.nom}</form:option>
						</c:forEach>
						
					</form:select>
					<form:errors path="depart" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="dateDepart"><spring:message code="vol.edit.dateDep" /></form:label>
					<form:input path="dateDepart" type="date" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="dateDepart" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="heureDepart"><spring:message code="vol.edit.heureDep" /></form:label>
					<form:input path="heureDepart" type="time" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="heureDepart" cssStyle="color:red"/>
				</div>
				
				<%-- <div class="form-group">
					<form:label path="arrivee"><spring:message code="vol.edit.AeroportArr" /></form:label>
					<form:input path="arrivee" type="date" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="arrivee" cssStyle="color:red"/>
				</div> --%>
				
				<div class="form-group">
					<form:label path="arrivee"><spring:message code="vol.edit.AeroportArr" /></form:label>
					<form:select path="arrivee" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="${null}"><spring:message code="vol.edit.choixAeroportA" /></form:option>
						<c:forEach items="${arrivees}" var="arrivee">
							<form:option value="${arrivee.nom}">${arrivee.nom}</form:option>
						</c:forEach>
						
					</form:select>
					<form:errors path="depart" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="dateArrivee"><spring:message code="vol.edit.dateArr" /></form:label>
					<form:input path="dateArrivee" type="date" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="dateArrivee" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="heureArrivee"><spring:message code="vol.edit.heureArr" /></form:label>
					<form:input path="heureArrivee" type="time" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="heureArrivee" cssStyle="color:red"/>
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