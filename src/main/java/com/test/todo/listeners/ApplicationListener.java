package com.test.todo.listeners;

import java.sql.Connection;
import java.sql.SQLException;

import com.test.todo.dao.DBConnection;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ApplicationListener implements ServletContextListener {

    // Method invoked when the application starts
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // For tracing purposes
            System.out.println("In context Initialized!");
            
            // Get a database connection
            Connection connection = DBConnection.getConnection();
            
            // Set the connection in the servlet context for global accessibility
            sce.getServletContext().setAttribute("dbconnection", connection);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method invoked when the application is about to be stopped
    public void contextDestroyed(ServletContextEvent sce) {
        // Retrieve the connection object from the application context scope
        Connection connection = (Connection) sce.getServletContext().getAttribute("dbconnection");

        // Close the connection
        try {
            connection.close();
            System.out.println("Application Closed successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
