<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Komponenty</h1>

        <div class="col-left">
            Fomt Todoooooo
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
                        <td><c:out value="${component.component_group}"/></td>
                        <td class="actions">
                            <a class="btn-edit-main" href="./component_detail?cmp=${component.id_component}"><c:out value="${component.name}"/></a>
                            <div class="row-actions">
                                <span class="edit"><a class="btn-edit" href="./component_detail?cmp=${component.id_component}">Upravit</a></span>
                                <span class="delete"><a class="btn-trash" href="./component_trash?cmp=${component.id_component}">Odstranit</a></span> 
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