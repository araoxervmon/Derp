<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page language="java" import="java.sql.*" %>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>  
</head>
<body>  
<style>
.emailclass {
    text-align: right;
}
</style>
<script  type="text/javascript">
function deleteUser(id){
		console.log(id);
		input_box = confirm("Are you sure you want to delete this Record?");
		if (input_box == true) {
		var f=document.form;
		f.method="post";
	    f.action='deleteServlet?id='+id;
	    f.submit();
		    $('#' + id).remove();
		    alert('Record Deleted');
		} else {
		// Output when Cancel is clicked
		return false;
		}
	}

function sendDerp(emailID){
	console.log(emailID);
	input_box = confirm("Are you sure you want to Derp?"+emailID);
	if (input_box == true) {
	var f=document.form;
	f.method="post";
	f.action='inviteemailServlet?emailID='+emailID;
	f.submit();
	$('#' + emailID).remove();
	} else {
		// Output when Cancel is clicked
		return false;
	}
} 

function inviteUser(){
	var userEmail = document.getElementById('inviteEmail').value;
	var f=document.form;
	f.method="post";
	f.action='inviteuserServlet?userEmail='+userEmail;
	f.submit();
	$('#' + emailID).remove();
} 
</script>
    <h2 align="center">Welcome back  <%=session.getAttribute("name")%></h2> 
    <a href="addcontact.jsp"> <input class="btn btn-large btn-primary" type="submit" value="Add Friend" name="addUser" id="addUser" /></a> <br/>
   	 <form action="loginServlet" method="post" name="form">  
     <table class="table table-bordered">
	   <tr>
	      <th colspan="5"><br><h3 align="center">Contact Table</h3>
	      </th>
	   </tr>
	  <tr>
	      <th>Id</th>
	      <th>Name</th>
	      <th>Email</th>
	      <th>Action</th>
	   </tr>
		<%
			Connection con = null;
			String url = "jdbc:mysql://localhost:3306/";
			String db = "derp";
			String driver = "com.mysql.jdbc.Driver";
			String userName ="root";
			String password="";
			
			int sumcount=0;
			Statement st;
			try{
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(url+db,userName,password);
				String query = "select * from derpmembers where derpname='"+session.getAttribute("name")+"'" ;
				st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
			%>
			<%
			while(rs.next()){
			%>
				<tr><td><%=rs.getString(1)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><input class="btn btn-success" type="button" value="Derp" onclick="sendDerp('<%=rs.getString(4)%>');"/>
         		 <input class="btn btn-danger" type="button" value="Delete" onclick="deleteUser('<%=rs.getString(1)%>');"/></td>
				</tr>
			<%
				}
			%>
			<%
			}
			catch(Exception e){
				e.printStackTrace();
			}
		%>
	</table>
	</form>
	<div class="emailclass">
		<input type="text" placeholder="Invite Email" name="invite" id="inviteEmail" /> 
		<input class="btn btn-large btn-primary" type="submit" value="Invite"  onclick="inviteUser();"/></button> 
     </div>            
   	
</body>
</html>