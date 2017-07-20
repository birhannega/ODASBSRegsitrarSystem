
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
<body>
	<%String userid=session.getAttribute("registrar").toString(),branch=null;
		 Statement stsession=dbcon.getConnection().createStatement();
		 ResultSet Rssession=stsession.executeQuery("select * from TBL_users where UserName='"+userid+"'");
		 if(Rssession.next()){
			 branch=Rssession.getString("branch");
			 //branch=Rssession.getString("branch");
		 }%>
	<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xs-12">

		<p class="text-uppercase">
			ODA Special Boarding School
			<%=branch%>
			branch Students reports
		</p>


		<form class="form-inline" method="post"
			onsubmit="return checkForm(this)">
			<div class="form-inline  pull-right"
				style="margin: -10px 2px 12px 1px">
				<strong>Choose zone</strong> <select class="form-control"
					name="gender" required>
					<option value="">----select zone</option>

					<option>oromia special Zone surrounding Finfine</option>
					<option>West shoa</option>
					<option>North Shoa</option>
					<option>East shoa</option>
					<option>South west shoa</option>
					<option>East Wellega</option>
					<option>West Wellega</option>
					<option>Horro Guduru wellega</option>
					<option>Qelem Wellega</option>
					<option>Illu Aba bor</option>
					<option>Jimma</option>
					<option>West Arsi</option>
					<option>Arsi</option>
					<option>Borena</option>
					<option>Guji</option>
					<option>East Harerghe</option>
					<option>West Harerghe</option>
					<option>West Guji</option>
					<option>Buno Bedelle</option>
					<option>Bale</option>

				</select>
				<button class="btn btn-primary">
					<span class="fa fa-arrow-right"></span>
				</button>
			</div>
		</form>
		<%String zone=request.getParameter("gender");
		 if(zone==null||zone.trim()==""){
		 %>

		<p>You Should Choose Gender</p>
	</div>
	<%
		 }
		 else
		 {	 
		 %>

	<%
			String id=null,studentid=null,fullname=null,genderofStudent=null,fname=null,lname=null;int i=0;
		 Statement  male=dbcon.getConnection().createStatement();
		 ResultSet rsmale=male.executeQuery("select * from TBL_student where  Status='Active'and Branch='"+branch+"' and Zone='"+zone+"'"); 
		 if(!rsmale.isBeforeFirst()){%>
	<p style="color: red;">no Student found with the given zone</p>
	<%} %>
	<table class="table table-responsive table-bordered">
		<tr>
			<th>ID</th>
			<th>Teacher ID</th>
			<th>FullName</th>
			<th>Gender</th>

		</tr>

		<% while(rsmale.next()){i++;
		 studentid=rsmale.getString("Stud_id");
		 fname=rsmale.getString("FirstName");
		 lname=rsmale.getString("LastName");
		 fullname=fname+   "\n  "+lname;
		 genderofStudent=rsmale.getString("Gender");
 %>

		<tr>
			<td><%=i %></td>
			<td><%=studentid %></td>
			<td><%=fullname %></td>
			<td><%=genderofStudent %></td>

		</tr>



		<%}%>
	</table>
	<div class="container-fluid">
		<input type="submit" onclick="printpage();" value="print this report"
			id="printpagebutton" class="pull-right btn btn-primary" />
	</div>
	<%}}%>




</body>
</html>