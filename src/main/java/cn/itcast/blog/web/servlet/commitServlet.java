package cn.itcast.blog.web.servlet;

import cn.itcast.blog.domain.Comment;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.CommetService;
import cn.itcast.blog.service.impl.CommentServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.joda.time.DateTime;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "commitServlet", value = "/commitServlet")
public class commitServlet extends HttpServlet {
    Comment temp=null;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Comment comment=new Comment();
        int size=map.get("content").length;
        try {
            BeanUtils.populate(comment,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User user=(User)request.getSession().getAttribute("user");
        comment.setUname_email(user.getEmail());
        comment.setCtime(new Timestamp(System.currentTimeMillis()));
        comment.setUname_head(user.getHead());
        CommetService service=new CommentServiceImpl();
        service.saveComment(comment);

        ResultInfo info=new ResultInfo();
        info.setFlag(true);
        temp=comment;
        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(),info);
    }
}
