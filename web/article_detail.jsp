<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/6/18
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Article</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <link rel="stylesheet" type="text/css" href="plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/pifu/pifu.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/wangEditor/css/wangEditor.min.css">
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
<%
    String block_name = request.getParameter("blockname");
%>
<nav class="breadcrumb">
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="index.jsp" class="c-primary">首页</a> <span
            class="c-gray en">&gt;</span> <span class="c-gray">文章</span> <span class="c-gray en">&gt;</span> <span
            class="c-gray"><%=block_name%></span></div>
</nav>

<section class="container pt-20">
    <div class="row w_main_row">
        <div class="col-lg-9 col-md-9 w_main_left">
            <div class="panel panel-default  mb-20">
                <div class="panel-body pt-10 pb-10">
                    <h2 class="c_titile"><%=block_name%>
                    </h2>
                    <p class="box_c"><span
                            class="d_time">发布时间：<%=request.getParameter("create_time")%></span>
                        <span>版主：<%=request.getParameter("own_name")%></span>
                    </p>
                    <ul class="infos">
                        <p><%=request.getParameter("default_text")%>
                        </p>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default  mb-20">
                <div class="tab-category">
                    <a href=""><strong>Talk Show</strong></a>
                </div>
                <div class="panel-body">
                    <div class="panel-body" style="margin: 0 3%;">
                        <div class="mb-20">
                            <ul class="commentList">
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
                                        String click_number = String.format("select id from block where name='%s';", block_name);
                                        ResultSet clickset = sql.executeQuery(click_number);
                                        clickset.next();
                                        click_number = String.format("update block set click_number = (click_number+1) where id =%d;", clickset.getInt(1));
                                        sql.execute(click_number);
                                        String sqlline = String.format("SELECT own_name,create_time,content FROM topic where own_block_name='%s';", block_name);
                                        ResultSet topic_set = sql.executeQuery(sqlline); %>
                                <% while (topic_set.next()) {%>
                                <li class="item cl">
                                    <a href="#"><i class="avatar size-L radius">
                                        <img alt=""
                                             src="http://qzapp.qlogo.cn/qzapp/101388738/696C8A17B3383B88804BA92ECBAA5D81/100"></i></a>
                                    <div class="comment-main">
                                        <header class="comment-header">
                                            <div class="comment-meta"><a class="comment-author"
                                                                         href="#"><%=topic_set.getString(1)%>
                                            </a>
                                                <time class="f-r"><%=topic_set.getString(2)%>
                                                </time>
                                            </div>
                                        </header>
                                        <div class="comment-body">
                                            <p><%=topic_set.getString(3)%>
                                            </p>
                                        </div>
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

                        </div>
                        <div id="div1">
                            <p></p>
                        </div>
                        <% if (session.getAttribute("username") != null) {%>
                        <button id="btn2">发帖</button>
                        <%} else {%>
                        <p>请先登录 , 登陆后即可跟帖</p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3">
            <!--热门推荐-->
            <div class="bg-fff box-shadow radius mb-20">
                <div class="tab-category">
                    <a href=""><strong>热门推荐</strong></a>
                </div>
                <div class="tab-category-item">
                    <ul class="index_recd">


                        <li>
                            <a href="#">阻止a标签href默认跳转事件</a>
                            <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe622;</i> 276 </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <form action="save_text.jsp" method="post" id="myform">
        <input type="hidden" id="sel" name="topictext"/>
        <input type="hidden" name="own_block_name" value="<%=block_name%>">
    </form>
</section>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()

</script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#div1');
    editor.create();

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        document.getElementById("sel").value = editor.txt.text();
        // alert(editor.txt.text());
        document.getElementById("myform").submit();
    }, false)
</script>
<script> $(function () {
    $(window).on("scroll", backToTopFun);
    backToTopFun();
}); </script>
</body>
</html>

