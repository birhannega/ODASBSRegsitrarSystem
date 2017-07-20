
<%if(session.getAttribute("registrar")==null)
{
	
	response.sendRedirect("../index.jsp");
	
}
	else
	{
	%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function printpage() {

    var printButton = document.getElementById("printpagebutton");
 
    printButton.style.visibility = 'hidden';
   
    window.print()
     printButton.style.visibility = 'visible';
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>

<link type="text/css" rel="stylesheet" title="currentStyle"
	href=../resources/css/demo_table.css />

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h4 class="alert-success" role="alert">${AlreadyInserted}</h4>
	<%String userid=session.getAttribute("registrar").toString(),branch=null;
		 Statement stsession=dbcon.getConnection().createStatement();
		 ResultSet Rssession=stsession.executeQuery("select * from TBL_users where UserName='"+userid+"'");
		 if(Rssession.next()){
			 branch=Rssession.getString("branch");
			 //branch=Rssession.getString("branch");
		 }%>
	<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="text-uppercase">
					ODA Special Boarding School
					<%=branch%>
					branch Entrance Exam
				</h4>

			</div>
		</div>

		<form class="form-inline" method="post"
			onsubmit="return checkForm(this)">
			<div class="form-inline col-lg-4 pull-right"
				style="margin: -10px 2px 12px 1px">
				<strong>Choose Report Type</strong> <select class="form-control"
					name="report" required>
					<option></option>
					<option value="Grade_10">Grade_10</option>
					<option value="Grade_12">Grade_12</option>
					<option></option>
				</select>
				<button class="btn btn-primary">
					<span class="fa fa-arrow-right"></span>
				</button>
			</div>
		</form>
		<%String entrance=request.getParameter("report");
		 if(entrance==null){
		 %>
		<div class="alert alert-warning">
			<h4 class="text-warning">You Should Choose Report Type</h4>
		</div>
		<%}else if(entrance.equalsIgnoreCase("Grade_10")){%>

		<%
	
			
			String id=null,Affanoromo=null,amharic=null,english=null,maths=null,
			physics=null,chemistry=null,biology=null,civics=null,geo=null,history=null,
			studentid=null,fullname=null,fname=null,lname=null;int i=0,Grade=0;float total=0;
		 Statement  exam=dbcon.getConnection().createStatement();
		 ResultSet entrance10=exam.executeQuery("select Distinct Stud_id,Grade,Mark from EntranceExam where Grade='10'and branch='"+branch+"'"); 
		 if(!entrance10.isBeforeFirst()){%>
		<h3 class="alert alert-info" style="color: red;">Grade_10
			Entrance Exam Results does't in the database</h3>
		<%} %>
		<table class="table table-responsive table-bordered">
			<tr>
				<th>ID</th>
				<th>Teacher ID</th>
				<th>FullName</th>
				<th>Grade</th>
				<th>AffanOromo</th>
				<th>Amharic</th>
				<th>Biology</th>
				<th>Chemistry</th>
				<th>Civics</th>
				<th>English</th>
				<th>geography</th>
				<th>History</th>
				<th>Maths</th>
				<th>Physics</th>



			</tr>

			<%
			while(entrance10.next()){
		 studentid=entrance10.getString("Stud_id");
		 Grade=entrance10.getInt("Grade");
		 Affanoromo=entrance10.getString("Mark");
		/* Amharic=entrance10.getString("Amharic");
		 English=entrance10.getString("English");
		 Maths=entrance10.getString("Maths");
		 Physics=entrance10.getString("Physics");
		 Chemistry=entrance10.getString("Chemistry");
		 Biology=entrance10.getString("Biology");
		 Civics=entrance10.getString("Civics");
		 Geography=entrance10.getString("Geography");
		 History=entrance10.getString("History");
  */
	Statement Stentrance=dbcon.getConnection().createStatement();
	ResultSet rsentrance=Stentrance.executeQuery("select *from TBL_student where Stud_id='"+studentid+"'and Branch='"+branch+"'");
	while(rsentrance.next()){
		fname=rsentrance.getString("FirstName");
		lname=rsentrance.getString("LastName");
		fullname=fname+"  "+lname;
	
 %>

			<tr>
				<%} %>

				<%Statement sthistry=dbcon.getConnection().createStatement();
			ResultSet rshistory=sthistry.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='History10'");
			 while(rshistory.next())
			 {
				 history=rshistory.getString("Mark");
			 
		Statement stchemist=dbcon.getConnection().createStatement();
		ResultSet chemist=stchemist.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='Chemistry10'");
		while(chemist.next()){
			chemistry=chemist.getString("Mark");
		%>
				<%Statement stenglish=dbcon.getConnection().createStatement();
		ResultSet rsenglish=stenglish.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='English10'");
		while(rsenglish.next()){
			english=rsenglish.getString("Mark");
		%>
				<%Statement stmaths=dbcon.getConnection().createStatement();
	
		ResultSet rsmaths=stmaths.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='Maths10'");
		while(rsmaths.next()){
		maths=rsmaths.getString("Mark");
		%>
				<%Statement stgeo=dbcon.getConnection().createStatement();
		
		ResultSet rsgeo=stgeo.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='Geography10'");
		while(rsgeo.next()){
			geo=rsgeo.getString("Mark");
		%>
				<%Statement stphysics=dbcon.getConnection().createStatement();
	
		ResultSet rsphysics=stphysics.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and  Grade='10'and branch='"+branch+"'and SubjectId='physics10'");
		while(rsphysics.next()){
			physics=rsphysics.getString("Mark");
		%>
				<%Statement stamharic=dbcon.getConnection().createStatement();

		ResultSet rsamharic=stamharic.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='Amharic10'");
		while(rsamharic.next()){
			amharic=rsamharic.getString("Mark");
		%>
				<%Statement stbiology=dbcon.getConnection().createStatement();

		ResultSet rsbiology=stbiology.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and Grade='10'and branch='"+branch+"'and SubjectId='Biology10'");
		while(rsbiology.next()){
			biology=rsbiology.getString("Mark");
		%>
				<%Statement stcivics=dbcon.getConnection().createStatement();
		ResultSet rscivics=stcivics.executeQuery("select * from EntranceExam where Stud_id='"+studentid+"'and  Grade='10'and branch='"+branch+"'and SubjectId='Civics10'");
		while(rscivics.next()){i++;
			civics=rscivics.getString("Mark");%>
				<td><%=i %></td>
				<td><%=studentid %></td>
				<td><%=fullname %></td>
				<td><%=Grade %></td>
				<td><%=Affanoromo %></td>
				<td><%=amharic %></td>
				<td><%=biology %></td>
				<td><%=chemistry %></td>
				<td><%=civics %></td>
				<td><%=english %></td>
				<td><%=geo %></td>
				<td><%=history %></td>
				<td><%=maths %></td>
				<td><%=physics %></td>


				<%	}%>

				<%}%>
				<%}}}}}}}}%>

			</tr>
		</table>

	</div>

	<div class="container-fluid">
		<input type="submit" onclick="printpage();" value="print this report"
			id="printpagebutton" class="pull-right btn btn-primary" />
	</div>
	<%}else if(entrance.equalsIgnoreCase("Grade_12")){ 
	%>
	<table class="table table-responsive table-bordered">
		<tr>
			<td>Stud ID</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>English</td>
			<td>Maths</td>
			<td>aptitude</td>
			<td>Physics</td>
			<td>Chemistry</td>
			<td>Biology</td>
			<td>civics</td>
		</tr>
		<%
String id=null,studid=null,FirstName=null,lastname=null,aptitude=null,biology=null,chemistry=null,civics=null,english=null,maths=null,physics=null;int grade=0,j=0;
Statement St=dbcon.getConnection().createStatement();
ResultSet rs=St.executeQuery("select *from TBL_student where Branch='"+branch+"'and Grade='12'");
while(rs.next()){
studid=rs.getString("Stud_id");
FirstName=rs.getString("FirstName");
lastname=rs.getString("LastName");
Statement st1=dbcon.getConnection().createStatement();
ResultSet rs1=st1.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'");
while(rs1.next()){
id=rs1.getString("Stud_id");
}%>
		<%Statement st2=dbcon.getConnection().createStatement();
ResultSet rs2=st2.executeQuery("select *from  EntranceExam where Stud_id='"+studid+"'and SubjectId='Physics12'");
while(rs2.next()){
physics=rs2.getString("Mark");
%>
		<%Statement st3=dbcon.getConnection().createStatement();
ResultSet rs3=st3.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'and SubjectId='Maths12'");
while(rs3.next()){
maths=rs3.getString("Mark");
}%>
		<%Statement st4=dbcon.getConnection().createStatement();
ResultSet rs4=st4.executeQuery("select * from EntranceExam where Stud_id='"+studid+"'and SubjectId='Biology12'");
while(rs4.next()){
biology=rs4.getString("Mark");
}%>
		<%Statement st5=dbcon.getConnection().createStatement();
ResultSet rs5=st5.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'and SubjectId='Civics12'");
while(rs5.next()){
civics=rs5.getString("Mark");
}%>
		<%Statement st6=dbcon.getConnection().createStatement();
ResultSet rs6=st6.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'and SubjectId='English12'");
while(rs6.next()){
english=rs6.getString("Mark");
}%>
		<%Statement st7=dbcon.getConnection().createStatement();
ResultSet rs7=st7.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'and SubjectId='Aptitude12'");
while(rs7.next()){
aptitude=rs7.getString("Mark");
}%>
		<%Statement st8=dbcon.getConnection().createStatement();
ResultSet rs8=st8.executeQuery("select *from EntranceExam where Stud_id='"+studid+"'and SubjectId='Chemistry12'");
while(rs8.next()){
chemistry=rs8.getString("Mark");
}%><tr>
			<td><%=studid %></td>
			<td><%=FirstName %></td>
			<td><%=lastname %></td>
			<td><%=english %></td>
			<td><%=maths %></td>
			<td><%=aptitude %></td>
			<td><%=physics %></td>
			<td><%=chemistry %></td>
			<td><%=biology %></td>
			<td><%=civics %></td>


			<%}}%>
		
	</table>

	<div class="container-fluid">
		<input type="submit" onclick="printpage();" value="print this report"
			id="printpagebutton" class="pull-right btn btn-primary" />
	</div>

	<%}}%>
</body>
</html>