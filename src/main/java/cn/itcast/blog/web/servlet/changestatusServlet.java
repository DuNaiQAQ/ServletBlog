package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changestatusServlet", value = "/changestatusServlet")
public class changestatusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int code=Integer.valueOf(request.getParameter("articleid"));
        int status=Integer.valueOf(request.getParameter("setstatus"));
        int page=Integer.valueOf(request.getParameter("pageid"));
        Article article=new Article();
        ArticleService service=new ArticleServiceImpl();
        ResultInfo resultInfo=new ResultInfo();
        article=service.findarticleById(code);
        article.setStatus(status);
        if(article==null){
            resultInfo.setFlag(false);
            resultInfo.setErrorMsg("文章数据更新失败！");
        }else {
            resultInfo.setFlag(true);
            service.changeStatus(article);
        }
        if(page==1) {
            response.sendRedirect(request.getContextPath()+"/manage/articles.jsp");
        }else if(page==2){
            response.sendRedirect(request.getContextPath()+"/manage/drafts.jsp");
        }else if(page==3){
            response.sendRedirect(request.getContextPath()+"/manage/rubbishs.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
