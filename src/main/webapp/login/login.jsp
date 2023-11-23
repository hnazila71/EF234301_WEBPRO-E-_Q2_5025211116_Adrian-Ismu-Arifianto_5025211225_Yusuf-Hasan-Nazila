<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="../Error.jsp"%>
<!-- JSP directive for defining page settings such as language, encoding, and error page -->

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!-- JSP directive to import the Jakarta Standard Tag Library (JSTL) core tag library -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo Management Application</title>

<link rel="stylesheet" href="css/styles.css">
<!-- Linking an external CSS file for styling -->

<style>
    /* Additional CSS for the interactive register page */
    .register-container {
        margin: 50px auto; /* Margin for the registration container */
        padding: 20px; /* Padding inside the registration container */
        max-width: 400px; /* Maximum width of the registration container */
        border: 1px solid #ccc; /* Border around the registration container */
        border-radius: 8px; /* Border radius to round the corners of the container */
        background-color: #f9f9f9; /* Background color of the registration container */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow effect for the container */
    }

    .form {
        display: flex; /* Display as a flex container */
        flex-direction: column; /* Arrange items in a column */
        allign-item: center; /* Typo: should be 'align-items: center;' to center items horizontally */
    }

    .form p {
        margin-top: 10px; /* Top margin for paragraphs inside the form */
        margin-bottom: 5px; /* Bottom margin for paragraphs inside the form */
        font-weight: bold; /* Bold text for paragraphs inside the form */
    }

    .form input[type="text"],
    .form input[type="password"] {
        padding: 8px; /* Padding inside text and password input fields */
        margin-bottom: 15px; /* Bottom margin for text and password input fields */
        border-radius: 5px; /* Border radius to round the corners of input fields */
        border: 1px solid #ccc; /* Border around input fields */
    }

    .form button {
        padding: 10px; /* Padding inside the button */
        margin-top: 15px; /* Top margin for the button */
        background-color: #3498db; /* Background color of the button */
        color: white; /* Text color of the button */
        border: none; /* No border for the button */
        border-radius: 5px; /* Border radius to round the corners of the button */
        cursor: pointer; /* Cursor style on hover */
        transition: background-color 0.3s ease; /* Transition effect for background color */
    }

    .form button:hover {
        background-color: #2980b9; /* Background color of the button on hover */
    }
</style>
</head>

<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<!-- Including a header file -->

<!-- start user register form -->
<div class="register-container">
    <h1 class="h1-class">Log in</h1>

    <form action="RegisterUser" method="POST" class="form">
        <!-- Login form with input fields -->
        <p>First Name:</p>
        <input type="text" name="firstName" placeholder="enter first name" required>

        <p>Last Name:</p>
        <input type="text" name="lastName" placeholder="enter last name" required>

        <p>Username:</p>
        <input type="text" name="userName" placeholder="enter username" required>

        <p>Password:</p>
        <input type="password" name="password" placeholder="enter the password" required>

        <button type="submit">Submit</button>
    </form>
</div>
<!-- end user register-->

<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- Including a footer file -->

</body>
</html>
