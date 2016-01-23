<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="adminDefinition">
    <tiles:putAttribute name="body">
  
        <h1>Uživatel: ${userAccount.user.login}</h1>

        <div class="col-left">
            <form:form action="./update_user" method="POST" modelAttribute="userAccount">
                <fieldset>
                    <label for="username">Username</label>
                    <form:input path="user.name" id="username" />
                </fieldset>
                <fieldset>
                    <form:label path="user.surname">surname</form:label>
                    <form:input path="user.surname" />
                </fieldset>
                <fieldset>
                    <form:label path="user.email">email</form:label>
                    <form:input path="user.email" />
                </fieldset>
                <fieldset>
                    <form:label path="password">password</form:label>
                    <form:input path="password" />
                </fieldset>
                <fieldset>
                    <form:label path="password_check">password_check</form:label>
                    <form:input path="password_check" />
                </fieldset>
                <fieldset>
                    <form:label path="user.website">website</form:label>
                    <form:input path="user.website" />
                </fieldset>
                <fieldset>
                    <form:label path="user.phone">phone</form:label>
                    <form:input path="user.phone" />
                </fieldset>
                <fieldset>
                    <form:label path="user.rights">rights</form:label>
                    <form:input path="user.rights" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
    </tiles:putAttribute>
</tiles:insertDefinition>