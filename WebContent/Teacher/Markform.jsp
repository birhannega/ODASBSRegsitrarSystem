<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.Dbconnection"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	} else 
	{
		
		Date year=new Date();
		SimpleDateFormat yrformmat=new SimpleDateFormat("yyyy");
	String currentyear=yrformmat.format(year);
	
		
		String ActiveUser = session.getAttribute("user").toString();
		Dbconnection DBconnection = new Dbconnection();
%>

<html>
<head>

<style>
input[type='number']
{
-moz-appearance:textfield;
}


</style>
<link type="text/css" rel="stylesheet" title="currentStyle"
	href=../resources/css/demo_table.css />

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.bdt.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	$('#mark').bdt(
			{
			ordering:true,
			scrollY:300,
			paging:false
			});

})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>
<title>mark input form</title>

<style type="text/css">
.error {
	color: red;
	font: small 12px brown;
}
</style>
</head>
<body>
<div class="container-fluid">
<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-left text-uppercase">ODA Special boarding
					school student Record Management System</h3>
			</div>
			</div>
		</div>
<div style="color: red" class="col-lg-12">
					<a href="Tindex.jsp"><span class="fa fa-arrow-left"></span><strong>
							back to Menu</strong></a>
				</div>
	<%
		String TeacherID, grade, section, room, branch;

	Date currrentdate=new Date();
	SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
	String currentYear=dateFormat.format(currrentdate);
	
			Connection connection = DBconnection.getConnection();
			Statement st = connection.createStatement();
			String sql = "select TeacherId,branch from TBL_Users where userName='" + ActiveUser + "' ";
			ResultSet rs_test = st.executeQuery(sql);
			if (rs_test.next()) {
				TeacherID = rs_test.getString(1);
				branch = rs_test.getString(2);
				ResultSet rs_test_hrm = st
						.executeQuery("select * from TBL_HomeRoom where TeacherId='" + TeacherID + "' and AcadamicYear='"+currentYear+"'");
				if (rs_test_hrm.next()) {
					grade = rs_test_hrm.getString("Grade");
					//out.println(grade);
					section = rs_test_hrm.getString("Section_id");
					//out.println(section);
	%>
	<div class="container-fluid" style="margin-top: 3px;">
     <div class="  container-fluid">
			<h4 class="text-info text-left container col-md-offseet-2">
					ODA Special Boarding School
					<%=branch%>
					branch<br> Mark update form for Grade
					<%=grade.concat(section)%></h4>
			<form class="form-inline" method="post" action="">
				<h4>${choose_section }</h4>
				<div class="form-inline col-lg-4 col-md-5 pull-right"
					style="margin: -50px 2px 12px 1px;">
					<strong> Choose Semister </strong><select required
						class="form-control" name="semister">
						<option></option>
						<option value="I">First semister</option>
						<option value="II">Second semister</option>
					</select>
					<button class="btn btn-primary">
						<span class="fa fa-arrow-right"></span>
					</button>
				</div>
			</form>
		</div>
		<%
		String semister = request.getParameter("semister");
						if (semister == null) {
		%>
		<div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose semister</h5>
		</div>
		

		<%
			} else {
		%>
		
		
		<table class="table table-responsive table-condensed table-bordered table-striped" id="mark">
			<thead>
			
				<tr>
					
					<th>Student ID</th>
					<th>Affan Oromo </th>
					<th>Amharic </th>
					<th>Biology</th>
					<th>chemistry</th>
					<th>Chinese</th>
					<th>Civics and Ethical Education </th>
					<th>BT.Drawing</th>
					
					<th>English   </th>
					<th>H.Physical Education</th>
					<th>Information Communication Technology</th>
					<th>Mathematics</th>
					<th>Physics</th>
					<th>Action</th>
				</tr>

			</thead>
			<tbody>
			
		    <span class="alert alert-info well well-sm "><strong>Message:  <span style="color:red">${ nupdted } ${notrefreshed }</span> <span style="color:red">${AlreadyInserted}</span> <span  style="color:green" >${refreshed} ${updted}</span></strong></span>	
	

	<div class="pull-right">

	<form method="post" action="${pageContext.request.contextPath }/RankRefresh">
	<%
	int Year=Integer.valueOf(currentyear)-7;
	%>
	
	<input type="hidden" name="section"      value="<%=section%>">
	<input type="hidden" name="semister" value="<%=semister%>">
	<input type="hidden" name="grade"    value="<%=grade%>">
	<input type="hidden" name="year"     value="<%=Year%>">
	<input type="hidden" name="branch"     value="<%=branch%>">
	
	<button type="submit" class="btn btn-success"><strong>Refresh Rank of Students</strong></button>
	</form>
	  </div>
			<%
			request.getSession().setAttribute("AlreadyInserted", null);
			request.getSession().setAttribute("updted", null);
			request.getSession().setAttribute("nupdted", null);
			request.getSession().setAttribute("refreshed", null);
			request.getSession().setAttribute("notrefreshed", null);
				%>
			
				<%
				String studentid=null;
				int i=0;
					Statement Markstatement = DBconnection.getConnection().createStatement();
									ResultSet rs_stud = Markstatement.executeQuery("select * from TBL_Student where Grade='"+grade+"' and Section_id='"+section+"'");
									while (rs_stud.next()) {
										studentid=rs_stud.getString("Stud_id");
				%>
				
				<form class="form-group" name="mark" id="mark"
					action="${pageContext.request.contextPath }/UpdateMark"
					method="post" onsubmit="return validateform(this)">
					
					<tr>
					
						<td class="text-info"><%=studentid %></td>
						<%
						int iterator=0;
						String pre="sub";
						String subject="subject";
						Statement st_subid=DBconnection.getConnection().createStatement();
						ResultSet ressub=st_subid.executeQuery("select Distinct Subject_id from TBL_SUBJ where Grade='"+grade+"'order by Subject_id");
						while(ressub.next())
						{
					     String name=pre+iterator;
					     String subname=subject+iterator;
						%>
						<td>
						<input type="number" step="0.01" name="<%=subname%>" class="col-lg form-control " required="required" min="1" max="100">
						<input type="hidden" name="<%=name%>" value="<%=ressub.getString(1)%>" class="form-control" required="required" min="1" max="100">
						</td>		
						<%
						iterator++;
						} %>
						<td>
						     <input type="hidden" name="studentid" value="<%=studentid%>"> 
							<input type="hidden" name="teacherid" value="<%=TeacherID%>"> 
							<input type="hidden" name="semister" value="<%=semister%>"> 
							<input type="hidden" name="grade" value="<%=grade%>">
							<input type="hidden" name="branch"     value="<%=branch%>">
						     <input type="hidden" name="section" value="<%=section%>">  
							<button type="submit" class="btn btn-success">
								<span class="fa fa-save"></span>
								
							</button>
						
							
							
							
							</td>
					</tr>
				</form>
				
				<%
			i++;
					}
						if(i==0)
						{
							%>
							<tr>
							<td colspan="15">No student found for Grade <%=grade %> section <%=section %></td>
							</tr>
							<%
							
						}
				%>
			</tbody>
		</table>

	</div>
	<%
		}
				} else {
				%>
				<div class="alert alert-danger">Dear User you cannot update mark of students </div>
				<%
				}
			}
	%>


</body>
</html>
<%
	}
%>