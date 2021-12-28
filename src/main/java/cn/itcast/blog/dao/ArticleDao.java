package cn.itcast.blog.dao;

import cn.itcast.blog.domain.Article;

import java.util.List;

/**
 * 文章控制Dao层
 * @author 2020401308 李翊君
 * @version 1.0
 * */
public interface ArticleDao {
    public List<Article> findPostArticle(String email);
    public List<Article> findAllArticles();
    public List<Article> findDraftArticles(String email);
    public List<Article> findRubbishCan(String email);
    public void saveArticle(Article article);
    public void changeStatus(Article article);
    public Article findArticleByID(int id);
    public void deleteArticle(int id);
    public List<Article> getAllArticles();
    public void updateInfo(Article article);
    public boolean setfavorite(String email,int id);
    public boolean setgood(String email,int id);
    public boolean delfavo(String email,int id);
    public List<Article> findAllPostArticle();
    public List<Article> readFavorite(String email);
}
