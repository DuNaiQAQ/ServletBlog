package cn.itcast.blog.service;

import cn.itcast.blog.domain.User;

import java.util.List;

public interface UserService {
    boolean regist(User user);
    boolean active(String code);
    User login(User user);
    boolean updateInfo(User user);
    List<User> getAllusers();
    boolean deleteUser(int userid);
    void addUser(User user);
    void changePass(String email,String pass);
}
