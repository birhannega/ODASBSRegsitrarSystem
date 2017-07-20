
<%if(session.getAttribute("registrar")==null) 
{
response.sendRedirect("../index.jsp");	
}

else{

Dbconnection dbcon=new Dbconnection();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>
<div class=" container-fluid col-md-12  col-lg-12 col-sm-12 col-xs-12 ">

	<div class="panel panel-heading ">
		<strong>Teacher resignation form</strong>
	</div>

	${resigned }
	<%-- <%session.setAttribute("resigned", null); %> --%>
	<form action="" method="post" class="form-inline pull-right">
		<div class="form-group">
			<label>Enter TeacherID</label> <input type="text" name="teacherid"
				class="form-control"> <input type="submit" value="search"
				class="btn btn-primary">
		</div>
	</form>
	<br> <br> <br>

	<form action="${pageContext.request.contextPath }/Resign" method="post"
		class="form-inline">
		<%

String userid=session.getAttribute("registrar").toString(),branch=null;
Statement stsession=dbcon.getConnection().createStatement();
ResultSet rssession=stsession.executeQuery("select * from TBL_Users where UserName='"+userid+"'");
while(rssession.next()){
	branch=rssession.getString("branch");
}
String teacherId=request.getParameter("teacherid"),teacherid=null,fname=null,lname=null,gender, age=null;
if(request.getParameter("teacherid")==null||request.getParameter("teacherid")==""){
	%>

		<%
}
else {



Statement studentwithdraw=dbcon.getConnection().createStatement();
ResultSet rsstuwithdraw=studentwithdraw.executeQuery("select *from TBL_teacher where TeacherId='"+teacherId+"'and Branch='"+branch+"' and Status='Active'");
if(rsstuwithdraw.next()){
	teacherid=rsstuwithdraw.getString("TeacherId");
	fname=rsstuwithdraw.getString("FirstName");
	lname=rsstuwithdraw.getString("LastName");
	gender=rsstuwithdraw.getString("Gender");
	age=rsstuwithdraw.getString("Qualified");
%>
		<div class="row">
			<div class="form-inline pull-center"></div>

			<table class="table  table-condensed  table-bordered ">
				<tr>
					<td colspan="5" class="active">
						<p class="text-info">Profile of Teacher to be Resigned</p>
					</td>
				</tr>
				<tr>
					<th>Teacher ID</th>
					<th>FullName</th>
					<th>Gender</th>
					<th>Qualified</th>
					<th>Action</th>
				</tr>
				<tr>
					<td><%=teacherid %><input type="hidden"
						value="<%=teacherid %>" name="teacherid"></td>
					<td><%=fname+"  "+lname %></td>
					<td><%=gender %></td>
					<td><%=age %></td>
					<td><input type="submit" class="btn btn-danger" id="resign"
						value="submit"></td>
			</table>
		</div>
	</form>
	<%}
else{ %><strong style="color: red;"> ID did not match to any
		Teacher</strong>


	<%}}
Statement stat_session=dbcon.getConnection().createStatement();
ResultSet rs_session=stat_session.executeQuery("select currentState from TBL_users where userName='"+session.getAttribute("registrar").toString()+"' ");
if(rs_session.next())
{
	String status=rs_session.getString(1);
	if(!status.equalsIgnoreCase("Active"))
	{
		
		response.sendRedirect("../index.jsp");
		session.invalidate();
	}
}

}%>

</div>





<%

	%>