<%-- 
    Document   : feed
    Created on : 05-Jun-2021, 3:10:34 pm
    Author     : Karan Koya
--%>

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
        <title>My Feed</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
        <link rel="stylesheet" href="CSS/style2.css"/>
        <link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <style>
        body{
            background-image: url("https://www.linkpicture.com/q/WALLPAPER-LAYER.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
    <body> 
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mca_db" user = "root" password="" />
        <sql:query dataSource="${db}" var = "rs">
            SELECT comm_id from UserTBL where user_name = '${user_name}';
        </sql:query>
        <div id="wrapper" class="toggled">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand"> <a href="feed.jsp"> Welcome, ${user_name} </a> </li>
                        <li> <a href="profile.jsp">View Profile</a> </li>
                        <br/>
                        <c:forEach var = "tb" items = "${rs.rows}">
                        <c:choose>
                            <c:when test = "${tb.comm_id != null}">
                                <li> <a href="friendslist.jsp">Friend List</a> </li>
                                <br/>
                                <li> <a href="postform.jsp">Create Post</a> </li>
                                <br/>
                            </c:when>
                            <c:when test= "${tb.comm_id == null}">
                                <li> <a href="friendsadd.jsp">Create/Join Community</a> </li>
                                <br/>
                            </c:when>
                        </c:choose>
                        <li> <a href="index.html">Log Out</a> </li>
                    </c:forEach>
                </ul>
            </div> <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <sql:query dataSource="${db}" var = "rs">
                 SELECT post_id,user_name,caption from PostTBL where user_name != '${user_name}' and user_name in (select user_name from UserTBL where comm_id = (select comm_id from UserTBL where user_name = '${user_name}'));
            </sql:query>
            <div class="page-content page-container" id="page-content">
                <div class="padding">
                    <c:forEach var = "tb" items="${rs.rows}">
                    <div class="row container justify-content-center" style ="margin-botton:0px;height:15px;">
                            <div class="col-md-6">
                                <div class="box box-widget" style = "margin-botton:0px;">
                                    <div class="box-header with-border">
                                        <div class="user-block"> <img class="img-circle" src="getImage.jsp?user_name=${tb.user_name}" style = "border-radius:100%; border:4px double white;" height ="60" width ="60" alt="User Image"><span class="username">${tb.user_name}</span> </div>
                                        <div class="box-tools"> <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read"> <i class="fa fa-circle-o"></i></button> <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> </button> <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> </div>
                                    </div>
                                        <div class="box-body"> <img class="img-responsive pad" src="getPost.jsp?post_id=${tb.post_id}" alt="Photo">
                                        <p>${tb.caption}</p>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </c:forEach>
                </div>
            </div> <!-- /#page-content-wrapper -->
        </div> <!-- /#wrapper -->
    </body>
</html>

