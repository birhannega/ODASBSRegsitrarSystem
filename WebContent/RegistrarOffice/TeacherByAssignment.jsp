
<%if(session.getAttribute("registrar")==null)
{
	
	response.sendRedirect("../index.jsp");
	
}
	else
	{
	%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function printpage() {

    var printButton = document.getElementById("printpagebutton");
 
    printButton.style.visibility = 'hidden';
   
    window.print()
     printButton.style.visibility = 'visible';
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>

<link type="text/css" rel="stylesheet" title="currentStyle"
	href=../resources/css/demo_table.css />

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String userid=session.getAttribute("registrar").toString(),branch=null;
		 Statement stsession=dbcon.getConnection().createStatement();
		 ResultSet Rssession=stsession.executeQuery("select * from TBL_users where UserName='"+userid+"'");
		 if(Rssession.next()){
			 branch=Rssession.getString("branch");
			 //branch=Rssession.getString("branch");
		 }%>
	<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="text-uppercase">
					ODA Special Boarding School
					<%=branch%>
					branch Teacher reports
				</h4>

			</div>
		</div>

		<form class="form-inline" method="post"
			onsubmit="return checkForm(this)">
			<div class="form-inline col-lg-4 pull-right"
				style="margin: -10px 2px 12px 1px">
				<strong>Choose Report Type</strong> <select class="form-control"
					name="workassignment" required>
					<option></option>
					<option value="HomeRoomTeacher">HomeRoomTeacher</option>
					<option value="AssignedTeacher">AssignedTeacher</option>
					<option value="ResignedTeacher">ResignedTeacher</option>
					<option></option>
				</select>
				<button class="btn btn-primary">
					<span class="fa fa-arrow-right"></span>
				</button>
			</div>
		</form>
		<%String Teacher=request.getParameter("workassignment");
		 if(Teacher==null){
		 %>
		<div class="alert alert-warning">
			<h4 class="text-warning">You Should Choose Report Type</h4>
		</div>
		<%}else if(Teacher.equalsIgnoreCase("HomeRoomTeacher")){%>

		<table class="table table-responsive table-bordered">
			<tr>
				<th>ID</th>
				<th>Teacher ID</th>
				<th>FullName</th>
				<th>Gender</th>
				<th>Qualification</th>
				<th>Grade</th>
				<th>Section</th>
			</tr>
			<%
		 String id=null,teacherid=null,fullname=null,gender=null,fname=null,lname=null;int i=0;String Qualified=null;
		 Statement  stteacher=dbcon.getConnection().createStatement();
		 ResultSet rsteacher=stteacher.executeQuery("select * from TBL_HomeRoom  ");
		 if(!rsteacher.isBeforeFirst()){%>
			<h3 class="alert alert-info" style="color: red;"">home room
				teacher can't assigned in the database</h3>
			<%}%>
			Home Room Teacher List
			<%
		 while(rsteacher.next()){i++;
		 teacherid=rsteacher.getString("TeacherId");
		 Statement sthomeroom=dbcon.getConnection().createStatement();
		 ResultSet rshomeroom=sthomeroom.executeQuery("select *from TBL_teacher where TeacherId='"+teacherid+"'and Branch='"+branch+"'");
	 	 while(rshomeroom.next()){
			 
			 Qualified=rshomeroom.getString("Qualified");
		 fname=rshomeroom.getString("FirstName");
		 lname=rshomeroom.getString("LastName");
		 fullname=fname+   "\n  "+lname;
		 gender=rshomeroom.getString("Gender");
		 }
		 Statement homeroom=dbcon.getConnection().createStatement();
		 String sectionid=null;int grade=0;
		 ResultSet rshomeroomteacher=homeroom.executeQuery("select *from TBL_HomeRoom where TeacherId='"+teacherid+"'");
		 while(rshomeroomteacher.next()){
			 sectionid=rshomeroomteacher.getString("Section_id");
			 grade=rshomeroomteacher.getInt("Grade");
		 }
		 
			 %>

			<tr>
				<td><%=i %></td>
				<td><%=teacherid %></td>

				<td><%=fullname %></td>
				<td><%=gender %></td>
				<td><%=Qualified %></td>
				<td><%=grade %></td>
				<td><%=sectionid %></td>


			</tr>


			<%}%>


		</table>

		<div class="container-fluid">
			<input type="submit" onclick="printpage();" value="print this report"
				id="printpagebutton" class="pull-right btn btn-primary" />
		</div>
		<%}else if(Teacher.equalsIgnoreCase("AssignedTeacher"))
{%>
		<table class="table table-responsive table-bordered">
			<tr>
				<th>id</th>
				<th>TeacherId</th>
				<th>full name</th>

				<th>gender</th>
				<th>Qualification</th>
				<th>Grade</th>
				<th>Section</th>
			</tr>

			<%int j=0;
String idno=null,fullname=null,Gender=null,firstname=null,lastname=null,qualifed=null,section=null;int Grade=0;
	Statement assignedteacher=dbcon.getConnection().createStatement();
ResultSet rsassigndteacher=assignedteacher.executeQuery("select *from TBL_Subject_Teacher");
if(!rsassigndteacher.isBeforeFirst()){
	%>
			<h3 class="alert alert-info" style="color: red;"">subject
				teacher can't assigned in the database</h3>

			<%}
   while(rsassigndteacher.next()){
	idno=rsassigndteacher.getString("TeacherId");
	section=rsassigndteacher.getString("Section_id");
	Grade=rsassigndteacher.getInt("Grade");}
	Statement subjectteacher=dbcon.getConnection().createStatement();
	ResultSet rssubteacher=subjectteacher.executeQuery("select *from TBL_teacher where TeacherId='"+idno+"'and Branch='"+branch+"' ");
	while(rssubteacher.next()){j++;
	firstname=rssubteacher.getString("FirstName");
	lastname=rssubteacher.getString("LastName");
	fullname=lastname+"\n"+lastname;
	Gender=rssubteacher.getString("Gender");
	qualifed=rssubteacher.getString("Qualified");
	%>

			<tr>
				<td><%=j %></td>
				<td><%=idno %></td>

				<td><%=fullname %></td>
				<td><%=Gender %></td>
				<td><%=qualifed %></td>
				<td><%=Grade %></td>
				<td><%=section %></td>

			</tr>

			<%
}%>

		</table>
		<div class="container-fluid">
			<input type="submit" onclick="printpage();" value="print this report"
				id="printpagebutton" class="pull-right btn btn-primary" />
		</div>

		<%}else if(Teacher.equalsIgnoreCase("ResignedTeacher")){%>
		<table class="table table-responsive table-bordered">
			<tr>
				<th>Teacher id</th>
				<th>Full Name</th>

				<th>Gender</th>
				<th>Qualification</th>
			</tr>
			<%Statement resignedTeacher=dbcon.getConnection().createStatement();
String teachid=null,tfirstname=null,tlastname=null,tgender=null,qualified=null,fullName=null;
ResultSet rsresignedTeacher=resignedTeacher.executeQuery("select *from TBL_teacher where Status='Resigned'");
if(!rsresignedTeacher.isBeforeFirst()){%>


			<%}
while(rsresignedTeacher.next()){
	teachid=rsresignedTeacher.getString("TeacherId");
	tfirstname=rsresignedTeacher.getString("FirstName");
	tlastname=rsresignedTeacher.getString("LastName");
	fullName=tfirstname+"\n"+tlastname;
	tgender=rsresignedTeacher.getString("Gender");
	qualified=rsresignedTeacher.getString("Qualified");
	//teachid=rsresignedTeacher.getString("");
%>
			<tr>
				<td><%=teachid %></td>
				<td><%=fullName %></td>

				<td><%=tgender %></td>
				<td><%=qualified %></td>
			</tr>
			<%}%>

		</table>
		<div class="container-fluid">
			<input type="submit" onclick="printpage();" value="print this report"
				id="printpagebutton" class="pull-right btn btn-primary" />
		</div>

	</div>
	<%}} %>


</body>
</html>