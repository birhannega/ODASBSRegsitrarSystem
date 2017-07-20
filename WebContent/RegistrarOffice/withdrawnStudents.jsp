
<%if(session.getAttribute("Registrar")==null)
{
	response.sendRedirect("../index.jsp");
}
else
{
	%>
<div>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.Date"%>
	<%@page import="databaseConnection.Dbconnection"%>

	<p>List of withdrawn Students</p>
	<%
Date curdate=new Date();
String branch=null;
SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
String year=dateFormat.format(curdate);
Dbconnection db_list_withdrawn=new Dbconnection();
Connection withconnection=db_list_withdrawn.getConnection();
Statement withdrawn=withconnection.createStatement();
ResultSet res_branch=withdrawn.executeQuery("select Branch from TBL_users where userName='"+session.getAttribute("Registrar").toString()+"'");
if(res_branch.next())
{
	branch=res_branch.getString(1);

ResultSet withResultSet=withdrawn.executeQuery("select * from TBL_student where Status='withdraw' and Branch='"+branch+"' and AcademicYear='"+year+"'");
%>
	<table>

		<%
while(withResultSet.next())
{
	%>

		<tr>
			<td><%=withResultSet.getString(1) %></td>
			<td><%=withResultSet.getString(1) %></td>

		</tr>

		<%
	}
}else
{
	out.print("you are not logged in");
}
}
%>

	</table>
</div>