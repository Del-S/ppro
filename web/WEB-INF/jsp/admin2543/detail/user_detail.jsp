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
                    <form:label path="user.name">name</form:label>
                    <form:input path="user.name" id="username" />
                    <form:errors path="user.name" />
                </fieldset>
                <fieldset>
                    <form:label path="user.surname">surname</form:label>
                    <form:input path="user.surname" />
                    <form:errors path="user.surname" />
                </fieldset>
                <fieldset>
                    <form:label path="user.email">email</form:label>
                    <form:input path="user.email" />
                    <form:errors path="user.email" />
                </fieldset>
                <fieldset>
                    <form:label path="password">password</form:label>
                    <form:input path="password" />
                    <form:errors path="password" />
                </fieldset>
                <fieldset>
                    <form:label path="password_check">password_check</form:label>
                    <form:input path="password_check" />
                    <form:errors path="password_check" />
                </fieldset>
                <fieldset>
                    <form:label path="user.website">website</form:label>
                    <form:input path="user.website" />
                    <form:errors path="user.website" />
                </fieldset>
                <fieldset>
                    <form:label path="user.phone">phone</form:label>
                    <form:input path="user.phone" />
                    <form:errors path="user.phone" />
                </fieldset>
                <fieldset>
                    <form:label path="user.rights">rights</form:label>
                    <form:input path="user.rights" />
                    <form:errors path="user.rights" />
                </fieldset>
                
                <fieldset>
                    <form:label path="address.address">Address</form:label>
                    <form:input path="address.address" />
                    <form:errors path="address.address" />
                </fieldset>
                <fieldset>
                    <form:label path="address.city">city</form:label>
                    <form:input path="address.city" />
                    <form:errors path="address.city" />
                </fieldset>
                <fieldset>
                    <form:label path="address.postal_code">postal_code</form:label>
                    <form:input path="address.postal_code" />
                    <form:errors path="address.postal_code" />
                </fieldset>
                <input type="submit" value="Submit"/>
            </form:form>      
        </div>
        
    </tiles:putAttribute>
</tiles:insertDefinition>