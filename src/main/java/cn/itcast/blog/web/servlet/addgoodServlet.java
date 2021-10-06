package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addgoodServlet", value = "/addgoodServlet")
public class addgoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.valueOf(request.getParameter("articleid"));
        ArticleService service=new ArticleServiceImpl();
        User user=(User)request.getSession().getAttribute("user");
        if(service.addlike(user.getEmail(),id)) {
            Article article = service.findarticleById(id);
            article.setCount_good(article.getCount_good() + 1);
            service.updateInfo(article);
            String str="{'sumlike':"+article.getCount_good()+"}";
            JSONObject jsonObject=JSONObject.parseObject(str);
            PrintWriter writer=response.getWriter();
            writer.print(jsonObject);
        }else {
            String str="{'sumlike':"+-1+"}";
            JSONObject jsonObject=JSONObject.parseObject(str);
            PrintWriter writer=response.getWriter();
            writer.print(jsonObject);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
