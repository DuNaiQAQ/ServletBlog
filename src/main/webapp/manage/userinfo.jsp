<%@ page import="cn.itcast.blog.domain.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: DuNai
  Date: 2021/9/10
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
这是一个入门模板页面。通过此页面从头开发新的项目。
该页面删除了所有链接，仅提供所需的标签。
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人中心|个人资料</title>

    <!-- 离线 Google 字体: Source Sans Pro -->
    <link rel="stylesheet" href="/manage/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome 图标 -->
    <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="./dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- 导航栏 -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- 左侧导航栏链接 -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">主页</a>
            </li>
        </ul>

        <!-- 右侧导航栏链接 -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="搜索" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- 主侧边栏容器 -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- 品牌 Logo -->
        <a href="index3.html" class="brand-link">
            <img src="./dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- 侧边栏用户面板（可选） -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="${sessionScope.user.getHead()}" class="img-circle elevation-2" alt="用户头像">
                </div>
                <div class="info">
                    <!--这里到时候用jsp改一下-->
                    <a href="#" class="d-block">${sessionScope.user.getUsername()}</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="搜索" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- 侧边栏菜单 -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- 使用 .nav-icon 类添加图标，
                         或使用 font-awesome 或其他任何图标字体库 -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                用户中心
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./userinfo.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>个人资料及信息</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="changeinfo.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>修改个人资料</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./alluers.jsp" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>管理全站用户</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./adduers.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>添加用户</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                文章管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav-treeview">
                            <li class="nav-item">
                                <a href="writearticle.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>写文章</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="articles.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>已发布的文章</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./drafts.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>草稿箱</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./rubbishs.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>垃圾箱</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./allarticles.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>全站所有文章管理</p>
                                </a>
                            </li>
                        </ul>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-mail-bulk"></i>
                            <p>
                                评论管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./mycomments.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>查看我的评论</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./allcoments.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>查看所有评论</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper" style="min-height: 3604px;">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>资料</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">用户资料</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle" src="${sessionScope.user.getHead()}" alt="User profile picture">
                                </div>

                                <h3 class="profile-username text-center">${sessionScope.user.getUsername()}</h3>

                                <p class="text-muted text-center">DuNaiBlog博客使用者</p>

                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>发布文章数</b> <a class="float-right">0</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>发布评论数</b> <a class="float-right">0</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- 关于我 Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">关于我自己</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong><i class="far fa-file-alt mr-1"></i> 个人说明</strong>
                                <p class="text-muted">${sessionScope.user.getSelf_content()}</p>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-body">
                                <strong><i class="far fa-file-alt mr-1"></i> 我的生日</strong>
                                <p class="text-muted">
                                    <%
                                    User user=(User) session.getAttribute("user");
                                    Date date=user.getBirth();
                                        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
                                        String birth=format.format(date);
                                        pageContext.setAttribute("birth",birth);
                                    %>
                                    ${birth}
                                </p>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-body">
                                <strong><i class="far fa-file-alt mr-1"></i> 邮箱</strong>
                                <p class="text-muted">${sessionScope.user.getEmail()}</p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">最近发布的5个博客</a></li>
                                </ul>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="activity">
                                        <!-- Post -->
                                        <div class="post">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm" src="./dist/img/user1-128x128.jpg" alt="用户头像">
                                                <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                                <span class="description">公开分享 - 今天下午7:30</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                这里会显示已经发布的5个博客，还在制作中
                                            </p>
                                        </div>
                                        <!-- /.post -->
                                    </div>
                                </div>
                                <!-- /.tab-content -->
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- Default to the left -->
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> 保留所有权利。
    </footer>
</div>
<!-- ./wrapper -->

<!-- 载入脚本 -->

<!-- jQuery -->
<script src="./plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./dist/js/adminlte.min.js"></script>
</body>
</html>