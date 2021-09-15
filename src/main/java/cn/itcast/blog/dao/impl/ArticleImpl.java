package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.ArticleDao;
import cn.itcast.blog.dao.impl.rowmappers.ArticleRowMapper;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ArticleImpl implements ArticleDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Article> findPostArticle(String email) {
        String sql="select * from article where author_email = ? and status = 1";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public List<Article> findAllArticles() {
        String sql="select * from article";
        return template.query(sql,new ArticleRowMapper());
    }

    @Override
    public List<Article> findDraftArticles(String email) {
        String sql="select * from article where author_email = ? and status = 2";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public List<Article> findRubbishCan(String email) {
        String sql="select * from article where author_email = ? and status = 3";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public void saveArticle(Article article) {
        String sql="insert into article(author_email,title,text,status,creat_time,last_change_time,count_good,count_shou)";
        template.update(sql,article.getEmail(),article.getTitle(),article.getText(),article.getCreat_time(),article.getLast_change_time(),
        article.getCount_good(),article.getCount_shou());
    }

    @Override
    public void changeStatus(Article article) {
        String sql="update article set status = ? where id = ?";
        template.update(sql,article.getStatus());
    }
}
