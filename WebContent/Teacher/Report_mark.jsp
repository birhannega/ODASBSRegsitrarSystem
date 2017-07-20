<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<style type="text/css" title="currentStyle">
@import "../resources/css/demo_table.css";
</style>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mark list report</title>
</head>

<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		Dbconnection dbconn = new Dbconnection();
		String Grade = null;
		String SubID = null, section = null, FirstName = null, LastName = null, teacherID = null, branch = null;
		String Loggeduser = session.getAttribute("user").toString();
		Statement statment_active = dbconn.getConnection().createStatement();
		ResultSet rs_active = statment_active
				.executeQuery("select TeacherId,branch from TBL_Users where userName='" + Loggeduser + "'");
		if (rs_active.next()) {
			teacherID = rs_active.getString(1);
			branch = rs_active.getString(2);
		}
		Statement st_details = dbconn.getConnection().createStatement();
		ResultSet rs_detail = statment_active
				.executeQuery("select FirstName,LastName from TBL_teacher where TeacherId='" + teacherID + "'");
		while (rs_detail.next()) {
			FirstName = rs_detail.getString(1);
			LastName = rs_detail.getString(2);
		}
		Statement statment_sub = dbconn.getConnection().createStatement();
		ResultSet rs_sub = statment_active
				.executeQuery("select Grade,Section_id, subject_id from TBL_Subject_Teacher where TeacherId='"
						+ teacherID + "'");
%>
<body>
	<div>
		<%@ include file="../includes/vector.jsp"%></div>

	<div class="container-fluid">
		<div>
			<a href="Tindex.jsp"><strong>Back to main menu</strong></a>
		</div>
		<div class="container-fluid">
			<div>
				<form action="" class="form-inline pull-right" method="post">

					<select class="form-control" name="grade_se">
						<option value="">Choose Grade and section</option>
						<%
							while (rs_sub.next()) {
									String grade = rs_sub.getString(1);

									section = rs_sub.getString(2);
									SubID = rs_sub.getString(3);
						%>
						<option><%=grade.concat(section)%></option>
						<%
							}
						%>
					</select>
					<button class="btn btn-primary">
						<span class="fa fa-arrow-right"></span>
					</button>
				</form>
				<%
					String grade_sec = request.getParameter("grade_se");

						if (grade_sec == null || grade_sec.trim() == "") {
							out.println("Grade and section not specified");
						} else {
							if (grade_sec.startsWith("9")) {
								grade_sec = "0" + grade_sec;
							}
							char extracted_grade_1st = grade_sec.charAt(0);
							char extracted_grade_2nd = grade_sec.charAt(1);
							char sec1 = grade_sec.charAt(2);
							Grade = String.valueOf(extracted_grade_1st).concat(String.valueOf(extracted_grade_2nd));
							section = String.valueOf(sec1);
				%>
			</div>




		</div>
		<div class="info text-center">
			<h4 class="text-center">
				ODA special Boarding School
				<%=branch%>
				branch
			</h4>
			<strong class="text-center text-uppercase">Mark list for
				students of Grade <%
			if(Grade.contains("9"))
			{
				Grade="9";
			}
			
			%> <%=Grade%><%=section%></strong>
		</div>
		<table class="table table-bordered table-condensed table-responsive"
			id="marklist">
			<thead>
				<tr>
					<th>No.</th>
					<th>Student ID</th>
					<th>Test1</th>
					<th>Test2</th>
					<th>Test Average</th>
					<th>Worksheet1</th>
					<th>worksheet2</th>
					<th>work sheet average</th>
					<th>project</th>
					<th>Mid exam</th>
					<th>Final</th>
					<th>Activity</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<%
					Statement ListStudents = dbconn.getConnection().createStatement();
							int i = 0;
							String Stud_id = null;
							ResultSet rs_stud = ListStudents.executeQuery("select  Distinct Stud_id from TBL_Test where Grade='"
									+ Grade + "' and Section_id='" + section + "' and branch='"+branch+"'");
							
							
							while (rs_stud.next()) {
								i++;
								Stud_id = rs_stud.getString("Stud_id");
								if(i==0)
								{
									%>
				<tr>
					<td>no record found</td>
				</tr>

				<%
								}
								else
								{
				%>
				<tr>
					<td><%=i%></td>
					<td><%=Stud_id%></td>
					<!-- mark t1 -->
					<td>
						<%
							Statement st_test = dbconn.getConnection().createStatement();
										String obtainedMark_t1 = null, obtainedMark_t2 = null;
										String mark_project = null;
										String mark_w1 = null;
										String mark_w2 = null;
										String mark_final = null;
										String mark_mid = null;
										String mark_activity = null;

										ResultSet rs_t1 = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='t1'");
										float ObtainedMark_t1 = 0;
										if (rs_t1.next()) {
											ObtainedMark_t1 = rs_t1.getFloat(1);
											out.println(ObtainedMark_t1);
										} else {
											out.print("incomplete");
											ObtainedMark_t1 = 0;
										}
						%>
					</td>
					<!-- 
//////////////////////////////////////////////
            students mark form test2 
//////////////////////////////////////
 -->
					<td>
						<%
							ResultSet rs_t2 = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='t2'");
										float t2 = 0;
										if (rs_t2.next()) {
											obtainedMark_t2 = rs_t2.getString(1);
											t2 = Float.valueOf(obtainedMark_t2);
											out.println(obtainedMark_t2);
										} else {
											t2 = 0;
											out.print("incomplete");
										}
						%>
					</td>

					<td><%=(ObtainedMark_t1 + t2) / 2%></td>
					<!-- 
//////////////////////////////////
///////////////////////////////////
mar from workheet1
////////////////////////////////
/////////////////////////////////
 -->
					<td>
						<%
							ResultSet rs_w1 = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='w1'");
										float worksheet1 = 0;
										if (rs_w1.next()) {
											mark_w1 = rs_w1.getString(1);
											worksheet1 = Float.valueOf(mark_w1);
											out.println(mark_w1);
										} else {
											out.print("incomplete");
										}
						%>
					</td>
					<td>
						<%
							ResultSet rs_w2 = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='w2'");
										float worksheet2 = 0;
										if (rs_w2.next()) {
											mark_w2 = rs_w2.getString(1);
											out.println(mark_w2);
											worksheet2 = Float.valueOf(mark_w2);
										} else {
											out.print("incomplete");
										}
						%>
					</td>
					<td><%=(worksheet1 + worksheet2) / 2%></td>

					<td>
						<%
							ResultSet rs_pro = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='pro'");
										float proj_mark = 0;
										if (rs_pro.next()) {
											mark_project = rs_pro.getString(1);
											proj_mark = Float.valueOf(mark_project);
											out.println(proj_mark);
										} else {
											out.print("incomplete");
											proj_mark = 0;
										}
						%>
					</td>
					<td>
						<%
							ResultSet rs_mid = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='mid'");
										float mid_mark = 0;
										if (rs_mid.next()) {
											String mid = rs_mid.getString(1);
											mid_mark = Float.valueOf(mid);
											out.println(mid_mark);
										} else {
											out.print("incomplete");
											mid_mark = 0;
										}
						%>
					</td>
					<td>
						<%
							ResultSet rs_final = st_test.executeQuery(
												"select obtainedMark from TBL_Test where Stud_id='" + Stud_id + "' and type='final'");
										float finalex = 0;
										if (rs_final.next()) {
											mark_final = rs_final.getString(1);
											finalex = Float.valueOf(mark_final);
											out.println(finalex);
										} else {
											out.print("incomplete");
											mark_final = null;

										}
						%>
					</td>

					<td>
						<%
							ResultSet rs_activity = st_test.executeQuery("select obtainedMark from TBL_Test where Stud_id='"
												+ Stud_id + "' and type='activity'");
										float activity = 0;
										if (rs_activity.next()) {
											mark_activity = rs_activity.getString(1);
											activity = Float.valueOf(mark_activity);
											out.println(activity);
										} else {
											out.print("incomplete");
										}
						%>
					</td>
					<td>
						<%
							float total = finalex + mid_mark + activity + proj_mark + (worksheet2 + worksheet1) / 2
												+ (ObtainedMark_t1 + t2) / 2;
										out.println(total);
						%>
					</td>
				</tr>
				<%
					}
							}
				
				%>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="13"><span class="col-lg-6 pull-left">
							<p>
								Subject Teacher name:<strong> <%
 	String Fullname = FirstName + " " + LastName;
 			out.println(Fullname);
 %>
								</strong>
							</p>

							<p>Signature _______________________</p>
							<p>Date ____________________________</p>
					</span> <span class="col-lg-4 pull-right">
							<p>Deputy Directors' name __________________</p>
							<p>Signature ______________________________</p>
							<p>
								Date
								<% Date date=new Date(); 
							SimpleDateFormat simpleFormat=new SimpleDateFormat("d/M/YYYY");
							String formateddate=simpleFormat.format(date);
							out.println(formateddate);
							%>
							</p>

					</span></td>

				</tr>
			</tfoot>
		</table>
		<span class="pull-right">
			<button id="printpagebutton" type="button"
				class="btn btn-primary pull-right" onclick="printpage()">
				<span class="glyphicon glyphicon-print"> <strong>print
						this report</strong>
				</span>
			</button>
		</span>
	</div>
	<!-- 	<script type="text/javascript">
		$(document).ready(function() {

			$("#marklist").bdt();

		});
	</script> -->
	<script type="text/javascript">
function printpage() {
    //Get the print button and put it into a variable
    var printButton = document.getElementById("printpagebutton");
    //Set the print button visibility to 'hidden' 
    printButton.style.visibility = 'hidden';
    //Print the page content
    window.print()
    //Set the print button to 'visible' again 
    //[Delete this line if you want it to stay hidden after printing]
    printButton.style.visibility = 'visible';
}


</script>
	<%
		}
	}
	%>

</body>

</html>