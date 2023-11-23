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

@WebServlet("/EditTodo")
public class EditTodo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the todo details from the database using the todoId
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        int todoId = Integer.parseInt(request.getParameter("todoId"));

        Todo todo = ApplicationDao.getTodo(todoId, connection);

        // Set attributes in the session and request
        request.getSession().setAttribute("todoId", todoId);
        request.setAttribute("todo", todo);

        // Forward the request to the edit-todo.jsp page for displaying the form
        request.getRequestDispatcher("/todo/edit-todo.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get todo details from the form
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        int id = (int) request.getSession().getAttribute("todoId");
        String userName = (String) request.getSession().getAttribute("userName");

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        boolean status = request.getParameter("status").equals("true") ? true : false;
        String targetDate = request.getParameter("targetDate");

        // Create a Todo object with updated details
        Todo todo = new Todo(id, title, description, status, targetDate, userName);

        // Update the todo in the database
        int rows = ApplicationDao.updateTodo(todo, connection);

        // Log an error message if the update operation fails
        if (rows == 0) {
            System.out.println("Error! Can't edit the todo");
        } else {
            System.out.println("Todo updated successfully!");
        }

        // Redirect the user back to the "/RegisterUser" servlet after the update
        response.sendRedirect(request.getContextPath() + "/RegisterUser");
    }
}
