<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
        
        <h1>Skupina komponent: ${componentGroup.name}</h1>

        <div class="col-left">
            <form:form action="./update_component_group" method="POST" modelAttribute="componentGroup">
                <fieldset>
                    <form:label path="name">name</form:label>
                    <form:input path="name" />
                    <form:errors path="name" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:textarea path="description" />
                    <form:errors path="description" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
    </tiles:putAttribute>
</tiles:insertDefinition>