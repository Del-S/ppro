<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
   
        <h1>Detail obrázku: ${image.image_alt}</h1>
        <form:form action="./update_image" method="POST" modelAttribute="image">
                <fieldset>
                    <form:label path="image_alt">image_alt</form:label>
                    <form:input path="image_alt" />
                </fieldset>
                <fieldset>
                    <form:label path="image_src">image_src</form:label>
                    <form:input path="image_src" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:textarea path="description" />
                </fieldset>
                <fieldset>
                <input type="submit" value="Submit"/>
            </form:form>          
    
  </div>
        
    </tiles:putAttribute>
</tiles:insertDefinition>
