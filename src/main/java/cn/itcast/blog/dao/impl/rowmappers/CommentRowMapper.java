package cn.itcast.blog.dao.impl.rowmappers;


import cn.itcast.blog.domain.Comment;
import org.joda.time.DateTime;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentRowMapper implements RowMapper {

    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Comment comment=new Comment();
        comment.setId(resultSet.getInt("id"));
        comment.setPost_id(resultSet.getInt("post_id"));
        comment.setUname_email(resultSet.getString("unname_email"));
        comment.setContent(resultSet.getString("content"));
        comment.setCtime(new DateTime(resultSet.getTimestamp("ctime")));
        comment.setParent(resultSet.getInt("parent"));
        comment.setParent_name(resultSet.getString("parent_name"));
        comment.setCount_good(resultSet.getInt("count_good"));
        return comment;
    }
}
