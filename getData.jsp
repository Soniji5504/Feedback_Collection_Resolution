<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%
// Initialize variables
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    // Register JDBC driver (if necessary, replace with appropriate driver)
    Class.forName("com.mysql.jdbc.Driver");

    // Open a connection
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback", "root", "dhruv@123");

    // Execute a query
    String sql = "SELECT * FROM feedback";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    // Process the result set
    out.println("<html><body>");
    out.println("<h2></h2>");
    out.println("<table border='1'>");
    

    while (rs.next()) {
        String name = rs.getString("name");
        String email = rs.getString("email");
        String message = rs.getString("message");
        out.println("<tr><td>" + name + "</td><td>" + email + "</td><td>" + message + "</td></tr>");
    }

    out.println("</table>");
    out.println("</body></html>");

} catch (SQLException se) {
    // Handle errors for JDBC
    se.printStackTrace();
} catch (Exception e) {
    // Handle errors for Class.forName
    e.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>
