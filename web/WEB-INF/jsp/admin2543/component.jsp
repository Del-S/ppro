<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Komponenty</h1>

        <div class="col-left">
            <form:form action="./add_component" method="POST" modelAttribute="component">
                <fieldset>
                    <form:label path="form_id_component_group">componentGroup</form:label>
                    <form:select path="form_id_component_group" items="${componentGroups}" />
                    <form:errors path="form_id_component_group" />
                </fieldset>
                <fieldset>
                    <form:label path="name">name</form:label>
                    <form:input path="name" />
                    <form:errors path="name" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:input path="description" />
                    <form:errors path="description" />
                </fieldset>
                <fieldset>
                    <form:label path="description_link">description_link</form:label>
                    <form:input path="description_link" />
                    <form:errors path="description_link" />
                </fieldset>
                <fieldset>
                    <form:label path="complexity">complexity</form:label>
                    <form:input path="complexity" />
                    <form:errors path="complexity" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
        <div class="col-right">
        <table class="list-table widefat">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Skupina</th>
                    <th>Název</th>
                    <th>Popis</th>
                    <th>Složitost</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${components}" var="component">
                    <tr>
                        <td><c:out value="${component.id_component}"/></td>
                        <td><c:out value="${component.componentGroup.name}"/></td>
                        <td class="actions">
                            <a class="btn-edit-main" href="./detail_component?cmp=${component.id_component}"><c:out value="${component.name}"/></a>
                            <div class="row-actions">
                                <span class="edit"><a class="btn-edit" href="./detail_component?cmp=${component.id_component}">Upravit</a></span>
                                <span class="delete"><a class="btn-trash" href="./trash_component?cmp=${component.id_component}">Odstranit</a></span> 
                            </div>   
                        </td>
                        <td><c:out value="${component.description}"/></td>
                        <td><c:out value="${component.complexity}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>     
 
    </tiles:putAttribute>
</tiles:insertDefinition>