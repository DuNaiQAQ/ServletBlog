package cn.itcast.blog.dao.impl.rowmappers;

import cn.itcast.blog.domain.Kind;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KindGetRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Kind kind=new Kind();
        kind.setId(resultSet.getInt("id"));
        kind.setKind_name(resultSet.getString("kind_name"));
        return kind;
    }
}
