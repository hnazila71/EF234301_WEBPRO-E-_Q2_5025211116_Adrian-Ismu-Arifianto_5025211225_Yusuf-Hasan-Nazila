<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- JSP directive defining page settings for error handling -->

<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <h2><%=exception.getMessage()%><br />
    <!-- Displaying the error message from the exception -->
    </h2>
</body>
</html>
