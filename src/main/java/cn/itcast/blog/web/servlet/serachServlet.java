package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.transform.Result;
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
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
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
        ResultInfo info=new ResultInfo();
        info.setFlag(true);
        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(),info);
    }
}
