package cn.itcast.blog.dao.impl.rowmappers;

import cn.itcast.blog.domain.Article;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ArticleRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Article article=new Article();
        article.setId(resultSet.getInt("id"));
        article.setEmail(resultSet.getString("author_email"));
        article.setTitle(resultSet.getString("title"));
        article.setText(resultSet.getString("text"));
        article.setStatus(resultSet.getInt("status"));
        article.setCreat_time(resultSet.getTimestamp("create_time"));
        article.setLast_change_time(resultSet.getTimestamp("last_change_time"));
        article.setCount_good(resultSet.getInt("count_good"));
        article.setCount_shou(resultSet.getInt("count_shou"));
        article.setKind_id(resultSet.getInt("kind_id"));
        return article;
    }
}
