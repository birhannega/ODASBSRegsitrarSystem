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
		 <div class="container-fluid">
		
			
	
		 
		  <form class="form-inline"method="post"onsubmit="return checkForm(this)">
		 <div class="form-inline  pull-right"style="margin:-10px 2px 12px 1px">
		 	
		 <strong>Choose Gender</strong>
		 <select class="form-control"name="gender"required>
		       <option value="">choose Gender</option>
		 		 <option value="Male">Male</option>
		 		 		 <option value="Female">Female</option>
		 		 		 		 
		 </select>
		 <button class="btn btn-primary">
		 <span class="fa fa-arrow-right"></span></button>
		 </div>
		  </form>
		 <%String Gender=request.getParameter("gender");
		 if(Gender==null){
		 %>
		
		 <p>You Should Choose Gender</p>
		 </div>
		 <%}else if(Gender.equalsIgnoreCase("Male")){%>
       
			<%
			String id=null,studentid=null,fullname=null,genderofStudent=null,fname=null,lname=null;int i=0;
		 Statement  male=dbcon.getConnection().createStatement();
		 ResultSet rsmale=male.executeQuery("select * from TBL_student where Gender='male' and Status='Active'and Branch='"+branch+"'"); 
		 if(!rsmale.isBeforeFirst()){%>
		 <h3 class="alert alert-info"style="color:red;">No Male Students found</h3>
		 <%} %>
		  <table class="table table-responsive table-bordered">
		  <tr >	
		  <td colspan="4">
		  <p class="text-uppercase text-center">ODA Special Boarding School
					<%=branch%>
					branch  Students reports
			</p></td></tr>
		<tr>
		<th >ID</th>
		<th>Student ID</th>
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
		<td class="active"><%=i %></td>
		<td><%=studentid %></td>
		<td><%=fullname %></td>
		<td><%=genderofStudent %></td>
			
		</tr>
		


<%}%>
		</table>
<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
<%}else if(Gender.equalsIgnoreCase("Female")){ %>

<%int i=0;
String idno=null,fullname=null,gender=null,firstname=null,lastname=null;

	Statement stfemal=dbcon.getConnection().createStatement();
ResultSet rsfemal=stfemal.executeQuery("select *from TBL_student where Gender='Female'and Status='Active'and Branch='"+branch+"'");
if(!rsfemal.isBeforeFirst()){%>
<div class="clearfix" style="height:40px"></div>
<div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>oops!no Female Student(s) found </strong>
  
</div>




<%} %>
         <table class="table table-responsive table-bordered">
<tr>
<th>id</th>
<th>student ID</th>
<th>full name</th>

<th>gender</th>

</tr>
<% 
while(rsfemal.next()){i++;
	idno=rsfemal.getString("Stud_id");
	firstname=rsfemal.getString("FirstName");
	lastname=rsfemal.getString("LastName");
	fullname=firstname+"\n"+lastname;
	gender=rsfemal.getString("Gender");
	%>
	<tr>
		<td><%=i %></td>
	<td><%=idno %></td>

	<td><%=fullname %></td>
	<td><%=gender %></td>
	</tr>
	<%
}%>
	
</table>
<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>

<%}}%>
</div>



</body>
</html>