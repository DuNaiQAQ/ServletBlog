package cn.itcast.blog.domain;

import org.joda.time.DateTime;

public class Comment {
    private long id;
    private long post_id;
    private String uname_email;
    private String content;
    private DateTime ctime;
    private long parent;
    private String parent_name;

    public Comment() {
    }

    public Comment(long id, long post_id, String uname_email, String content, DateTime ctime, long parent, String parent_name) {
        this.id = id;
        this.post_id = post_id;
        this.uname_email = uname_email;
        this.content = content;
        this.ctime = ctime;
        this.parent = parent;
        this.parent_name = parent_name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getPost_id() {
        return post_id;
    }

    public void setPost_id(long post_id) {
        this.post_id = post_id;
    }

    public String getUname_email() {
        return uname_email;
    }

    public void setUname_email(String uname_email) {
        this.uname_email = uname_email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public DateTime getCtime() {
        return ctime;
    }

    public void setCtime(DateTime ctime) {
        this.ctime = ctime;
    }

    public long getParent() {
        return parent;
    }

    public void setParent(long parent) {
        this.parent = parent;
    }

    public String getParent_name() {
        return parent_name;
    }

    public void setParent_name(String parent_name) {
        this.parent_name = parent_name;
    }
}
