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
      <li><a href="accueil"><spring:message code="MenuNav.accueil" /></a></li>
      <li><a href="../aeroport/list"><spring:message code="MenuNav.aeroport" /></a></li>
      <li><a href="../vol/list"><spring:message code="MenuNav.vol" /></a></li>
      <li><a href="../reservation/list"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="../passager/list"><spring:message code="MenuNav.passager" /></a></li>
      <li><a href="../escale/list"><spring:message code="MenuNav.escale" /></a></li>
      <li><a href="../client/list"><spring:message code="MenuNav.client" /></a></li>
      <li><a href="../ville/list"><spring:message code="MenuNav.ville" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li class="active"><a href="../login/list"><b><spring:message code="MenuNav.login" /></b></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>

<div class="container">
		<fieldset>
			<legend><spring:message code="login.edit.fieldset" /></legend>
			<form:form modelAttribute="login" action="save" method="post">
				<input type="hidden" name="mode" value="${mode}"/>
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="login"><spring:message code="login.edit.login" /></form:label>
					<form:input path="login" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="login" cssStyle="color:red"/>
				</div>
				
				<div class="form-group">
					<form:label path="motDePasse"><spring:message code="login.edit.motDePasse" /></form:label>
					<form:input path="motDePasse" type="text" cssClass="form-control" cssStyle="width: 400px"/>
					<form:errors path="motDePasse" cssStyle="color:red"/>
				</div>
			
				<div class="form-group">
					<form:label path="admin"><spring:message code="login.edit.choixadmin" /></form:label>
					<p>oui</p>
					<form:radiobutton path="admin" value="true"/>
					<p>non</p>
					<form:radiobutton path="admin" value="false"/>
					
					<%-- <form:select path="admins" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="${null}"><spring:message code="login.edit.choixadmin" /></form:option>
						<c:forEach items="${admins}" var="admin">
							<form:option value="${login.admin}">${login.admin}</form:option>
						</c:forEach>
						
					</form:select> --%>
					<form:errors path="admin" cssStyle="color:red"/>
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