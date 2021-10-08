package cn.itcast.blog.web.servlet;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.List;

@WebServlet(name = "uploadImgServlet", value = "/uploadImgServlet")
@MultipartConfig
public class uploadImgServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject=new JSONObject();
        String realPath = this.getServletContext().getRealPath("/upload/img/");
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
                    jsonObject.put("success",1);
                    jsonObject.put("message","上传成功");
                    jsonObject.put("url",request.getContextPath()+"/upload/img/"+fileName);
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
        String info=jsonObject.toJSONString();
        PrintWriter pw=response.getWriter();
        pw.print(info);
    }
}
