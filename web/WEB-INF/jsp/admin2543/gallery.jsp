<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Galerie</h1>
        
        <div class="fullwidth">
        <table class="list-table widefat">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Název</th>
                    <th>Popis</th>
                    <th>Thumbnail id</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${galleries}" var="gallery">
                    <tr>
                        <td><c:out value="${gallery.id_gallery}"/></td>
                        <td class="actions">
                            <a class="btn-edit-main" href="./detail_gallery?gallery=${gallery.id_gallery}"><c:out value="${gallery.name}"/></a>
                            <div class="row-actions">
                                <span class="edit"><a class="btn-edit" href="./detail_gallery?gallery=${gallery.id_gallery}">Upravit</a></span>
                                <span class="delete"><a class="btn-trash" href="./trash_gallery?gallery=${gallery.id_gallery}">Odstranit</a></span> 
                            </div>   
                        </td>
                        <td><c:out value="${gallery.description}"/></td>
                        <td><c:out value="${gallery.id_thumbnail_gallery}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>