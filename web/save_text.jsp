<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/6/18
  Time: 4:21 AM
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
        String topictext = new String((request.getParameter("topictext")).getBytes("ISO-8859-1"), "UTF-8");
        if (!topictext.equals("")) {
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date currentTime = new java.util.Date();//得到当前系统时间
            String str_date1 = formatter.format(currentTime); //将日期时间格式化
            String uri = "jdbc:mysql://localhost:3306/sectorweb";
            con = DriverManager.getConnection(uri, "demeen", "maoniou");
            sql = con.createStatement();
            String username = new String((request.getParameter("username")).getBytes("ISO-8859-1"), "UTF-8");
            String own_block_name = request.getParameter("own_block_name");
            String sqlline = String.format("INSERT INTO topic " +
                    "(own_block_name,content,own_name,create_time) VALUES " +
                    "('%s','%s','%s','%s');", own_block_name, topictext, username, str_date1);
            sql.execute(sqlline);
            con.close();
        }%>
<script type="text/javascript">
    window.location = "index.jsp";
</script>
<% } catch (Exception e) {
    out.print(e);

}%>
