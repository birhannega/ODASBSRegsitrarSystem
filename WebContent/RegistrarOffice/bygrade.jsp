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
					branch  Students reports
			</p>
	
		 
		  <form class="form-inline"method="post"onsubmit="return checkForm(this)">
		 <div class="form-inline  pull-right"style="margin:-10px 2px 12px 1px">
		 <strong>Choose Grade</strong>
		 <select class="form-control" name="grade"required>
		       <option value="">choose Grade</option>
		 		 <option>9</option>
		 		 		 <option >10</option>
		 		 		 		 <option>11</option>
		 		 		 		 <option>12</option>
		 </select>
		 <button class="btn btn-primary">
		 <span class="fa fa-arrow-right"></span></button>
		 </div>
		  </form>
		 <%String Grade=request.getParameter("grade");
		 String state=null;
		 if(Grade==null){
		 %>
		
		 <p>You Should Choose Grade</p>
		 </div>
		 <%
		 }
		 else
		 {
		 %>
       
			<%
			String id=null,studentid=null,fullname=null,genderofStudent=null,fname=null,lname=null;int i=0;
		 Statement  male=dbcon.getConnection().createStatement();
		 ResultSet rsmale=male.executeQuery("select * from TBL_student where Status='Active'and Branch='"+branch+"' and Grade='"+Grade+"'"); 
		 if(!rsmale.isBeforeFirst()){
			 state="disabled";
		 %>
		
		 <p style="color:red;">No Student found in the for the given Grade</p>
		 <%} %>
		  <table class="table table-responsive table-bordered">
		<tr>
		<th>No.</th>
		<th>Student ID</th>
		<th>FullName</th>
		<th>Gender</th>
		
		</tr>
		
		<% while(rsmale.next()){
			i++;
		 state="enabled";
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
<input  type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
<%}}%>




</body>
</html>