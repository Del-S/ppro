<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<body>
    <div class="login">
      <h1>Admin login</h1>
  <form:form name="user" method="post">
      <table>
      <tr><th>login:</th><th><input type="text" name="name"> <br/></th></tr>
      <tr><th>password :</th><th><input type="password" name="pwd"/><br/></th></tr>
      <div style="color:red">${error}</div>
      <tr><th></th><th><input type="submit" value="Login"></th></tr>
      </table>
  </form:form>
    </div>
</body>
</html>
 

