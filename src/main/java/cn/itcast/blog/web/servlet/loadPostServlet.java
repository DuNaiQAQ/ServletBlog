package cn.itcast.blog.web.servlet;

import cn.itcast.blog.dao.ArticleDao;
import cn.itcast.blog.dao.impl.ArticleImpl;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/loadPostServlet")
public class loadPostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Article> posta=null;
        ArticleService articleDao=new ArticleServiceImpl();
        User user=(User)request.getSession().getAttribute("user");
        posta=articleDao.getPostArticles(user.getEmail());
        request.setAttribute("posta",posta);
        if(user.getRole()==1) {
            response.sendRedirect("http://localhost:8080/MyBlog_war_exploded/manage/articles.jsp");
        }else{
            response.sendRedirect("http://localhost:8080/MyBlog_war_exploded/users/articles.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
