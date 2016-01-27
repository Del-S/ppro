<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Šablony</h1>

        <table class="list-table widefat">
        <thead>
            <tr>
                <th>ID</th>
                <th>Název</th>
                <th>Popis</th>
                <th>Uživatel</th>
            </tr>
        </thead>
            <c:forEach items="${templates}" var="template">
                <tr>
                    <td><c:out value="${template.id_template}"/></td>
                    <td class="actions">
                        <a class="btn-edit-main" href="./detail_template?tmp=${template.id_template}"><c:out value="${template.name}"/></a>
                        <div class="row-actions">
                            <span class="edit"><a class="btn-edit" href="./detail_template?tmp=${template.id_template}">Upravit</a></span>
                            <span class="delete"><a class="btn-trash" href="./trash_template?tmp=${template.id_template}">Odstranit</a></span> 
                        </div>   
                    </td>
                    <td><c:out value="${template.description}"/></td>
                    <td><c:out value="${template.id_user}"/></td>
                </tr>
            </c:forEach>
        </table>       
 
    </tiles:putAttribute>
</tiles:insertDefinition>