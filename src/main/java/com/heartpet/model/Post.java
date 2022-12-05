package com.heartpet.model;

public class Post {
    private int postId;
    private String nickName;
    private String title;
    public Post(int num, String name, String book){
        this.nickName = name;
        this.postId = num;
        this.title = book;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
