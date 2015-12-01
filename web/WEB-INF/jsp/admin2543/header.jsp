<%@ page contentType="text/html; charset=UTF-8" %>
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
  <title>Admin</title>	
</head>

<body>

  <div id="content">
      
    <ul id="nav" class="navbar-nav nav-left">
        <li><a href="<spring:url value="/admin2543/" htmlEscape="true" />">Nástěnka</a></li>
        <li><a href="<spring:url value="/admin2543/viewTemplates" htmlEscape="true" />">Šablony</a></li>
    </ul>