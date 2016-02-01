<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="<spring:url value="/assets/css/admin.css" htmlEscape="true" />" type="text/css"/>
  <script type="text/javascript" src="<spring:url value="/assets/js/jquery-1.12.0.min.js" htmlEscape="true" />"></script>
  <script type="text/javascript" src="<spring:url value="/assets/js/admin.js" htmlEscape="true" />"></script>
  <title>Admin</title>	
</head>

<body>

  <div id="wrap">
    <div class="admin-back"></div>
    <nav class="nav admin">
        <ul id="nav" class="navbar-nav nav-left">
            <li><a href="<spring:url value="/admin2543/" htmlEscape="true" />">Nástěnka</a></li>
            <li><a href="<spring:url value="/admin2543/view_templates" htmlEscape="true" />">Šablony</a>
                <ul class="submenu">
                    <li><a href="<spring:url value="/admin2543/view_templates" htmlEscape="true" />">Zobrazit šablony</a></li>
                    <li><a href="<spring:url value="/admin2543/new_template" htmlEscape="true" />">Vytvořit šablonu</a></li>
                </ul>
            </li>
            <li><a href="<spring:url value="/admin2543/view_components" htmlEscape="true" />">Komponenty</a>
                <ul class="submenu">
                    <li><a href="<spring:url value="/admin2543/view_component_groups" htmlEscape="true" />">Skupiny komponent</a></li>
                </ul>
            </li>
            <li><a href="<spring:url value="/admin2543/view_users" htmlEscape="true" />">Uživatelé</a>
                <ul class="submenu">
                    <li><a href="<spring:url value="/admin2543/view_users" htmlEscape="true" />">Zobrazit uživatele</a></li>
                    <li><a href="<spring:url value="/admin2543/new_user" htmlEscape="true" />">Přidate uživatele</a></li>
                </ul>
            </li>
            <li><a href="<spring:url value="/admin2543/view_images" htmlEscape="true"/>">Obrázky</a>
                <ul class="submenu">
                    <li><a href="<spring:url value="/admin2543/view_images" htmlEscape="true" />">Nahrát obrázek</a></li>
                </ul>
            </li>
            <li><a href="<spring:url value="/admin2543/view_galleries" htmlEscape="true"/>">Galerie</a>
                <ul class="submenu">
                    <li><a href="<spring:url value="/admin2543/new_gallery" htmlEscape="true" />">Přidat galerii</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    
    <div class="container clearfix admin">