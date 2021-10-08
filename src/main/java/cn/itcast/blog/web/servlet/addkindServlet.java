package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Kind;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.service.KindService;
import cn.itcast.blog.service.impl.KindServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addkindServlet", value = "/addkindServlet")
public class addkindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kindname=(String)request.getSession().getAttribute("kindname");
        KindService service=new KindServiceImpl();
        ResultInfo info=new ResultInfo();
        Kind kind=new Kind();
        kind.setKind_name(kindname);
        if(service.setKind(kind)){
            info.setFlag(true);
        }else {
            info.setFlag(false);
            info.setErrorMsg("已经有重复的类名称！");
        }

        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(),info);
    }
}
