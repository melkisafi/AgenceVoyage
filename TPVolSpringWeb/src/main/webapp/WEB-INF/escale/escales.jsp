<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title><spring:message code="escale.list.title" /></title>
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
			<legend>
				<spring:message code="escale.list.fieldset" />
			</legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="escale.list.voldepart" /></th>
					<th><spring:message code="escale.list.volarrivee" /></th>
					<th><spring:message code="escale.list.aeronom" /></th>
					<th><spring:message code="escale.list.escaleArrive" /></th>
					<th><spring:message code="escale.list.escaleDepart" /></th>
				</tr>

				<c:forEach items="${escales}" var="escale">
					<tr>
						<td>${escale.vol.depart.nom}</td>
						<td>${escale.vol.arrivee.nom}</td>
						<td rowspan="3" Style="vertical-align: middle; text-align: center;">${escale.aeroport.nom}</td>
						<td rowspan="3" Style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${escale.heureArrivee}" pattern="HH:mm"/></td>
						<td rowspan="3" Style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${escale.heureDepart}" pattern="HH:mm"/></td>
						<td rowspan="3" Style="vertical-align: middle; text-align: center;"><a href="edit?vol=${escale.vol.id}&aero=${escale.aeroport.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span></a></td>
						<td rowspan="3" Style="vertical-align: middle; text-align: center;"><a href="edit?vol=${escale.vol.id}&aero=${escale.aeroport.id}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
					<tr>
						<td><fmt:formatDate value="${escale.vol.dateDepart}" pattern="dd/MM/yyyy"/></td>
						<td><fmt:formatDate value="${escale.vol.dateArrivee}" pattern="dd/MM/yyyy"/></td>
						
					</tr>
					<tr>
						<td><fmt:formatDate value="${escale.vol.heureDepart}" pattern="HH:mm"/></td>
						<td><fmt:formatDate value="${escale.vol.heureArrivee}" pattern="HH:mm"/></td>
						
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