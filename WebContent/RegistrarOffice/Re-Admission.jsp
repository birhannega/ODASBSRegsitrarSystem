<%if(session.getAttribute("registrar")==null) 
{
	response.sendRedirect("../index.jsp");}
else{
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseConnection.Dbconnection"%>

<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Active Status form</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />


</head>
<body>
<div
		class=" container-fluid col-md-12  col-lg-12 col-sm-12 col-xs-12 offset-2">
		
				<div class="panel panel-heading "><strong>ODA Special Boarding  School Student Re-Admission  form
				</strong></div>
			<strong>${Active}${notActive} ${emptyid } </strong>
<%session.setAttribute("Active",null);
							%>
	<form action=""method="post" class="form-inline pull-right">
<div class="form-group">
<input type="text"name="studentid"class="form-control">
<input type="submit"value="search"class="btn btn-primary">
</div>
</form>
<form action="${pageContext.request.contextPath }/ChangeStatus"method="post"class="form-inline">
<%
Dbconnection dbcon=new Dbconnection();
String userid=session.getAttribute("registrar").toString(),branch=null;
Statement stsession=dbcon.getConnection().createStatement();
ResultSet rssession=stsession.executeQuery("select *from TBL_users where UserName='"+userid+"'");
if(rssession.next()){
	//out.println(rssession.getString("TeacherId"));
	branch=rssession.getString("branch");
//out.println(branch);
}
String studid=request.getParameter("studentid"),studId=null,fname=null,lname=null,gender;String grade=null;
if(request.getParameter("studentid")==null||request.getParameter("studentid")==""){
	request.getSession().setAttribute("emptyid", "Enter student ID");
	%>
	
	
	<%
	
}

else{
Statement studentwithdraw=dbcon.getConnection().createStatement();
ResultSet rsstuwithdraw=studentwithdraw.executeQuery("select *from TBL_student where Stud_id='"+studid+"' and branch='"+branch+"' and Status='withdraw'");
if(rsstuwithdraw.next()){
	studId=rsstuwithdraw.getString("Stud_id");
	fname=rsstuwithdraw.getString("FirstName");
	lname=rsstuwithdraw.getString("LastName");
	gender=rsstuwithdraw.getString("Gender");
	grade=rsstuwithdraw.getString("Grade");
%>
<div class="">
<div class="form-inline pull-center"> student Re-Admission Form</div>

						<table class="table  table-condensed  table-bordered ">
<tr>
<th>StudentId</th>
<th>FullName</th>
<th>Gender</th>
<th>Grade</th>
<th>Action</th>
</tr>
<tr>
<td><%=studId %>
<input type="hidden"value="<%=studId %>"name="studid"/></td>
<td><%=fname+"  "+lname %></td>
<td><%=gender %></td>
<td><%=grade %></td>
<td><input type="submit"value="submit"></td>
					</table>
					</div>
				</form>	
					<%}else {%>
						
						
						
	<div class="col-lg-12 col-md-12">
	<br>
	<p class="alert alert-info "Style="color:red;"> The Entered ID didn't match any Student's id who has been withdrawn</p>
	
	</div>
					<%}}}%>
					
					</div>
					
</body>
</html>