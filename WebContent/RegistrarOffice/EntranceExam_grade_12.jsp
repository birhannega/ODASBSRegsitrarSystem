

<%if(session.getAttribute("registrar")==null) {
response.sendRedirect("../index.jsp");
}
else {
	

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
					branch EntranceExam Mark Inserted Form
				</h4>

			</div>
		</div>

		<p class="alert alert-info">
			<strong>${Existed} ${registerd} ${notregisterd}</strong>
		</p>

		<%request.getSession().setAttribute("Existed", null); %>
		<%
		  request.getSession().setAttribute("notregisterd", null); %>
		<%request.getSession().setAttribute("registerd", null); %>
		<table class="table table-responsive table-bordered">
			<tr>
				<td>StudentId</td>
				<td>firstName</td>
				<td>Grade</td>

				<td>Aptitude</td>
				<td>Biology</td>
				<td>Chemistry</td>
				<td>Civics</td>
				<td>English</td>
				<td>Maths</td>
				<td>Physics</td>
				<td>Action</td>
			</tr>
			<%Statement entrance=dbcon.getConnection().createStatement();
		String studid=null,firstname=null,ayear=null,Branch=null;int grade=0;
		ResultSet entranceexam=entrance.executeQuery("select *from TBL_student where Grade='12'and Branch='"+branch+"'");
		while(entranceexam.next()){
			studid=entranceexam.getString("Stud_id"); 
				firstname=entranceexam.getString("FirstName");
				grade=entranceexam.getInt("Grade");
				ayear=entranceexam.getString("AcademicYear");
				Branch=entranceexam.getString("Branch");%>

			<tr>
				<form action="${pageContext.request.contextPath }/Grade_12_entrance"
					method="post" onsubmit="return chekForm(this)">

					<td><%=studid %> <input type="hidden" value="<%=studid %>"
						name="Studid"></td> <input type="hidden" value="<%=ayear %>"
						name="ayear"> <input type="hidden" value="<%=Branch %>"
						name="branch">
					<td><%=firstname %></td>
					<td><%=grade %> <input type="hidden" value="<%=grade %>"
						name="grade"></td>
					<%Statement stsubject=dbcon.getConnection().createStatement();
		int i=0,j=0;
		String subjectid="subjectid",subjectname="subjectname";
		ResultSet rssubject=stsubject.executeQuery("select distinct Subject_id from TBL_SUBJ where Grade='"+grade+"'and Subject_id='Chemistry12' or Subject_id='Biology12' or Subject_id='Physics12'or Subject_id='English12'or Subject_id='Civics12'or Subject_id='Aptitude12'or Subject_id='Maths12'order by Subject_id");
		while(rssubject.next()){
			String id=subjectid+i;
			String name=subjectname+i;
					%>
					<td><input type="number" name="<%=id%>" class="form-control"
						required="required" min="1" max="100"> <input
						type="hidden" name="<%=name%>" value="<%=rssubject.getString(1)%>"
						class="form-control" required="required" min="1" max="100">
					</td>
					<%
		i++;
		
		} %>

					<td><input type="submit" value="submit"></td>
			</tr>
			</form>
			<%}%>
		</table>
	</div>
	<%} %>
</body>
</html>