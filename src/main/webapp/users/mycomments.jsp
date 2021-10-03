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
    <title>文章管理|已经发布的文章</title>

    <!-- 离线 Google 字体: Source Sans Pro -->
    <link rel="stylesheet" href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome 图标 -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
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
                <a href="http://localhost:8080/MyBlog_war_exploded/index.jsp?pagenum=1" class="nav-link">主页</a>
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
            <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- 侧边栏用户面板（可选） -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="用户头像">
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
                    <li class="nav-item">
                        <a href="#" class="nav-link">
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
                                <a href="./alluers.jsp" class="nav-link">
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
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-mail-bulk"></i>
                            <p>
                                评论管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./mycomments.jsp" class="nav-link active">
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
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">评论管理</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">评论管理</a></li>
                            <li class="breadcrumb-item active">我的评论</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">我发出的评论</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div id="articles_wrapper" class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                        <div class="col-sm-12 col-md-6"></div>
                        <div class="col-sm-12 col-md-6"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="articles" class="table table-bordered table-hover dataTable dtr-inline"
                                   role="grid" aria-describedby="articles_info">
                                <thead>
                                <tr role="row">
                                    <th class="sorting sorting_asc" tabindex="0" aria-controls="articles" rowspan="1"
                                        colspan="1" aria-sort="ascending"
                                        aria-label="文章ID: activate to sort column descending">文章ID
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="文章作者: activate to sort column ascending">文章作者
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="文章标题: activate to sort column ascending">文章标题
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="发布时间: activate to sort column ascending">发布时间
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="最后修改时间: activate to sort column ascending">最后修改时间
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="点赞次数: activate to sort column ascending">点赞次数
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="收藏次数: activate to sort column ascending">收藏次数
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="articles" rowspan="1" colspan="1"
                                        aria-label="操作: activate to sort column ascending">操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>DuNai</td>
                                    <td>论()为什么是神</td>
                                    <td>2021-5-24 10:30:20</td>
                                    <td>2021-10-10 10:30:22</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <button type="button" class="btn btn-primary lookat">浏览</button>
                                        <button type="button" class="btn btn-primary delete">删除</button>
                                    </td>
                                </tr>
                                <c:forEach var="a" items="${posta}">
                                    <tr>
                                        <td>${a.getId()}</td>
                                        <td>${a.getEmail()}</td>
                                        <td>${a.getTitle()}</td>
                                        <td>${a.getCount_good()}</td>
                                        <td>${a.getCount_shou()}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary lookat">浏览</button>
                                            <button type="button" class="btn btn-primary delete">删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
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
<script>
    $(".lookat").click(function () {
        window.location.href="../articlepage.jsp?articleid=1";
    })

    $(".delete").click(function(){
        //这里会参入文章ID参数进行对于文章状态的修改
    })
</script>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script>
    $(document).ready(function () {
        $('#articles').DataTable();
    })
</script>
</body>
</html>