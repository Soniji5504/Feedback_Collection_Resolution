<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Submitted</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body >
    
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
         

            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback", "admin", "root123");
  

            // Insert into feedback table
            String sql = "INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = cn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);
            pstmt.executeUpdate();

            pstmt.close();
            cn.close();
        } catch ( SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("name", name);
        response.sendRedirect("thankyou.jsp");
    %>
    
    <!-- <h2 style="margin: 220px;"><center>Thank you  for your valuable Feedback !</center></h2> -->
    
</body>
</html>
