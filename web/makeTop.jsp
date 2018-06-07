<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/7/18
  Time: 1:43 AM
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
        String topic_id = request.getParameter("topic_id");
        if (!topic_id.equals("")) {
            String uri = "jdbc:mysql://localhost:3306/sectorweb";
            con = DriverManager.getConnection(uri, "demeen", "maoniou");
            sql = con.createStatement();
            String sqlline = String.format("UPDATE topic SET top=1 WHERE id=%s;", topic_id);
            sql.execute(sqlline);
            con.close();
        }%>
<script type="text/javascript">
    window.location = "index.jsp";
</script>
<% } catch (Exception e) {
    out.print(e);

}%>
