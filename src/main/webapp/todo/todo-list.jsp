<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="../Error.jsp"%>
<!-- JSP directive defining page settings such as language, encoding, and error handling page -->

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!-- JSP directive to import the Jakarta Standard Tag Library (JSTL) core tag library -->

<html>
<head>
    <title>To-do Management Application</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <!-- Linking an external CSS file for styling -->

    <style>
        /* CSS for the List of To-dos page */
        body {
            font-family: 'Arial', sans-serif; /* Font family for the entire body */
            margin: 0; /* Resetting margin */
            padding: 0; /* Resetting padding */
            background-color: #f5f5f5; /* Background color for the body */
        }

        .list-todo-container {
            background-color: #fff; /* Background color for the container */
            max-width: 800px; /* Maximum width of the container */
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

        hr {
            margin-bottom: 20px; /* Bottom margin for horizontal rule */
        }

        .add-todo {
            display: block; /* Display as a block element */
            width: fit-content; /* Adjusting width to fit content */
            padding: 10px 15px; /* Padding inside the element */
            margin-bottom: 20px; /* Bottom margin */
            text-decoration: none; /* No text decoration */
            background-color: #3498db; /* Background color */
            color: #fff; /* Text color */
            border-radius: 5px; /* Border radius */
            transition: background-color 0.3s ease; /* Transition effect */
            text-align: center; /* Center alignment */
        }

        .add-todo:hover {
            background-color: #2980b9; /* Background color on hover */
        }

        table {
            width: 100%; /* Table width */
            border-collapse: collapse; /* Collapse table borders */
        }

        th, td {
            border: 1px solid #ddd; /* Border for table cells */
            padding: 8px; /* Padding inside table cells */
            text-align: left; /* Left-align text */
        }

        th {
            background-color: #f2f2f2; /* Background color for table header */
        }

        td a {
            text-decoration: none; /* No text decoration for links */
            color: #3498db; /* Link color */
            margin-right: 10px; /* Right margin for links */
        }

        td a:hover {
            text-decoration: underline; /* Underline links on hover */
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <!-- Including a header file -->

    <!-- List todo area -->
    <div class="list-todo-container">
        <h1>List of To-dos</h1>
        <hr>
        <a class="add-todo" href="AddTodo">Add To-do list</a>
        <!-- Link to add a new to-do -->
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Target Date</th>
                    <th>To-do list Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate through list of to-dos -->
                <c:if test="${requestScope.ListTodos != null}">
                    <c:forEach var="todo" items="${requestScope.ListTodos}">
                        <!-- Define URLs for editing and deleting each todo -->
                        <c:url var="editLink" value="EditTodo">
                            <c:param name="todoId" value="${todo.id}"></c:param>
                        </c:url>
                        <c:url var="deleteLink" value="DeleteTodo">
                            <c:param name="todoId" value="${todo.id}"></c:param>
                        </c:url>
                        <tr>
                            <!-- Display todo details in table rows -->
                            <td>${todo.title}</td>
                            <td>${todo.targetDate}</td>
                            <td>${todo.status}</td>
                            <td>
                                <!-- Links for editing and deleting each todo -->
                                <a href="${editLink}">Edit</a> |
                                <!-- Confirm deletion before performing action -->
                                <a href="${deleteLink}" onclick="if(!(confirm('Are you sure from deleting this Todo?')))return false;">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
    <!-- List todo area -->

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!-- Including a footer file -->
</body>
</html>
