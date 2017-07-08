<%if(session.getAttribute("registrar")==null) {
	response.sendRedirect("../index.jsp");
	
}
else{
%>


 <%@page import="databaseConnection.Dbconnection"%>
    
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssignedTeacher</title>
</head>
<body>
<div class="container-fluid">
<table class="table table-bordered">

<thead>
<tr>
<th colspan="3"><strong>List of Active Assigned Teacher</strong></th>

</tr>
<tr>
<th>FirstName</th>
<th>LastName</th>
<th>Gender</th>
<th>Qualified</th>
</tr>
<thead>
<tbody>
<%
String  branch=null,firstname=null,lastname=null,gender=null,qualified=null;
Dbconnection dbcon=new Dbconnection();
String user=session.getAttribute("registrar").toString();
Statement st_user=dbcon.getConnection().createStatement();
ResultSet rs_user=st_user.executeQuery("select * from tbl_users ");
while(rs_user.next()){
	branch=rs_user.getString("branch");

}
ResultSet rs_teacher=st_user.executeQuery("select * from tbl_teacher where branch='"+branch+"'and status='active'");
while(rs_teacher.next()){
	firstname=rs_teacher.getString("firstname");
	lastname=rs_teacher.getString("lastname");
	gender=rs_teacher.getString("gender");
	qualified=rs_teacher.getString("qualified");

%>
<tr>
<td><%=firstname%></td>
<td><%=lastname %></td>
<td><%=gender %></td>
<td><%=qualified %></td>
</tr>

<%} }%></tbody>

</table>
  		<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
	
</div>
</body>
</html>