package cn.itcast.blog.service.impl;

import cn.itcast.blog.dao.ArticleDao;
import cn.itcast.blog.dao.impl.ArticleImpl;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.service.ArticleService;

import java.util.List;

public class ArticleServiceImpl implements ArticleService {

    private ArticleDao articleDao=new ArticleImpl();
    @Override
    public List<Article> getAllPostArticles() {
        return articleDao.findAllArticles();
    }

    @Override
    public List<Article> getPostArticles(String email) {
        return articleDao.findPostArticle(email);
    }

    @Override
    public List<Article> getDraftArticles(String email) {
        return articleDao.findDraftArticles(email);
    }

    @Override
    public List<Article> getRubbishCan(String email) {
        return articleDao.findRubbishCan(email);
    }

    @Override
    public void saveArticle(Article article) {
        articleDao.saveArticle(article);
    }

    @Override
    public Article findarticleById(int id) {
        return articleDao.findArticleByID(id);
    }

    @Override
    public void changeStatus(Article article) {
        articleDao.changeStatus(article);
    }

    @Override
    public boolean deleteArticle(int article) {
        return false;
    }

    @Override
    public List<Article> getAllArticles() {
        return articleDao.getAllArticles();
    }
}
