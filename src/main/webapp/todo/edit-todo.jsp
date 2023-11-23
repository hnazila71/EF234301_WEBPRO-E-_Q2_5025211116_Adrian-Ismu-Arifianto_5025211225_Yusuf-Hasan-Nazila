<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="../Error.jsp"%>
<!-- JSP directive for defining page settings such as language, encoding, and error page -->

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!-- JSP directive to import the Jakarta Standard Tag Library (JSTL) core tag library -->

<html>
<head>
    <title>Todo Management Application</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <!-- Linking an external CSS file for styling -->

    <style>
        /* Additional CSS for the Edit Todo page */
        body {
            font-family: 'Arial', sans-serif; /* Font family for the entire body */
            margin: 0; /* Resetting margin */
            padding: 0; /* Resetting padding */
            background-color: #f5f5f5; /* Background color for the body */
        }

        .add-todo-container {
            background-color: #fff; /* Background color for the container */
            max-width: 600px; /* Maximum width of the container */
            margin: 20px auto; /* Margin for the container */
            padding: 20px; /* Padding inside the container */
            border-radius: 8px; /* Border radius to round the corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow effect */
        }

        h1 {
            font-size: 24px; /* Font size for the heading */
            margin-bottom: 20px; /* Bottom margin for the heading */
            text-align: center; /* Center alignment for the heading */
        }

        form {
            display: flex; /* Display as a flex container */
            flex-direction: column; /* Arrange items in a column */
        }

        p {
            font-weight: bold; /* Bold text for paragraphs */
            margin-top: 10px; /* Top margin for paragraphs */
        }

        .input {
            padding: 8px; /* Padding inside input fields */
            margin-bottom: 15px; /* Bottom margin for input fields */
            border-radius: 5px; /* Border radius to round the corners of input fields */
            border: 1px solid #ccc; /* Border around input fields */
            width: calc(100% - 20px); /* Adjust input width */
        }

        .spec {
            width: calc(100% - 20px); /* Adjust select width */
        }

        button {
            padding: 10px; /* Padding inside the button */
            background-color: #3498db; /* Background color of the button */
            color: white; /* Text color of the button */
            border: none; /* No border for the button */
            border-radius: 5px; /* Border radius to round the corners of the button */
            cursor: pointer; /* Cursor style */
            transition: background-color 0.3s ease; /* Transition effect */
            width: 100px; /* Width of the button */
            margin-top: 15px; /* Top margin for the button */
            margin-left: auto; /* Aligning the button to the right */
            margin-right: auto; /* Aligning the button to the right */
            display: block; /* Display as a block element */
        }

        button:hover {
            background-color: #2980b9; /* Background color of the button on hover */
        }

        @media screen and (max-width: 600px) {
            /* Media query for responsiveness */
            .add-todo-container {
                margin: 10px; /* Margin adjustment for smaller screens */
                padding: 15px; /* Padding adjustment for smaller screens */
            }

            .input,
            .spec,
            button {
                width: calc(100% - 10px); /* Width adjustment for smaller screens */
                margin-left: 5px; /* Margin adjustment for smaller screens */
                margin-right: 5px; /* Margin adjustment for smaller screens */
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <!-- Including a header file -->

    <div class="add-todo-container">
        <h1>Edit Todo</h1>

        <form action="EditTodo" method="POST">
            <!-- Form for editing a todo -->
            <p>Todo Title:</p>
            <input type="text" name="title" value="<c:out value="${todo.title}" />" class="input" required>

            <p>Todo Description:</p>
            <input type="text" name="description" value="<c:out value="${todo.description}" />" class="input" required>

            <p>Todo Status:</p>
            <select name="status" class="input spec">
                <!-- Dropdown for selecting status -->
                <option value="false">In Progress</option>
                <option value="true">Complete</option>
            </select>

            <p>Todo Target Date:</p>
            <input type="date" name="targetDate" value="<c:out value="${todo.targetDate}"/>" class="input" required>

            <button type="submit">Save</button>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!-- Including a footer file -->
</body>
</html>
