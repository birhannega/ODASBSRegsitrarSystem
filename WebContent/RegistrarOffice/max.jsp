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
<%@page import="java.util.Date" %>
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
		
				<p class="text-uppercase">ODA Special Boarding School
					<%=branch%>
					branch  Teacher reports
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
			<%
			String id=null,maxmark=null,fullname=null,genderofStudent=null,fname=null,lname=null;int i=0,Grade=0;
		 Statement  max=dbcon.getConnection().createStatement();
		 ResultSet rsmax=max.executeQuery("select Max(Total) from TBL_Total_Mark where Pass_fail='pass' and Branch='"+branch+"'"); 
		 while(rsmax.next()){i++;
		 maxmark=rsmax.getString(1);
			 Statement totalmark=dbcon.getConnection().createStatement();
			 ResultSet rsmaxvalue=totalmark.executeQuery("select *from TBL_Total_Mark where Total='"+maxmark+"'");
			 while(rsmaxvalue.next()){
				 id=rsmaxvalue.getString("Stud_id");
				 
			 }
			 Statement ststud_id=dbcon.getConnection().createStatement();
			 ResultSet rsstud_id=ststud_id.executeQuery("select * from TBL_student where Stud_id='"+id+"'and Branch='"+branch+"'");
			 while(rsstud_id.next()){
				 genderofStudent=rsstud_id.getString("Gender");
				 fname=rsstud_id.getString("FirstName");
				 lname=rsstud_id.getString("LastName");
				 fullname=fname+"\n"+lname;
				 Grade=rsstud_id.getInt("Grade");
			 }%>
			
			 <tr>
		<td><%=i %></td>
		<td><%=id %></td>
		<td><%=fname %></td>
		
		<td><%=genderofStudent %></td>
		<td><%=Grade %></td>
					<td><%=maxmark %></td>
		</tr>
		</table>
		<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
	
<%}}%>
</div>



</body>
</html>