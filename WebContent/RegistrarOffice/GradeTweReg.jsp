<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    if(session.getAttribute("registrar")==null)
    {
    	response.sendRedirect("../index.jsp");
    }
    	else
    	{
    	
    
    	
    %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Grade 12 Students Registration</div>
		<div class="panel-body">
			<%
Dbconnection dbconnection=new Dbconnection();
Statement st_ten=dbconnection.getConnection().createStatement();
Date date = new Date();
SimpleDateFormat Sdf = new SimpleDateFormat("YYYY");
String year = Sdf.format(date);
int A_year=Integer.valueOf(year);
int lastyear=A_year-1;
out.print("<strong>The Following students have qualified for Grade Twelve after learning Grade 11 in "+lastyear+"</strong>");

ResultSet rs_ten=st_ten.executeQuery("select * from TBL_student where Status='active'and Grade=11 and AcademicYear='"+A_year+"'");
%>
			${registered }

			<table class="table table-condensed">
				<thead>
					<tr class="info">
						<th>N0.</th>
						<th>Student ID</th>
						<th>Full Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<%
int i=1;

int updatedYear=A_year+1;

while(rs_ten.next())
{
%>
				<tr>
					<td><%=i %></td>
					<td><%=rs_ten.getString("Stud_id") %></td>


					<td><%=rs_ten.getString("FirstName")+" "+ rs_ten.getString("LastName")%></td>
					<td>
						<form action="${pageContext.request.contextPath}/Exceptnine"
							method="post">

							<input type="hidden" value="<%=rs_ten.getString("Stud_id")%>"
								name="studid"> <input type="hidden" name="grade"
								value="12"> <input type="hidden"
								value="<%=updatedYear%>" name="year"></input>
							<button type="submit" class="btn btn-primary">register</button>
						</form>
					</td>
				</tr>
				<% 
i++;
}
%>

			</table>

		</div>
	</div>

</body>
<%} %>
</html>