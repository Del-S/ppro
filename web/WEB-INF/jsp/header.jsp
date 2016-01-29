<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="description" content="${description}">
  <title>${title}</title>
  
  <meta property="og:locale" content="cs_CZ">
  <meta property="og:type" content="article">
  <meta property="og:title" content="${title}">
  <meta property="og:description" content="${description}">
  <meta property="og:url" content="${url}">
  <meta property="og:site_name" content="Pick Template">
  
  <meta name="twitter:card" content="summary">
  <meta name="twitter:description" content="${description}">
  <meta name="twitter:title" content="${title}">
  <meta name="twitter:domain" content="Pick Template">
  
  <link rel="stylesheet" href="<spring:url value="/assets/css/main.css" htmlEscape="true" />" type="text/css"/>	
  <script type="text/javascript" src="<spring:url value="/assets/js/jquery-1.12.0.min.js" htmlEscape="true" />"></script>
  <script type="text/javascript" src="<spring:url value="/assets/js/main.js" htmlEscape="true" />"></script>
</head>

<body>

  <div id="wrap">
      
    <header id="main-header">
          <div class="container clearfix menu_container">
            <div class="logo_container"> 
                <span class="logo_helper"></span> 
                <a href="<spring:url value="/" htmlEscape="true" />"> 
                    <img src="<spring:url value="/assets/img/logo.png" htmlEscape="true" />" alt="Pick Template" id="logo"> 
                </a>
            </div>
            <div id="top-navigation"> 
                <nav id="top-menu-nav" class="nav admin">
                    <ul id="top-menu" class="nav">
                        <li class="menu-item"><a href="<spring:url value="/" htmlEscape="true" />">Domů</a></li>
                        <li class="menu-item"><a href="<spring:url value="/pick_template_eshop" htmlEscape="true" />">Šablony - Eshop</a>
                            <ul class="sub-menu">
                                <li class="menu-item"><a href="<spring:url value="/" htmlEscape="true" />">Submenu</a></li>
                                <li class="menu-item"><a href="<spring:url value="/" htmlEscape="true" />">Submenu 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="<spring:url value="/info" htmlEscape="true" />">Informace</a></li>
                        <li class="menu-item"><a href="<spring:url value="/kontakt" htmlEscape="true" />">Kontakt</a></li>
                    </ul>
                </nav>                   
            </div>
        </div> <!-- .container -->
    </header>
      
    