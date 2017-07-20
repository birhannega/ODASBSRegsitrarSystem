
<%
if(session.getAttribute("registrar")==null)
{
response.sendRedirect("../index.jsp");	
}
else
{
	Dbconnection con_GetBranch=new Dbconnection();
%>

<%@ page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>change password</title>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />



<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../includes/vector.jsp"%>
	</div>

	<div class="container-fluid" style="margin-top: -25px">
		<%@ include file="../includes/nav.html"%>
	</div>

	<div class="container-fluid">
		<div class="col-lg-3 col-md-3">
			<%@include file="../includes/sidebar.jsp"%>
		</div>
		<div class="container-fluid col-lg-9 col-md-9 pull-right">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Change your password </strong>
				</div>
				<div class="panel-body ">
					<%
					Statement getBranch=con_GetBranch.getConnection().createStatement();
					String logged_user_branch=null,logged_user_id=null,logged_user_username=null;
					ResultSet brachRs=getBranch.executeQuery("select branch,TeacherId,userName from TBL_Users where userName='"+session.getAttribute("registrar").toString()+"'");
					if(brachRs.next())
					{
						logged_user_branch=brachRs.getString("branch");
						logged_user_id=brachRs.getString("TeacherId");
						logged_user_username=brachRs.getString("userName");
						//out.println(logged_user_branch);
					}
					%>

					<form id="changepassword" method="post" class="form-group  "
						action="${pageContext.request.contextPath}/ChangePassword">
						<h3>${added}</h3>
						${changed}
						<h4>${failed}</h4>
						<h6 style="color: red">${idexists }</h6>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" " for="branch"> Branch</label>
							<div class=" ">
								<input class="form-control" value="<%=logged_user_branch%>"
									id="branch" name="branch" readonly="readonly">


							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" " for="lastname1"> User ID</label>
							<div class="">
								<input class="form-control" name="teacherid"
									value="<%=logged_user_id%>" readonly="readonly">
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" control-label" for="username1"> User name</label>
							<div class="">
								<input type="text" class="form-control"
									value="<%=logged_user_username %>" id="username1"
									name="username1" readonly="readonly" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" control-label" for="password1">Enter old
								Password</label>
							<div class="">
								<input type="password" class="form-control" id="password_old"
									name="password_old" placeholder="old Password" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" control-label" for="password1">Enter new
								Password</label>
							<div class="">
								<input type="password" class="form-control" id="password1"
									name="password1" placeholder="Password" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6">
							<label class=" control-label" for="confirm_password1">Confirm
								password</label>
							<div class="">
								<input type="password" class="form-control"
									id="confirm_password1" name="confirm_password1"
									placeholder="Confirm password" />
							</div>
						</div>


						<div class="form-group ">
							<div class=" ">
								<button type="submit" class="btn btn-primary pull-right"
									name="signup1">change password</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%
			request.getSession().setAttribute("changed", null);
			%>
	</div>
	<%} %>
	<script type="text/javascript"
		src="../resources/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#changepassword").validate({
				rules : {
					password_old:"required",
					confirm_password1 : "required",
					password1:"required",
					confirm_password1:
						{
							required:true,
							minlength:4,
							equalTo: "#password1"
					
				         },
				         password1:{
				        	 required:true,
								minlength:4
								
				         }
				},
				messages:{
					password1:{
						required:"please enter your username",
							minlength:"Password should be atleast 4 characters long"
					}
				}

			})

		});
	</script>
</body>
</html>
