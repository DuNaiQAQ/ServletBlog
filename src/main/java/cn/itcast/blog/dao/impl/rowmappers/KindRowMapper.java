package cn.itcast.blog.dao.impl.rowmappers;

import cn.itcast.blog.domain.Kindpost;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KindRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Kindpost kindpost =new Kindpost();
        kindpost.setId(resultSet.getInt("id"));
        kindpost.setArticle_id(resultSet.getInt("article_id"));
        kindpost.setPost_id(resultSet.getInt("post_id"));
        return  kindpost;
    }
}
