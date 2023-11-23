package com.test.todo.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.test.todo.dao.ApplicationDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTodo")
public class DeleteTodo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the database connection from the servlet context
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        // Get the todoId parameter from the request
        int todoId = Integer.parseInt(request.getParameter("todoId"));

        // Call the ApplicationDao to delete the todo item
        int rowsAffected = ApplicationDao.deleteTodo(todoId, connection);

        // Log an error message if deletion fails
        if (rowsAffected == 0) {
            System.out.println("Error! Can't delete the todo");
        }

        // Redirect the user to the "/RegisterUser" page after deletion
        response.sendRedirect(request.getContextPath() + "/RegisterUser");
    }
}
