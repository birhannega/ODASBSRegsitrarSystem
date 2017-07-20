
<%
if(session.getAttribute("registrar")==null)
{
response.sendRedirect("../index.jsp");
}
else{
%>

<html>
<head>

<script type="text/javascript"
	src="../resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#section").validate({

			rules : {
				grade : "required",
				size:"required",
				studentID : {
					required : true,
					minlength : 16,
					maxlength : 16,
					autocomplete : false,
				}
			}
		});
	});
</script>
</head>
<%@ page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>


<%if (session.getAttribute("registrar")!=null){
	Dbconnection dbcon=new Dbconnection();
	Connection _connection=dbcon.getConnection();
	Statement st_choose_grade=_connection.createStatement();
	ResultSet rs_choose_grade=st_choose_grade.executeQuery("Select * from TBL_grade");
	%>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Students Section Assignment form</strong>
	</div>
	<div class="panel-body">
		<div class="panel-content">

			<form class="form-inline"
				action="${pageContext.request.contextPath }/sectioning" id="section"
				method="post">
				<h4 style="color: red">${SectionnotAssigned}</h4>

				<h4 style="color: green">${SectionAssigned}</h4>

				<div class="form-group ">
					<label for="grade" class="label-control">Grade</label> <select
						class="form-control" name="grade">
						<option value="">Choose Grade</option>
						<%
    while(rs_choose_grade.next())
	{
		String grade=rs_choose_grade.getString(1);
	%>

						<option><%=grade%></option>
						<%} %>
					</select>
				</div>

				<div class="form-group ">
					<label for="section">Section size</label> <input type="number"
						name="size" class="form-control">

				</div>

				<div class="form-group ">
					<button type="submit" class="btn btn-primary    pull-right">Assign
						section</button>
				</div>

			</form>
		</div>
	</div>
</div>
<%
}
else
{
	%>
<div class="container-fluid">
	<h4 class="text-warning">you should have Login first</h4>
	<%
	response.sendRedirect("../index.jsp");
	%>
</div>

<%
}
}
%>