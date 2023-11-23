package com.test.todo.beans;

// Class representing a Todo item
public class Todo {
    // Attributes/fields of the Todo class
    private int id; // Unique identifier for a Todo
    private String title; // Title of the Todo
    private String description; // Description of the Todo
    private boolean status; // Status of the Todo (completed or in progress)
    private String targetDate; // Target date for the Todo
    private String userName; // Username associated with the Todo

    // Constructor to create a Todo with all attributes
    public Todo(int id, String title, String description, boolean status, String targetDate, String userName) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
        this.targetDate = targetDate;
        this.userName = userName;
    }

    // Constructor to create a Todo without an ID (used for creation)
    public Todo(String title, String description, boolean status, String targetDate, String userName) {
        this.title = title;
        this.description = description;
        this.status = status;
        this.targetDate = targetDate;
        this.userName = userName;
    }

    // Getter method for retrieving the title of the Todo
    public String getTitle() {
        return title;
    }

    // Setter method for setting the title of the Todo
    public void setTitle(String title) {
        this.title = title;
    }

    // Getter method for retrieving the description of the Todo
    public String getDescription() {
        return description;
    }

    // Setter method for setting the description of the Todo
    public void setDescription(String description) {
        this.description = description;
    }

    // Getter method for retrieving the status of the Todo
    public boolean getStatus() {
        return status;
    }

    // Setter method for setting the status of the Todo
    public void setStatus(boolean status) {
        this.status = status;
    }

    // Getter method for retrieving the target date of the Todo
    public String getTargetDate() {
        return targetDate;
    }

    // Setter method for setting the target date of the Todo
    public void setTargetDate(String targetDate) {
        this.targetDate = targetDate;
    }

    // Getter method for retrieving the ID of the Todo
    public int getId() {
        return id;
    }

    // Setter method for setting the ID of the Todo
    public void setId(int id) {
        this.id = id;
    }

    // Getter method for retrieving the username associated with the Todo
    public String getUserName() {
        return userName;
    }

    // Setter method for setting the username associated with the Todo
    public void setUserName(String userName) {
        this.userName = userName;
    }
}
