package cn.itcast.blog.service.impl;

import cn.itcast.blog.dao.KindDao;
import cn.itcast.blog.dao.impl.KindDaoImpl;
import cn.itcast.blog.domain.Article;
import cn.itcast.blog.domain.Kind;
import cn.itcast.blog.service.KindService;

import java.util.List;

public class KindServiceImpl implements KindService {
    KindDao kindDao=new KindDaoImpl();
    @Override
    public boolean setKind(Kind kind) {
        return kindDao.setKind(kind);
    }

    @Override
    public Kind findkindbyName(String name) {
        return kindDao.findkindbyName(name);
    }

    @Override
    public List<Article> getKindArticles(int id) {
        return kindDao.getKindArticles(id);
    }

    @Override
    public boolean deletekind(int id) {
        return kindDao.deletekind(id);
    }

    @Override
    public void getConnectionWithArticle(int a_id, int p_id) {
        kindDao.getConnectionWithArticle(a_id,p_id);
    }
}
