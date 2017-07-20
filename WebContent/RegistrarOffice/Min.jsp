
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
	<div class="row">

		<p class="text-uppercase">
			ODA Special Boarding School
			<%=branch%>
			branch Student reports
		</p>



		<table class="table table-responsive table-bordered">
			<tr>
				<th>id</th>
				<th>Student ID</th>
				<th>full name</th>

				<th>gender</th>
				<th>Grade</th>
				<th>Total</th>
			</tr>
			<%int i=0;
String idno=null,fullname=null,gender=null,firstname=null,lastname=null;	String Studentid=null;int grade=0;
	Statement mark=dbcon.getConnection().createStatement();
ResultSet totalmark=mark.executeQuery("select min(Total) from TBL_Total_Mark where Pass_fail='pass' and Branch='"+branch+"'");
if(totalmark.next()){i++;
	idno=totalmark.getString(1);
		%>

			<%

}
Statement sttotal_mark=dbcon.getConnection().createStatement();
ResultSet rstotalmark=sttotal_mark.executeQuery("select *from TBL_Total_Mark where Total='"+idno+"'");
if(rstotalmark.next()){
	Studentid=rstotalmark.getString("Stud_id");
}
Statement studentname=dbcon.getConnection().createStatement();
ResultSet rsstudname=studentname.executeQuery("select * from TBL_student where Stud_id='"+Studentid+"'");
if(rsstudname.next()){
	firstname=rsstudname.getString("FirstName");
	lastname=rsstudname.getString("LastName");
	fullname=firstname+"\n"+lastname;
	gender=rsstudname.getString("Gender");
	grade=rsstudname.getInt("Grade");
} %>
			<tr>
				<td><%=i %></td>
				<td><%=Studentid %></td>
				<td><%=fullname %></td>


				<td><%=gender %></td>
				<td><%=grade %></td>
				<td><%=idno %></td>

			</tr>
		</table>
		<div class="container-fluid">
			<input type="submit" onclick="printpage();" value="print this report"
				id="printpagebutton" class="pull-right btn btn-primary" />
		</div>
	</div>
	<%}%>