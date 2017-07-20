<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<div class="container-fluid">
	<div class="panel ">
		<div class="panel-heading">
			<strong>Re-Activate User Account</strong>
		</div>
		<div class="panel-body">
			<div class="panel-content">
				<strong><span style="color: green">${Activated}</span> <span
					style="color: red">${notActivated}</span></strong>
				<form class="form-inline" method="post"
					action="${pageContext.request.contextPath}/activateAccount">
					<div class="form-group">

						<div class="input-group">
							<div class="input-group-addon">Teacher_ID</div>
							<select class="form-control" name="TeacherID" required="required">
								<option value="">choose user</option>
								<%
      request.getSession().setAttribute("Activated", null);
      request.getSession().setAttribute("notActivated", null);
            Dbconnection dbconnection=new  Dbconnection();
    		Connection con=dbconnection.getConnection();
    		Statement statment_user=con.createStatement();
    		String User=null,ID=null;
    		ResultSet res_users=statment_user.executeQuery("select TeacherId,userName from TBL_Users where currentState='Blocked'");
    		while(res_users.next())
    		{
    			ID=res_users.getString(1);
    			User=res_users.getString(2);
    			
    		%>
								<option value="<%=ID%>"><%= ID+"---- "+User%></option>
								<%} %>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-success">Activate
						User</button>
				</form>
			</div>
		</div>
	</div>
</div>