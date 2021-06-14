<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Post an Image</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script>
            var loadFile = function(event) {
                    var image = document.getElementById('output');
                    image.src = URL.createObjectURL(event.target.files[0]);
                    var file = document.getElementById('file');
                    file.value = URL.createObjectURL(event.target.files[0]);
            };
        </script>
    </head>
    <body style = "background: #654ea3; background: linear-gradient(to right, #e96443, #904e95);">
        <br/>
        <div class ="container">
            <div class ="">
                <form action = "UploadPic" method="POST">
                    <div class="card" style = "background: #654ea3;">
                        <center>
                        <div class="row" style="margin:150px 300px; padding: 5px;border: 1px solid grey;background-color: white;">
                            <div class="col-md-4 col-sm-12">
                                <img id="output" src ="https://image.flaticon.com/icons/png/512/3284/3284076.png" height = "200" width="200" style ="padding: 20px; align:center;" class = "rounded-circle"/>   
                                <input type="file"  accept="image/*" name="image" id="file"  onchange="loadFile(event)" style="display: none;"><label for="file" style="cursor: pointer;" class="btn-outline-success">Upload Picture</label>
                            </div>
                            <div class="col-md-8 col-sm-12">
                                <div class="comment-box ml-2" style = "padding:15px; margin:5px;">
                                    <h4>Post an Image</h4>
                                    <div class="comment-area" style = "margin:10px;"> <textarea class="form-control" name = "caption" placeholder="what is your caption?" rows="4"></textarea> </div>
                                    <div class="comment-btns mt-2">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="pull-left"> <input type = "reset" value = "Cancel" class = "btn btn-outline-danger"> </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="pull-right"> <input type = "submit" value ="POST" class ="btn btn-outline-success"> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                        </div>
                     </center>  
                  </div>
                </form>
            </div>
        </div>
    </body>
</html>
