package cn.itcast.blog.web.servlet;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.dao.impl.UserDaoImpl;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.UserService;
import cn.itcast.blog.service.impl.UserServiceImpl;
import cn.itcast.blog.util.MailUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "sendAccServlet", value = "/sendAccServlet")
public class sendAccServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass=request.getParameter("password");
        String email=request.getParameter("email");
        String acccode="";
        ResultInfo info=new ResultInfo();
        Random random=new Random();
        for(int i=0;i<6;i++){
            acccode+=random.nextInt(10);
        }
        UserDao dao=new UserDaoImpl();
        if(dao.findByEmail(email)==null){
            info.setFlag(false);
            info.setErrorMsg("没有此用户！");
        }else {
            MailUtils.sendMail(email, "您的验证码是：" + acccode, "密码修改验证码");
            request.getSession().setAttribute("code", acccode);
            info.setFlag(true);
        }
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(info);

        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }
}
