<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Confirmation</title>
    <style>
        .center-text {
            text-align: center;
            margin-top: 20px; 
            font-size: 28px; 
            margin-top: 250px;
        }
    </style>
</head>
<body>
    <div class="center-text">
        <% 
            String username = (String) session.getAttribute("name");
            out.print("Thank you " + username);
            out.print(" for your valuable feedback!");
        %>
    </div>
</body>
</html>
