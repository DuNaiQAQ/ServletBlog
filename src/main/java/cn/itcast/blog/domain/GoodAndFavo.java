package cn.itcast.blog.domain;

public class GoodAndFavo {
    private int id;
    private String user_email;
    private String post_id;

    public GoodAndFavo(int id, String user_email, String post_id) {
        this.id = id;
        this.user_email = user_email;
        this.post_id = post_id;
    }

    public GoodAndFavo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }
}
