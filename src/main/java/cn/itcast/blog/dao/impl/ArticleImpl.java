package cn.itcast.blog.dao.impl;

import cn.itcast.blog.dao.ArticleDao;
import cn.itcast.blog.dao.impl.rowmappers.ArticleRowMapper;
import cn.itcast.blog.dao.impl.rowmappers.TempRowMapper;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.GoodAndFavo;
import cn.itcast.blog.domain.User;
import cn.itcast.blog.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class ArticleImpl implements ArticleDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Article> findPostArticle(String email) {
        String sql="select article.* from article,user_articleqa where author_email = ? and status = 1";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public List<Article> findAllArticles() {
        String sql="select * from article";
        return template.query(sql,new ArticleRowMapper());
    }

    @Override
    public List<Article> findDraftArticles(String email) {
        String sql="select article.* from article,user_article where user_article.author_email = ? and user_article.article_id=article.id and status = 2";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public List<Article> findRubbishCan(String email) {
        String sql="select article.* from article,user_article where user_article.author_email = ? and user_article.article_id=article.id and status = 3";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    @Override
    public void saveArticle(Article article) {
        String sql="insert into article(title,author_email,text,status,create_time,last_change_time,count_good,count_shou) values(?,?,?,?,?,?,?)";
        template.update(sql,article.getTitle(),article.getEmail(),article.getText(),article.getStatus(),article.getCreat_time(),article.getLast_change_time(),
        article.getCount_good(),article.getCount_shou());
        template.update("insert into kind_post(kind_id,article_id) value(?,?)",article.getKind_id(),article.getId());
        template.update("insert into user_article(author_email,article_id) value(?,?)",article.getEmail(),article.getId());
    }

    @Override
    public void changeStatus(Article article) {
        String sql="update article set status = ? where id = ?";
        template.update(sql,article.getStatus(),article.getId());
    }

    @Override
    public Article findArticleByID(int id) {
        String sql="select * from article where id = ?";
        Article article=(Article) template.queryForObject(sql,new ArticleRowMapper(),id);
        return article;
    }

    @Override
    public void deleteArticle(int id) {
        String sql="delete from article where id = ?";
        template.update(sql,id);
    }

    @Override
    public List<Article> getAllArticles() {
        String sql="select * from article";
        return  template.query(sql,new ArticleRowMapper());
    }

    @Override
    public void updateInfo(Article article) {
        String sql="update article set title=?,author_email=?,text=?,status=?,create_time=?,last_change_time=?,count_good=?,count_shou=?where id = ?";
        template.update(sql,article.getTitle(),article.getEmail(),article.getText(),article.getStatus(),article.getCreat_time(),article.getLast_change_time(),
                article.getCount_good(),article.getCount_shou(),article.getId());
        template.update("update kind_post set kind_id = ?,article_id = ?",article.getKind_id(),article.getId());
        template.update("update user_article set author_email = ?,article_id = ?",article.getEmail(),article.getId());
    }

    @Override
    public boolean setfavorite(String email, int id) {
        String sql="select * from userfavorite where user_email = ? and post_id = ?";
        List<GoodAndFavo> exist=template.query(sql,new TempRowMapper(),email,id);
        if(exist.size()==1){
            return false;
        }else {
            String insql="insert into userfavorite(user_email,post_id) values(?,?)";
            template.update(insql,email,id);
            return true;
        }
    }

    @Override
    public boolean setgood(String email, int id) {
        String sql="select * from userlike where user_email = ? and post_id = ?";
        List<GoodAndFavo> exist=template.query(sql,new TempRowMapper(), email,id);
        if(exist.size()==1){
            return false;
        }else {
            String insql="insert into userlike(user_email,post_id) values(?,?)";
            template.update(insql,email,id);
            return true;
        }
    }

    @Override
    public boolean delfavo(String email, int id) {
        String sql="select * from userfavorite where user_email = ? and post_id = ?";
        List<GoodAndFavo> exist=template.query(sql,new TempRowMapper(), email,id);
        if(exist.size()==1){
            String insql="delete from userfavorite where user_email = ? and post_id = ?";
            template.update(insql,email,id);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Article> findAllPostArticle() {
        String sql="select * from article where status = 1";
        return template.query(sql,new ArticleRowMapper());
    }

    @Override
    public List<Article> readFavorite(String email) {
        List<GoodAndFavo> temp=null;
        String sql="select * from userfavorite where user_email = ?";
        temp=template.query(sql,new TempRowMapper(),email);
        List<Article> favo=new ArrayList<Article>();
        for(int i=0;i<temp.size();i++){
            String sql2="select * from article where id = ?";
            Article article=null;
            try {
                article = (Article) template.queryForObject(sql2, new ArticleRowMapper(), temp.get(i).getPost_id());
            }catch (Exception e){
                e.printStackTrace();
            }
            favo.add(article);
        }
        return favo;
    }


}
