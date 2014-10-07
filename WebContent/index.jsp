<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>  
</head>
<body>
<script type="text/javascript">

	function validateUsername(){
		var text = document.getElementById("username").value;
		if(text == ""){
			document.getElementById("errorusername").innerHTML = "Required";
			document.getElementById("errorusername").style.color = "red";
	
		}
		else
		{
			document.getElementById("errorusername").innerHTML = "Woohoo";
			document.getElementById("errorusername").style.color = "green";
		}
	}
	function validatePassword(){
		var text = document.getElementById("password").value;
		if(text == ""){
			document.getElementById("errorpassword").innerHTML = "Required";
			document.getElementById("errorpassword").style.color = "red";
		
		}
		else{
			document.getElementById("errorpassword").innerHTML = "Woohoo";
			document.getElementById("errorpassword").style.color = "green";
		}
	}
</script>
<style>
.centerDiv{
width:800px;
padding:10px;
height:30%;
position:absolute;
top:30%;
left:35%;}
 body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
</style>
<div id="centerDiv" class="container">
 <form action="loginServlet" method="post" class="form-signin">  
        <center><legend> Login to Derp </legend> 
        <div class="control-group">
        			<label class="control-label" for="inputname">User Name</label>
        			<div class="controls">
            		<input type="text" class="input-block-level" placeholder="User Name" name="username" id="username" required="required" onblur="validateUsername();"/></td>
                    <label id="errorusername"></label>
                    </div>
                    <div class="controls">
        			<label>Password</label>
                	<input type="password" class="input-block-level" placeholder="Password" name="userpass" id="password"  required="required" onblur="validatePassword();"/></td>  
                    <label id="errorpassword"></label>
                    </div>
        </div>            
                   <!--    <button class="btn btn-large btn-primary" type="submit" value="reset">RESET</button>-->
                    <button class="btn btn-info pull-left" type="submit" value="Login">LOGIN</button>
                 
                
                	<a href="registration.jsp">Signup here</a>
               
        </center>    
    </form> 
    </div> 
</body>
</html>