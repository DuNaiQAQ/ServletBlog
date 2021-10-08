package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.KindDao;
import cn.itcast.blog.dao.impl.rowmappers.KindGetRowMapper;
import cn.itcast.blog.dao.impl.rowmappers.KindRowMapper;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.Kind;
import cn.itcast.blog.domain.Kindpost;
import cn.itcast.blog.service.ArticleService;
import cn.itcast.blog.service.impl.ArticleServiceImpl;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class KindDaoImpl implements KindDao {
    JdbcTemplate template=new JdbcTemplate();

    @Override
    public boolean setKind(Kind kind) {
        String sqlbefor="select * from kinds where kind_name = ?";
        if(template.queryForObject(sqlbefor,new KindGetRowMapper(),kind.getKind_name())==null){
            return false;
        }else {
            String sql = "insert into kinds(id,kind_name) values(?,?)";
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
        ArticleService service=new ArticleServiceImpl();
        List<Kindpost> temp=null;
        List<Article> kindArticles=new ArrayList<>();
        String sql="select * from kindpost where kind_id = ?";
        temp=template.query(sql,new KindRowMapper(),id);
        for(int i=0;i<temp.size();i++){
            kindArticles.add(service.findarticleById(temp.get(i).getArticle_id()));
        }
        return kindArticles;
    }

    @Override
    public boolean deletekind(int id) {
        String sqlbefor="select * from kinds where id = ?";
        if(template.queryForObject(sqlbefor,new KindGetRowMapper(),id)==null){
            return false;
        }else {
            String sql = "delete from kinds where id = ?";
            template.update(sql,id);
            return true;
        }
    }

    @Override
    public void getConnectionWithArticle(int a_id, int p_id) {
        String sql="insert into kindpost(article_id,kind_id) values(?,?)";
        template.update(sql,a_id,p_id);
    }
}
