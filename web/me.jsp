<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/6/18
  Time: 3:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Me</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/pifu/pifu.css"/>
    <![endif]-->
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }

    function showSide() {
        $('.navbar-nav').toggle();
    }</script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);"
               onclick="showSide();">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <li class="active"><a href="index.jsp" data-hover="首页">首页</a></li>
                </ul>
            </nav>
            <nav class="navbar-nav navbar-userbar hidden-xs hidden-sm " style="top: 0;">
                <ul class="cl">
                    <li class="userInfo dropDown dropDown_hover">
                        <% String username = (String) session.getAttribute("username");
                            if (username != null) {%>
                        <a href="me.jsp"><%=username%>
                        </a>
                        <%} else {%>
                        <a href="login.jsp"> 登陆 Login in</a>
                        <%}%>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="index.jsp" class="c-primary">首页</a> <span
            class="c-gray en">&gt;</span> <span class="c-gray">关于</span></div>
</nav>

<section class="container">
    <div class="container-fluid">
        <div class="about">
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
                    String sqlline = String.format("SELECT own_name,create_time,content FROM topic where own_block_name='%s';", block_name);
                    ResultSet topic_set = sql.executeQuery(sqlline);
            %>
            <% while (topic_set.next()) {%>

            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }
            %>
            <h2>About me</h2>
            <ul>
                <p>name：<%=username%>
                </p>
                <p>服务器：腾讯云服务器 ，于2017年02月23日完成备案</p>
                <p>备案号：皖ICP备17002922号</p>
                <p>本站定位为IT技术博客站，博客内容主要涉及编程语言、前端开发、服务端开发及一些热门技术等方面，同时分享实用的学习和开发资料。</p>
            </ul>
            <h2>My topic</h2>
            <ul>
                <p></p>
            </ul>
        </div>

    </div>
</section>
<script type="text/javascript" src="plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script> $(function () {
    $(window).on("scroll", backToTopFun);
    backToTopFun();
}); </script>
</body>
</html>

