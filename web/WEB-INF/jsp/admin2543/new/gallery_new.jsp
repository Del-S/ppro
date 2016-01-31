<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">

        <h1>Nová galerie</h1>

        <div class="col-left">
            <form:form action="./add_gallery" method="POST" modelAttribute="gallery">
                <fieldset>
                    <form:label path="name">name</form:label>
                    <form:input path="name" />
                    <form:errors path="name" />
                </fieldset>  
                <fieldset>
                    <form:label path="images">images</form:label>
                    <form:checkboxes path="images" items="${images}" itemLabel="image_alt" itemValue="id_image"/>
                    <form:errors path="images" />
                </fieldset>
                <fieldset>
                    <form:label path="description">description</form:label>
                    <form:textarea path="description" />
                    <form:errors path="description" />
                </fieldset>
                <fieldset>
                    <form:label path="id_thumbnail">id_thumbnail</form:label>
                    <form:select path="id_thumbnail">
                        <form:option value="-1" label="--- Select ---"/>
                    </form:select>
                    <form:errors path="id_thumbnail" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>  
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>