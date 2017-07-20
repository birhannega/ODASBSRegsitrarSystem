<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<%
	if (session.getAttribute("user") == null) {

		response.sendRedirect("../index.jsp");
	} else {
		Dbconnection dbconnection=new Dbconnection();
		Statement updatestatement=dbconnection.getConnection().createStatement();
		if(session.getAttribute("user")!=null)
        {
			String user=session.getAttribute("user").toString();
			//out.println("current user is "+user);
			String updateStatusSql="select currentstate from TBL_Users where userName='"+user+"'";
			ResultSet stupdate= updatestatement.executeQuery(updateStatusSql);
			if(stupdate.next())
			{
				String state=stupdate.getString(1);
				//out.println("and state is "+state);
				if(state.equalsIgnoreCase("Blocked")){
					session.invalidate();
					//response.sendRedirect("../index.jsp");
					
				}
				
			}

       }
%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />


<script type="text/javascript"
	src="../resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="font-family: Trebuchet MS, sans-serif;">

	<%@ include file="../includes/vector.jsp"%>
	<div class="container-fluid" style="margin-top: -12px">


		<div class="col-lg-3 col-sm-3 col-md-3">
			<%@ include file="../includes/Tsidebar.jsp"%>
		</div>
		<div class="col-lg-9 col-md-9 col-sm-12">
			<%@ include file="../carousel.jsp"%>
		</div>
		<%-- <span class="pull-right col-sm-12 col-md-3 col-lg-3 ">
			<%@ include file="Viewprofile.jsp"%>
		</span> --%>
	</div>
	<div class="container-fluid">
		<div class="row container-fluid">
			<hr style="border: 1px solid brown">
			<p class="text-info">This system is developed by volunteer
				students graduated from Adama science and Technology University for
				Oromiya Development Association</p>

			<%
				Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
					SimpleDateFormat lsdf = new SimpleDateFormat("MMMM");

					String year = sdf.format(date);
					String month = lsdf.format(date);
					out.println("<center>" + "<h5>" + "&copy" + " " + month + " " + year + "</h5>" + "</center");
				}
			%>
		</div>
	</div>

</body>
</html>
