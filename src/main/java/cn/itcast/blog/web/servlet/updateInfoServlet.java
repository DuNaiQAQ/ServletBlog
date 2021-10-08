package cn.itcast.blog.web.servlet;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.dao.impl.UserDaoImpl;
import cn.itcast.blog.domain.ResultInfo;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.UserService;
import cn.itcast.blog.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.awt.SystemColor.info;

@WebServlet("/updateInfoServlet")
public class updateInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String>map=new HashMap<String, String>();
        String username=request.getParameter("username");
        String realPath = this.getServletContext().getRealPath("/upload/head/");
        String tempPath=this.getServletContext().getRealPath("/upload/temp/");
        File f=new File(realPath);
        File ft=new File(tempPath);
        if(!f.exists()&&!f.isDirectory()){
            f.mkdirs();
        }

        if(!ft.exists()&&!ft.isDirectory()){
            ft.mkdirs();
        }


        DiskFileItemFactory factory=new DiskFileItemFactory();
        factory.setRepository(ft);
        ServletFileUpload servletFileUpload=new ServletFileUpload(factory);
        servletFileUpload.setHeaderEncoding("UTF-8");

        if(!ServletFileUpload.isMultipartContent(request)){
            return;
        }

        try {
            List<FileItem> items=servletFileUpload.parseRequest(request);
            for(FileItem item:items){
                if(item.isFormField()){
                    String filedName=item.getFieldName();
                    String filedValue=item.getString("UTF-8");
                    map.put(filedName,filedValue);
                }else {
                    String fileName=item.getName();
                    if(fileName==null||"".equals(fileName.trim())){
                        continue;
                    }
                    fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
                    String filePath=realPath+"\\"+fileName;
                    InputStream in=item.getInputStream();
                    OutputStream out=new FileOutputStream(filePath);

                    byte b[]=new byte[1024];
                    int len=-1;
                    while((len=in.read(b))!=-1){
                        out.write(b,0,len);
                    }
                    out.close();
                    in.close();
                    map.put("head",request.getContextPath()+"/upload/head/"+fileName);
                    try{
                        Thread.sleep(3000);
                    }catch (InterruptedException e){
                        e.printStackTrace();
                    }
                    item.delete();
                    System.out.println("图片上传成功！");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        //当读取完头像文件之后再进行操作
        String msg=null;
        User user=new User();
        try{
            BeanUtils.populate(user,map);
        }catch (IllegalAccessException e){
            e.printStackTrace();
        }catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        UserService service=new UserServiceImpl();
        ResultInfo info=new ResultInfo();
        if(service.updateInfo(user)){
            info.setFlag(true);
        }else {
            info.setFlag(false);
            info.setErrorMsg("数据更新失败！");
        }
        UserDao dao=new UserDaoImpl();
        User user1=dao.findById(user.getId());
        request.getSession().setAttribute("user",user1);
        ObjectMapper mapper=new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        response.sendRedirect(request.getContextPath()+"/manage/userinfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
