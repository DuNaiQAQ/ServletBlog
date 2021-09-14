package cn.itcast.blog.dao;

import cn.itcast.blog.domain.Article;

import java.util.List;

public interface ArticleDao {
    public List<Article> findPostArticle(String email);
    public List<Article> findAllArticles();
    public List<Article> findDraftArticles(String email);
    public List<Article> findRubbishCan(String email);
}
