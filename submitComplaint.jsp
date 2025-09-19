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
    <title>Complaint Submitted</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>
    <h2>Your Complaint Has Been Filed</h2>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String complaint = request.getParameter("complaint");

        try {
            // Establish database connection
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/feedback_system");
            Connection conn = ds.getConnection();

            // Insert into complaints table
            String sql = "INSERT INTO complaints (name, email, complaint) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, complaint);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>

