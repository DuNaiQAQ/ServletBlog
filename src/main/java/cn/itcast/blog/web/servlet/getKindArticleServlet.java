package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.service.KindService;
import cn.itcast.blog.service.impl.KindServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "getKindArticleServlet", value = "/getKindArticleServlet")
public class getKindArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.valueOf(request.getParameter("id"));
        KindService service=new KindServiceImpl();
        List<Article> articles=service.getKindArticles(id);
        request.getSession().setAttribute("kind_of_article",articles);
        response.sendRedirect(request.getContextPath()+"/kindresult.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
