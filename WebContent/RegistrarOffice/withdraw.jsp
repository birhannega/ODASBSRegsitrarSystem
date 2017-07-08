
<%
	if (session.getAttribute("registrar") == null) {
		response.sendRedirect("../index.jsp");

	} else {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="databaseConnection.Dbconnection"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student withdraw</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/font-awesome/css/font-awesome.min.css" />



</head>
<body>
	<div
		class=" container-fluid col-md-12  col-lg-12 col-sm-12 col-xs-12 offset-2">

		<div class="panel panel-heading ">
			<strong>ODA Special Boarding School Student withdraw Form</strong>
		</div>
		<strong>${withdraw }</strong>
		<%
			session.setAttribute("withdraw", null);
		%>
		<form action="" method="post" class="form-inline pull-right">
			<div class="form-group">
				<label>Enter studentId</label> <input type="text" name="studentid"
					class="form-control" required="required"> <input
					type="submit" value="search" class="btn btn-primary">
			</div>
		</form>
		<form action="${pageContext.request.contextPath }/Studentwithdraw"
			method="post" class="form-inline">
			<%
				String studid = request.getParameter("studentid");
					if (request.getParameter("studentid") == null || request.getParameter("studentid") == "") {
			%>
			<div class="content-box"></div>



			<%
				} else {
						String studId = null, fname = null, lname = null, gender;
						String grade = null, branch = null;
						String userid = session.getAttribute("registrar").toString();
						Dbconnection dbcon = new Dbconnection();
						Statement stsession = dbcon.getConnection().createStatement();
						ResultSet rs = stsession.executeQuery("select *from TBL_users where UserName='" + userid + "'");
						while (rs.next()) {
							branch = rs.getString("branch");

						}

						Statement studentwithdraw = dbcon.getConnection().createStatement();
						ResultSet rsstuwithdraw = studentwithdraw.executeQuery("select *from TBL_student where Stud_id='"
								+ studid + "' and branch='" + branch + "'and Status='Active'");
						if (rsstuwithdraw.next()) {
							studId = rsstuwithdraw.getString("Stud_id");
							fname = rsstuwithdraw.getString("FirstName");
							lname = rsstuwithdraw.getString("LastName");
							gender = rsstuwithdraw.getString("Gender");
							grade = rsstuwithdraw.getString("Grade");
			%>
			<div class="">
				<div class="form-inline pull-center">Withdraw student
					information</div>
				<table class="table  table-condensed  table-bordered ">
					<tr class="Active">
						<th class="Active">StudentId</th>
						<th class="Active">FullName</th>
						<th class="Active">Gender</th>
						<th class="Active">Grade</th>
						<th class="Active">Action</th>
					</tr>
					<tr>
						<td><%=studId%> <input type="hidden" value="<%=studId%>"
							name="studid" /></td>
						<td><%=fname + "  " + lname%></td>
						<td><%=gender%></td>
						<td><%=grade%></td>
						<td><input type="submit" class="btn btn-warning pull-right"
							value="Withdraw student"></td>
				</table>
			</div>
		</form>
		<%
			} else
			{
		%>
  <div>
		<span class="text-warning"> <strong>The ID you entered
				didn't match to any student try again </strong>
		</span>
		</div>
		<%
			}
				}
			}
		%>

	</div>

</body>
</html>