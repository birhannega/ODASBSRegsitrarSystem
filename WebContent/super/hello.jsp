<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />
</head>
<body>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>No.</th>
				<th>full name.</th>
				<th colspan="2">Action</th>
			</tr>

		</thead>
		<%

Dbconnection dbcn=new Dbconnection();
Connection dbcon=dbcn.getConnection();
Statement statement=dbcon.createStatement();
String query="select * from TBL_student where Status='Active'";
ResultSet rs=statement.executeQuery(query);
while(rs.next())
{
	%>
		<tr>
			<td>
				<% out.print(rs.getString(1));%>
			</td>
			<td>
				<% out.print(rs.getString(2)+" ".concat(rs.getString(3)));%>
			</td>
			<td><button class="btn btn-primary">Edit</button></td>
			<td><button class="btn btn-danger">Delete</button></td>

		</tr>
		<%
}

%>
	</table>
</body>
</html>