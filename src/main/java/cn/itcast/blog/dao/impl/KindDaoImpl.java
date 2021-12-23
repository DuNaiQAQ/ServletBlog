package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.KindDao;
import cn.itcast.blog.dao.impl.rowmappers.ArticleRowMapper;
import cn.itcast.blog.dao.impl.rowmappers.KindGetRowMapper;
import cn.itcast.blog.dao.impl.rowmappers.KindRowMapper;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.Kind;
import cn.itcast.blog.domain.Kindpost;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;
import cn.itcast.blog.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class KindDaoImpl implements KindDao {
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public boolean setKind(Kind kind) {
        String sqlbefor="select * from kinds where kind_name = ?";
        Kind kind1=null;
        try {
            kind1 = (Kind) template.queryForObject(sqlbefor, new KindGetRowMapper(), kind.getKind_name());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(kind1!=null){
            return false;
        }else {
            String sql = "insert into kinds(kind_name) values(?)";
            template.update(sql, kind.getKind_name());
            return true;
        }
    }

    @Override
    public Kind findkindbyName(String name) {
        String sqlbefor="select * from kinds where kind_name = ?";
        return (Kind) template.queryForObject(sqlbefor,new KindGetRowMapper(),name);
    }

    @Override
    public List<Article> getKindArticles(int id) {
        String sql="select article.* from article,kind_post where kind_post.kind_id = ? and kind_post.article_id=article.id";
        return template.query(sql,new ArticleRowMapper(),id);
    }

    @Override
    public boolean deletekind(int id) {
        String sqlbefor="select * from kinds where id = ?";
        Kind kind=null;
        try {
            kind = (Kind) template.queryForObject(sqlbefor, new KindGetRowMapper(), kind.getKind_name());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(kind==null){
            return false;
        }else {
            String sql = "delete from kinds where id = ?";
            template.update(sql,id);
            return true;
        }
    }

    /**
     * 方法已废弃！
     * */
    @Override
    public void getConnectionWithArticle(int a_id, int p_id) {
        String sql="insert into kind_post(article_id,kind_id) values(?,?)";
        template.update(sql,a_id,p_id);
    }

    @Override
    public List<Kind> getKindList() {
        String sql="select * from kinds";
        return template.query(sql,new KindGetRowMapper());
    }
}
