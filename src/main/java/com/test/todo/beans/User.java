package com.test.todo.beans;

// Class representing a User
public class User {
    // Attributes/fields of the User class
    private String firstName; // First name of the user
    private String lastName; // Last name of the user
    private String userName; // Username of the user
    private String password; // Password of the user

    // Constructor to create a User with all attributes
    public User(String firstName, String lastName, String userName, String password) {
        // Initialize user attributes with provided values
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
    }

    // Getter method for retrieving the user's first name
    public String getFirstName() {
        return firstName;
    }

    // Setter method for setting the user's first name
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    // Getter method for retrieving the user's last name
    public String getLastName() {
        return lastName;
    }

    // Setter method for setting the user's last name
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    // Getter method for retrieving the user's username
    public String getUserName() {
        return userName;
    }

    // Setter method for setting the user's username
    public void setUserName(String userName) {
        this.userName = userName;
    }

    // Getter method for retrieving the user's password
    public String getPassword() {
        return password;
    }

    // Setter method for setting the user's password
    public void setPassword(String password) {
        this.password = password;
    }
}
