package com.example;

import java.sql.Timestamp;

public class Post {
    private int id;
    private String userId;
    private String title;
    private Timestamp deadline;
    private String content;
    private String category;
    private String l_category;
    private int numPeople;
    private String location;
    private String imageUrl;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getDeadline() {
        return deadline;
    }
    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public String getLCategory() {
        return l_category;
    }
    public void setLCategory(String l_category) {
        this.l_category = l_category;
    }
    
    public int getNumPeople() {
        return numPeople;
    }
    public void setNumPeople(int people) {
        this.numPeople = people;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String filename) {
        this.imageUrl = filename;
    }
}
