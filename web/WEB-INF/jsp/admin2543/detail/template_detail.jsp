<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Šablona: ${template.name}</h1>

        <form:form action="./update_template" method="POST" modelAttribute="template">
            <fieldset>
                <form:label path="name">Name</form:label>
                <form:input path="name" />
            </fieldset>
            <fieldset>
                <form:label path="description">Description</form:label>
                <form:textarea path="description" />
            </fieldset>
            <fieldset>
                <form:label path="components">components (add checkboxes)</form:label>
            </fieldset>
            <fieldset>
                <form:label path="price_implement">price_implement</form:label>
                <form:input path="price_implement" />
            </fieldset>
            <fieldset>
                <form:label path="price_editing">price_editing</form:label>
                <form:input path="price_editing" />
            </fieldset>
            <input type="submit" value="Submit"/>
        </form:form>      
 
    </tiles:putAttribute>
</tiles:insertDefinition>