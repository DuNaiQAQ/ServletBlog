package cn.itcast.blog.service;

import cn.itcast.blog.domain.Article;

import java.util.List;

public interface ArticleService {
    public List<Article> getAllPostArticles();
    public List<Article> getPostArticles(String email);
    public List<Article> getDraftArticles(String email);
    public List<Article> getRubbishCan(String email);
    public void saveArticle(Article article);
    public Article findarticleById(int id);
    public void changeStatus(Article article);
    public boolean deleteArticle(int article);
    public List<Article> getAllArticles();
    public void updateInfo(Article article);
    public boolean addlike(String email,int id);
    public boolean addfavo(String email,int id);
}
