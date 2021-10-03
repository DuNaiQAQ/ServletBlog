package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.CommetService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;
import cn.itcast.blog.service.impl.CommentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteServlet", value = "/deleteServlet")
public class deleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int method=Integer.valueOf(request.getParameter("method"));//这里获取是删除评论还是文章
        int id=Integer.valueOf(request.getParameter("id"));//获取评论或者文章的ID
        int pageid=Integer.valueOf(request.getParameter("pageid"));//便于重定向刷新页面（实现类似于刷新页面的效果
        if(method==1){
            ArticleService service=new ArticleServiceImpl();
            service.deleteArticle(id);
            response.sendRedirect("http://localhost:8080/MyBlog_war_exploded/manage/rubbishs.jsp");
        }else if(method==2){
            CommetService service=new CommentServiceImpl();
            service.deleteComment(id);
            response.sendRedirect("http://localhost:8080/MyBlog_war_exploded/manage/mycomments.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


