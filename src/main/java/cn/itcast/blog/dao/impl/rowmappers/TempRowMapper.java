package cn.itcast.blog.dao.impl.rowmappers;


import cn.itcast.blog.domain.GoodAndFavo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TempRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        GoodAndFavo goodAndFavo=new GoodAndFavo();
        goodAndFavo.setId(resultSet.getInt("id"));
        goodAndFavo.setUser_email(resultSet.getString("user_email"));
        goodAndFavo.setUser_email(resultSet.getString("post_id"));
        return goodAndFavo;
    }
}
