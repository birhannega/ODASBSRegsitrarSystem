<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection(); %>
<%if (session.getAttribute("registrar") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		String ActiveUser = session.getAttribute("registrar").toString();
		Dbconnection DBconnection = new Dbconnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>

<link type="text/css" rel="stylesheet" title="currentStyle"
	href=../resources/css/demo_table.css />

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.bdt.js"></script>
<title>Student Reports</title>
</head>
<body>
<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="text-uppercase">ODA special Boarding school student
					Record Management System</h4>

			</div>
		</div>
		<h4 class="alert-success" role="alert">${AlreadyInserted}</h4>	
		
	<%
		String TeacherID, grade, section=null, room, branch;

			
			Statement st = dbcon.getConnection().createStatement();
			String sql = "select TeacherId,branch from TBL_Users where userName='" + ActiveUser + "' ";
			ResultSet rs_test = st.executeQuery(sql);
			if (rs_test.next()) {
				TeacherID = rs_test.getString(1);
				branch = rs_test.getString(2);
							%>
	<div class="container-fluid" style="margin-top: 3px;">


		<div class="  container-fluid">
			<h4 class="text-info text-center">
					ODA Special Boarding School
					<%=branch%>
					branch<br> Student reports
				</h4>
	
	
<form class="form-inline"method="post"onsubmit="return checkForm(this)">
<div class="form-inline col-lg-4 pull-right"
					style="margin: -50px 2px 12px 1px;">
					<strong> Choose Report Type </strong><select required
						class="form-control" name="reporttype">
						<option></option>
						<option value="gender">Gender</option>
						<option value="Score">Score</option>
						<option value="pass/failPass_fail">Pass_fail</option>
							<option value="markcomparison">mark comparison</option>
					</select>
					<button class="btn btn-primary">
						<span class="fa fa-arrow-right"></span>
					</button>
				</div>
               </form>
				 </div>
				  <%
			String report = request.getParameter("reporttype");
						if (report == null) {
		%>
		<div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose report type</h5>
		</div><%}        else if(report.equalsIgnoreCase("Score")){
			%>
			<form action="">
             <input type="number"name="mark">
            <input type="submit"value="submit">
            </form>
            <div class="alert alert-warning">
			<h5 class=" text-warning">enter your comparison number</h5>
		</div><%
			
						
if(request.getParameter("mark")==null ||request.getParameter("mark")=="")
{
	%>
	<%
}
else
{ 
float score=Float.valueOf(request.getParameter("mark"));
Statement st3=dbcon.getConnection().createStatement();
int i=0;%>
<table class="table table-responsive table-bordered">
	<tr>
	<th>id</th>	
	<th>Student id</th>
	<th>year</th>
	<th>grade</th>
	<th>Section</th>
	<th>result</th>
	</tr>
	
<%if (score!=0)
{
String  listofyear=null;
ResultSet rs=st3.executeQuery("select * from TBL_mark where total>='"+score+"' order by total DESC ");
while(rs.next()){i++;
float result=rs.getFloat("total");
String student_id=rs.getString("Stud_id");
int gradelist=rs.getInt("Grade");
String sectionid=rs.getString("Section_id");
listofyear=rs.getString("year");
	%>
	
	<tr>
<td><%=i %></td>
<td><%=student_id %></td>
<td><%=listofyear %></td>
<td><%=gradelist %></td>
<td><%=sectionid %></td>
<td><%=result %></td>
</tr>

<%
}

%>
</table>
<%
}}}

%>

				  <%
			String sex = request.getParameter("reporttype");
						if (sex == null) {
		%>

	<%
		}	else if(sex.equalsIgnoreCase("gender")) {%>
				 <form action=""class="form-inline"method="post"onsubmit="return checkForm(this)">
				 <div class="form-inline col-lg-4">
				 <strong>Choose Gender</strong>
				 <select required class="form-control"name="Gender">
				 <option></option>
				 <option value="M">male</option>
				 <option value="F">female</option>
				<option value="total">total</option>
				 
				 </select>
				 <button class="btn btn-primary">
			<span class="fa fa-arrow-right"></span>
				</button>
	             </div>
	      <div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose gender</h5>
		</div>
				 </form>
		    <%}String Gender=request.getParameter("Gender");
		    if(Gender==null){ %>
		    
		<%
		}
		    else if(Gender.equalsIgnoreCase("M")){
		    
		%>




<table class="table table-responsive table-bordered">
		
<tr>
<th>id</th>
<th>Student id</th>
<th>Full Name</th>
<th> Gender</th>
<th> Age</th>
</tr>
<%
Date date=new Date();
SimpleDateFormat sdfyear=new SimpleDateFormat("YYY");
String currentyear=sdfyear.format(date);
SimpleDateFormat sdfday=new SimpleDateFormat("d");
String currentday=sdfday.format(date);
SimpleDateFormat sdfmonth=new SimpleDateFormat("M");
String currentmonth=sdfmonth.format(date);
int i=0, agecount=0;
String gender=null,fname=null,lname=null,id=null,fullname=null; Date age=null;
Statement st1=dbcon.getConnection().createStatement();
ResultSet rs=st1.executeQuery("SELECT * FROM TBL_student where Gender='male'");
while(rs.next()){
	age=rs.getDate("BirthDate");
	SimpleDateFormat sdfbirthofyear=new SimpleDateFormat("Y");
	String birthof_year=sdfbirthofyear.format(age);
	SimpleDateFormat birthof_daye=new SimpleDateFormat("d");
	String brithof_day=birthof_daye.format(age);
	SimpleDateFormat birthof_month=new SimpleDateFormat("M");
	String bmonth=birthof_month.format(age);
	gender=rs.getString("Gender");
	fname=rs.getString("FirstName");
	lname=rs.getString("LastName");
	id=rs.getString("Stud_id");
	fullname=fname.concat(lname);
	 agecount=Integer.valueOf(currentyear)-Integer.valueOf(birthof_year)+(Integer.valueOf(currentday)-Integer.valueOf(brithof_day))+(Integer.valueOf(currentmonth)-Integer.valueOf(bmonth));
	i++;
%>
<tr>
<td><%=i %></td>
<td><%=id %></td>
<td><%=fullname %></td>
<td><%=gender %></td>
<td><%=agecount %></td>
</tr>

<%}}%><%else if(Gender.equalsIgnoreCase("F"))
				{
	
%>

</table>
<table class="table table-responsive table-bordered">
		
<tr>
<th>id</th>
<th>Student id</th>
<th>Full Name</th>
<th> Gender</th>
<th> Age</th>
</tr>
<%
Date date=new Date();
SimpleDateFormat sdfyear=new SimpleDateFormat("YYY");
String currentyear=sdfyear.format(date);
SimpleDateFormat sdfday=new SimpleDateFormat("d");
String currentday=sdfday.format(date);
SimpleDateFormat sdfmonth=new SimpleDateFormat("M");
String currentmonth=sdfmonth.format(date);

 int agecounter=0;

int j=0;Statement stfemale=dbcon.getConnection().createStatement();
ResultSet rsfemale=stfemale.executeQuery("select * from TBL_student where Gender='female'");
while(rsfemale.next()){j++;
	String firstName=rsfemale.getString("FirstName");
	String lastname=rsfemale.getString("LastName");
	String studentid=rsfemale.getString("Stud_id");
	Date ageof=rsfemale.getDate("BirthDate");
	SimpleDateFormat femalesdf=new SimpleDateFormat("y");
	String femalebirthyear=femalesdf.format(ageof);
	SimpleDateFormat femaledayof_birth=new SimpleDateFormat("d");
	String femaleday_ofbirth=femaledayof_birth.format(ageof);
	SimpleDateFormat femalebirthof_month=new SimpleDateFormat("M");
	String birthof_month=femalebirthof_month.format(ageof);
	agecounter=Integer.valueOf(currentyear)-Integer.valueOf(femalebirthyear)+(Integer.valueOf(currentday)-Integer.valueOf(femaleday_ofbirth))+(Integer.valueOf(currentmonth)-Integer.valueOf(birthof_month));
%>
   
	<tr>
	<td><%=j %></td>
	<td><%=studentid %></td>
	<td><%=firstName %></td>
	<td><%=lastname %></td>
	<td><%=agecounter %></td></tr>
<%}}%><%else if(Gender.equalsIgnoreCase("total"))
				{%>	</table>
    <%
	
	Statement sttotal=dbcon.getConnection().createStatement();
	ResultSet rstotal=sttotal.executeQuery("select count(Stud_id) from TBL_student");
	while(rstotal.next()){%>
	<button>
	<%out.println(rstotal.getString(1));%></button>
	
	<%}}%>

	  <%
			String Pass_fail = request.getParameter("reporttype");
						if (Pass_fail == null) {
							
							
							
		}else if(Pass_fail.equalsIgnoreCase("pass/failPass_fail")){%>
		<form class="form-inline"method="post"onsubmit="return checkForm(this)">
		<strong>choose pass/fail Pass_fail</strong>
		<select required class="form-control"name="Pass_fail">
		<option></option>
		<option value="pass">pass</option>
		<option value="fail">fail</option>
		</select>
		<button class="btn btn-primary">
			<span class="fa fa-arrow-right"></span>
				</button>
	              <div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose pass/fail Pass_fail</h5>
		</div>
		
		</form>
		<%}
						String info=request.getParameter("Pass_fail");
						if(info==null){
		%>
		 
	<%} else if(info.equalsIgnoreCase("pass")){
		Statement stpass=dbcon.getConnection().createStatement();
		ResultSet rspas=stpass.executeQuery("select * from TBL_Total_Mark where Pass_fail='pass'");
		int j=0;%>
		 <table class="table table-responsive table-bordered">
		<tr><th>id</th>
		<th>student id</th>
		<th>pass</th>
		</tr><%
		while(rspas.next()){
			j++;
		String passid=rspas.getString("Stud_id");
		String pass=rspas.getString("Pass_fail");%>
		
		<tr><td><%=j %></td>
		<td><%=passid %></td>
	<td><%=pass %></td>
</tr>

	<%}%></table><%}else if(info.equalsIgnoreCase("fail"))
		{%>
		 <table class="table table-responsive table-bordered">
		<tr><th>id</th>
		<th>student id</th>
		<th>pass</th>
		</tr><%
		Statement stfail=dbcon.getConnection().createStatement();
		ResultSet rsfail=stfail.executeQuery("select * from TBL_Total_Mark where Pass_fail='fail'");
		int k=0;
		while(rsfail.next()){
			k++;
			String failid=rsfail.getString("Stud_id");
			String fail=rsfail.getString("Pass_fail");
			%>
			<tr><td><%=k %></td>
		<td><%=failid %></td>
	<td><%=fail %></td>
</tr><%
		}}}%>
		</table>
		<%String max_min=request.getParameter("reporttype");
		if(max_min==null){
			%>
			
		<%}
		else if(max_min.equalsIgnoreCase("markcomparison"))
		{%>
			<form action=""class="form-inline"onsubmit="return checkForm"method="post">
			<strong>choose mark</strong>
			<select class="form-control"required name="max-min">
			<option></option>
			<option value="max">max</option>
			<option value="min">min</option>
			</select>
			<button class="btn btn-primary">
			<span class="fa fa-arrow-right"></span>
				</button>
	              <div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose pass/fail Pass_fail</h5>
		</div>
			</form>
	<%	}
		String comparison=request.getParameter("max-min");
		if(comparison==null)
		{
			
		}
		else if(comparison.equalsIgnoreCase("max")){
			Statement stmax=dbcon.getConnection().createStatement();
			float markofmax=0;
			ResultSet rsmax=stmax.executeQuery(" SELECT distinct max(total) FROM TBL_Total_mark ");
		while(rsmax.next()){
				 markofmax=rsmax.getFloat(1);
		
			
		%>

<%}%>
		<%=markofmax %><%}
		else if(comparison.equalsIgnoreCase("min"))
			{
			Statement stmin=dbcon.getConnection().createStatement();
			ResultSet rsmin=stmin.executeQuery("select Stud_id, min(total) from TBL_Total_Mark");
			float markofmin=0;String stud=null;
			while(rsmin.next()){
				 markofmin=rsmin.getFloat(1);
			}
			out.println(markofmin);
			}}%>



</div>
</div>
</body>
</html>