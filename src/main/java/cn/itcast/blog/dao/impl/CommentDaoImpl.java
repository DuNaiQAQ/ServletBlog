package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.CommentDao;
import cn.itcast.blog.dao.impl.rowmappers.CommentRowMapper;
import cn.itcast.blog.domain.Comment;
import cn.itcast.blog.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CommentDaoImpl implements CommentDao {
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void saveComment(Comment comment) {
        String sql="intsert into comment(post_id,uname_email,content,ctime,parent,parent_name,count_good) values(?,?,?,?,?,?,?,?)";
        template.update(sql,comment.getPost_id(),comment.getUname_email(),comment.getContent(),comment.getCtime(),
                comment.getParent(),comment.getParent_name(),comment.getCount_good());
    }

    @Override
    public List<Comment> loadComment(String email) {
        List<Comment> comments=null;
        String sql="select * from comment where email = ?";
        comments=template.query(sql,new CommentRowMapper(),email);
        return comments;
    }

    @Override
    public List<Comment> loadAllComment() {
        List<Comment> comments=null;
        String sql="select * from comment";
        comments=template.query(sql,new CommentRowMapper());
        return comments;
    }
}
