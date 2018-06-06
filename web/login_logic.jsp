<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/5/18
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    Connection con;
    Statement sql;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception e) {
        out.print(e);
    }
    try {
        String username = new String((request.getParameter("username")).getBytes("ISO-8859-1"), "UTF-8");
        String password = new String((request.getParameter("password")).getBytes("ISO-8859-1"), "UTF-8");
        if (!username.equals("") && !password.equals("")) {
            String uri = "jdbc:mysql://localhost:3306/sectorweb";
            con = DriverManager.getConnection(uri, "demeen", "maoniou");
            sql = con.createStatement();
            String sqlline = String.format("SELECT username,password FROM user where username='%s' and password='%s';", username, password);
            ResultSet set = sql.executeQuery(sqlline);
            if (set.next()){
                
            }
            con.close();
%>
<%--success--%>


<% } else {%>
<%--fail--%>
<script type="text/javascript">
    window.location = "signin.jsp";
    alert("Login is fail , please check your password");
</script>

<% }
} catch (SQLException e1) {
    out.print(e1);
}%>