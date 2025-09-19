<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body >
    <%
    boolean status = false;
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
            
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection cn = DriverManager.getConnection("jdbc:mysql://@localhost:3306/feedback", "root", "dhruv@123");

        // Insert into feedback table
        String sql = "select *from Admin where username=? and password=?";
        PreparedStatement pstmt = cn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        if(rs.next()){
            status = true;
        }
        
        pstmt.close();
        cn.close();
    } catch ( SQLException e) {
        e.printStackTrace();
    }
    if(status){
        response.sendRedirect("listdata.html");
    }else{
        response.sendRedirect("wrong.html");
    }
    %>
</body>
</html>