
<%if(session.getAttribute("user")==null)
    	{
    	response.sendRedirect("../index.jsp");
    	}
    	else
    	{%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<title>Insert title here</title>
</head>
<body>

	<%
Dbconnection dbconnection=new Dbconnection();
String user=session.getAttribute("user").toString(),teacherid=null,branch=null;
Statement activeUser=dbconnection.getConnection().createStatement();
ResultSet rsactiveUser=activeUser.executeQuery("select *from TBL_users where userName='"+user+"'");
if(rsactiveUser.next()){
	branch=rsactiveUser.getString("branch");
	teacherid=rsactiveUser.getString("TeacherId");
}
String sectionid=null,grade=null;
Statement sthometeacher=dbconnection.getConnection().createStatement();
ResultSet rshometeacher=sthometeacher.executeQuery("select * from TBL_HomeRoom where TeacherId='"+teacherid+"'");
if(rshometeacher.next()){
	sectionid=rshometeacher.getString("Section_id");
	grade=rshometeacher.getString("Grade");
}%>
	<table class="table table-responsive table-bordered">
		<tr>
			<th>stud_id</th>
			<th>Grade</th>
			<th>total mark</th>
			<th>average</th>
			<th>semister</th>
			<th>section id</th>
			<th>pass_fail</th>
			<th>teacher id</th>
			<th>AcademicYear</th>
		</tr>

		<%
float pass_fail=0;
Statement policy=dbconnection.getConnection().createStatement();
ResultSet rspolicy=policy.executeQuery("select * from TBL_policy");
while(rspolicy.next()){
	pass_fail=rspolicy.getFloat("min_ave");
	out.println(pass_fail);
}
String Status=null,id=null,semister=null,year=null;
Statement ststudent=dbconnection.getConnection().createStatement();
ResultSet rsstudent=ststudent.executeQuery("select DISTINCT Stud_id,semister,AcademicYear from TBL_mark");
while(rsstudent.next()){
	id=rsstudent.getString("Stud_id");
	semister=rsstudent.getString("semister");
	year=rsstudent.getString("AcademicYear");
float totalmark=0;
float average=0;

Statement st=dbconnection.getConnection().createStatement();
ResultSet rs=st.executeQuery("select sum(total)from TBL_mark where Section_id='"+sectionid+"'and Grade='"+grade+"'and Stud_id='"+id+"'");
while(rs.next()){
%>
		<tr>

			<%

float markvalue=rs.getFloat(1);
totalmark=totalmark+markvalue;
average=totalmark/12;
if(average>=pass_fail){
	Status="pass";
}
else {Status="failed";}
%>

			<td><%=id %></td>

			<%}%>
			<td><%=grade%></td>
			<td><%=totalmark%></td>

			<td><%=average%></td>

			<td><%=semister%></td>
			<td><%=sectionid %></td>
			<td><%=Status %></td>
			<td><%=teacherid %></td>
			<td><%=year %></td>

		</tr>
		<% }}%>


	</table>
</body>
</html>