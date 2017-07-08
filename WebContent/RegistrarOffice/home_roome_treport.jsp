<%if(session.getAttribute("registrar")==null){
	response.sendRedirect("../index.jsp");
	
}
else{%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
<title>teacher</title>
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
<div class="container-fluid">
<table class="table table-bordered" >

<thead>
<tr>
<th colspan="3"><strong>List of Home Room Teacher</strong></th>

</tr>
<tr>
<th>FirstName</th>
<th>LastName</th>
<th>Gender</th>
<th>Address</th>
<th>Grade</th>
<th>Section</th>
</tr>
<thead>
<tbody>
<%

int i=1;
String first=null,last=null,address=null,Gender=null,Qualified=null,branch=null,section=null, Grade=null,teacherid=null;
Dbconnection db_con=new Dbconnection();
Statement statement_teacherlist=db_con.getConnection().createStatement();

String userid=session.getAttribute("registrar").toString();
ResultSet rs_user=statement_teacherlist.executeQuery("select *from TBL_users where UserName='"+userid+"'and currentState='Active'");
while(rs_user.next()){
branch=rs_user.getString("branch");

}
ResultSet rs_teacher=statement_teacherlist.executeQuery("select * from TBL_HomeRoom where branch='"+branch+"'");
while(rs_teacher.next()){
	section=rs_teacher.getString("section_id");
	Grade=rs_teacher.getString("Grade");
	teacherid=rs_teacher.getString("TeacherId");
	Statement st_teacher=db_con.getConnection().createStatement();
ResultSet rs_list=st_teacher.executeQuery("select firstname,lastname,address,gender,qualified from TBL_teacher where status='Active'and branch='"+branch+"'and TeacherId='"+teacherid+"'");
while(rs_list.next()){
	first=rs_list.getString("FirstName");
	last=rs_list.getString("LastName");
	Gender=rs_list.getString("gender");
	address=rs_list.getString("address");

}%>
	<tr>
<td><%=first %></td>
<td><%=last%></td>
<td><%=Gender %></td>
<td><%=address %></td>
<td><%=Grade %></td>
<td><%=section%></td>
</tr>
<%
i++;


}} %>



</tbody>
</table>
  		<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
	
</div>
</body>
</html>