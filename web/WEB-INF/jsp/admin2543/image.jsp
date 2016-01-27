<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
        
        <h1>Obrázky</h1>
        
        <div class="col-left">
            <form:form action="./add_image" method="POST" modelAttribute="image" enctype="multipart/form-data">
                <fieldset>
                <label path="soubor">soubor: </label>
                <input type="file" name="file" id="file" /> <br/>
                </fieldset>
                <fieldset>
                    <form:label path="image_alt">image_alt</form:label>
                    <form:input path="image_alt" />
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
                    <th>Adresa</th>
                    <th>Popis</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${images}" var="image">
                    <tr>
                        <td><c:out value="${image.id_image}"/></td>
                        <td class="actions">
                            <a class="btn-edit-main" href="./detail_image?image=${image.id_image}"><c:out value="${image.image_alt}"/></a>
                            <div class="row-actions">
                                <span class="edit"><a class="btn-edit" href="./detail_image?image=${image.id_image}">Upravit</a></span>
                                <span class="delete"><a class="btn-trash" href="./trash_image?image=${image.id_image}">Odstranit</a></span> 
                            </div>   
                        </td>
                        <td><c:out value="${image.image_src}"/></td>
                        <td><c:out value="${image.description}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>         
 
    </tiles:putAttribute>
</tiles:insertDefinition>
