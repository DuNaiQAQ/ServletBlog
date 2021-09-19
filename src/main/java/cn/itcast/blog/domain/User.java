package cn.itcast.blog.domain;

import java.sql.Date;

public class User {
    private String Username;
    private String email;
    private String password;
    private Date birth;
    private String status;
    private String code;
    private int role;
    private String self_content;
    private String head;

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getSelf_content() {
        return self_content;
    }

    public void setSelf_content(String self_content) {
        this.self_content = self_content;
    }

    public User(String username, String email, String password, Date birth, String status, String code,int role,String self_content) {
        this.Username = username;
        this.email = email;
        this.password = password;
        this.birth = birth;
        this.status = status;
        this.code = code;
        this.role=role;
        this.self_content=self_content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }
}
