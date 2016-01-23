<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Komponenta: ${component.name}</h1>

        <div class="col-left">
            <form:form action="./update_component" method="POST" modelAttribute="component">
                <fieldset>
                    <form:label path="id_component_group">id_component_group</form:label>
                    <form:select path="id_component_group" items="${componentGroups}" />
                </fieldset>
                <fieldset>
                    <form:label path="name">name</form:label>
                    <form:input path="name" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:input path="description" />
                </fieldset>
                <fieldset>
                    <form:label path="description_link">description_link</form:label>
                    <form:input path="description_link" />
                </fieldset>
                <fieldset>
                    <form:label path="complexity">complexity</form:label>
                    <form:input path="complexity" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
    </tiles:putAttribute>
</tiles:insertDefinition>