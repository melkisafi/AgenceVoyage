<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="reservation.list.title"/></title>
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
      <li class="active"><a href="../reservation/list"><b><spring:message code="MenuNav.reservation" /></b></a></li>
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
			<legend><spring:message code="reservation.list.fieldset"/></legend>
			<table class="table table-striped">
				<tr>
					<th><spring:message code="reservation.list.id"/></th>
					<th><spring:message code="reservation.list.version"/></th>
					<th><spring:message code="reservation.list.dtReservation"/></th>
					<th><spring:message code="reservation.list.numReservation"/></th>
					<th><spring:message code="reservation.list.passager.nom"/></th>
					<th><spring:message code="reservation.list.client.nom"/></th>
					<th><spring:message code="reservation.list.vol.id"/></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach items="${reservations}" var="reservation">
					<tr>
						<td>${reservation.id}</td>
						<td>${reservation.version}</td>
						<td><fmt:formatDate value="${reservation.dateResa}" pattern="dd/MM/yyyy"/></td>
						<td>${reservation.numero}</td>
						<td>${reservation.passager.nom}</td>
						<td>${resrevation.client.nom}</td>
						<td>${reservation.vol.id}</td>

		
						<td><a href="edit?id=${reservation.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="delete?id=${reservation.id}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="9"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>