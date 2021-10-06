package cn.itcast.blog.dao;

import cn.itcast.blog.domain.Article;

import java.util.List;

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
}
