<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="title">sdf</tiles:putAttribute>
    <tiles:putAttribute name="body">
  
        <div id="main-area" class="container">
            <h1>Home page !</h1>
 
            <p>The time on the server is ${serverTime}.<a>Teeeest</a></p>
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>