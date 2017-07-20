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
<title>Teacher reports</title>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../includes/vector.jsp"%></div>

		<div class="row" style="margin-top: -20px">
			<%@ include file="../includes/nav.html"%></div>

		<div class="container-fluid">
			<div class="col-lg-3 col-md-3">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-lg-9 col-md-9">

				<form class="form-inline pull-right">
					<div class="form-group">
						<select class="form-control" name="report">
							<optgroup label="This Year"></optgroup>
							<option value="">------- choose report ----</option>
							<option value="gender">Teachers By Gender</option>
							<option value="bysubject">Filter Teachers by
								qualification subject</option>
							<option value="activeteachers">Total Active Teachers</option>
							<option value="HRteachers">Home room Teachers</option>
							<option value="sub_teacher">Subject Teachers</option>

						</select>
					</div>

					<button type="submit" class="btn btn-primary">Generate
						report</button>
				</form>
				<p class="page-header">Teacher related Reports</p>
				<%
String type=request.getParameter("report");
if(type==null||type.trim()=="")
{
	out.print("choose report type");	
}
else if(type.equalsIgnoreCase("gender"))
{
%>
				<%@ include file="GenderofTeacher.jsp"%>
				<%	
}
else if(type.equalsIgnoreCase("activeteachers"))
{
	%>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="5" class="text-center">List of Currently Active
								Teachers</th>

						</tr>
						<tr>
							<th>No.</th>
							<th>Teacher ID</th>
							<th>Full Name</th>
							<th>Qualification</th>
							<th>Hire Date</th>
						</tr>
					</thead>
					<tbody>
						<%
Date date=new Date();
SimpleDateFormat format=new SimpleDateFormat("Y");
String Year=format.format(date);

int i=0;
int j=1;
Dbconnection dbconnection=new Dbconnection();
Connection connection=dbconnection.getConnection();
Statement statement=connection.createStatement();
ResultSet resultSet=statement.executeQuery("select * from TBL_Teacher where Status='Active'");
while(resultSet.next())
{
%>
						<tr>
							<td><%=j %></td>
							<td><%=resultSet.getString(1) %></td>
							<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName") %></td>
							<td><%=resultSet.getString("qualified") %></td>
							<td><%=resultSet.getString("hiredate") %></td>
						</tr>
						<%	
i++; 
j++;
}
%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="text-center"><span>Total of <%=i %>
									Teachers Found
							</span></td>
						</tr>
					</tfoot>
				</table>


				<%
}

else if(type.equalsIgnoreCase("HRteachers"))
{
	%>
				<%@ include file="home_roome_treport.jsp"%>
				<%
}
else if(type.equalsIgnoreCase("sub_teacher"))
{
	%>
				<%@ include file="AssignedTeacher.jsp"%>
				<%
}
else if(type.equalsIgnoreCase("bysubject"))
{
	%>
				<%@ include file="bysubject.jsp"%>


				<%
}

}
    
%>

			</div>
		</div>
	</div>
</body>
</html>