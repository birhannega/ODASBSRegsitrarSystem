
<%if(session.getAttribute("registrar")==null)
{
	response.sendRedirect("../index.jsp");
}
else
{
	String branch=null,username=session.getAttribute("registrar").toString();
	Dbconnection dbcon = new Dbconnection();
	Statement st_logged_user=dbcon.getConnection().createStatement();
	ResultSet rs_logged_user=st_logged_user.executeQuery("select branch from TBL_users where userName='"+username+"'");
	if(rs_logged_user.next())
	{
		branch=rs_logged_user.getString(1);
	}
%>

<%@ page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript"
	src="../resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>
<style type="text/css">
.error {
	color: red;
}
</style>

<div class="container-fluid">
	<div class="container-fluid">
		<div class="panel panel-default ">
			<div class="panel-heading">
				<h3 class="panel-title">Add User Account</h3>
			</div>
			<div class="panel-body">
				<strong>${failed} ${added} <span class="bg-red">${UserNameexists}</span>
					${idexists} ${notadded}
				</strong>
				<form id="adduser" method="post" class="form-group"
					action="${pageContext.request.contextPath}/AddUserAccount">


					<%
					
						request.getSession().setAttribute("failed", null);
						request.getSession().setAttribute("UserNameexists", null);
						request.getSession().setAttribute("idexists", null);
						request.getSession().setAttribute("failed", null);
						request.getSession().setAttribute("notadded", null);
						request.getSession().setAttribute("added", null);
						%>

					<div class="form-group col-lg-6 col-sm-6 col-md-6"
						style="margin-top: -10px">
						<strong> Branch</strong> <input type="text" class="form-control"
							value="<%=branch %>" id="firstname1" name="branch"
							readonly="readonly">

					</div>


					<div class="form-group col-lg-6 col-md-6" style="margin-top: -10px">
						<strong>Select user role</strong> <select class="form-control"
							id="type" name="type">
							<option value="">choose type</option>
							<option value="T">Teacher</option>
							<option value="R">Data encoder</option>

						</select>
					</div>




					<div class="form-group col-lg-6 col-md-6" style="margin-top: -10px">
						<strong>Select User ID</strong> <select required name="teacherid"
							class="form-control">
							<option value="">choose TeacherID</option>



							<%
							
								Statement st = dbcon.getConnection().createStatement();
								ResultSet rs = st.executeQuery("select TeacherId from TBL_teacher where status='active' and branch='"+branch+"'");
								while (rs.next()) {
							%>
							<option>
								<%
									out.println(rs.getString("TeacherId"));
								%>
							</option>
							<%
								}
							%>

						</select>
					</div>
					<div class="form-group col-lg-6 col-md-6" style="margin-top: -10px">
						<strong>Enter Username</strong> <input type="text"
							class="form-control" id="username1" name="username1"
							placeholder="Username" />
					</div>






					<div class="form-group col-lg-6 col-md-6" style="margin-top: -10px">
						<strong>Enter Password</strong> <input type="password"
							class="form-control" id="password1" name="password1"
							placeholder="Password" />
					</div>




					<div class="form-group col-lg-6 col-md-6" style="margin-top: -10px">
						<strong>Confirm password</strong> <input type="password"
							class="form-control" id="confirm_password1"
							name="confirm_password1" placeholder="Confirm password" />
					</div>


					<div class="form-group">
						<div class="pull-right ">
							<button type="submit" class="btn btn-primary " name="signup1">Create
								User Account</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</div>
<%} %>
<script type="text/javascript">
		

		$( document ).ready( function () {

			

			$( "#adduser" ).validate( {
				rules: {
					
					lastname1: "required",
					
					username1: {
						required: true,
						minlength: 4
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

