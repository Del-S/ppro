<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Nová šablona</h1>

        <form:form action="./add_template" method="POST" modelAttribute="template">
            <fieldset>
                <form:label path="name">Name</form:label>
                <form:input path="name" />
                <form:errors path="name" />
            </fieldset>
            <fieldset>
                <form:label path="description">Description</form:label>
                <form:textarea path="description" />
                <form:errors path="description" />
            </fieldset>
            <fieldset>
                <form:label path="price_implement">price_implement</form:label>
                <form:input path="price_implement" />
                <form:errors path="price_implement" />
            </fieldset>
            <fieldset>
                <form:label path="price_editing">price_editing</form:label>
                <form:input path="price_editing" />
                <form:errors path="price_editing" />
            </fieldset>
            
            <c:forEach var="componentGroup" items="${componentGroups}">
                <fieldset>
                    <legend>${componentGroup.name}</legend>
                    <form:checkboxes path="components" items="${componentGroup.components}" itemLabel="name" itemValue="id_component"></form:checkboxes>
                </fieldset>   
            </c:forEach>
            
            <fieldset>
                <form:label path="gallery">id_gallery</form:label>
                <form:select path="gallery">
                    <form:option value="null" label="--- Select ---"/>
                    <form:options items="${galleries}" itemLabel="name" itemValue="id_gallery" />
                </form:select>
                <form:errors path="gallery" />
            </fieldset>
            <input type="submit" value="Submit"/>
        </form:form>      
        
    </tiles:putAttribute>
</tiles:insertDefinition>