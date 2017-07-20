<%@page import="databaseConnection.Dbconnection"%>
<%if(session.getAttribute("registrar")==null){
	response.sendRedirect("../index.jsp");	
} 
else
{	
	String ActiveUser=session.getAttribute("registrar").toString();
String branch=null;
Dbconnection dbc=new Dbconnection();
Connection connection=dbc.getConnection();
Statement statement=connection.createStatement();
ResultSet rs=statement.executeQuery("select branch from TBL_Users where userName='"+ActiveUser+"'");
if(rs.next())
{
	branch=rs.getString(1);
}
else
{
	response.sendRedirect("../index.jsp");
} 
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="jquery-ui.css" rel="stylesheet">




<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>


	<div class="container-fluid">
		<div class="panel panel-default">


			<div class="panel-heading">Teacher registration form</div>
			<div class="panel-body">
				<div class="form ">

					<form action="${pageContext.request.contextPath}/RegisterTeacher"
						method="post" class="form-group" enctype="multipart/form-data"
						class="form-inline" onsubmit="return checkForm(this);">
						<div class="container">
							<strong> ${registered} </strong>
						</div>
						<%
                      request.getSession().setAttribute("registered", null);
                      %>


						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>First Name</span></span> <input
									type="text" required="required" name="fname"
									class="form-control" required="required">
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Last Name</span></span> <input
									required="required" type="text" name="lname"
									class="form-control">
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Gender</span></span> <select
									required="required" class="form-control" name="sex">
									<option>male</option>
									<option>Female</option>

								</select>
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Birth Date</span></span> <input
									required="required" name="bdate" type="text"
									required="required"
									class="   form-control  datetimepicker-inline"
									autocomplete="off" value="" id="datepicker"
									placeholder="Choose Date" />
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">
							<div class="input-group">
								<span class="input-group-addon"><span>Contact
										person</span></span> <input type="text" required="required" name="cpname"
									class="form-control">
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">
							<div class="input-group">
								<span class="input-group-addon"><span>Experience</span></span> <select
									class="form-control" required="required" name="experience">
									<%
										for (int i = 0; i <= 10; i++) {
									%>
									<option><%=i + " " + "year"%></option>

									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Phone number</span></span>
								<input type="tel" name="tel" required="required"
									class="form-control">
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Address</span></span> <input
									type="text" name="aname" class="form-control"
									required="required">
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Major course</span></span>
								<select name="qualification" class="form-control"
									required="required">
									<optgroup label="Language">
										<option>English</option>
										<option>Afan oromo</option>
										<option>Amharic</option>
										<option>Chinese</option>
									</optgroup>
									<optgroup label="natural science">
										<option>Chemistry</option>
										<option>Biology</option>
										<option>Physics</option>
										<option>Mathematics</option>
										<option>Drawing</option>
									</optgroup>
									<optgroup label="social science">
										<option>Civics</option>
									</optgroup>
									<optgroup label="Technology">
										<option>Ict</option>
									</optgroup>

								</select>
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Hire Date</span></span> <input
									type="text" name="hdate" id="hdate" required="required"
									class="form-control" autocomplete="off" value="" />
							</div>
						</div>


						<div class="form-group col-lg-6 col-md-6">

							<div class="input-group">
								<span class="input-group-addon"><span>Profile
										Picture</span></span>
								<div class="input-group">
									<input required="required" type="file" name="photo"
										style="padding-bottom: 2px;" />
								</div>
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<input type="hidden" value="<%=branch %>" name="branch">
							<button class="btn    btn-primary pull-right " type="submit">
								<strong>Register Teacher</strong>
							</button>

						</div>
					</form>
				</div>
			</div>
			<div class="panel-footer"></div>
		</div>

	</div>

	<script type="text/javascript"
		src="../resources/js/jquery-1.11.3.min.js"></script>
	<script src="../external/jquery/jquery.js"></script>
	<script src="jquery-ui.js"></script>
	<script>
$( "#datepicker" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
});

</script>

	<script>
$( "#hdate" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
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
			if (form.bdate.value == "") {
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
			if (form.cpname.value == "") {
				alert("error:contact person name can't be empty");
				form.cpname.focus();
				return false;

			}
			re = /^[a-zA-Z\s]*$/;
			if (!re.test(form.cpname.value)) {
				alert("Error: contact person name must contain only letters");
				form.cpname.focus();
				return false;
			}
			if (form.experience.value == "") {
				alert("error:experience can't be empty");
				form.experience.focus();
				return false;

			}
			

			if (form.aname.value == "") {
				alert("error: address can't be empty");
				form.aname.focus();
				return false;

			}
			re = /^[a-zA-Z0-9-\s]*$/;
			if (!re.test(form.aname.value)) {
				alert("Error: address must contain letters,numbers,letter and numbers");
				form.aname.focus();
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
	<%} %>
</body>
</html>