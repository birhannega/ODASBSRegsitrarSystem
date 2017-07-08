<%
if(session.getAttribute("registrar")==null)
{
response.sendRedirect("../index.jsp");
}else
{
	Dbconnection dbconnection=new Dbconnection();
	Connection connection=dbconnection.getConnection();
	Statement st_logged_user=connection.createStatement();
	String branch=null;
	ResultSet res_user=st_logged_user.executeQuery("select branch from TBL_users where userName='"+session.getAttribute("registrar").toString()+"'");
      if(res_user.next())
      {
    	  branch=res_user.getString(1);
      }
%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<link rel="stylesheet" type="text/css" href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<title>Active Teachers</title>
</head>
<body class="container-fluid">
<div class=" row">
<%@ include file="../includes/vector.jsp" %>
</div>

<div class=" row" style="margin-top: -15px">
<%@ include file="../includes/nav.html" %>
</div>

<div class="container-fluid col-lg-3 col-md-3" style="margin-top: -10px">
<%@ include file="../includes/sidebar.jsp" %>
</div>
<div class="container-fluid col-lg-9 col-md-9" style="margin-top: -10px">
<table class="table table-bordered" id="teacherlist">
<thead>
<tr>
<th colspan="5" class=" active text-success text-uppercase">List of Currently Active Teachers in ODA special Boarding school <%out.println(branch); %>branch</th>

</tr>
<tr>
<th>No.</th>
<th>Teacher ID </th>
<th>Full Name </th>
<th>Qualification </th>
<th>Hire Date </th>
</tr>
</thead>
<tbody>
<%
Date date=new Date();
SimpleDateFormat format=new SimpleDateFormat("Y");
String Year=format.format(date);

int i=0;
int j=1;

Statement statement=connection.createStatement();
ResultSet resultSet=statement.executeQuery("select * from TBL_Teacher where Status='Active' and branch='"+branch+"'");
while(resultSet.next())
{
%>
<tr>
<td><%=j %></td>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName") %></td>
<td><%=resultSet.getString("qualified") %></td>
<td><%=resultSet.getString("hiredate") %></td>
</tr>
<%	
i++; 
j++;
}
%>
</tbody>
<tfoot> <tr> <td colspan="5" class="text-center"> <span >Total of <%=i %> Teachers Found </span></td></tr></tfoot>
</table>
</div>
	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		
		<p class="text-info well well-sm ">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>
<script type="text/javascript"  src="../resources/js/jquery.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.bdt.js"></script>
	<script type="text/javascript">
	$().ready(function(){
		
		$("#teacherlist").bdt();
	});
	</script>
		<%
 
Date currentdate=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(currentdate);
String month=lsdf.format(currentdate);
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>
</body>
</html>
<%}%>