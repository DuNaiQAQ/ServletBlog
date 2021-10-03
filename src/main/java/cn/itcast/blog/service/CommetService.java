package cn.itcast.blog.service;

import cn.itcast.blog.domain.Comment;

import java.util.List;

public interface CommetService {
    public void saveComment(Comment comment);
    public List<Comment> loadComment(String email);
    public List<Comment> loadAllComment();
    public List<Comment> loadArticleComment(int id);
    public void deleteComment(int id);
}
