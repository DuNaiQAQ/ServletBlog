package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "serachServlet", value = "/serachServlet")
public class serachServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=(String) request.getSession().getAttribute("name");
        ArticleService service=new ArticleServiceImpl();
        List<Article> get=service.getAllPostArticles();
        List<Article> result=new ArrayList<>();
        for(int i=0;i<get.size();i++){
            if(get.get(i).getTitle().contains(name)){
                result.add(get.get(i));
            }else if(get.get(i).getText().contains(name)){
                result.add(get.get(i));
            }
        }
        request.getSession().setAttribute("findarticles",result);
        response.sendRedirect(request.getContextPath()+"/findresult.jsp");
    }
}
