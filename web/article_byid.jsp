<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/7/18
  Time: 2:34 AM
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
    String uri = "jdbc:mysql://localhost:3306/sectorweb";
    try {
        con = DriverManager.getConnection(uri, "demeen", "maoniou");
        sql = con.createStatement();
        String block_id = request.getParameter("id");
        String sqlline = String.format("SELECT name,own_name,create_time,default_text FROM block where id=%s;", block_id);
        ResultSet block_set = sql.executeQuery(sqlline);
        block_set.next();%>
%>
<script type="text/javascript">
    window.location = "article_detail.jsp?blockname=<%=block_set.getString(1)%>&own_name=<%=block_set.getString(2)%>&create_time=<%=block_set.getString(3)%>&default_text=<%=block_set.getString(4)%>";
</script>

</script>

<%

        con.close();
    } catch (Exception e) {
        out.print(e);
    }
%>