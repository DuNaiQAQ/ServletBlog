 <%@ page import="java.util.Random" %>
<%@ page import="cn.itcast.blog.util.MailUtils" %>
<%@ page import="cn.itcast.blog.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>找回密码</title>
    <!--引入bootstrap的css文件-->
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/loginpagestyle.css">
</head>
<body class="background">
<!--加载jquery-->
<script type="text/javascript" src="lib/jquery-3.6.0.js"></script>
<!--加载bootstrap依赖的JS文件-->
<script type="text/javascript" src="lib/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<!--使用几个div来完成对于博客首页的编写-->
<div class="container">
    <div class="topblank"></div>
    <div class="rg-right"><a href="index.jsp">返回主页</a></div>
    <h2>欢迎回来,先请登录</h2>
    <form action method="post" id="logform">
        <div class="form-group">
            <label for="userinfo">E-mail:</label>
            <input type="email" class="form-control" id="userinfo" name="email" placeholder="请输入邮箱">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
        <div class="form-group">
            <label for="passworda">Password:</label>
            <input type="password" class="form-control" id="passworda" name="password" placeholder="请重复密码">
        </div>
        <div class="form-group">
            <label for="acccode">验证码:</label>
            <input type="text" class="form-control" id="acccode" name="acccode" placeholder="请输入验证码">
            <button type="button" id="sendacccode" class="btn btn-primary">发送验证码</button>
        </div>
        <div class="blank"></div>
        <button type="button" class="btn btn-primary" id="reset">重设密码</button>
    </form>
</div>
<script>

    $("#sendacccode").click(function () {
        $.post("/sendAccServlet",$("#logform").serialize(),function (data) {
            if(data.flag){
                alert("验证码发送成功");
            }else {
                alert("用户未存在");
            }
        })
    })

    $("#reg").click(function () {
        window.location.href="regpage.html"
    })

    function checkemail() {
        var mail=$("#userinfo").val();
        var reg_email=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
        var flag=reg_email.test(mail);
        return flag;
    }

    function checkPassword() {
        var pass=$("#password").val();
        var reg_pass=/^[a-zA-Z]\w{5,17}$/;
        var flag=reg_pass.test(pass);
        return flag;
    }


    $(function () {
        $("#reset").click(function () {
                var cantrylog=true;
                if(!checkemail()){
                    alert("请检查邮箱输入格式是否正确");
                    cantrylog=false;
                }else if(!checkPassword()) {
                    alert("请检查密码输入格式是否正确");
                    cantrylog = false;
                }else if($("#password").val()!=$("#passworda").val()){
                    alert("请检查两次输入的密码是否一致");
                    cantrylog = false;
                }
            if(cantrylog){
                $.post("/changePassServlet",$("#logform").serialize(),function (data) {
                                if(data.flag){
                                    alert("密码修改成功，跳转至登录界面");
                                    window.location.href="loginpage.html";
                                    <%
                                    request.getSession().invalidate();
                                    %>
                                }else {
                                    alert(data.errorMsg);
                                }
                })
            }
        })
    })

</script>
</body>
</html>