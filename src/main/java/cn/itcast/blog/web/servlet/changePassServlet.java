package cn.itcast.blog.web.servlet;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.dao.impl.UserDaoImpl;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.UserService;
import cn.itcast.blog.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changePassServlet", value = "/changePassServlet")
public class changePassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email;
        if(request.getSession().getAttribute("user")==null) {
            email = request.getParameter("email");
        }else {
            User user=(User) request.getSession().getAttribute("user");
            email=user.getEmail();
        }
        String code=(String) request.getSession().getAttribute("code");
        String pass=request.getParameter("password");
        UserService service=new UserServiceImpl();
        UserDao userDao=new UserDaoImpl();
        ResultInfo info=new ResultInfo();
        if(userDao.findByEmail(email)!=null){
            service.changePass(email,pass);
            info.setFlag(true);
        }else {
            info.setFlag(false);
            info.setErrorMsg("用户不存在！");
        }

        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(info);

        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }
}
