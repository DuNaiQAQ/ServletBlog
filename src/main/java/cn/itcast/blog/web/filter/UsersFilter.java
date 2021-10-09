package cn.itcast.blog.web.filter;

import cn.itcast.blog.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName = "UsersFilter")
public class UsersFilter implements Filter {
    private List<String> manageUrl=new ArrayList<String>();
    public void init(FilterConfig config) throws ServletException {
        manageUrl.add("/allarticels.jsp");
        manageUrl.add("/addusers.jsp");
        manageUrl.add("/alluers.jsp");
        manageUrl.add("/manage_changeinfo.jsp");
        manageUrl.add("/allcomments.jsp");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest=(HttpServletRequest)request;
        HttpServletResponse httpServletResponse=(HttpServletResponse)response;
        String path=httpServletRequest.getServletPath();
        if(manageUrl!=null&&manageUrl.contains(path)){
            User user=(User) httpServletRequest.getSession().getAttribute("user");
            if(user.getRole()==1){
                chain.doFilter(request,response);
                return;
            }else {
                ((HttpServletResponse) response).sendRedirect(httpServletRequest.getContextPath()+"/errorpage.html");
            }
        }
        chain.doFilter(request,response);
    }
}
