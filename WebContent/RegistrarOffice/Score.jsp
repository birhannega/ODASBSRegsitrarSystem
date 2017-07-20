
<%if (session.getAttribute("registrar") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		String ActiveUser = session.getAttribute("registrar").toString();%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection(); %>
<!DOCTYPE html>
<html>
<head>
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
<title>Student Reports</title>
<script type="text/javascript">
function printpage() {

    var printButton = document.getElementById("printpagebutton");
 
    printButton.style.visibility = 'hidden';
   
    window.print()
     printButton.style.visibility = 'visible';
}


</script>
</head>
<body>
	<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="text-uppercase">ODA special Boarding school student
					Record Management System</h4>

			</div>
		</div>
		<h4 class="alert-success" role="alert">${AlreadyInserted}</h4>

		<%
		String TeacherID, grade, section=null, room, branch,academicyear=null;

			
			Statement st = dbcon.getConnection().createStatement();
			String sql = "select TeacherId,branch from TBL_Users where userName='" + ActiveUser + "' ";
			ResultSet rs_test = st.executeQuery(sql);
			if (rs_test.next()) {
				TeacherID = rs_test.getString(1);
				branch = rs_test.getString(2);
							%>
		<div class="container-fluid" style="margin-top: 3px;">


			<div class="  container-fluid">
				<h4 class="text-info text-center">
					ODA Special Boarding School
					<%=branch%>
					branch<br> Student reports
				</h4>
				<form action="">
					<input type="number" name="mark" required> <input
						type="submit" value="submit">
				</form>

				<%			
if(request.getParameter("mark")!=null && request.getParameter("mark")!="")
{
	float score=Float.valueOf(request.getParameter("mark"));
if(score!=0){
Statement st3=dbcon.getConnection().createStatement();
int i=0;

%>

				<%
float result=0;
ResultSet rs=st3.executeQuery("select * from TBL_Total_Mark where Total>='"+score+"' order by Total DESC ");
if(!rs.isBeforeFirst()){%>
				<h3 class="alret alert-info " style="color: red;">isn't greater
					than this number</h3>
				<%}%>
				<table class="table table-responsive table-bordered">
					<tr>
						<th>id</th>
						<th>Student id</th>
						<th>grade</th>
						<th>Section</th>
						<th>result</th>
						<th>AcademicYear</th>
					</tr>

					<% 
while(rs.next()){i++;
result=rs.getFloat("Total");
String student_id=rs.getString("Stud_id");
int gradelist=rs.getInt("Grade");
String sectionid=rs.getString("Section_id");
academicyear=rs.getString("AcademicYear");
	%>

					<tr>
						<td><%=i %></td>
						<td><%=student_id %></td>
						<td><%=gradelist %></td>
						<td><%=sectionid %></td>
						<td><%=result %></td>
						<td><%=academicyear %></td>
					</tr>

					<%
}
%>
				</table>
				<div class="container-fluid">
					<input type="submit" onclick="printpage();"
						value="print this report" id="printpagebutton"
						class="pull-right btn btn-primary" />
				</div>

				<%
}}else{%>
				<p class="aleret alert-info" style="color: red;">Enter The
					Comparison Number</p>
				<%}}}%>



			</div>
		</div>
	</div>
</body>
</html>