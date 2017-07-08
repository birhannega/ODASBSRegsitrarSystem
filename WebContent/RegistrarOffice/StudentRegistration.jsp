
<%
	if (session.getAttribute("registrar") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		String ActiveUser = session.getAttribute("registrar").toString();
		String branch = null;
		Dbconnection dbc = new Dbconnection();
		Connection connection = dbc.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement
				.executeQuery("select branch from TBL_Users where userName='" + ActiveUser + "'");
		if (rs.next()) {
			branch = rs.getString(1);
		} else {

		}
%>

<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page%>

<!DOCTYPE html>
<html>
<head>


<link href="jquery-ui.css" rel="stylesheet">





<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

	<div
		class=" container-fluid col-md-12  col-lg-12 col-sm-12 col-xs-12 offset-2">
		<div class="panel panel-default">
			<div class="panel panel-heading ">Student Registration Form</div>
			<div class="panel-body">
				<div class="panel-content">
					<div class="form-group">
						<form action="${pageContext.request.contextPath}/RegisterStudent"
							method="post" onsubmit="return checkForm(this);">

							<div class="container-fluid">
								<strong>${studregistered} ${oops}</strong>
							</div>

							<%
								request.getSession().setAttribute("studregistered", null);
									request.getSession().setAttribute("oops", null);
							%>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>First Name</span></span>
									<input type="text" name="fname" class="form-control"
										required="required">
								</div>

							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Middle Name</span></span>
									<input type="text" name="mname" class="form-control"
										required="required">
								</div>

							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Last Name</span></span>
									<input type="text" name="lname" class="form-control"
										required="required">
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Birth Date</span></span>
									<input required="required" name="bdate" name="bdate"
										type="text" id="bdate" autocomplete="off" class="form-control" />
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Gender</span></span> <select
										class="form-control" name="sex" required="required">
										<option>male</option>
										<option>Female</option>
									</select>
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>contact
											Person</span></span> <input required="required" type="text" name="cname"
										class="form-control">
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Acadamic
											year</span></span>
									<%
										Dbconnection dbcon = new Dbconnection();

											//creating statement//
											Statement st = dbcon.getConnection().createStatement();
											//create query
											String query = "select AcademicYear from TBL_setup where calandar_status='1'";

											//execute query
											ResultSet res = st.executeQuery(query);
									%>

									<select name="ayear" required="required" class="form-control">
										<%
											while (res.next()) {
										%>

										<option value="2009">
											<%
												out.println(res.getString("AcademicYear"));
											%>
										</option>
										<%
											}
										%>
									</select>

								</div>
							</div>


							<div class="col-lg-4 form-group col-md-6">


								<div class="input-group ">
									<span class="input-group-addon"> <span>Specific
											Address</span></span> <input type="text" name="address" required="required"
										class="form-control">
								</div>
							</div>
							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Grade</span></span> <select
										class="form-control" name="grade">


										<option>9</option>

									</select>
								</div>
							</div>




							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>zone</span></span> <select
										name="zone" class="form-control" required="required">
										<option value="">Choose zone</option>
										<option>oromia special Zone surrounding Finfine</option>
										<option>West shoa</option>
										<option>North Shoa</option>
										<option>East shoa</option>
										<option>South west shoa</option>
										<option>East Wellega</option>
										<option>West Wellega</option>
										<option>Horro Guduru wellega</option>
										<option>Qelem Wellega</option>
										<option>Illu Aba bor</option>
										<option>Jimma</option>
										<option>West Arsi</option>
										<option>Arsi</option>
										<option>Borena</option>
										<option>Guji</option>
										<option>East Harerghe</option>
										<option>West Harerghe</option>
										<option>West Guji</option>
										<option>Buno Bedelle</option>
										<option>Bale</option>
									</select>

								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span></span>Wereda
									</span> <input required="required" type="text" name="wereda"
										class="form-control">
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group">
									<span class="input-group-addon"> <span
										class="fa fa-phone"> phone number </span>
									</span> <input type="tel" required="required" name="tel"
										class="form-control">
								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span> Section </span>
									</span> <select required="required" name="section"
										class="form-control">
										<option value="">choose section</option>
										<option>A</option>
										<option>B</option>
										<option>C</option>
										<option>D</option>
									</select>

								</div>
							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span> Hobby </span>
									</span> <input type="text" required="required" name="hobby"
										class="form-control">

								</div>
							</div>
							<input type="hidden" value="<%=branch%>" name="branch">

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span> Oda exam
											score </span>
									</span> <input max="100" step="0.001" required="required"
										type="number" name="odascore" class="form-control">

								</div>
							</div>

							<div class="form-group col-lg-4 col-md-6 pull-right">
								<div class="input-group ">
									<button class="btn btn-primary btn-set  "
										style="float: right" type="submit">
										<span class="fa  fa-sav"></span> Register Student
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

		<script type="text/javascript"
			src="../resources/js/jquery-1.11.3.min.js"></script>
		<script src="../external/jquery/jquery.js"></script>
		<script src="jquery-ui.js"></script>
		<script>
			$("#bdate").datepicker({
				inline : true,
				changeMonth : true,
				changeYear : true,
			});
		</script>



		<script type="text/javascript">
			function checkForm(form) {
				if (form.fname.value == "") {
					alert("error: first name can't be empty");
					form.fname.focus();
					return false;

				}
				re = /^[A-Za-z]+$/;
				if (!re.test(form.fname.value)) {
					alert("Error: first name must contain only letters");
					form.fname.focus();
					return false;
				}
				if (form.lname.value == "") {
					alert("error:last name can't be empty");
					form.lname.focus();
					return false;
				}
				re = /^[A-Za-z]+$/;
				if (!re.test(form.fname.value)) {
					alert("error: last name must contain only letters")
					form.lname.focus();
					return false;

				}
				var curdate = new date().getFullYear();
				var bdate = form.bdate.value.getFullYear;

				var age = curdate - bdate;

				if (form.bdate.value == "" || age < 7) {

					alert("error:birth date can't be empty");
					form.bdate.focus();
					return false;
				}
				re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
				if (!re.test(form.bdate.value)) {
					alert("error:birth date must contain date");
					form.bdate.focus();
					return false;
					var genderM = form.gender_male.value;
					var genderF = form.gender_female.value;

					if (genderM.checked == false && genderF.checked == false) {
						alert("You must select male or female");
						return false;
					}
				}
				if (form.cname.value == "") {
					alert("error:contact person name can't be empty");
					form.cname.focus();
					return false;

				}
				re = /^[a-zA-Z\s]*$/;
				if (!re.test(form.cname.value)) {
					alert("Error: contact person name must contain only letters");
					form.cname.focus();
					return false;
				}
				if (form.address.value == "") {
					alert("error: address can't be empty");
					form.address.focus();
					return false;

				}
				re = /^[a-zA-Z0-9-\s]*$/;
				if (!re.test(form.address.value)) {
					alert("Error: address must contain letters,numbers,letter and numbers");
					form.address.focus();
					return false;

				}
				if (form.tel.value == "") {
					alert("error: phone number can't be empty");
					form.tel.focus();
					return false;

				}
				re = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
				if (!re.test(form.tel.value)) {
					alert("Error:phone number must contain only number");
					form.tel.focus();
					return false;
				}

				if (form.status.value == "") {
					alert("error: status can't be empty");
					form.status.focus();
					return false;

				}
				re = /^[A-Za-z]+$/;
				if (!re.test(form.status.value)) {
					alert("Error: status must contain only letters");
					form.status.focus();
					return false;
				}
			}
		</script>

		<script type="text/javascript">
			$(document).ready(function() {

			});

			var bootstrapButton = $.fn.bdate.noConflict() // return $.fn.button to previously assigned value
			$.fn.bootstrapBtn = bootstrapButton
		</script>
		<%
			}
		%>

	</div>

</body>
</html>