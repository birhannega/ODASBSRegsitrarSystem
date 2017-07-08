<%@ page import="java.sql.*" %>
<%@ page import="databaseConnection.*" %>

<div class="col-lg-12">


<div class="panel panel-default">
<div class="panel-heading">List of User Accounts</div>
<div class="panel-body">
<div class="form-group">

<form action="" method="post">
<div class="form-inline">
<select class="form-control " name="account">
<option>Active</option>
<option>Blocked</option>
<option>Closed</option>
</select>


<input type="submit" class="btn btn-primary">
</div>

</form>
<div class="container-fluid" style="margin-top: 13px;"></div>
	<table class="table table-responsive table-bordered">
	<thead>
	<tr>
	<td colspan="3">List of <%=request.getParameter("account") %> accounts</td>
	</tr>
	<tr>
	<td>No.</td>
	<td>Teacher ID</td>
	
	</tr>
	</thead>
	
	
	

	
<%
String account=request.getParameter("account");

Dbconnection databasecon=new Dbconnection();
Connection connection=databasecon.getConnection();
Statement statement=connection.createStatement();
ResultSet res=statement.executeQuery("select TeacherId,userName from TBL_Users where currentstate='"+account+"' ");
int i=1;
while(res.next())
{
	String Teacherid=res.getString(1);
	%>
	<tr>
	<td><%=i %></td>

		<td><%=Teacherid %></td>
		
	</tr>
	
	
	<%
	i++;
}
%>

	</table>
</div>
</div>

</div>
</div>
