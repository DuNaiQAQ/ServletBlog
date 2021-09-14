package cn.itcast.blog.service.impl;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.dao.impl.UserDaoImpl;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.UserService;
import cn.itcast.blog.util.MailUtils;
import cn.itcast.blog.util.UuidUtil;

public class UserServiceImpl implements UserService {
    private UserDao userDao=new UserDaoImpl();
    /**
    * 注册用户
    * @param user
    * @return
    */
    @Override
    public boolean regist(User user) {
        User u=userDao.findByUsername(user.getUsername());
        if(u!=null){
            //用户名已经存在
            return false;
        }

        user.setCode(UuidUtil.getUuid());
        user.setStatus("N");

        userDao.save(user);

        String content="<a href='http://localhost:8080/MyBlog_war_exploded/activeUserServlet?code="+user.getCode()+"'>点击激活【DuNai个人博客】</a>";
        MailUtils.sendMail(user.getEmail(),content,"激活邮件");
        return true;
    }

    @Override
    public boolean active(String code) {
        User user =userDao.findByCode(code);
        if(user!=null){
            userDao.updateStatus(user);
            return true;
        }
        return false;
    }

    @Override
    public User login(User user) {
        return userDao.findByUsernameAndPassword(user.getEmail(),user.getPassword());
    }

    @Override
    public boolean updateInfo(User user) {
        User u=userDao.findByCode(user.getCode());
        if(u!=null) {
            userDao.updateInfo(user);
            return true;
        }
        return false;
    }
}
