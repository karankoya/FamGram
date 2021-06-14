<%-- 
    Document   : getImage
    Created on : 06-Jun-2021, 3:01:18 pm
    Author     : Karan Koya
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user_name = request.getParameter("user_name");
            Class.forName("com.mysql.jdbc.Driver");
            try(Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mca_db","root","")){
                Statement stmt = (Statement) conn.createStatement();
                String query = "select profile_pic from UserTBL where user_name='"+user_name+"'";
                ResultSet rs = (ResultSet) stmt.executeQuery(query);
                
                if(rs.next())
                {
                    byte[ ] imgData = rs.getBytes(1); 
                    response.setContentType("images/jpg");
                    OutputStream os = response.getOutputStream();
                    os.write(imgData);
                    os.flush();
                    os.close();
                }
            }
        %>
    </body>
</html>
