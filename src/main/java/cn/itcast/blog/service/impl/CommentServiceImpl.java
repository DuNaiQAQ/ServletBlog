package cn.itcast.blog.service.impl;

import cn.itcast.blog.dao.CommentDao;
import cn.itcast.blog.dao.impl.CommentDaoImpl;
import cn.itcast.blog.domain.Comment;
import cn.itcast.blog.service.CommetService;

import java.util.List;

public class CommentServiceImpl implements CommetService {
    CommentDao commentDao=new CommentDaoImpl();

    @Override
    public void saveComment(Comment comment) {
        commentDao.saveComment(comment);
    }

    @Override
    public List<Comment> loadComment(String email) {
        return commentDao.loadComment(email);
    }

    @Override
    public List<Comment> loadAllComment() {
        return commentDao.loadAllComment();
    }

    @Override
    public List<Comment> loadArticleComment(int id) {
        return commentDao.loadArticleComment(id);
    }

    @Override
    public void deleteComment(int id) {
        commentDao.deleteComment(id);
    }
}
