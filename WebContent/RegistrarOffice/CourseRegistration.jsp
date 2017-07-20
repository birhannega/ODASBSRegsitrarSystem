<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="databaseConnection.Dbconnection"%>



<div class="panel panel-info">
	<div class="panel-heading">New Subject registration form</div>

	<div class="panel-body">
		<div class="panel-content">
			<form class="form-inline "
				action="${pageContext.request.contextPath}/RegisterSubject"
				method="post">
				${subregistered} ${err} ${subexists}



				<div class="form-group">
					<strong>Subject Name</strong> <input type="text"
						class="form-control" id="name" name="sub_name"
						placeholder="Enter subject name" required>
				</div>


				<div class="form-group ">
					<label for="sub_name">Select Grade</label> <select name="grade"
						class="form-control" required>
						<option value="">Choose Grade</option>
						<%
							Dbconnection dbcon = new Dbconnection();
							Connection con = dbcon.getConnection();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select Grade from TBL_Grade");
							while (rs.next()) {
						%>

						<option>
							<%
								out.println(rs.getString("Grade"));
							%>
						</option>
						<%
							}
						%>

					</select>

				</div>
				<div class="form-group">
					<button class="btn btn-info pull-right">Save Subject</button>
				</div>




			</form>
		</div>
	</div>

</div>
<%
	request.getSession().setAttribute("subexists", null);
	request.getSession().setAttribute("subregistered", null);
%>
<table class="table table-bordered table-condensed">
	<tr>
		<th colspan="3">Currently Registered subjects</th>
	</tr>
	<tr>
		<th>No.</th>
		<th>Grade</th>
		<th>Subjects</th>
	</tr>
	<%
		Statement List_gradet = con.createStatement();
		int no = 0;
		ResultSet res_list = List_gradet.executeQuery("select Distinct Grade from TBL_SUBJ");

		while (res_list.next()) {
			no++;
			String grade = res_list.getString(1);
	%>
	<tr>
		<td><%=no%></td>
		<td><%=res_list.getString("Grade")%></td>
		<td>
			<%
				Statement st_sub_list = con.createStatement();
					ResultSet sbjects = st_sub_list.executeQuery("select Name from TBL_SUBJ where Grade='" + grade + "'");
					while (sbjects.next()) {
			%> <%=sbjects.getString("name")%> <%
 	}
 %>

		</td>
	</tr>
	<%
		}
	%>
</table>


