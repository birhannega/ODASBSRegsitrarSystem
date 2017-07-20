
<%if(session.getAttribute("registrar")==null){
	response.sendRedirect("../index.jsp");
	
}else
{
		

	%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="databaseConnection.Dbconnection"%>
<div class="form-group">
	<form class="form-inline pull-right" method="post" Action="">
		<select name="qualification" class="form-control">
			<option value="AfanOromo">Afan Oromo</option>
			<option>Amharic</option>
			<option>English</option>
			<option>Mathematics</option>
			<option>Physics</option>
			<option>Chemistry</option>
			<option>Biology</option>
			<option>Civics</option>
			<option>BT.Drawing</option>
			<option>ICT</option>
			<option>Chinese</option>
			<option>Sport</option>

		</select>
		<button type="submit" class="btn btn-primary">
			GO! <span class="fa fa-arrow-right"></span>
		</button>

	</form>


</div>
<%
String subject=request.getParameter("qualification"),branch=null;
String loggeduser=session.getAttribute("registrar").toString();

Dbconnection  dbconnection=new Dbconnection();
Connection connection=dbconnection.getConnection();
Statement statement=connection.createStatement();

ResultSet resultSet=statement.executeQuery("select Branch from TBL_Users where userName='"+loggeduser+"'");
if(resultSet.next())
{
	branch=resultSet.getString(1);
	
}
String fname=null,id=null,lname=null,qualification=null;

ResultSet reSet=statement.executeQuery("select * from TBL_teacher where Status='Active' and Branch='"+branch+"' and Qualified='"+subject+"'");
%>
<div class="page-header">
	Teachers whose qualification subject is <strong><%=subject %></strong>
	in
	<%=branch %>
	branch
</div>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>No.</th>
			<th>Teacher ID</th>
			<th>Full name</th>
			<th>Hire date</th>
		</tr>
	</thead>


	<tbody>
		<%
int i=1;
while(reSet.next())
{
	%>
		<tr>
			<td><%=i %></td>
			<td><%=reSet.getString("TeacherID") %></td>
			<td><%=reSet.getString("FirstName")+" "+reSet.getString("LastName")%></td>
			<td><%=reSet.getString("HireDate") %></td>
		</tr>



		<%
	i++;
}


}
%>
	</tbody>
</table>