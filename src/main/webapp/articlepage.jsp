<%@ page import="cn.itcast.blog.domain.Article" %>
<%@ page import="cn.itcast.blog.service.ArticleService" %>
<%@ page import="cn.itcast.blog.service.impl.ArticleServiceImpl" %>
<%@ page import="cn.itcast.blog.service.CommetService" %>
<%@ page import="cn.itcast.blog.service.impl.CommentServiceImpl" %>
<%@ page import="cn.itcast.blog.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.blog.domain.User" %>
<%@ page import="cn.itcast.blog.domain.Kind" %>
<%@ page import="cn.itcast.blog.service.impl.KindServiceImpl" %>
<%@ page import="cn.itcast.blog.service.KindService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Article article = new Article();
    int id = Integer.valueOf(request.getParameter("articleid"));
    ArticleService service = new ArticleServiceImpl();
    article = service.findarticleById(id);
    pageContext.setAttribute("article", article);
    CommetService commetService = new CommentServiceImpl();
    List<Comment> commentList = commetService.loadArticleComment(id);
    pageContext.setAttribute("comments", commentList);
    pageContext.setAttribute("id", id);
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
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章页面</title>
    <!--引入bootstrap的css文件-->
    <link rel="stylesheet" href="lib/editormd/css/editormd.preview.css"/>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mainpagestyle.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="./manage/plugins/fontawesome-free/css/all.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="./manage/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
                    <a class="nav-link" href="index.jsp?pagenum=1">首页</a>
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
                <li class="btn-group btn-group-sm" id="logandreg"<c:if test="${sessionScope.user!=null}">hidden</c:if>>
                    <button type="button" class="btn btn-primary" id="login">登录</button>
                    <button type="button" class="btn btn-primary" id="regidit">注册</button>
                </li>

                <li class="btn-group btn-group-sm" id="selfinfo">
                    <button type="button" class="btn btn-primary" id="myprofile"><c:if test="${sessionScope.user==null}">
                        现在使用的是游客模式！
                    </c:if><c:if test="${sessionScope.user!=null}">
                        ${sessionScope.user.getUsername()}
                    </c:if></button>
                    <button type="button" class="btn btn-primary" id="logout" <c:if test="${sessionScope.user==null}">hidden</c:if>>退出</button>
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
                    <div class="card-header">
                    <h1>${article.getTitle()}</h1>
                    <i class="bi-person-fill"></i><a style="color: black">${article.getEmail()}</a>
                    <i class="bi-heart-fill"></i><a id="sumgood" style="color: black">${article.getCount_good()}</a>
                        <i class="bi-star-fill"></i><a id="sumfavo" style="color: black">${article.getCount_shou()}</a>
                    <ui class="nav-item">
                        <button type="button" class="btn btn-default" id="addgood" style="float:right;">点赞</button>
                        <button type="button" class="btn btn-dark" id="addfavorite" style="float: right;">收藏</button>
                    </ui>
                    </div>
                    <div class="card-body">
                    <div class="border border-top-0"></div>
                    <div id="texta">
                        <textarea id="texts" style="display:none;">${article.getText()}</textarea>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4" id="othersinfoview" style="border: dot-dot-dash">
                <div class="card">
                    <h3>个人信息</h3>
                    <div class="card-header">
                    <h4>个人简介</h4>
                    </div>
                    <div class="card-body">
                    <p>摸鱼程序员</p>
                    <p>正经人谁自己写前端.jpg</p>
                    </div>
                    <h3>友情链接</h3>
                    <p>这里的链接都是一些实用网站</p>
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
                <div class="card">
                    <div class="card-header">
                        <h3>文章搜索</h3>
                    </div>
                    <div class="card-body">
                        <form class="form-inline" action="/serachServlet" method="post">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-navbar" type="search" placeholder="搜索"
                                       name="name" aria-label="Search" style="width: 170px">
                                <button class="btn btn-navbar" type="submit" style="height: 31px;width: 31px" >
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
            <div id="comment_area">
                <br>
                <div>
                    <c:forEach var="com" items="${comments}">
                        <c:if test="${com.getParent_name()!=null}"><div  style="width: 1140px;height: 260px"></c:if>
                        <c:if test="${com.getParent_name()==null}"><div  style="width: 1140px;height: 210px"></c:if>
                        <div class="post card">
                            <div class="user-block">
                                <img class="img-circle img-bordered-sm" src="${com.getUname_head()}" alt="用户头像">
                                <span class="username">
                          <a href="#">${com.getUname_email()}</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                <span class="description">${com.getCtime()}</span>
                            </div>
                            <!-- /.user-block -->
                            <c:if test="${com.getParent_name()!=null}">
                                <div class="replya">
                                    <p style="color: grey">${com.getParent_name()}</p>
                                    <br>
                                </div>
                            </c:if>
                            <p>
                                    ${com.getContent()}
                            </p>
                            <p>
                                <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> 喜欢</a>
                            </p>

                            <form class="form-horizontal sendr">
                                    <div class="input-group input-group-sm mb-0">
                                    <input type="hidden" name="parent" value="${com.getId()}">
                                    <input type="hidden" name="post_id" value="${article.getId()}">
                                    <input type="hidden" name="parent_name" value="${com.getContent()}">
                                    <input class="form-control form-control-sm" name="content" placeholder="内容">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-danger sendreply">发送</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </div>
                    </c:forEach>
                    <div class="post">
                        有什么想说的？
                        <form class="form-horizontal" id="sendc">
                            <input type="hidden" name="post_id" value="${article.getId()}">
                            <div class="input-group input-group-sm mb-0">
                                <textarea class="form-control form-control-sm" name="content" style="height: 100px;width: 1140px"
                                          placeholder="说点什么吧呜呜"></textarea>
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
        $.post("/commitServlet", $("#sendc").serialize(), function (data) {
            if (data.flag) {
                alert("评论发送成功！");
                window.location.href = "http://localhost:8080/articlepage.jsp?articleid=${article.getId()}";
            }
        })
    })

    $(".sendreply").click(function () {
        $.post("/commitServlet?", $(this).parents(".sendr").serialize(), function (data) {
            if (data.flag) {
                alert("回复发送成功！");
                location.reload();
            }
        })
    })

    $("#addgood").click(function () {
        $.get("/commitServlet", $(".sendr").serialize(), function (data) {
            if (data.flag) {
                alert("回复发送成功！");
                location.reload();
            }
        })
    })

    $("#addgood").click(function () {
        if (${sessionScope.user==null}) {
            alert("只有登录用户才能进行操作哦")
        } else {
            $.ajax({
                url: "/addgoodServlet?id",
                data: {"articleid":${id}},
                type: "get",
                dataType: "JSON",
                success: function (rs) {
                    if(rs.sumlike!=-1) {
                        alert("点赞成功！");
                        var s = rs.sumlike
                        $("#sumgood").html(s);
                    }else {
                        alert("您已经点赞过了呢~");
                    }
                },
                error: function (rs) {
                    alert("您已经点赞过了呢~");
                }
            })
        }
    })

    $("#addfavorite").click(function () {
        if (${sessionScope.user==null}) {
            alert("只有登录用户才能进行操作哦")
        } else {
            $.ajax({
                url: "/addfavoriteServlet",
                data: {"articleid":${id}},
                type: "get",
                dataType: "JSON",
                success: function (rs) {
                    if(rs.sumfav!=-1) {
                        alert("收藏成功！");
                        var s = +rs.sumfav
                        $("#sumfavo").html(s);
                    }else {
                        var a=confirm("您已经收藏过了，确定要取消收藏吗？");
                        if(a){
                            $.ajax({
                                url: "/delfavoriteServlet",
                                data: {"articleid":${id}},
                                type: "get",
                                dataType: "JSON",
                                success:function (rs) {
                                    if(rs.sumfav!=-1) {
                                        alert("取消收藏成功！");
                                        var s = rs.sumfav
                                        $("#sumfavo").html(s);
                                    }
                                }
                            })
                        }
                    }
                },
                error: function (rs) {
                    alert("500！");
                }
            })
        }
    })

    $("#login").click(function () {
        window.location.href = "loginpage.html"
    })

    $("#regidit").click(function () {
        window.location.href = "regpage.html"
    })

    var Viewer = editormd.markdownToHTML("texta", {
        htmlDecode: "style,script,iframe",
        emoji: true,
        taskList: true,
        tex: true,  // 默认不解析
        flowChart: true,  // 默认不解析
        sequenceDiagram: true  // 默认不解析
    });

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