
    <%
    
    if(session.getAttribute("user")==null)
    {
    	response.sendRedirect("../index.jsp");
    	
    }
    else
    	{
    	String teacherid=session.getAttribute("user").toString();
    	
    	
    %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
     <%@ page import="databaseConnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
</head>
<body>

<%
String teacher_id=null;

Dbconnection dbcon=new Dbconnection();
Connection connect=dbcon.getConnection();

String queryUser="select TeacherId from TBL_Users where userName='"+teacherid+"'";

Statement st_us=connect.createStatement();

ResultSet res=st_us.executeQuery(queryUser);
if(res.next())
{
 teacher_id=res.getString("TeacherId");

Statement statement_te=connect.createStatement();
String query_subject="select * from TBL_Subject_Teacher where TeacherId='"+teacher_id+"'";
ResultSet rs=statement_te.executeQuery(query_subject);

%>
 <div class="container-fluid">

 
  <table class="table  table-bordered table-responsive ">
	<thead>
	<tr class="info">
	<td colspan="4">
	<strong class=" active">You are Teaching the following subjects </strong>
	</td>
	</tr>
	<tr class="default">
	<th>Subject ID</th>
	<th>Subject Name</th>
	<th>Grade</th>
	<th>Section</th>
	</tr>
	</thead>
	<tbody>
<%
if(!rs.isBeforeFirst())
{
%>
<tr>
<td colspan="4">
<%
out.print("No subjects are assigned yet ");
%>
</td>
</tr>
<%
}
while(rs.next())	
{
	String subject=rs.getString("Subject_id"),
			section=rs.getString("Section_id"),Grade=rs.getString("Grade");
	
	String name=null;
	Statement st_name=connect.createStatement();
	ResultSet rs_name=st_name.executeQuery("select Name from TBL_SUBJ where subject_id='"+subject+"'");
	while(rs_name.next())
	{
		name=rs_name.getString(1);
	}
	%>
	
	
	<tr>
	<td class="text-capitalize"><small> <%=subject %></small></td>
	<td class="text-capitalize"> <small><%=name %></small></td>
	<td class="text-capitalize"> <small><%=Grade %></small></td>
	<td class="text-capitalize"> <small><%=section %></small></td>
	</tr>
	<%
	
}
}
else
{
%>
<tr>
<td>
<h1>you are not teacher for any classes yet</h1></td>
</tr>
<%}} %>
	</tbody>
	<tfoot>

	 </tfoot>
	
	
	</table>
  </div>

 

	

</body>
</html>