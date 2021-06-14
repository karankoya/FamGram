<%@page import="java.util.Base64"%>
<%@page import="com.mysql.jdbc.Blob"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<html>
    <head>
        <title>My Community</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                background: #654ea3;
                background: url("https://www.linkpicture.com/q/WALLPAPER-LAYER.jpg");;
            }

            .followers {
                font-size: 12px
            }
        </style>
        <link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
    <center>
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mca_db" user = "root" password="" />
        <sql:query dataSource="${db}" var = "rs">
            SELECT user_name,email from UserTBL where user_name != '${user_name}' and comm_id = (select comm_id from UserTBL where user_name ='${user_name}');
        </sql:query>
         <div class="col-md-6">
            <div class="p-3 bg-dark text-center"style = "opacity: 0.9;">
                <c:forEach var = "tb" items= "${rs.rows}">
                    <c:choose>
                        <c:when test = "${tb.user_name == ''}">
                            <h1 style = "font-family: 'Odibee Sans', cursive; font-size: 50px; color: white;">No Community yet</h1>
                        </c:when>
                        <c:when test = "${tb.user_name != null}">
                            <div class="d-flex flex-row justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center"><img style ="border-radius:100%; border:4px double white;" src="getImage.jsp?user_name=${tb.user_name}" width="60" height = "60">
                                    <div class="d-flex flex-column align-items-start ml-2"><span class="font-weight-bold" style = "color: white;">${tb.user_name}</span><span class="followers"style = "color: white;">${tb.email}</span></div>
                                </div>
                            </div>
                            <hr color = "white">
                        </c:when>
                    </c:choose>
                </c:forEach> 
               <sql:query dataSource="${db}" var = "rs">
                    SELECT famcode,comm_id from UserTBL where user_name = '${user_name}';
               </sql:query>
                    
                <c:forEach var = "tb" items = "${rs.rows}">
                    <c:choose>
                        <c:when test = "${tb.famcode == tb.comm_id}">
                            <form action = "DeleteCommunity" method = "POST">
                                <input type = "submit" value = "Delete Community" class = "btn btn-outline-warning">
                            </form>
                        </c:when>
                        <c:when test = "${tb.famcode != tb.comm_id}">
                            <form action = "LeaveCommunity" method = "POST">
                                <input type = "submit" value = "Leave Community" class = "btn btn-outline-warning">
                            </form>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </div>
         </div>
    </center>
</body>
</html>

