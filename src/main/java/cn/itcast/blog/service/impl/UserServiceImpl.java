package cn.itcast.blog.service.impl;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.dao.impl.UserDaoImpl;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.service.UserService;
import cn.itcast.blog.util.MailUtils;
import cn.itcast.blog.util.Md5Util;
import cn.itcast.blog.util.UuidUtil;

import java.util.List;

public class  UserServiceImpl implements UserService {
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

        String content="<a href='http://localhost:8080/activeUserServlet?code="+user.getCode()+"'>点击激活【DuNai个人博客】</a>";
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
        User user1=null;
        try {
            user1=userDao.findByUsernameAndPassword(user.getEmail(), Md5Util.encodeByMd5(user.getPassword()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user1;
    }

    @Override
    public boolean updateInfo(User user) {
        User u=userDao.findById(user.getId());
        if(u!=null) {
            userDao.updateInfo(user);
            return true;
        }
        return false;
    }

    @Override
    public List<User> getAllusers() {
        return  userDao.getAllUsers();
    }

    @Override
    public boolean deleteUser(int userid) {
        return false;
    }

    @Override
    public void addUser(User user) {
        userDao.save(user);
    }

    @Override
    public void changePass(String email, String pass) {
        userDao.changePass(email,pass);
    }
}
