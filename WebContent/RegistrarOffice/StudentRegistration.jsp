
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
							method="post" onsubmit="return checkForm(this);"
							id="registerstudent">

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
									<input type="text" name="fname" class="form-control">
								</div>

							</div>

							<div class="col-lg-4 form-group col-md-6">

								<div class="input-group ">
									<span class="input-group-addon"> <span>Middle
											Name</span></span> <input type="text" name="mname" class="form-control"
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
									<button class="btn btn-primary btn-set  " style="float: right"
										type="submit">
										<span class="fa  fa-sav"></span> Register Student
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

		<script src="jquery-ui.js"></script>
		<script>
			$("#bdate").datepicker({
				inline : true,
				changeMonth : true,
				changeYear : true,
			});
		</script>


		
		<script type="text/javascript">
		$(document).ready( function (){
			$( "#registerstudent" ).validate( {
				rules: {
					fname: {
						required: true,
						minlength: 4
					},
					lname: {
						required: true,
						minlength: 5
					},
					mname: {
						required: true,
						minlength: 5,
						
					},
					type:"required",
					branch:"required",
					agree1: "required"
				},
				messages: {
					firstname1: "Please select branch",
					lastname1: "Please enter your lastname",
					username1: {
						required: "Please enter a username",
						minlength: "Your username must consist of at least 2 characters"
					},
					password1: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long"
					},
					confirm_password1: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long",
						equalTo: "Please enter the same password as above"
					},
					email1: "Please enter a valid email address",
					agree1: "Please accept our policy"
				},
				errorElement: "em",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					// Add `has-feedback` class to the parent div.form-group
					// in order to add icons to inputs
					element.parents( ".col-sm-5" ).addClass( "has-feedback" );

					if ( element.prop( "type" ) === "checkbox" ) {
						error.insertAfter( element.parent( "label" ) );
					} else {
						error.insertAfter( element );
					}

					// Add the span element, if doesn't exists, and apply the icon classes to it.
					if ( !element.next( "span" )[ 0 ] ) {
						$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
					}
				},
				success: function ( label, element ) {
					// Add the span element, if doesn't exists, and apply the icon classes to it.
					if ( !$( element ).next( "span" )[ 0 ] ) {
						$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
					}
				},
				highlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
					$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
				},
				unhighlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
					$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
				}
			} );
		} );
	</script>
		<%
			}
		%>

	</div>

</body>
</html>