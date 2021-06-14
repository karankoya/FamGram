<%-- 
    Document   : friendsadd
    Created on : 06-Jun-2021, 11:16:37 am
    Author     : Karan Koya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Create/Join Community</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            .profile-head {
                transform: translateY(5rem)
            }

            .cover {
                background-image: url(https://www.amny.com/wp-content/uploads/2019/09/image-296.jpg);
                background-size: cover;
                background-repeat: no-repeat
            }

            body {
                background: #654ea3;
                background: linear-gradient(to right, #e96443, #904e95);
                min-height: 100vh
            }
            .vl {
                border-left: 2px solid grey;
                height: 200px;
                width: 0px;
                padding: 0px 2px;
              }
        </style>
    </head>
    <body>
        <br/>
        <br/>
        <div class="row py-5 px-4">
            <div class="col-md-5 mx-auto">
                <!-- Profile widget -->
                <div class="bg-white shadow rounded overflow-hidden">
                    <div class="px-4 pt-0 pb-4 cover" style = "height: 250px;">
<!--                        <div class="media align-items-end profile-head">
                            <div class="profile mr-3"><img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" alt="..." width="130" class="rounded mb-2 img-thumbnail"><h4>Your code:- 123456</h4></div>
                            <div class="media-body mb-5 text-white">
                                <h4 class="mt-0 mb-0">Mark Williams</h4>
                                <p class="small mb-4"> <i class="fas fa-map-marker-alt mr-2"></i>New York</p>
                            </div>
                        </div>-->
                    </div>
                    <div class="py-4 px-4">
                        <div class = "row">
                            <div class ="col-md-12">
                                <form action = "JoinCommunity" action = "POST">
                                    <div class="form-group">
                                        <label for="usr"style = "font-family: 'Odibee Sans', cursive;">JOIN COMMUNITY</label>
                                        <input type="text" name ="code" class="btn btn-block btn-warning" id="usr" placeholder = "Enter code">
                                        <br/>
                                        <input type="submit" value ="Join Community" class ="btn btn-block btn-outline-info">
                                    </div>
                                </form>
                            </div>
                            <!--<div class ="vl"></div>-->
                            <hr color = "grey" style = "width:100%;text-align:left;margin-left:0">
                            <div class ="col-md-12">
                                <form action = "CreateCommunity" action = "POST"> 
                                       <input type="submit" value ="Create Community" class ="btn btn-block btn-outline-danger">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
    
