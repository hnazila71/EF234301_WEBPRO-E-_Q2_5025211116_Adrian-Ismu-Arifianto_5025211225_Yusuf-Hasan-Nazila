package com.test.todo.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.test.todo.beans.Todo;
import com.test.todo.dao.ApplicationDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddTodo")
public class AddTodo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the JSP page responsible for adding a new todo
        request.getRequestDispatcher("/todo/add-todo.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form submission
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        boolean status = request.getParameter("status").equals("true"); // Check status value
        String targetDate = request.getParameter("targetDate");

        // Get the username from the session
        String userName = (String) request.getSession().getAttribute("userName");

        // Create a new Todo object
        Todo todo = new Todo(title, description, status, targetDate, userName);

        // Obtain the database connection from the servlet context
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        // Add the new Todo to the database using the ApplicationDao
        int rows = ApplicationDao.addTodo(userName, todo, connection);

        // Logging for tracing purposes
        if (rows == 0) {
            System.out.println("Error! Todo wasn't added");
        } else {
            System.out.println("Todo added successfully!");
        }

        // Redirect the user after adding the Todo
        response.sendRedirect(request.getContextPath() + "/RegisterUser");
    }
}
