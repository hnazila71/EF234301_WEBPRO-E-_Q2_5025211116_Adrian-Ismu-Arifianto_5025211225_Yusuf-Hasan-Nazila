package com.test.todo.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.test.todo.beans.Todo;
import com.test.todo.beans.User;
import com.test.todo.dao.ApplicationDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session
        HttpSession session = request.getSession();

        // Retrieve the username from the session
        String userName = (String) session.getAttribute("userName");

        if (userName == null) {
            String notify = "";

            // Display any messages stored in the session
            if (session.getAttribute("message") != null)
                response.getWriter().write((String) session.getAttribute("message"));
            response.getWriter().write(notify);

            // Forward the request to the register.jsp page
            request.getRequestDispatcher("/register/register.jsp").include(request, response);
        } else {
            // If the user is already logged in, fetch their todos
            Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
            List<Todo> todos = ApplicationDao.getTodos(userName, connection);

            // Set the todos attribute for the request
            request.setAttribute("ListTodos", todos);

            // Forward the request to the todo-list.jsp page
            request.getRequestDispatcher("/todo/todo-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the database connection from the context scope
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        
        // Retrieve user details from the request parameters
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        
        // Create a User object with the retrieved details
        User user = new User(firstName, lastName, userName, password);

        // Store the username in the session
        request.getSession().setAttribute("userName", userName);

        // Add the user to the database
        int rows = ApplicationDao.addUser(user, connection);

        // -------Tracing purposes--------//

        if (rows == 0) {
            System.out.println("sorry! an error occurs");
        } else {
            System.out.println("user register successfully");
        }

        // Redirect the user to the RegisterUser servlet again
        response.sendRedirect(request.getContextPath() + "/RegisterUser");
    }
}
