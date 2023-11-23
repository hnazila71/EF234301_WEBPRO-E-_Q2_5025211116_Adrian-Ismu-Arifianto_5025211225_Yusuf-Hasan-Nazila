# EF234301_WEBPRO-E-_Q2_5025211116_Adrian-Ismu-Arifianto_5025211225_Yusuf-Hasan-Nazila

#### Contribution
#### Yusuf Hasan Nazila     (5025211225) 40% Frondend + MySQL
#### Adrian Ismu Arifianto  (5025211116) 60% JSP + Frondend

### 1. Register
![WhatsApp Image 2023-11-23 at 21 21 56_c5528722 width="40%"](https://github.com/hnazila71/EF234301_WEBPRO-E-_Q2_5025211116_Adrian-Ismu-Arifianto_5025211225_Yusuf-Hasan-Nazila/assets/114125438/7f8e8576-1be4-4a2b-bdb0-728e0c09f462) 
``` java
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

    // Handling GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Getting the session
        HttpSession session = request.getSession();
        // Getting the username from the session
        String userName = (String) session.getAttribute("userName");

        if (userName == null) {
            String notify = "";

            // Writing any available message to the response
            if (session.getAttribute("message") != null)
                response.getWriter().write((String) session.getAttribute("message"));
            response.getWriter().write(notify);

            // Including the register.jsp page
            request.getRequestDispatcher("/register/register.jsp").include(request, response);
        } else {
            // Getting the database connection from the application context scope
            Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
            // Getting the todos list for the current user
            List<Todo> todos = ApplicationDao.getTodos(userName, connection);

            // Setting the list of todos as an attribute in the request scope
            request.setAttribute("ListTodos", todos);

            // Forwarding the request to todo-list.jsp
            request.getRequestDispatcher("/todo/todo-list.jsp").forward(request, response);
        }
    }

    // Handling POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Getting the database connection from the application context scope
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        // Getting user input from the registration form
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        User user = new User(firstName, lastName, userName, password);

        // Putting the username in the session scope
        request.getSession().setAttribute("userName", userName);

        // Adding the user to the database
        int rows = ApplicationDao.addUser(user, connection);

        // Tracing purposes - Printing messages based on the result of the database operation
        if (rows == 0) {
            System.out.println("sorry! an error occurs");
        } else {
            System.out.println("user registered successfully");
        }

        // Redirecting the user to the RegisterUser servlet (GET request) after registration
        response.sendRedirect(request.getContextPath() + "/RegisterUser");
    }
}
```
### Fungsi `doGet`:
- Fungsi ini berperan saat ada permintaan HTTP dengan metode GET.
- Pertama, akses sesi yang terkait dengan permintaan.
- Selanjutnya, kode mencoba mengambil informasi `userName` dari sesi. `userName` adalah nama pengguna yang telah disimpan sebelumnya.
- Jika tidak ada informasi `userName` yang tersimpan dalam sesi, berarti pengguna belum masuk. Kode akan menampilkan notifikasi pesan jika ada, kemudian menampilkan halaman pendaftaran untuk pengguna yang belum masuk.
- Namun, jika terdapat informasi `userName` (artinya pengguna sudah masuk), koneksi ke data dasar yang diperoleh dari konteks aplikasi. Kemudian, daftar tugas (todos) untuk pengguna yang masuk diambil dari data dasar menggunakan objek `ApplicationDao`.
- Daftar tugas tersebut kemudian disimpan sebagai atribut pada objek permintaan (permintaan), dan pengguna diarahkan ke halaman yang menampilkan daftar tugas (`/todo/todo-list.jsp`).

### Fungsi `doPost`:
- Fungsi ini digunakan saat ada permintaan HTTP dengan metode POST.
- Pertama, kode mengakses koneksi data dasar dari konteks aplikasi.
- Informasi yang diisi oleh pengguna pada formulir pendaftaran diambil dari permintaan (`HttpServletRequest`).
- Nama pengguna (`userName`) yang diisi dalam formulir pendaftaran disimpan ke dalam sesi.
- Data pengguna yang diambil dari formulir tersebut kemudian ditambahkan ke data dasar menggunakan objek `ApplicationDao.addUser`.
- Pesan kesalahan atau keberhasilan penambahan pengguna ke basis data dicetak ke konsol untuk tujuan siklus.
- Akhirnya, pengguna diarahkan kembali ke servlet `RegisterUser` (melalui permintaan GET) setelah proses pendaftaran berhasil.

``` jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="../Error.jsp"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Todo Management Application</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional CSS for the interactive register page */
        /* CSS styles for the registration form */
    </style>
</head>
<body>
    <!-- Include the header -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- Start of user registration form -->
    <div class="register-container">
        <h1 class="h1-class">Register</h1>

        <!-- Registration form -->
        <form action="RegisterUser" method="POST" class="form">
            <!-- Input fields for user details -->
            <p>First Name:</p>
            <input type="text" name="firstName" placeholder="Enter first name" required>

            <p>Last Name:</p>
            <input type="text" name="lastName" placeholder="Enter last name" required>

            <p>Username:</p>
            <input type="text" name="userName" placeholder="Enter username" required>

            <p>Password:</p>
            <input type="password" name="password" placeholder="Enter the password" required>

            <!-- Button to submit the registration form -->
            <button type="submit">Submit</button>
        </form>
    </div>
    <!-- End of user registration form -->

    <!-- Include the footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
```

