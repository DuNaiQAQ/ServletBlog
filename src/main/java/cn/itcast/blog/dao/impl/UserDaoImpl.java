package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.UserDao;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


public class UserDaoImpl implements UserDao {

    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public User findByUsername(String username) {
        User user=null;
        try {
            String sql = "select * from user where Username=?";
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username);
        }catch (Exception e){

        }
        return user;
    }

    @Override
    public void save(User user) {
        String sql= "insert into user(Username,Email,Password,Birth,Status,Code,role,self_content) values(?,?,?,?,?,?,?,?)";
        template.update(sql,user.getUsername(),user.getEmail(),user.getPassword(),user.getBirth(),user.getStatus(),user.getCode()
        , user.getRole(),user.getSelf_content());
    }

    @Override
    public User findByCode(String code) {
        User user=null;
        try {
            String sql = "select * from user where Code = ?";
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), code);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateStatus(User user) {
        String sql = "update user set Status = 'Y' where Email=?";
        template.update(sql,user.getEmail());
    }

    @Override
    public User findByUsernameAndPassword(String username, String password) {
        User user=null;
        try {
            String sql = "select * from user where Email=? and Password = ?";
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username,password);
        }catch (Exception e){

        }
        return user;
    }

    @Override
    public void updateInfo(User user){
        String sql = "update user set Username = ?,Birthday = ?,self_content = ? where Email = ?";
        template.update(sql,user.getUsername(),user.getBirth(),user.getSelf_content(),user.getEmail());
    }
}
