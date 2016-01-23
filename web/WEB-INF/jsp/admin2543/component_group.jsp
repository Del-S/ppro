<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Skupiny komponent</h1>

        <div class="col-left">
            <form:form action="./add_component_group" method="POST" modelAttribute="componentGroup">
                <fieldset>
                    <form:label path="name">name</form:label>
                    <form:input path="name" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:textarea path="description" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
        <div class="col-right">
        <table class="list-table widefat">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Název</th>
                    <th>Popis</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${componentsGroup}" var="componentGroup">
                    <tr>
                        <td><c:out value="${componentGroup.id_component_group}"/></td>
                        <td class="actions">
                            <a class="btn-edit-main" href="./detail_component_group?cg=${componentGroup.id_component_group}"><c:out value="${componentGroup.name}"/></a>
                            <div class="row-actions">
                                <span class="edit"><a class="btn-edit" href="./detail_component_group?cg=${componentGroup.id_component_group}">Upravit</a></span>
                                <span class="delete"><a class="btn-trash" href="./trash_component_group?cg=${componentGroup.id_component_group}">Odstranit</a></span> 
                            </div>   
                        </td>
                        <td><c:out value="${componentGroup.description}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>     
 
    </tiles:putAttribute>
</tiles:insertDefinition>