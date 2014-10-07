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

<script  type="text/javascript">
function deleteUser(id){
		console.log(id);

		input_box = confirm("Are you sure you want to delete this Record?");
		if (input_box == true) {
	/*	$.ajax({
		    url : 'DeleteDao.java?derpId='+id,
		    type : "POST",
		    async : false,
		    success : function() {
		        $("input[name='derpId']").each(function() {
		            $('#' + $(this).val()).remove();
		        });
		        alert('Record(s) Deleted');
		    }
		});*/
		var f=document.form;
		f.method="post";
	    f.action='deleteServlet?id='+id;
//	    f.value = 'derpId='+id;
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
	var f=document.form;
	f.method="post";
	f.action='inviteemailServlet?emailID='+emailID;
	f.submit();
	$('#' + emailID).remove();
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
    <h4>Welcome back  <%=session.getAttribute("name")%></h4> 
    <a href="addcontact.jsp"> <input type="submit" value="Add User" name="addUser" id="addUser" /></a> <br/>
   	 <form action="loginServlet" method="post" name="form">  
     <table border="5"    width="50%"   cellpadding="4" cellspacing="3">
	   <tr>
	      <th colspan="5"><br><h3>Contact Table</h3>
	      </th>
	   </tr>
	  <tr>
	      <th>Id</th>
	      <th>Name</th>
	      <th>Email</th>
	      <th>Action</th>
	   </tr>
	<!--    <tr align="center">
	      <td>1</td>
	      <td>Jackson</td>
	      <td>jackson@jackson.com</td>
          <td><input type="submit" value="Derp" onclick="sendDerp();"/>
          <input type="submit" value="Delete" onclick="deleteUser();"/>
          <input type="submit" value="Invite" /></td>
	   </tr>
	   <tr align="center">
	      <td>2</td>
	      <td>Jill</td> 
	      <td>Jill@jill.com</td>
          <td><input type="submit" value="Derp" onclick="sendDerp();"/>
          <input type="submit" value="Delete" onclick="deleteUser();"/>
          <input type="submit" value="Invite" /></td>
	   </tr>-->
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
				String query = "select * from derpmembers";
				st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
			%>
			<%
			while(rs.next()){
				// String columnName = rs.getString("id");
			   //   System.out.println("getPrimaryKeys(): id=" + columnName);
			%>
				<tr><td><%=rs.getString(1)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><input type="button" value="Derp" onclick="sendDerp('<%=rs.getString(4)%>');"/>
         		 <input type="button" value="Delete" onclick="deleteUser('<%=rs.getString(1)%>');"/></td>
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
	<input type="text" placeholder="Invite Email" name="invite" id="inviteEmail" /> 
	<input type="submit" value="Invite"  onclick="inviteUser();"/> <br/>
   	
</body>
</html>