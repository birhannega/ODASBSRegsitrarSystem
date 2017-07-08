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

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.bdt.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#male').bdt({
			ordering:true,
			scrollY:300,
			paging:true,
		});
		
	})
	$(document).ready(function(){
		$('#female').bdt({
			ordering:true,
			scrollY:200,
			paging:true,
		});
		
		
	})
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher list</title>
</head>
<body>
		<h4 class="alert-success" role="alert">${AlreadyInserted}</h4>	
		<%String userid=session.getAttribute("registrar").toString(),branch=null;
		 Statement stsession=dbcon.getConnection().createStatement();
		 ResultSet Rssession=stsession.executeQuery("select * from TBL_users where UserName='"+userid+"'");
		 if(Rssession.next()){
			 branch=Rssession.getString("branch");
			 //branch=Rssession.getString("branch");
		 }%>
		
		 
		  <form class="form-inline"method="post"onsubmit="return checkForm(this)">
		 <div class="form-inline col-lg-4 pull-right"style="margin:-10px 2px 12px 1px">
		 <strong>Choose Gender</strong>
		 <select class="form-control"name="gender"required>
		       <option value="">.....Choose Gender...</option>
		 		 <option value="Male">Male</option>
		 		 		 <option value="Female">Female</option>
		 		 		 		 <option></option>
		 </select>
		 <button class="btn btn-primary">
		 <span class="fa fa-arrow-right"></span>Go</button>
		 </div>
		  </form>
		 <%String genderofteacher=request.getParameter("gender");
		 if(genderofteacher==null){
		 %>
		
		 <%}else if(genderofteacher.equalsIgnoreCase("Male")){%>
		 <strong>Oda special boarding school for  male Teachers list</strong>
		 <hr>
      <table id="male"class="table table-responsive table-bordered">
		<tr>
		<th>ID</th>
		<th>Teacher ID</th>
		<th>FullName</th>
		<th>Gender</th>
		<th>Qualification</th>
		</tr>
	
			<%
			String id=null,teacherid=null,fullname=null,teachergender=null,fname=null,lname=null,qualification=null;int i=0;
		 Statement  stteacher=dbcon.getConnection().createStatement();
		ResultSet rsteacher=stteacher.executeQuery("select * from TBL_teacher where Gender='male' and Status='Active'and Branch='"+branch+"'"); 
		 if(!rsteacher.isBeforeFirst()){%>
		 <h3 class="alert alert-info"style="color:red;">Male Teacher Not in the database</h3>
   	 <%}
		 while(rsteacher.next()){i++;
		 teacherid=rsteacher.getString("TeacherId");
		 fname=rsteacher.getString("FirstName");
		 lname=rsteacher.getString("LastName");
		 fullname=fname+   "\n  "+lname;
		 teachergender=rsteacher.getString("Gender");
		 qualification=rsteacher.getString("Qualified");
	 %>
			
			 <tr>
		<td><%=i %></td>
		<td><%=teacherid %></td>
		<td><%=fullname %></td>
		<td><%=teachergender %></td>
		<td><%=qualification %></td>
			
		</tr>
		


	
<%}%>
		
</table>
	<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
<%}else if(genderofteacher.equalsIgnoreCase("Female")){ %>
<strong>Oda special boarding school Female Teachers List</strong>
         <table id="female"class="table table-responsive table-bordered">
<tr>
<th>id</th>
<th>id no</th>
<th>full name</th>
<th>Qualification</th>
<th>gender</th>

</tr>
<%int i=0;
String idno=null,fullname=null,gender=null,firstname=null,lastname=null,qualified=null;
	Statement stfemal=dbcon.getConnection().createStatement();
ResultSet rsfemal=stfemal.executeQuery("select *from TBL_teacher where Gender='Female'and Branch='"+branch+"'and Status='Active'");
if(!rsfemal.isBeforeFirst()){%>
<h3 class="alert alert-info"style="color:red;">Female Teacher Not in the database</h3>
<%}
while(rsfemal.next()){i++;
	idno=rsfemal.getString("TeacherId");
	firstname=rsfemal.getString("FirstName");
	lastname=rsfemal.getString("LastName");
	fullname=firstname+"\n"+lastname;
	gender=rsfemal.getString("Gender");
	qualified=rsfemal.getString("Qualified");
	%>
	<tr>
		<td><%=i %></td>
	<td><%=idno %></td>

	<td><%=fullname %></td>
	<td><%= qualified%></td>
	<td><%=gender %></td>
	</tr>
	<%
}%>
</table>

	<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
	
<%}}%>



</body>
</html>