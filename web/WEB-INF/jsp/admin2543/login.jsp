<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Login</h1>

        TODOOO
        <form:form id="loginForm" name="loginForm" method="post" >
            <form:label path="username">Login: </form:label>
            <form:input id="username" name="username" path="username" /><br>
            <form:label path="username">Password: </form:label>
            <form:password id="password" name="password" path="password" /><br>
            <input type="submit" value="Submit" />
        </form:form>  
 
    </tiles:putAttribute>
</tiles:insertDefinition>