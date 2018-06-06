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
    try {

        String topictext = new String((request.getParameter("topictext")).getBytes("ISO-8859-1"), "UTF-8");
        String text2 = (String) session.getAttribute("topictext");

    } catch (Exception e) {
        out.print(e);
    }
%>
<script>

</script>
