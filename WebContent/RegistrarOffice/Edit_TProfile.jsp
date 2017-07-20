
<%
if (session.getAttribute("registrar") == null) {
	response.sendRedirect("../index.jsp");
} else {
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseConnection.Dbconnection"%>
<div class="container-fluid">
	<form class="form-inline pull-right" method="post">
		<div class="form-group">
			<label class="sr-only" for="id">Teacher ID</label>
			<div class="input-group">
				<div class="input-group-addon  alert-info">Enter Teacher ID</div>
				<input type="text" class="form-control" name="TID"
					placeholder="Teacher ID ex. R/000/2009" required="required">

			</div>
		</div>
		<button type="submit" class="btn btn-primary">
			Go <span class="fa fa-arrow-right fa-1x"></span>
		</button>
	</form>
</div>
${updated}
<%



request.getSession().setAttribute("updated", null);

String ID=request.getParameter("TID");
if(ID==null||ID.trim()=="")
{
	%>
<div></div>
<%
}else
{
Dbconnection dbconnection=new Dbconnection();
Statement statement=dbconnection.getConnection().createStatement();
//get branch of logged user
String branch=null;
ResultSet rs_loged_user=statement.executeQuery("select * from TBL_users where userName='"+session.getAttribute("registrar").toString()+"'");
if(rs_loged_user.next())
{
	branch=rs_loged_user.getString("branch");
}else{
	out.println("<div class='alert alert-warning'> unable to determine brancv</div>");
}

ResultSet resultSet=statement.executeQuery("select * from TBL_teacher where TeacherID='"+ID+"' and branch='"+branch+"'");
%>

<%
int i=0;
String field="field";

if(resultSet.next())
{
%>
<div class="form-group">
	<form class="form-group" method="post"
		action="${pageContext.request.contextPath}/ProfileEditor">
		<div class="form-group col-md-3 col-lg-4">
			Teacher ID:<input disabled value="<%=resultSet.getString(1) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			First Name:<input value="<%=resultSet.getString(2) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Last Name:<input value="<%=resultSet.getString(3) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Birth Date:<input value="<%=resultSet.getString(4) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Address:<input value="<%=resultSet.getString(5) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Gender:<input value="<%=resultSet.getString(6) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Hire Date:<input value="<%=resultSet.getString(7) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Phone number:<input value="<%=resultSet.getString(8) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Qualification:<input value="<%=resultSet.getString(9) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			Experience:<input value="<%=resultSet.getString(10) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<%i=i+1; %>
		<div class="form-group col-md-3 col-lg-4">
			contact person:<input value="<%=resultSet.getString(11) %>"
				name="<%=field+i %>" class="form-control">
		</div>
		<div class="form-group col-md-3 col-lg-4">
			<input type="submit" class="btn btn-success btn-lg btn-set"
				value="save changes">
		</div>
	</form>
</div>
<%
}
else
{
%>
<br>
<br>
<div class="alert alert-warning alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<strong>Warning!</strong> This Identification number didn't match to
	any Active Teacher.
</div>

<%
}
}
}

%>