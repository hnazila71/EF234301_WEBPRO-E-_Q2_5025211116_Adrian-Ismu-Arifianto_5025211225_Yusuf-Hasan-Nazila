package com.test.todo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Establishes a connection to the MySQL database
    public static Connection getConnection() {
        // Database URL, username, and password
        String jdbcURL = "jdbc:mysql://localhost:3306/todos";
        String jdbcUserName = "root";
        String jdbcPassword = "root";

        Connection connection = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);

        } catch (ClassNotFoundException e) {
            // Exception handling for driver not found
            System.out.println("Where is your class file?");
            e.printStackTrace();

        } catch (SQLException e) {
            // Exception handling for failed connection
            System.out.println("Connection Failed!");
            e.printStackTrace();
        }

        // For tracing purposes
        if (connection != null) {
            System.out.println("Connection established successfully to the database!");
        }

        return connection;
    }
}
