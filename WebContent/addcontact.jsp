<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Contacts</title>
</head>
<body>
        <form method="post" action="addcontactServlet">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add your Friend info here</th>
                    </tr>
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
            			<td><input type="submit" value="Submit" />
            			<input type="reset" value="Reset" /></td>
            		</tr>
                    <tr>
                        <td colspan="2"> <a href="welcome.jsp">Click to go back</a></td>
                    </tr>	
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>