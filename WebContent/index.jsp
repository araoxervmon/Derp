<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>  
</head>
<body>
<script type="text/javascript">

	function validateUsername(){
		var text = document.getElementById("username").value;
		if(text == ""){
			document.getElementById("errorusername").innerHTML = "Username is required";
			document.getElementById("errorusername").style.color = "red";
	
		}
		else
		{
			document.getElementById("errorusername").innerHTML = "OK";
			document.getElementById("errorusername").style.color = "green";
		}
	}
	function validatePassword(){
		var text = document.getElementById("password").value;
		if(text == ""){
			document.getElementById("errorpassword").innerHTML = "Password is required";
			document.getElementById("errorpassword").style.color = "red";
		
		}
		else{
			document.getElementById("errorpassword").innerHTML = "OK";
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
</style>
<div id="centerDiv" class="centerDiv">
 <form action="loginServlet" method="post">  
        <fieldset style="width: 300px">  
        <center><legend> Login to Derp </legend> 
            <table>  
                <tr>  
                    <td>Username</td>  
                    <td><input type="text" name="username" id="username" required="required" onblur="validateUsername();"/></td>
                    <td><label id="errorusername"></label></td>  
                </tr>  
                <tr>  
                    <td>Password</td>  
                    <td><input type="password" name="userpass" id="password"  required="required" onblur="validatePassword();"/></td>  
                    <td><label id="errorpassword"></label></td>
                </tr>  
                <tr>  
                    <td><input type="submit" value="Login" /></td>  
                    <td><input type="reset" value="Reset" /></td>
                </tr>  
                <tr>
                	<td colspan="2">Not Registered!! <a href="registration.jsp">Register Here</a></td>
                </tr>
            </table>  
        </center>    
        </fieldset>  
    </form> 
    </div> 
</body>
</html>