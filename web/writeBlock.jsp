<%--
  Created by IntelliJ IDEA.
  User: demeen
  Date: 6/6/18
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write_block</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/pifu/pifu.css"/>
</head>
<body>
<%--header--%>
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
<div style="padding: 130px;">
    Title:
    <div id="divtitle" style="padding: 30px">
        <p></p>
    </div>
    Content:
    <div id="div1" style="padding: 30px">
        <p></p>
    </div>
    <% if (session.getAttribute("username") != null) {%>
    <button id="btn2" style="font-size: 20px">发送话题</button>
    <%} else {%>
    <p>请先登录 , 登陆后即可跟帖</p>
    <%}%>
</div>
<form action="writeBlock_logic.jsp" method="post" id="myform">
    <input type="hidden" id="block_title" name="block_title">
    <input type="hidden" id="sel" name="topictext"/>
</form>
</body>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()

</script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#div1');
    var editortitle = new E('#divtitle');
    editor.create();
    editortitle.create();
    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        document.getElementById("sel").value = editor.txt.text();
        document.getElementById("block_title").value = editortitle.txt.text();
        // alert(editor.txt.text());
        document.getElementById("myform").submit();
    }, false)
</script>
<script type="text/javascript" src="plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</html>
