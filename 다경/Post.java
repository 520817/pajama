package com.example;

import java.sql.Timestamp;

public class Post {
    private int id;
    private String userId;
    private String title;
    private Timestamp deadline;

    // Getter and Setter
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
    public void setDeadline(Timestamp deadlineTimestamp) {
        this.deadline = deadlineTimestamp;
    }
}
