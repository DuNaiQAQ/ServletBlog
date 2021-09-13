package cn.itcast.blog.service;

import cn.itcast.blog.domain.User;

public interface UserService {
    boolean regist(User user);
    boolean active(String code);
    User login(User user);
    boolean updateInfo(User user);
}
