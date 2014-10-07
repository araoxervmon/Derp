<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Contacts</title>
</head>
<body>
        <form method="post" action="addcontactServlet">
            <center>
            <table class="table table-bordered">
                <thead><h3 align="center">Add Your Friend Info Here</h3>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="derpname" value="<%=session.getAttribute("name")%>" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
            		<tr>
            			<td><input class="btn btn-info pull-left" type="submit" value="Submit" />
            		
                        <td colspan="2"> <a href="welcome.jsp">Click to go back</a></td>
                   	</tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>