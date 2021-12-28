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

/**
 * <p>文章类Dao实现类</p>
 * @author 2020401308 李翊君
 * @version 1.0
 * @see cn.itcast.blog.dao.ArticleDao
 * */
public class ArticleImpl implements ArticleDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * <p>通过作者邮箱来查找到文章信息</p>
     * @param email 邮箱 String类型
     * @return 返回查找到的文章列表
     * */
    @Override
    public List<Article> findPostArticle(String email) {
        String sql="select article.* from article,user_article where user_article.author_email = ? and user_article.article_id=article.id and status = 1";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    /**
     * <p>直接返回数据库中所有文章的信息</p>
     * @return 查找到的文章列表
     * */
    @Override
    public List<Article> findAllArticles() {
        String sql="select * from article";
        return template.query(sql,new ArticleRowMapper());
    }

    /**
     * <p>通过作者邮箱来查找特定用户在草稿箱中的文章</p>
     * @param email 用户邮箱
     * @return 查找到的文章列表
     * */
    @Override
    public List<Article> findDraftArticles(String email) {
        String sql="select article.* from article,user_article where user_article.author_email = ? and user_article.article_id=article.id and status = 2";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    /**
     * <p>通过作者邮箱来查找特定用户在垃圾箱中的文章</p>
     * @param email 用户邮箱
     * @return 查找到的文章列表
     * */
    @Override
    public List<Article> findRubbishCan(String email) {
        String sql="select article.* from article,user_article where user_article.author_email = ? and user_article.article_id=article.id and status = 3";
        return template.query(sql,new ArticleRowMapper(),email);
    }

    /**
     * <p>保存文章或者发布文章</p>
     * @param article 文章信息
     * */
    @Override
    public void saveArticle(Article article) {
        String sql="insert into article(title,author_email,text,status,create_time,last_change_time,count_good,count_shou) values(?,?,?,?,?,?,?,?)";
        template.update(sql,article.getTitle(),article.getEmail(),article.getText(),article.getStatus(),article.getCreat_time(),article.getLast_change_time(),
        article.getCount_good(),article.getCount_shou());
        int id=template.queryForInt("select max(id) from article");
        article.setId(id+1);
        template.update("insert into kind_post(kind_id,article_id) value(?,?)",article.getKind_id(),article.getId());
        template.update("insert into user_article(author_email,article_id) value(?,?)",article.getEmail(),article.getId());
    }

    /**
     * <p>修改文章的状态</p>
     * <p>1:已发布 2:草稿箱 3:垃圾箱</p>
     * @param article 文章信息
     * */
    @Override
    public void changeStatus(Article article) {
        String sql="update article set status = ? where id = ?";
        template.update(sql,article.getStatus(),article.getId());
    }

    /**
     * <p>通过文章ID来查找文章</p>
     * @param id 文章ID
     * @return 文章信息
     * */
    @Override
    public Article findArticleByID(int id) {
        String sql="select * from article where id = ?";
        Article article=(Article) template.queryForObject(sql,new ArticleRowMapper(),id);
        return article;
    }

    /**
     * <p>通过文章ID删除文章</p>
     * @param id 文章ID
     * */
    @Override
    public void deleteArticle(int id) {
        String sql="delete from article where id = ?";
        template.update(sql,id);
    }

    /**
     * <p>直接获取所有在数据库中的文章的信息</p>
     * @return 文章信息
     * */
    @Override
    public List<Article> getAllArticles() {
        String sql="select * from article";
        return  template.query(sql,new ArticleRowMapper());
    }

    /**
     * <p>更新文章信息</p>
     * @param article 文章信息
     * */
    @Override
    public void updateInfo(Article article) {
        String sql="update article set title=?,author_email=?,text=?,status=?,create_time=?,last_change_time=?,count_good=?,count_shou=? where id = ?";
        template.update(sql,article.getTitle(),article.getEmail(),article.getText(),article.getStatus(),article.getCreat_time(),article.getLast_change_time(),
                article.getCount_good(),article.getCount_shou(),article.getId());
        template.update("update kind_post set kind_id = ?,article_id = ?",article.getKind_id(),article.getId());
        template.update("update user_article set author_email = ?,article_id = ?",article.getEmail(),article.getId());
    }

    /**
     * <p>用户收藏文章</p>
     * @param id 文章id
     * @param email 用户邮箱
     * @return 操作是否成功
     * */
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

    /**
     * <p>设置用户文章点赞</p>
     * @param id 文章id
     * @param email 用户邮箱
     * @return 操作是否成功
     * */
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

    /**
     * <p>删除用户文章点赞</p>
     * @param id 文章id
     * @param email 用户邮箱
     * @return 操作是否成功
     * */
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

    /**
     * <p>直接返回数据库中所有已发布文章的信息</p>
     * @return 查找到的文章列表
     * */
    @Override
    public List<Article> findAllPostArticle() {
        String sql="select * from article where status = 1";
        return template.query(sql,new ArticleRowMapper());
    }

    /**
     * <p>获取某个用户收藏的文章列表</p>
     * @param email 用户邮箱
     * @return 文章列表
     * */
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
