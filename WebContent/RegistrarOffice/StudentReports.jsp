
<%
if(session.getAttribute("registrar")==null)
{
	response.sendRedirect("../index.jsp");
}
else	
{
	

	Dbconnection dbconnection=new Dbconnection();
	Connection connection=dbconnection.getConnection();
	Statement statement=connection.createStatement();
	String selectedbranch=null;
	ResultSet rs=statement.executeQuery("select Branch from TBL_Users where username='"+session.getAttribute("registrar").toString()+"'");
	if(rs.next())
	{
		selectedbranch=rs.getString(1);
	}
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>

<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student reports</title>
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
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-md-9 col-lg-9">

				<form class="form-inline pull-right">
					<div class="form-group">
						<select class="form-control" name="report">

							<option value="">------- choose report ----</option>
							<option value="1">1.Students By Gender</option>
							<option value="2">2.student with Lowest score(flop)</option>
							<option value="3">3.student with highest score(The whole
								First)</option>

							<option value="byzone">4.Filter Students by zone</option>
							<option value="bygrade">5.Filter Students by Grade</option>

							<option value="activeStudents">6.Total Active Students</option>
							<option value="withdrawn">7.Withdrawn Students</option>
							<option value="readmitted">8.Re-admitted Students</option>

						</select>
					</div>

					<button type="submit" class="btn btn-primary">Generate
						report</button>
				</form>
				<h4 class="page-header">Student related Reports</h4>
				<%
String type=request.getParameter("report");
if(type==null||type.trim()=="")
{
	out.print("choose report type");	
}
else if(type.equalsIgnoreCase("1"))
{
%>
				<%@ include file="GenderofStudent.jsp"%>
				<%	
}
else if(type.equalsIgnoreCase("2"))
{
	%>
				<%@ include file="Min.jsp"%>
				<%
}

else if(type.equalsIgnoreCase("3"))
{
	%>
				<%@ include file="max.jsp"%>
				<%
}
else if(type.equalsIgnoreCase("activeStudents"))
{
	%>
				<%@ include file="total_students.jsp"%>
				<%
}

else if(type.equalsIgnoreCase("byzone"))
{
%>
				<%@ include file="byzone.jsp"%>
				<%
}
else if(type.equalsIgnoreCase("bygrade"))
{
%>
				<%@ include file="bygrade.jsp"%>
				<%
}
 
} 
%>
			</div>
		</div>
	</div>

</body>
</html>