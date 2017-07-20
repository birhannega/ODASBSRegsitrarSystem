
<%if(session.getAttribute("user")==null)
	{
	response.sendRedirect("../index.jsp");
	}
	else
	{
	%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="databaseConnection.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/font-awesome/css/font-awesome.min.css" />

<title>test</title>
</head>
<body>
	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">Student Test update form</div>
			<div class="panel-body">
				<%
String id,fname,lname,TID=null,subid=null,Grade=null,section=null,branch=null;
Dbconnection dbconnnect=new Dbconnection();
Statement getTeacher=dbconnnect.getConnection().createStatement();
ResultSet ActiveTeacher=getTeacher.executeQuery("Select TeacherId,branch from TBL_USers where userName='"+session.getAttribute("user").toString()+"'");

if(ActiveTeacher.next())
{
	TID=ActiveTeacher.getString(1);
	branch=ActiveTeacher.getString(2);
	//out.print(TID);
}
Statement st_selectsubject=dbconnnect.getConnection().createStatement();
ResultSet rs_sub=st_selectsubject.executeQuery("select Distinct Subject_id from TBL_Subject_Teacher where TeacherId='"+TID+"'");

	while(rs_sub.next())	
	{
		subid=rs_sub.getString(1);
	}
     Statement st_gs=dbconnnect.getConnection().createStatement();
	ResultSet rs_gs=st_gs.executeQuery("select Grade,Section_id,branch from TBL_Subject_Teacher where TeacherId='"+TID+"'");
	int min=0,max=0;
	%>
				<form action="" method="post" class="form-inline pull-left">
					<select class="form-control" name="grade" required="required">
						<option value="">Choose Grade</option>
						<%
while(rs_gs.next())
{
	Grade=rs_gs.getString("Grade");
	if(Grade.equalsIgnoreCase("9"))
			{
		Grade="0".concat(Grade);
			}
	section=rs_gs.getString("Section_id");
	//section=rs_gs.getString(2);
%>
						<option value="<%=Grade.concat(section)%>"><%=Grade+ section%></option>
						<%} %>
					</select> <select class="form-control" required name="test">
						<option value="">Choose test</option>
						<option value="t1">Test1</option>
						<option value="t2">Test2</option>
						<option value="w1">Worksheet1(15)</option>
						<option value="w2">Worksheet2(15)</option>
						<option value="pro">Project work(10)</option>
						<option value="mid">Mid Exam(20)</option>
						<option value="final">Final (40)</option>
						<option value="activity">Activity(5)</option>
					</select>
					<button class="btn btn-primary">choose test</button>
				</form>
			</div>
			<%
if(request.getParameter("test")==null)
{
	%>
			<div class=" well well-sm alert-warning">
				<h5 class="text-danger">choose test mechanism</h5>
			</div>
			<%}
else
{
	String test=request.getParameter("test");
	if(test.equals("t1")||test.equals("t2")||test.equals("pro"))
	{
		min=1;
		max=10;
	}
	else if (test.equals("w1")||test.equals("w2"))
	{
		min=1;
		max=15;
	}
	else if (test.equals("w1")||test.equals("mid"))
	{
		min=1;
		max=20;
	}
	else if  (test.equals("final")){
		min=1;
		max=40;
	}
	else if (test.equals("activity")){
		min=1;
		max=5;
	}
		
%>
			<div class="container-fluid">

				<strong><strong>${exists} ${notsaved} ${saved}</strong> </strong>

				<%
	request.getSession().setAttribute("exists", null);
	request.getSession().setAttribute("notsaved", null);
	request.getSession().setAttribute("saved", null);
	%>
				<table class="table  table-condensed" id="mark">

					<thead>
						<tr>
							<th>TestName</th>
							<th>Student ID</th>
							<th>Full name</th>
							<th>Mark obtained</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<%
Statement st=dbconnnect.getConnection().createStatement();

		String choosengrade=request.getParameter("grade");
		
	    char s1=choosengrade.charAt(0);
        char s2=choosengrade.charAt(1);
       char s3=choosengrade.charAt(2);
        String string1=String.valueOf(s1);
		String string2=String.valueOf(s2);
		String string3=String.valueOf(s3);	
	
String grade=string1.concat(string2);
String sec=string3;
	while(grade.equalsIgnoreCase("09")){
	grade=grade.replace("0", "");}
	
	out.print("<div class='alert'><strong> you selected Grade= "+grade+" section="+sec+"</strong></div>");
ResultSet Result=st.executeQuery("select * from TBL_student where Grade='"+grade+"' and Section_id='"+sec+"' and branch='"+branch+"' ");
while(Result.next())
{
	id=Result.getString("Stud_id");
	fname=Result.getString("FirstName");
	lname=Result.getString("LastName");
	%>
						<tr>
							<form method="post"
								action="${pageContext.request.contextPath}/SaveTestResult"
								id="mark" name="mark" onsubmit="return valiatemark(this)">
								<td><%=request.getParameter("test")%> <input
									name="teacherid" type="hidden" value="<%=TID%>"> <input
									name="subid" type="hidden" value="<%=subid%>"> <input
									name="studid" type="hidden" value="<%=id%>"> <input
									name="branch" type="hidden" value="<%=branch%>"> <input
									name="test" type="hidden"
									value="<%=request.getParameter("test")%>"> <input
									name="section" type="hidden" value="<%=section%>"> <input
									name="grade" type="hidden" value="<%=grade%>"></td>
								<td>
									<div>
										<%= id%>
									</div>
								</td>
								<td><%= fname+" "+lname%></td>
								<td><input type="number" step="0.01" class="form-control"
									name="obtainedMark" style="width: 150px" required="required"
									min="<%=min %>" max="<%=max%>"></td>
								<td><button type="submit"
										class="btn btn-primary fa fa-save" value="save mark"></button>
							</form>
							</td>
							</div>
						</tr>
						<% 
}
}
%>
					</tbody>
				</table>
			</div>
			<script type="text/javascript">
$(document).ready(function()
		{
$("#mark").bdt();	
});
</script>
			<%
 }
%>
		</div>
	</div>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
</body>
</html>