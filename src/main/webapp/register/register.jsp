<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="../Error.jsp"%>
<!-- JSP directive for defining page settings, language, encoding, and error page -->

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!-- JSP directive to import the Jakarta Standard Tag Library (JSTL) core tag library -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo Management Application</title>

<link rel="stylesheet" href="css/styles.css">
<!-- Linking an external CSS file to style the HTML content -->

<style>
/* Styling for the container of the registration form */
.register-container {
    margin: 50px auto; /* Sets top and bottom margin to 50px, left and right margin automatic */
    padding: 20px; /* Adds 20px padding inside the container */
    max-width: 400px; /* Sets the maximum width of the container to 400px */
    border: 1px solid #ccc; /* Adds a 1px solid border with light gray color */
    border-radius: 8px; /* Rounds the corners of the container */
    background-color: #f9f9f9; /* Sets the background color to a light gray */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Adds a subtle box shadow effect */
}

/* Styling for the registration form */
.form {
    display: flex; /* Sets the display as a flex container */
    flex-direction: column; /* Arranges flex items in a column */
    align-item: center; /* Typo: should be 'align-items: center;' to horizontally center the items */
}

.form p {
    margin-top: 10px; /* Sets top margin for paragraphs inside the form */
    margin-bottom: 5px; /* Sets bottom margin for paragraphs inside the form */
    font-weight: bold; /* Makes the text bold for paragraphs inside the form */
}

.form input[type="text"],
.form input[type="password"] {
    padding: 8px; /* Adds padding inside text and password input fields */
    margin-bottom: 15px; /* Sets bottom margin for text and password input fields */
    border-radius: 5px; /* Rounds the corners of text and password input fields */
    border: 1px solid #ccc; /* Adds a 1px solid border with light gray color */
}

.form button {
    padding: 10px; /* Adds padding inside the button */
    margin-top: 15px; /* Sets top margin for the button */
    background-color: #3498db; /* Sets the background color of the button */
    color: white; /* Sets the text color of the button to white */
    border: none; /* Removes the border of the button */
    border-radius: 5px; /* Rounds the corners of the button */
    cursor: pointer; /* Changes the cursor to a pointer on hover */
    transition: background-color 0.3s ease; /* Adds a smooth transition effect to background color changes */
}

.form button:hover {
    background-color: #2980b9; /* Changes the background color of the button on hover */
}

</style>
</head>

<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<!-- Including a header file -->

<!-- start user register form -->
<div class="register-container">
    <h1 class="h1-class">Register</h1>

    <form action="RegisterUser" method="POST" class="form">
        <!-- Registration form with input fields -->
        <p>First Name:</p>
        <input type="text" name="firstName" placeholder="Enter first name" required>

        <p>Last Name:</p>
        <input type="text" name="lastName" placeholder="Enter last name" required>

        <p>Username:</p>
        <input type="text" name="userName" placeholder="Enter username" required>

        <p>Password:</p>
        <input type="password" name="password" placeholder="Enter the password" required>

        <button type="submit">Submit</button>
    </form>
</div>
<!-- end user register -->

<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- Including a footer file -->

</body>
</html>
