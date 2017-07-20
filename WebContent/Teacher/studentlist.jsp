<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.Dbconnection"%>

<% 
  
  if(session.getAttribute("user")==null)
  {
	  response.sendRedirect("../index.jsp");
  }
Dbconnection studListdbcon=new Dbconnection();
  %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<style type="text/css" title="currentStyle">
@import "../resources/css/demo_table.css";
</style>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

<%
String teacherid,room=null,grade=null,section=null;
if(session.getAttribute("user")!=null)
{
String user=session.getAttribute("user").toString();	

Statement sts=studListdbcon.getConnection().createStatement();

String sql="select TeacherId from TBL_Users where userName='"+user+"' ";
ResultSet rstid=sts.executeQuery(sql);
while(rstid.next())
{
	teacherid=rstid.getString("TeacherId");
	
	Statement sthomerom=studListdbcon.getConnection().createStatement();
	
	String sql1="select Section_id,Grade from TBL_HomeRoom where TeacherId='"+teacherid+"'";
	ResultSet rshome=sthomerom.executeQuery(sql1);
	
	if(rshome.next())
	{
		section=rshome.getString(1);
		grade=rshome.getString(2);
		room=grade.concat(section);
	
%>
<title>Students List</title>
</head>
<body style="background: white">
	<div class="container-fluid">
		<%

Statement st=studListdbcon.getConnection().createStatement();
String qury="Select * from TBL_student where Grade='"+grade+"' and Section_id='"+section+"'";


//st.close();

%>

		<table class="table table-bordered col-md-12 table-responsive"
			style="background-color: white" id="studlist">
			<thead>
				<tr class="active">
					<td colspan="5"><strong>Students list of Grade <%out.print(room); %></strong></td>
				</tr>
				<tr class="info">
					<th>ID number</th>
					<th>Full Name</th>

					<th>Age</th>
					<th>Address</th>




				</tr>
			</thead>
			<%
ResultSet rsList=st.executeQuery(qury);
while(rsList.next())
{
	String id=rsList.getString("stud_id");
	String fname=rsList.getString("FirstName");
	String lname=rsList.getString("LastName");
	Date bdate = rsList.getDate("Birthdate");
	String address=rsList.getString("Address");
	String wereda=rsList.getString("wereda");
	int age;
%>

			<tr>
				<td width="10%">
					<%out.println(id); %>
				</td>
				<td width="10%"><%=fname+" "+lname%></td>

				<td width="10%">
					<%
					
					SimpleDateFormat simpledf = new SimpleDateFormat("y");
					String year = simpledf.format(bdate);
					int byear = Integer.valueOf(year);
					////
					Date date = new Date();
					SimpleDateFormat get_current_year = new SimpleDateFormat("YYYY");
					///get current year
					String current_year = get_current_year.format(date);
					int currentyear = Integer.valueOf(current_year);

					age = currentyear - byear + 1;
					out.println(age);
					%>
				</td>
				<td width="10%">
					<%out.println(address); %>
				</td>


			</tr>
			<%} %>
		</table>



		<script type="text/javascript">
$(document).ready(function() {
	var oTable = $('#studlist').bdt()
});

</script>
	</div>


</body>
<%


}
else
{
	%>

<h4 class="text-warning">Since you are not assigned as home room
	teacher, list of students is not available</h4>



<%

}
}
}
%>
</html>