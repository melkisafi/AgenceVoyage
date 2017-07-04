<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title><spring:message code="accueil.title" /></title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" ><spring:message code="accueil.title2" /></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="accueil"><b><spring:message code="MenuNav.accueil" /></b></a></li>
      <li><a href="aeroport/list"><spring:message code="MenuNav.aeroport" /></a></li>
      <li><a href="vol/list"><spring:message code="MenuNav.vol" /></a></li>
      <li><a href="reservation/list"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="passager/list"><spring:message code="MenuNav.passager" /></a></li>
      <li><a href="escale/list"><spring:message code="MenuNav.escale" /></a></li>
      <li><a href="client/list"><spring:message code="MenuNav.client" /></a></li>
      <li><a href="ville/list"><spring:message code="MenuNav.ville" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="https://www.wereldreisgids.nl/media/content/8q7bOs7D8s_vakantie-bahamas-1200x600.jpg" alt="Bahamas" style="width:100%;">
        <div class="carousel-caption">
          <h3>Bahamas</h3>
        </div>
      </div>

      <div class="item">
        <img src="https://scdn3.thomascook.com/crop?imageUrl=http://magnolia.production.thomascook.io/wcms/dam/tcuk/new/campaigns/signature/bali-sig-hero.jpg&maxWidth=1200&maxHeight=0" alt="Bali" style="width:100%;">
        <div class="carousel-caption">
          <h3>Bali</h3>
        </div>
      </div>
    
      <div class="item">
        <img src="http://www.passenger6a.fr/wp-content/uploads/2016/04/Foto-03.-Could-9-1200x600.jpg" alt="Perou" style="width:100%;">
        <div class="carousel-caption">
          <h3>Fidji</h3>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

</body>
</html>