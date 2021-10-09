<%@ page import="cn.itcast.blog.domain.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.blog.service.ArticleService" %>
<%@ page import="cn.itcast.blog.service.impl.ArticleServiceImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="cn.itcast.blog.domain.User" %>
<%@ page import="cn.itcast.blog.domain.Kind" %>
<%@ page import="cn.itcast.blog.service.KindService" %>
<%@ page import="cn.itcast.blog.service.impl.KindServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: DuNai
  Date: 2021/9/10
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    ArticleService service=new ArticleServiceImpl();
    List<Article> articles=service.getAllPostArticles();
    int pagesize=0;
    int flag=0;
    int pagenum=0;
    List<Article> pageArticles = new ArrayList<Article>();
    if(articles.size()!=0) {
        if ((articles.size() % 3) == 0) {
            pagesize = articles.size() / 3;
        } else {
            pagesize = articles.size() / 3 + 1;
        }
        pagenum = Integer.valueOf(request.getParameter("pagenum"));
        //从这里开始初始化文章主页面信息，固定每页显示3个文章
        if ((articles.size() - 3 * pagenum) < 0) {
            flag = 0;
        } else {
            flag = articles.size() - pagenum * 3;
        }
        for (int i = articles.size() - 1 - (pagenum - 1) * 3; i >= flag; i--) {
            pageArticles.add(articles.get(i));
        }
    }else {

    }
    if(pagenum==0){
        response.sendRedirect("index.jsp?pagenum=1");
    }else {
        String pre,next;
        if((pagenum-1)==0) {
            pre = "index.jsp?pagenum=" + pagenum;
        }else{
            pre = "index.jsp?pagenum=" + (pagenum - 1);
        }
        if((pagenum+1)>pagesize) {
            next = "index.jsp?pagenum=" + pagenum;
        }else {
            next = "index.jsp?pagenum=" + (pagenum + 1);
        }
        pageContext.setAttribute("pre",pre);
        pageContext.setAttribute("next",next);
        pageContext.setAttribute("size",pagesize);
        pageContext.setAttribute("num",pagenum);
        pageContext.setAttribute("articles",pageArticles);
    }
%>

<%
    User user=(User) session.getAttribute("user");
    if(user!=null) {
        List<Article> favolist = service.getfav(user.getEmail());
        if(favolist!=null) {
            pageContext.setAttribute("fav", favolist);
        }
    }
%>

<%
    List<Kind> kinds=null;
    KindService kindService=new KindServiceImpl();
    kinds=kindService.getKindList();
    if(kinds!=null) {
        kinds = kindService.getKindList();
        pageContext.setAttribute("kinds", kinds);
    }
%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- Font Awesome 图标 -->
    <link rel="stylesheet" href="manage/plugins/fontawesome-free/css/all.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="manage/dist/css/adminlte.min.css">
    <!-- AdminLTE App -->
    <script src="manage/dist/js/adminlte.min.js"></script>
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
                    <a class="nav-link" href="index.jsp?pagenum=1">首页</a>
                </li>
                <c:forEach items="${kinds}" var="a">
                    <li class="nav-item">
                        <a class="nav-link" href="/getKindArticleServlet?id=${a.id}">${a.kind_name}</a>
                    </li>
                </c:forEach>
            </ul>
            <div class="btn-group right" style="float:right;">
            <div class="btn-group btn-group-sm" id="logandreg" style="float:right;" <c:if test="${sessionScope.user!=null}">hidden</c:if>>
                <button type="button" class="btn btn-primary" id="login">登录</button>
                <button type="button" class="btn btn-primary" id="regidit">注册</button>
            </div>

            <div class="btn-group btn-group-sm" id="selfinfo" style="float:right">
                <button type="button" class="btn btn-primary" id="myprofile"><c:if test="${sessionScope.user==null}">
                    现在使用的是游客模式！
                </c:if><c:if test="${sessionScope.user!=null}">
                    ${sessionScope.user.getUsername()}
                </c:if></button>
                <button type="button" class="btn btn-primary" id="logout" <c:if test="${sessionScope.user==null}">hidden</c:if>>退出</button>
            </div>
            </div>
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
        <h1>文章推荐</h1>
        <div class="carousel-item active">
            <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
            <a href="articlepage.jsp?articleid=${hot1['id']}" style="text-align: center;display: block">${hot1['title']}</a>
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
            <a href="articlepage.jsp?articleid=${hot2['id']}" style="text-align: center;display: block">${hot2['title']}</a>
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
            <a href="articlepage.jsp?articleid=${hot3['id']}" style="text-align: center;display: block">${hot3['title']}</a>
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
                <c:forEach var="a" items="${articles}">
                    <!--这是一个文章-->
                    <div class="post" style="height:430px ">
                    <div class="article card">
                        <div class="card-header">
                        <h3>${a.getTitle()}</h3>
                        </div>
                        <div class="card-body">
                        <div class="fakeimg">
                            <img src="img/illust_80073481_20200325_082657.jpg" style="height: 200px; width: 700px">
                        </div>
                            <div>
                                <textarea maxlength="50" disabled style="resize: none;width: 700px">${a.text}</textarea>
                            </div>
                        </div>
                        <div class="card-footer">
                            <i class="bi-calendar"></i><a style="color: black">${a.getCreat_time()}</a>
                            <i class="bi-person"></i><a style="color:black;">${a.getEmail()}</a>
                            <i class="bi-heart"></i><a style="color:black;">${a.getCount_good()}</a>
                            <i class="bi-star"></i><a style="color:black;">${a.getCount_shou()}</a>
                            <div style="float: right" ><i class="bi-play-fill"></i><a href="articlepage.jsp?articleid=${a['id']}">点击查看详细内容</a></div>
                        </div>
                    </div>
                    </div>
                </c:forEach>
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="${pre}">上一页</a></li>
                    <li class="page-item"><a class="page-link" href="${next}">下一页</a></li>
                    <p>当前第${num}页，一共有${size}页</p>
                </ul>

            </div>
            <div class="col-sm-4" id="othersinfoview">
                <div class="card">
                <div class="card-header">
                <h3>站主个人信息</h3>
                </div>
                <div class="card-body">
                <p>个人简介</p>
                <h3>友情链接</h3>
                <p>这里的链接都是一些实用网站</p>
                <p>当然是固定连接不给改()</p>
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

                <div class="card">
                    <div class="card-header">
                    <h3>文章搜索</h3>
                    </div>
                    <div class="card-body">
                    <form class="form-inline" id="serachform">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="搜索"
                                   name="name" aria-label="Search" style="width: 170px">
                                <button class="btn btn-navbar" type="button" style="height: 31px;width: 31px" id="s" >
                                    <i class="fas fa-search"></i>
                                </button>
                        </div>
                    </form>
                    </div>
                </div>

                <!--这里就做一个博客收藏的表示-->
                <div class="card">
                    <div class="card-header"><h3>收藏的博客</h3></div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
                            <c:if test="${sessionScope.user==null}">现在使用的是游客模式！</c:if>
                            <c:if test="${sessionScope.user!=null}">
                                <c:forEach items="${fav}" var="a">
                                    <li class="nav-item">
                                        <a class="nav-link" href="articlepage.jsp?articleid=${a.id}">${a.title}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
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
<script>
    $("#login").click(function () {
        if(${sessionScope.user != null}){
            alert("您已经登录了！")
        }else {
            window.location.href = "loginpage.html"
        }
    })

    $("#regidit").click(function () {
        window.location.href="regpage.html"
    })

    $("#logout").click(function () {
        window.location.href="exitServlet"
    })

    $("#s").click(function () {
        $.post("/serachServlet",$("#serachform").serialize(),function (data) {
            
        })
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