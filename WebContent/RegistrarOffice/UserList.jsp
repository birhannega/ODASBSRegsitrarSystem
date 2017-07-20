<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<title>Users</title>
</head>
<body>
	<div class="container-fluid">
		<table class="table table-bordered table-striped">

			<thead>
				<tr>
					<th colspan="3"><strong>List Of active User Accounts</strong></th>

				</tr>
				<tr>
					<th>No.</th>
					<th>User name</th>
					<th>User ID</th>
				</tr>
			<thead>
			<tbody>
				<%
int i=1;
Dbconnection db_con=new Dbconnection();
Statement statement_user=db_con.getConnection().createStatement();
ResultSet rs_user=statement_user.executeQuery("select userName,TeacherId from TBL_Users where currentstate='Active'");
while(rs_user.next()){
%>
				<tr>
					<td><%=i %></td>
					<td><%=rs_user.getString(1) %></td>
					<td><%=rs_user.getString(2) %></td>
				</tr>
				<%
i++;
}
%>
			</tbody>
		</table>
	</div>
</body>
</html>