
<%@page import="controller.imagetestServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.*"%>
<%
	if (session.getAttribute("registrar") != null) {
		String id,branch, user_id = session.getAttribute("registrar").toString();
		//out.println(user_id);

		Dbconnection db = new Dbconnection();

		Statement stmt = db.getConnection().createStatement();
		ResultSet rs_id = stmt.executeQuery("select  * from TBL_Users where userName='" + user_id + "'");
		if (rs_id.next()) {
			id = rs_id.getString("TeacherId");
			branch=rs_id.getString("branch");
			

			String fname = null, lname = null, major = null; Date hdate = null;

			Statement st_user = db.getConnection().createStatement();
			ResultSet rs_pro = st_user.executeQuery(
					"select FirstName,LastName,image,hiredate,Qualified from TBL_teacher where TeacherId='" + id
							+ "'");
			if (rs_pro.next()) {

				fname = rs_pro.getString(1);
				lname = rs_pro.getString(2);
				hdate = rs_pro.getDate("hiredate");
				major = rs_pro.getString("Qualified");
				//get year of hire

			}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../includes/vector.jsp"%></div>

		<div class="row" style="margin-top: -20px">
			<%@ include file="../includes/nav.html"%></div>


		<div class="col-sm-12 col-lg-3 col-md-4">
			<%@ include file="../includes/sidebar.jsp"%>
		</div>
		<div class="col-sm-12 col-lg-3 col-md-4 pull-right">

			<div class="panel panel-info">
				<div class="panel-heading">
					<h4 class="text-center">
						User Profile<span class="glyphicon glyphicon-user pull-right"></span>
					</h4>
				</div>
				<div class="panel-body text-center">
					<p class="lead">
						<strong><%=fname + " " + lname%></strong>
					</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item liitem"><strong>Position:</strong>
						<span class="pull-right">Teacher</span></li>
					<li class="list-group-item liitem"><strong>School:</strong> <span
						class="pull-right">ODASBS</span></li>
					<li class="list-group-item liitem"><strong>Graduted
							in:</strong> <span class="pull-right"><%=major%></span></li>
					<li class="list-group-item liitem"><strong>service
							Duration:</strong> <span class="pull-right"> <%
 	SimpleDateFormat getyear = new SimpleDateFormat("y");
 			String birth_year = getyear.format(hdate);
 			//get month
 			SimpleDateFormat getmonth = new SimpleDateFormat("M");
 			String birth_month = getmonth.format(hdate);
 			//get date
 			SimpleDateFormat getdate = new SimpleDateFormat("d");
 			String birth_date = getdate.format(hdate);
 			//out.println(birth_date);

 			//////// get current date/////////////////////////
 			////////////////////////////////////
 			int byear = Integer.valueOf(birth_year);
 			int bmonth = Integer.valueOf(birth_month);
 			int bdate = Integer.valueOf(birth_date);

 			Date date = new Date();
 			SimpleDateFormat get_current_year = new SimpleDateFormat("YYYY");
 			///get current year
 			String current_year = get_current_year.format(date);
 			int currentyear = Integer.valueOf(current_year);
 			///get current month
 			SimpleDateFormat getcurrentmonth = new SimpleDateFormat("M");
 			String current_month = getcurrentmonth.format(date);
 			int currentmonth = Integer.valueOf(current_month);

 			//get current day//
 			SimpleDateFormat getcurrentday = new SimpleDateFormat("d");
 			String current_day = getcurrentday.format(date);
 			int currentday = Integer.valueOf(current_day);

 			int servicemonth = currentmonth - bmonth;
 			int serviceyear = currentyear - byear;
 			int serviceday = currentday - bdate;
 			//// get current date
 %> <%
 	out.println(serviceyear + " year " + servicemonth + " month " + serviceday + " days");
 %>
					</span></li>
				</ul>
				<div class="panel-footer">
					<div class="row">
						<div class="col-xs-4 col-sm-3 col-md-4 col-lg-2"></div>
						<div class="col-xs-2 col-sm-4 col-md-4 col-lg-4" id="qr1"></div>
						<div class="col-xs-6 col-sm-5 col-md-4 col-lg-6"></div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%
		//out.println(id);
			}

		} else {
			out.println("id not found");
		}
		//imagetestServlet imser=new imagetestServlet();

		//imser.doGet(request, response);
	%>



</body>
</html>