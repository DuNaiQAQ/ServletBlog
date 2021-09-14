package cn.itcast.blog.domain;

import java.sql.Timestamp;

public class Article {
    private int id;
    private String email;
    private String title;
    private String text;
    private int status;
    private Timestamp creat_time;
    private Timestamp last_change_time;
    private int count_good;
    private int count_shou;

    public Article(int id, String email, String title, String text, int status, Timestamp creat_time, Timestamp last_change_time,int count_good,int count_shou) {
        this.id = id;
        this.email = email;
        this.title = title;
        this.text = text;
        this.status = status;
        this.creat_time = creat_time;
        this.last_change_time = last_change_time;
        this.count_good=count_good;
        this.count_shou=count_shou;
    }

    public Article() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(Timestamp creat_time) {
        this.creat_time = creat_time;
    }

    public Timestamp getLast_change_time() {
        return last_change_time;
    }

    public void setLast_change_time(Timestamp last_change_time) {
        this.last_change_time = last_change_time;
    }

    public int getCount_good() {
        return count_good;
    }

    public void setCount_good(int count_good) {
        this.count_good = count_good;
    }

    public int getCount_shou() {
        return count_shou;
    }

    public void setCount_shou(int count_shou) {
        this.count_shou = count_shou;
    }
}
