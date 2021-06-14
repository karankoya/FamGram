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
        <title>My Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Pacifico&display=swap" rel="stylesheet">
        <style>
            .profile-head {
                transform: translateY(5rem)
            }

            .cover {
                background-image: url(https://images.unsplash.com/photo-1530305408560-82d13781b33a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80);
                background-size: cover;
                background-repeat: no-repeat
            }

            body {
                background: #654ea3;
                background: linear-gradient(to right, #e96443, #904e95);
                min-height: 100vh;
            }
        </style>
    </head>
    <body>
        <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/mca_db" user = "root" password="" />
        <sql:query dataSource="${db}" var = "rs">
            SELECT user_name,comm_id from UserTBL where user_name = '${user_name}';
        </sql:query>
        <div class="row py-5 px-4">
            <div class="col-md-5 mx-auto">
                <!-- Profile widget -->
                <c:forEach var = "tb" items= "${rs.rows}">
                    <div class="bg-white shadow rounded overflow-hidden">
                        <div class="px-4 pt-0 pb-4 cover">
                            <div class="media align-items-end profile-head">
                                <div class="profile mr-3"><img src="getImage.jsp?user_name=${user_name}" alt="..." height = "200px" width="200px" class="rounded mb-2 img-thumbnail"><h4>Your code:- ${tb.comm_id}</h4></div>
                                <div class="media-body mb-5 text-white" style = "padding:20px;">
                                    <h4 class="mt-0 mb-0" style = "font-family: 'Amatic SC', cursive; font-size:50px;">${user_name}</h4>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <div class="py-4 px-4">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <h5 class="mb-0">Recent photos</h5>
                            </div>
                            <sql:query dataSource="${db}" var = "rs">
                                SELECT post_id from PostTBL where user_name = '${user_name}';
                            </sql:query>
                            <div class="row">
                            <c:forEach var = "m" items = "${rs.rows}">
                                   <div class="col-md-6 mb-2 pl-lg-1"><img src="getPost.jsp?post_id=${m.post_id}" alt="" class="img-fluid rounded shadow-sm"></div>
                            </c:forEach>
                            </div>
                        </div>
                                
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
