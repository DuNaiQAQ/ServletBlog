package cn.itcast.blog.domain;

import com.sun.tools.corba.se.idl.constExpr.Times;
import org.joda.time.DateTime;

import java.sql.Timestamp;

public class Comment {
    private long id;
    private long post_id;
    private String uname_email;
    private String content;
    private Timestamp ctime;
    private long parent;
    private String parent_name;
    private int count_good;
    private String uname_head;

    public Comment() {
    }

    public Comment(long id, long post_id, String uname_email, String content, Timestamp ctime, long parent, String parent_name, int count_good,String uname_head) {
        this.id = id;
        this.post_id = post_id;
        this.uname_email = uname_email;
        this.content = content;
        this.ctime = ctime;
        this.parent = parent;
        this.parent_name = parent_name;
        this.count_good=count_good;
        this.uname_head=uname_head;
    }

    public String getUname_head() {
        return uname_head;
    }

    public void setUname_head(String uname_head) {
        this.uname_head = uname_head;
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

    public Timestamp getCtime() {
        return ctime;
    }

    public void setCtime(Timestamp ctime) {
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

    public int getCount_good() {
        return count_good;
    }

    public void setCount_good(int count_good) {
        this.count_good = count_good;
    }
}
