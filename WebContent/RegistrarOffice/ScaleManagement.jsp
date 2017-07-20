<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
    if(session.getAttribute("registrar")==null)
    {
    	response.sendRedirect("../index.jsp");
    }
    else
    {
    %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Scale management</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../includes/vector.jsp"%>
		</div>
	</div>

	<div class="container-fluid" style="margin-top: -18px">
		<div class="row">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-xm-12 col-sm-12"
					style="margin-top: -10px">
					<%@ include file="../includes/sidebar.jsp"%>
				</div>



				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 "
					style="margin-top: -10px">
					<div class="panel ">
						<div class="panel-heading text-right">
							<strong> <span class="fa fa-edit"></span> Pass fail
								Scale update form
							</strong>
						</div>



					</div>
					<div class="col-lg-7">


						${updated }


						<%
  request.getSession().setAttribute("updated", null);
  %>
						<form class="form-inline" method="post"
							action="${pageContext.request.contextPath}/UpdatePolicy">
							<div class="form-group pull-left">
								<label class="sr-only" for="Grade">choose Grade</label>
								<div class="input-group">
									<div class="input-group-addon">Select Grade</div>
									<select class="form-control" name="Grade" id="Grade"
										required="required">
										<option value="">choose Grade</option>
										<%
      for(int i=9;i<=12;i++)
      {
    	  %>
										<option><%=i %></option>
										<%
      }
      %>
									</select>

								</div>
							</div>
							<div class="form-group col-md-5 ">
								<label class="sr-only" for="scale">choose Grade</label>
								<div class="input-group">
									<div class="input-group-addon">Minimum Marks</div>
									<input type="number" step="0.001" class="form-control"
										name="mark" id="scale" placeholder="Ente the minimum mark"
										required="required">

								</div>
							</div>
							<div class="form-group pull-right">
								<button type="submit" class="btn btn-primary pull-right">Update
									policy</button>
							</div>
						</form>

					</div>
					<br>
					<br>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>No.</th>
									<th>Grade</th>
									<th>Scale</th>
								</tr>
							</thead>
							<%
  Date date=new Date();
    		SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
    		int Year=Integer.valueOf(dateFormat.format(date));
    		
    		
                Dbconnection dbcon=new Dbconnection();
    		Connection connection=dbcon.getConnection();
    		Statement statement=connection.createStatement();
    		ResultSet resultSet=statement.executeQuery("select * from TBL_policy where AcadamicYear="+Year+"");
    		  int i=0;
   while(resultSet.next())
   {
	   i++;
	 
	   int grade=resultSet.getInt("Grade");
	  float mark=resultSet.getFloat("min_Ave");
	  
	%>
							<tr>
								<td><%=i%></td>
								<td><%=grade%></td>
								<td><%=mark%></td>

							</tr>
							<%
	
   }
  %>
						</table>


					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

</body>
<%} %>
</html>