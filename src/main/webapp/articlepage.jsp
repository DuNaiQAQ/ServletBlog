<%@ page import="cn.itcast.blog.domain.Article" %>
<%@ page import="cn.itcast.blog.service.ArticleService" %>
<%@ page import="cn.itcast.blog.service.impl.ArticleServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Article article=new Article();
    int id=Integer.valueOf(request.getParameter("articleid"));
    ArticleService service=new ArticleServiceImpl();
    article=service.findarticleById(id);
    pageContext.setAttribute("article",article);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章页面</title>
    <!--引入bootstrap的css文件-->
    <link rel="stylesheet" href="lib/editormd/css/editormd.preview.css" />
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mainpagestyle.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="./manage/plugins/fontawesome-free/css/all.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="./manage/dist/css/adminlte.min.css">
    <!-- AdminLTE App -->
    <script src="./manage/dist/js/adminlte.min.js"></script>
</head>


<body class="background">
<!--加载jquery-->
<script type="text/javascript" src="lib/jquery-3.6.0.js"></script>
<!--加载bootstrap依赖的JS文件-->
<script type="text/javascript" src="lib/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<!--使用几个div来完成对于博客首页的编写-->
<!--页面顶部-->

<header class="head">
    <!--导航栏以及登录注册按钮-->
    <div class="toplink">
        <nav class="navbar navbar-expand-sm bg-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="navbar-brand text-dark" id="Mybrand" herf="#">DuNai的个人博客</a>
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.jsp">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.jsp">个人简介</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.jsp">学习天地</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.jsp">好玩的事</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.jsp">懒得分类</a>
                </li>
                <li class="nav-item" id="blank"></li>
                <li class="btn-group btn-group-sm" id="logandreg">
                    <button type="button" class="btn btn-primary" id="login">登录</button>
                    <button type="button" class="btn btn-primary" id="regidit">注册</button>
                </li>

                <li class="btn-group btn-group-sm" id="selfinfo">
                    <button type="button" class="btn btn-primary" id="myprofile"><c:if test="${sessionScope.user==null}">
                        现在使用的是游客模式！
                    </c:if><c:if test="${sessionScope.user!=null}">
                        ${sessionScope.user.getUsername()}
                    </c:if></button>
                    <button type="button" class="btn btn-primary" id="logout">退出</button>
                </li>
            </ul>
        </nav>
    </div>

</header>
<!--文章部分-->
<article>
    <div class="container">
        <div class="row">
            <div class="col-sm-8" id="articleview">
                <div class="card">
                <h1>${article.getTitle()}</h1>
                <p>文章作者:${article.getEmail()} 点赞次数:${article.getCount_good()} 收藏次数:${article.getCount_shou()}</p>
                <div class="border border-top-0"></div>
                <div id="texta">
                <textarea id="texts" style="display:none;">${article.getText()}</textarea>
                </div>
                </div>
            </div>
            <div class="col-sm-4" id="othersinfoview" style="height: 1000px;border: dot-dot-dash">
                <div class="card">
                <h3>个人信息</h3>
                <div class="fakeimg">这里随便选张图片</div>
                <p>个人简介</p>
                <h3>友情链接</h3>
                <p>这里的链接都是一些实用网站（包括表博客）</p>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="http://blog.dunaixdd.cn">个人博客</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">链接</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">链接</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">链接</a>
                    </li>
                </ul>
                </div>
            </div>
            <div id="comment_area">
                <div class="card" style="width: 1125px;margin: auto">
                    <div class="post">
                        <div class="user-block">
                            <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="用户头像">
                            <span class="username">
                          <a href="#">这里是用户名</a><p id="commentid">评论id:</p>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                            <span class="description">这里是评论时间</span>
                        </div>
                        <!-- /.user-block -->
                        <p>
                            这里是评论
                        </p>

                        <p>
                            <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> 喜欢</a>
                        </p>

                        <form class="form-horizontal">
                            <div class="input-group input-group-sm mb-0">
                                <input class="form-control form-control-sm" placeholder="内容">
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-danger sendreply">发送</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="post">
                        有什么想说的？
                        <form class="form-horizontal">
                            <div class="input-group input-group-sm mb-0">
                                <textarea class="form-control form-control-sm" style="height: 100px" placeholder="允许使用markdown表达式"></textarea>
                            </div>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-danger" id="sendcommit">发送</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</article>
<!--页面底部内容-->
<div class="jumbotron text-center" style="margin-bottom: 0">
    <p>页面底部</p>
</div>
<script src="lib/editormd/lib/marked.min.js"></script>
<script src="lib/editormd/lib/prettify.min.js"></script>
<script src="lib/editormd/lib/raphael.min.js"></script>
<script src="lib/editormd/lib/underscore.min.js"></script>
<script src="lib/editormd/lib/sequence-diagram.min.js"></script>
<script src="lib/editormd/lib/flowchart.min.js"></script>
<script src="lib/editormd/lib/jquery.flowchart.min.js"></script>
<script src="lib/editormd/editormd.min.js"></script>
<script>
    $("#sendcommit").click(function () {
        <%

        %>
    })
    
    $("#login").click(function () {
        window.location.href="loginpage.html"
    })

    $("#regidit").click(function () {
        window.location.href="regpage.html"
    })

    var Viewer = editormd.markdownToHTML("texta", {
        htmlDecode      : "style,script,iframe",
        emoji           : true,
        taskList        : true,
        tex             : true,  // 默认不解析
        flowChart       : true,  // 默认不解析
        sequenceDiagram : true  // 默认不解析
    });
</script>
</body>
</html>