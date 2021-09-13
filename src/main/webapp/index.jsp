<%--
  Created by IntelliJ IDEA.
  User: DuNai
  Date: 2021/9/10
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>博客首页</title>
    <!--引入bootstrap的css文件-->
    <link rel="stylesheet"  href="lib/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/mainpagestyle.css">
</head>


<body class="background">
<!--加载jquery-->
<script type="text/javascript" src="lib/jquery-3.6.0.js"></script>
<!--加载bootstrap依赖的JS文件-->
<script type="text/javascript" src="lib/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<!--使用几个div来完成对于博客首页的编写-->
<!--页面顶部-->

<!--头部script-->

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
                    <a class="nav-link" href="articlepage.html">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.html">个人简介</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.html">学习天地</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.html">好玩的事</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articlepage.html">懒得分类</a>
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
<div id="demo" class="carousel slide container" data-ride="carousel">

    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
        </div>
    </div>

    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
<!--文章部分-->
<article>
    <div class="container">
        <div class="row">
            <div class="col-sm-8" id="articleview">
                <h2>文章列表</h2>
                <!--这是一个文章-->
                <div class="article">
                    <h3>文章标题</h3>
                    <a href="#">点击查看博客详细内容</a>
                    <div class="fakeimg">
                        文章图像
                    </div>
                    <p>文章部分内容</p>
                    <div class="blank"></div>
                    <hr>
                </div>
                <!--这是一个文章-->
                <div class="article">
                    <h3>文章标题</h3>
                    <a href="#">点击查看博客详细内容</a>
                    <div class="fakeimg">
                        文章图像
                    </div>
                    <p>文章部分内容</p>
                    <div class="blank"></div>
                    <hr>
                </div>
                <!--这是一个文章-->
                <div class="article">
                    <h3>文章标题</h3>
                    <a href="#">点击查看博客详细内容</a>
                    <div class="fakeimg">
                        文章图像
                    </div>
                    <p>文章部分内容</p>
                    <div class="blank"></div>
                    <hr>
                </div>
            </div>
            <div class="col-sm-4" id="othersinfoview">
                <h3>个人信息</h3>
                <div class="fakeimg">这里随便选张图片</div>
                <p>个人简介</p>
                <h3>友情链接</h3>
                <p>这里的链接都是一些实用网站</p>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="http://blog.dunaixdd.cn">个人博客</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">链接</a>
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
    </div>
</article>
<!--页面底部内容-->
<div class="jumbotron text-center" style="margin-bottom: 0">
    <p>页面底部</p>
</div>
<script>
    $("#login").click(function () {
        window.location.href="loginpage.html"
    })

    $("#regidit").click(function () {
        window.location.href="regpage.html"
    })

    $("#logout").click(function () {
        window.location.href="exitServlet"
    })

    $("#myprofile").click(function () {
            if(${sessionScope.user != null}) {
                if(${sessionScope.user.getRole()==1}) {
                    window.location.href = "manage/userinfo.jsp";
                }else{
                    window.location.href="users/userinfo.jsp";
                }
            }else {
                alert("您还没有登录！先请登录！");
            }
    })
</script>
</body>
</html>