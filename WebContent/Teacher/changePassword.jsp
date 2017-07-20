
<%@ page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>JQuery-validation demo | Bootstrap</title>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="container-fluid">
				<div class="panel panel-default ">
					<div class="panel-heading">
						<h3 class="panel-title">Add User Account</h3>
					</div>
					<div class="panel-body">
						<form id="changepassword" method="post" class="form-horizontal"
							action="${pageContext.request.contextPath}/ChangePassword">
							<h3>${added}</h3>
							<h4>${failed}</h4>
							<h6 style="color: red">${idexists }</h6>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="branch">Select
									branch</label>
								<div class="col-sm-6 ">
									<select class="form-control" id="branch" name="branch">
										<option>Adama</option>
										<option>Ambo</option>
										<option>Sendafa</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="lastname1">Select
									User ID</label>
								<div class="col-sm-6">
									<input class="form-control" name="teacherid">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="username1">Enter
									Username</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="username1"
										name="username1" placeholder="Username" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Enter
									old Password</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password_old"
										name="password_old" placeholder="old Password" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Enter
									new Password</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password1"
										name="password1" placeholder="Password" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Confirm
									password</label>
								<div class="col-sm-6">
									<input type="password" class="form-control"
										id="confirm_password1" name="confirm_password1"
										placeholder="Confirm password" />
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit" class="btn btn-primary btn-lg"
										name="signup1">Add User</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		

		$( document ).ready( function () {

			

			$( "#changepassword" ).validate( {
				rules: {
					
					lastname1: "required",
					teacherid:"required",
					password_old:"required",
					teacherid:{
						required: true,
						minlength: 10,
					},
					username1: {
						required: true,
						minlength: 2
					},
					password1: {
						required: true,
						minlength: 5
					},
					confirm_password1: {
						required: true,
						minlength: 5,
						equalTo: "#password1"
					},
					email1: {
						required: true,
						email: true
					},
					agree1: "required"
				},
				messages: {
					password_old:{
						required:"Enter your old Password",
					},
					teacherid:
						{
						required:"please enter your teacher Id",
						minlength:"Your id should be in R/000/2009 format",
						},
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
</body>
</html>
