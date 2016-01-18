<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Uživatelé</h1>

        <table class="list-table widefat">
        <thead>
            <tr>
                <th>Uživatelské jméno</th>
                <th>Jméno</th>
                <th>Email</th>
                <th>Práva</th>
            </tr>
        </thead>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td class="actions">
                        <a class="btn-edit-main" href="./detail_user?usr=${user.id_user}"><c:out value="${user.login}"/></a>
                        <div class="row-actions">
                            <span class="edit"><a class="btn-edit" href="./detail_user?usr=${user.id_user}">Upravit</a></span>
                            <span class="delete"><a class="btn-trash" href="./trash_user?usr=${user.id_user}">Odstranit</a></span> 
                        </div>   
                    </td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.rights}"/></td>
                </tr>
            </c:forEach>
        </table>       
 
    </tiles:putAttribute>
</tiles:insertDefinition>