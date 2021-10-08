package cn.itcast.blog.dao;

import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.Kind;

import java.util.List;

public interface KindDao {
    public boolean setKind(Kind kind);
    public Kind findkindbyName(String name);
    public List<Article> getKindArticles(int id);
    public boolean deletekind(int id);
    public void getConnectionWithArticle(int a_id,int p_id);
}
