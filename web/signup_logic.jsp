<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/1/18
  Time: 3:40 AM
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
        String password1 = new String((request.getParameter("password1")).getBytes("ISO-8859-1"), "UTF-8");
        String password2 = new String((request.getParameter("password2")).getBytes("ISO-8859-1"), "UTF-8");
        if (password1.equals(password2) && !password1.equals("")) {
            String uri = "jdbc:mysql://localhost:3306/sectorweb";
            con = DriverManager.getConnection(uri, "demeen", "maoniou");
            sql = con.createStatement();
            String username = new String((request.getParameter("username")).getBytes("ISO-8859-1"), "UTF-8");
            String sqlline = String.format("INSERT INTO user (username,password) VALUES ('%s','%s');", username, password1);
            sql.execute(sqlline);
            con.close();%>
<script type="text/javascript">
    window.location = "login.jsp";
    alert("success");
</script>
<% } else {%>
<script type="text/javascript">
    window.location = "signup.jsp";
    alert("sign up is fail , please enter again");
</script>

<% }
} catch (SQLException e1) {
    out.print(e1);
}%>
