
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Insert Employee</title>
</head>
<body bgcolor="pink">
<%
Connection cn = null;
PreparedStatement pst = null;
try {
    // Load the JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    out.println("Driver Loaded Successfully");

    // Establish connection to the database
    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/itm", "root", "dhruv@123");
    out.println("Connection Established Successfully");

    // Prepare SQL statement
    pst = cn.prepareStatement("INSERT INTO empitmu VALUES (?, ?, ?)");
    pst.setInt(1, 51);  // Assuming 51 is the employee ID to insert

    // Assuming n1 and n2 are parameters from the request
    String s1 = request.getParameter("n1");
    String s2 = request.getParameter("n2");
    pst.setString(2, s1);  // Assuming s1 is a string parameter
    pst.setString(3, s2);  // Assuming s2 is a string parameter

    // Execute the update
    int x = pst.executeUpdate();

    if (x > 0) {
        out.println("Record inserted Successfully");
    } else {
        out.println("Failed to insert record");
    }
} catch (ClassNotFoundException e) {
    out.println("Driver Problem: " + e.getMessage());
} catch (SQLException e) {
    out.println("SQL Exception: " + e.getMessage());
} finally {
    // Close resources in finally block
    try {
        if (pst != null) {
            pst.close();
        }
        if (cn != null) {
            cn.close();
        }
    } catch (SQLException e) {
        out.println("Error closing resources: " + e.getMessage());
    }
}
%>
</body>
</html>
