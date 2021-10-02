package cn.itcast.blog.dao;

import cn.itcast.blog.domain.User;

import java.util.List;

public interface UserDao {
    /**
     * 根据用户名查询对象
     * @param username
     * @return
     */
    public User findByUsername(String username);

    /**
     * 保存用户信息
     * @param user
     */
    public void save(User user);

    /**
     *
     */
    public User findByCode(String code);

    public void updateStatus(User user);

    public User findByUsernameAndPassword(String username,String password);

    public void updateInfo(User user);

    public List<User> getAllUsers();

    public void deleteUser(int id);

    public User findById(int id);

    public User findByEmail(String email);
}
