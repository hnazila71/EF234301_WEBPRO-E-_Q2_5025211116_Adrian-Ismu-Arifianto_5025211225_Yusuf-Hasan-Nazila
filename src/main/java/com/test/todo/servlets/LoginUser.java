package com.test.todo.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.test.todo.beans.Todo;
import com.test.todo.dao.ApplicationDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");

        if (userName == null) { // check if the user is registered
            String notify = "";

            if (session.getAttribute("message") != null)
                response.getWriter().write((String) session.getAttribute("message"));

            response.getWriter().write(notify);

            request.getRequestDispatcher("/login/login.jsp").include(request, response);

        } else {
            // If user is already logged in, fetch their todos and display the todo list
            Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
            List<Todo> todos = ApplicationDao.getTodos(userName, connection);

            request.setAttribute("ListTodos", todos);

            request.getRequestDispatcher("/todo/todo-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user's todos from the database
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        String userName = request.getParameter("userName");
        List<Todo> todos = ApplicationDao.getTodos(userName, connection);

        // Put the username in the session scope
        request.getSession().setAttribute("userName", userName);

        // Put todos in the request scope
        request.setAttribute("ListTodos", todos);

        // SendRedirect (PRG) pattern - Redirect to the doGet method to display the todos
        response.sendRedirect(request.getContextPath() + "/LoginUser");
    }

}
