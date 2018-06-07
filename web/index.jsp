<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/1/18
  Time: 1:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>博客网站</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/pifu/pifu.css"/>
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
                    <% if (session.getAttribute("username") != null) {%>
                    <li class="active"><a href="writeBlock.jsp" data-hover="发起话题">发起话题</a></li>
                    <%} else {%>
                    <li class="active">登陆后发起话题</li>
                    <%}%>
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

<section class="container pt-20">
    <!--left-->
    <div class="col-sm-9 col-md-9">
        <!--滚动图-->
        <div class="art_content">
            <ul class="index_arc">

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
                        String sqlline = String.format("SELECT name,own_name,create_time,default_text FROM block;");
                        ResultSet block_set = sql.executeQuery(sqlline); %>
                <% while (block_set.next()) {%>
                <li class="index_arc_item no_pic">
                    <h2 class="title"><a href="article_detail.jsp?blockname=<%=block_set.getString(1)%>
                        &own_name=<%=block_set.getString(2)%>&create_time=<%=block_set.getString(3)%>
                        &default_text=<%=block_set.getString(4)%>">
                        <%=block_set.getString(1)%>
                    </a></h2> <br>
                    <div class="date_hits">
                        <span>版主 : <%=block_set.getString(2)%></span>
                        <span>创建时间 : <%=block_set.getString(3)%></span>
                        <p><%=block_set.getString(4)%>
                        </p>
                    </div>
                </li>

                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.print(e);
                    }
                %>


            </ul>
            <div class="text-c mb-20" id="moreBlog">
                <p onclick="moreBlog();">下面没有啦 .....</p>
            </div>
        </div>
    </div>

    <!--right-->
    <div class="col-sm-3 col-md-3">
        <!--热门推荐-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>热门推荐</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                        } catch (Exception e) {
                            out.print(e);
                        }
                        uri = "jdbc:mysql://localhost:3306/sectorweb";
                        try {
                            con = DriverManager.getConnection(uri, "demeen", "maoniou");
                            sql = con.createStatement();
                            String sqlline = "SELECT name,topic_number FROM block ORDER BY topic_number DESC limit 5";
                            ResultSet block_set = sql.executeQuery(sqlline); %>
                    <% while (block_set.next()) {%>
                    <li>
                        <a href="#"><%=block_set.getString(1)%>
                        </a>
                        <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe622;</i><%=block_set.getString(2)%>
                        </p>
                    </li>
                    <%
                            }
                            con.close();
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                </ul>
            </div>
        </div>

        <!--点击排行-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>点击排行</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd clickTop">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                        } catch (Exception e) {
                            out.print(e);
                        }
                        uri = "jdbc:mysql://localhost:3306/sectorweb";
                        try {
                            con = DriverManager.getConnection(uri, "demeen", "maoniou");
                            sql = con.createStatement();
                            String sqlline = "SELECT name,click_number FROM block ORDER BY click_number DESC limit 5";
                            ResultSet block_set = sql.executeQuery(sqlline); %>
                    <% while (block_set.next()) {%>
                    <li>
                        <a href="#"><%=block_set.getString(1)%>
                        </a>
                        <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i> <%=block_set.getInt(2)%>° </p>
                    </li>
                    <%
                            }
                            con.close();
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                </ul>
            </div>
        </div>

        <!--标签-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>标签云</strong></a>
            </div>
            <div class="tab-category-item">
                <div class="tags"><a href="http://www.h-ui.net/">H-ui前端框架</a> <a
                        href="http://www.h-ui.net/websafecolors.shtml">Web安全色</a> <a
                        href="http://www.h-ui.net/Hui-4.4-Unslider.shtml">jQuery轮播插件</a> <a
                        href="http://idc.likejianzhan.com/vhost/korea_hosting.php">韩国云虚拟主机</a> <a
                        href="http://www.h-ui.net/bug.shtml">IEbug</a> <a
                        href="http://www.h-ui.net/site.shtml">IT网址导航</a> <a href="http://www.h-ui.net/icon/index.shtml">网站常用小图标</a>
                    <a href="http://www.h-ui.net/tools/jsformat.shtml">web工具箱</a> <a
                            href="http://www.h-ui.net/bg/index.shtml">网站常用背景素材</a> <a
                            href="http://www.h-ui.net/yuedu/chm.shtml">H-ui阅读</a> <a
                            href="http://www.h-ui.net/easydialog-v2.0/index.html">弹出层插件</a> <a
                            href="http://www.h-ui.net/SuperSlide2.1/demo.html">SuperSlide插件</a> <a
                            href="http://www.h-ui.net/TouchSlide1.1/demo.html">TouchSlide</a></div>
            </div>
        </div>

        <!--友情链接-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>隔壁邻居</strong></a>
            </div>
            <div class="tab-category-item">
                <span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">百度</a></span>
                <span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">淘宝</a></span>
                <span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">腾讯</a></span>
                <span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">慕课网</a></span>
                <span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">h-ui</a></span>
            </div>
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
<script type="text/javascript" src="plugin/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>

<script>
    $(function () {
//幻灯片
        jQuery(".slider_main .slider").slide({
            mainCell: ".bd ul",
            titCell: ".hd li",
            trigger: "mouseover",
            effect: "leftLoop",
            autoPlay: true,
            delayTime: 700,
            interTime: 2000,
            pnLoop: true,
            titOnClassName: "active"
        })
//tips
        jQuery(".slideTxtBox").slide({
            titCell: ".hd ul",
            mainCell: ".bd ul",
            autoPage: true,
            effect: "top",
            autoPlay: true
        });
//标签
        $(".tags a").each(function () {
            var x = 9;
            var y = 0;
            var rand = parseInt(Math.random() * (x - y + 1) + y);
            $(this).addClass("tags" + rand)
        });

        $("img.lazyload").lazyload({failurelimit: 3});
    });

</script>

</body>
</html>
