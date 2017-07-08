
<%
	if (session.getAttribute("registrar") == null) {
		response.sendRedirect("../index.jsp");
	} else {
%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

<title>students transcript</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#transcript").validate({

			rules : {
				studentID : "required",
				studentID : {
					required : true,
					minlength : 16,
					maxlength : 16,
					autocomplete : false,
				}
			}
		});
	});
</script>
<Style>
.error {
	color: red;
}
</Style>
<style type="text/css" media="print">
@page {
	margin: 1mm;
	size: auto;
}

header {
	display: none;
	margin: 0;
	padding: 0;
}

footer {
	display: none;
}

table {
	border: 2px solid #000000;
	font-size: 12px;
	border-collapse: separater;
}
</style>
</head>
<%
	Dbconnection dataconnection = new Dbconnection();
		Connection con = dataconnection.getConnection();
		String branch = null;
		Statement stbr = con.createStatement();
		ResultSet rsbr = stbr.executeQuery("select Branch from TBL_Users where userName='"
				+ session.getAttribute("registrar").toString() + "'");
		if (rsbr.next()) {
			branch = rsbr.getString(1);
		}
%>

<body>
<div class="container-fluid">
          <%@include file="../includes/vector.jsp"%>

		<div style="margin-top: -20px">
			<%@ include file="../includes/nav.html"%>
		</div>
</div>
	<div class="container">
		
				<form action="" method="post" class="form-inline pull-right"
					id="transcript">
					<div class="form-group">
						<label>Enter Student ID</label> <input class="form-control"
							name="studentID" value="ODASBS/"> <input type="submit"
							value="Go!" class="btn btn-primary" />
					</div>
				</form>
			</div>
		
		<%
			String StudentID = request.getParameter("studentID"), retrievedID = null, Fname = null, Lname = null,
						sex = null;

				Statement statement = con.createStatement();
				ResultSet res_id = statement.executeQuery(
						"Select * from TBL_student where Stud_id='" + StudentID + "' and branch='" + branch + "'");
				if (res_id.next()) {
					retrievedID = res_id.getString("Stud_id");
					Fname = res_id.getString("FirstName");
					Lname = res_id.getString("LastName");
					sex = res_id.getString("Gender");
		%>
		<div class="container">
			<button id="printpagebutton" type="button"
				class="btn btn-primary pull-right" onclick="printpage()">
				<span class="glyphicon glyphicon-print"> <strong>print
						transcript</strong>
				</span>
			</button>

			<p class="text-left text-uppercase"
				style="font-family: Aerial, helvetica">
				<span class="text-center">O.N.R.S Education Bureau</span> Regular
				Student Transcript <br> <span class="text-center">
					School: ODA special boarding School </span> <br>Full Name of the
				student:
				<%=Fname + " " + Lname%>
				<br> ID number: <span class="text-uppercase"><%=StudentID%>
				</span> Gender:-
				<%=sex%><br> &nbsp; &nbsp; &nbsp; Date of Leaving:-
				<%
 	Date date = new Date();
 			SimpleDateFormat simple = new SimpleDateFormat("d/M/y");
 			SimpleDateFormat simpleY = new SimpleDateFormat("y");
 			String cur_date = simple.format(date);
 			String year = simpleY.format(date);
 			int Year = Integer.valueOf(year) - 7;
 			out.print(cur_date);
 %>
			
		</div>

		<div class="container-fluid">

			<div class="content-box">
				<table class="table  table-condensed  table-bordered">

					<thead>
						<tr>
							<%
								Statement st_year = con.createStatement();
										String sec_9 = null, Start_year = null;
										ResultSet res_9 = st_year
												.executeQuery("select Distinct AcademicYear,Section_id from TBL_mark where Stud_id='"
														+ StudentID + "' and Grade='9'");
										if (res_9.next()) {
											sec_9 = res_9.getString(2);
											Start_year = res_9.getString(1);
										}
							%>
							<th rowspan="2" class="active">Subject</th>
							<th colspan="3" class="active">Grade 9 sec <%=sec_9%></th>
							<%
								String sec_10 = null, year_10 = null;
										ResultSet res_10 = st_year
												.executeQuery("select Distinct AcademicYear,Section_id from TBL_mark where Stud_id='"
														+ StudentID + "' and Grade='10'");
										if (res_10.next()) {
											sec_10 = res_10.getString(2);
											year_10 = res_10.getString(1);
										}

										String sec_11 = null, year_11 = null;
										ResultSet res_11 = st_year
												.executeQuery("select Distinct AcademicYear,Section_id from TBL_mark where Stud_id='"
														+ StudentID + "' and Grade='11'");
										if (res_11.next()) {
											sec_11 = res_11.getString(2);
											year_11 = res_11.getString(1);
										}

										String sec_12 = null, year_12 = null;
										ResultSet res_12 = st_year
												.executeQuery("select Distinct AcademicYear,Section_id from TBL_mark where Stud_id='"
														+ StudentID + "' and Grade='12'");
										if (res_12.next()) {
											sec_12 = res_12.getString(2);
											year_12 = res_12.getString(1);
										}
							%>
							<th colspan="3" class="active">Grade 10 sec <%=sec_10%></th>
							<th colspan="3" class="active">Grade 11 sec <%=sec_11%></th>
							<th colspan="3" class="active">Grade 12 sec <%=sec_12%></th>
						</tr>
						<tr>
							<th class="active">I</th>
							<th class="active">II</th>
							<th class="active">Av.</th>
							<th class="active">I</th>
							<th class="active">II</th>
							<th class="active">Av.</th>
							<th class="active">I</th>
							<th class="active">II</th>
							<th class="active">Av.</th>
							<th class="active">I</th>
							<th class="active">II</th>
							<th class="active">Av.</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>Afan Oromo</td>



							<td>
								<%
									ResultSet rs_af_9 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float af_9_1st = 0;
											if (rs_af_9.next()) {
												String Af_9_1st = rs_af_9.getString("total");
												af_9_1st = Float.valueOf(Af_9_1st);
								%> <%=af_9_1st%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_af_2nd = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float af_9_2nd = 0;
											if (rs_af_2nd.next()) {
												af_9_2nd = Float.valueOf(rs_af_2nd.getString(1));
												out.println(af_9_2nd);
											} else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									out.println((af_9_2nd + af_9_1st) / 2);
								%>
							</td>

							<td>
								<%
									ResultSet rs_af_10 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float Af_1st_10 = 0;
											if (rs_af_10.next()) {
												Af_1st_10 = Float.valueOf(rs_af_10.getString(1));
												out.println(Af_1st_10);
											} else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_af_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float Af_2nd_10 = 0;
											if (rs_af_10_2.next()) {
												Af_2nd_10 = Float.valueOf(rs_af_10_2.getString(1));
												out.println(Af_2nd_10);
											} else {
												Af_2nd_10 = 0;
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									float average_10 = (Af_2nd_10 + Af_1st_10) / 2;
											out.println(average_10);
								%>
							</td>

							<td>
								<%
									ResultSet rs_af_11 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float af_11_1st = 0;
											if (rs_af_11.next()) {
												String Af_11_1st = rs_af_11.getString("total");
												af_11_1st = Float.valueOf(Af_11_1st);
								%> <%=af_11_1st%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_af_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float af_11_2nd = 0;
											if (rs_af_11_2.next()) {
												String Af_11_2nd = rs_af_11_2.getString("total");
												af_11_2nd = Float.valueOf(Af_11_2nd);
								%> <%=af_11_2nd%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(af_11_2nd + af_11_1st) / 2%></td>

							<td>
								<%
									ResultSet rs_af_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float af_12_1 = 0;
											if (rs_af_12_1.next()) {
												String Af_12_1 = rs_af_12_1.getString("total");
												af_12_1 = Float.valueOf(Af_12_1);
								%> <%=af_12_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>



							</td>
							<td>
								<%
									ResultSet rs_af_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='AfanOromo12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float af_12_2 = 0;
											if (rs_af_12_2.next()) {
												String Af_12_2 = rs_af_12_2.getString("total");
												af_12_2 = Float.valueOf(Af_12_2);
								%> <%=af_12_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(af_12_1 + af_12_2) / 2%></td>

						</tr>
						<tr>
							<td>Amharic</td>
							<td>
								<%
									ResultSet rs_am_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float am_9_1 = 0;
											if (rs_am_9_1.next()) {
												String amh_9_1 = rs_am_9_1.getString("total");
												am_9_1 = Float.valueOf(amh_9_1);
								%> <%=am_9_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_am_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float am_9_2 = 0;
											if (rs_am_9_2.next()) {
												String amh_9_2 = rs_am_9_2.getString("total");
												am_9_2 = Float.valueOf(amh_9_2);
								%> <%=am_9_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>

							<td><%=(am_9_2 + am_9_1) / 2%></td>


							<td>
								<%
									ResultSet rs_am_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='amharic10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float am_10_1 = 0;
											if (rs_am_10_1.next()) {
												String Am_10_1 = rs_am_10_1.getString("total");
												am_10_1 = Float.valueOf(Am_10_1);
								%> <%=am_10_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_am_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float am_10_2 = 0;
											if (rs_am_10_2.next()) {
												String Am_10_2 = rs_am_10_2.getString("total");
												am_10_2 = Float.valueOf(Am_10_2);
								%> <%=am_10_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>



							</td>
							<td><%=(am_10_2 + am_10_1) / 2%></td>

							<td>
								<%
									ResultSet rs_am_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float am_11_1 = 0;
											if (rs_am_11_1.next()) {
												String Am_11_1 = rs_am_11_1.getString("total");
												am_11_1 = Float.valueOf(Am_11_1);
								%> <%=am_11_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_am_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float am_11_2 = 0;
											if (rs_am_11_2.next()) {
												String Am_11_2 = rs_am_11_2.getString("total");
												am_11_2 = Float.valueOf(Am_11_2);
								%> <%=am_11_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>




							</td>
							<td><%=(am_11_1 + am_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_am_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float am_12_1 = 0;
											if (rs_am_12_1.next()) {
												String Am_12_1 = rs_am_12_1.getString("total");
												am_12_1 = Float.valueOf(Am_12_1);
								%> <%=am_12_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_am_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Amharic12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float am_12_2 = 0;
											if (rs_am_12_2.next()) {
												String Am_12_2 = rs_am_12_2.getString("total");
												am_12_2 = Float.valueOf(Am_12_2);
								%> <%=am_12_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(am_12_1 + am_12_2) / 2%></td>
						</tr>


						<tr>
							<td>Mathematics</td>
							<td>
								<%
									ResultSet rs_ma_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float ma_9_1 = 0;
											if (rs_ma_9_1.next()) {
												String mat_9_1 = rs_ma_9_1.getString("total");
												ma_9_1 = Float.valueOf(mat_9_1);
								%> <%=ma_9_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_ma_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float ma_9_2 = 0;
											if (rs_ma_9_2.next()) {
												String mat_9_2 = rs_ma_9_2.getString("total");
												ma_9_2 = Float.valueOf(mat_9_2);
								%> <%=ma_9_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>



							</td>
							<td><%=(ma_9_1 + ma_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_ma_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float ma_10_1 = 0;
											if (rs_ma_10_1.next()) {
												String mat_10_1 = rs_ma_10_1.getString("total");
												ma_10_1 = Float.valueOf(mat_10_1);
								%> <%=ma_10_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_ma_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float ma_10_2 = 0;
											if (rs_ma_10_2.next()) {
												String mat_10_2 = rs_ma_10_2.getString("total");
												ma_10_2 = Float.valueOf(mat_10_2);
								%> <%=ma_10_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(ma_10_1 + ma_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_ma_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float ma_11_1 = 0;
											if (rs_ma_11_1.next()) {
												String mat_11_1 = rs_ma_11_1.getString("total");
												ma_11_1 = Float.valueOf(mat_11_1);
								%> <%=ma_11_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_ma_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float ma_11_2 = 0;
											if (rs_ma_11_2.next()) {
												String mat_11_2 = rs_ma_11_2.getString("total");
												ma_11_2 = Float.valueOf(mat_11_2);
								%> <%=ma_11_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(ma_11_1 + ma_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_ma_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float ma_12_1 = 0;
											if (rs_ma_12_1.next()) {
												String mat_12_1 = rs_ma_12_1.getString("total");
												ma_12_1 = Float.valueOf(mat_12_1);
								%> <%=ma_12_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_ma_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Maths12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float ma_12_2 = 0;
											if (rs_ma_12_2.next()) {
												String mat_12_2 = rs_ma_12_2.getString("total");
												ma_12_2 = Float.valueOf(mat_12_2);
								%> <%=ma_12_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>



							</td>
							<td><%=(ma_12_1 + ma_12_2) / 2%></td>

						</tr>

						<tr>
							<td>English</td>

							<td>
								<%
									ResultSet rs_en_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float en_9_1 = 0;
											if (rs_en_9_1.next()) {
												String En_9_1 = rs_en_9_1.getString("total");
												en_9_1 = Float.valueOf(En_9_1);
								%> <%=en_9_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_en_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float en_9_2 = 0;
											if (rs_en_9_2.next()) {
												String En_9_2 = rs_en_9_2.getString("total");
												en_9_2 = Float.valueOf(En_9_2);
								%> <%=en_9_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(en_9_1 + en_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_en_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float en_10_1 = 0;
											if (rs_en_10_1.next()) {
												String En_10_1 = rs_en_10_1.getString("total");
												en_10_1 = Float.valueOf(En_10_1);
								%> <%=en_10_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_en_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float en_10_2 = 0;
											if (rs_en_10_2.next()) {
												String En_10_2 = rs_en_10_2.getString("total");
												en_10_2 = Float.valueOf(En_10_2);
								%> <%=en_10_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(en_10_1 + en_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_en_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float en_11_1 = 0;
											if (rs_en_11_1.next()) {
												String En_11_1 = rs_en_11_1.getString("total");
												en_11_1 = Float.valueOf(En_11_1);
								%> <%=en_11_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_en_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float en_11_2 = 0;
											if (rs_en_11_2.next()) {
												String En_11_2 = rs_en_11_2.getString("total");
												en_11_2 = Float.valueOf(En_11_2);
								%> <%=en_11_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(en_11_1 + en_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_en_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float en_12_1 = 0;
											if (rs_en_12_1.next()) {
												String En_12_1 = rs_en_12_1.getString("total");
												en_12_1 = Float.valueOf(En_12_1);
								%> <%=en_12_1%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_en_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='English12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float en_12_2 = 0;
											if (rs_en_12_2.next()) {
												String En_12_2 = rs_en_12_2.getString("total");
												en_12_2 = Float.valueOf(En_12_2);
								%> <%=en_12_2%> <%
 	}

 			else {
 %><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(en_12_1 + en_12_2) / 2%></td>


						</tr>
						<tr>
							<td>Chinese</td>

							<td>
								<%
									ResultSet rs_ch_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float ch_9_1 = 0;
											if (rs_ch_9_1.next()) {
												String Ch_9_1 = rs_ch_9_1.getString("total");
												ch_9_1 = Float.valueOf(Ch_9_1);

												out.print(ch_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_ch_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float ch_9_2 = 0;
											if (rs_ch_9_2.next()) {
												String Ch_9_2 = rs_ch_9_2.getString("total");
												ch_9_2 = Float.valueOf(Ch_9_2);

												out.print(ch_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(ch_9_1 + ch_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_ch_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float ch_10_1 = 0;
											if (rs_ch_10_1.next()) {
												String Ch_10_1 = rs_ch_10_1.getString("total");
												ch_10_1 = Float.valueOf(Ch_10_1);

												out.print(ch_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_ch_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float ch_10_2 = 0;
											if (rs_ch_10_2.next()) {
												String Ch_10_2 = rs_ch_10_2.getString("total");
												ch_10_2 = Float.valueOf(Ch_10_2);

												out.print(ch_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(ch_10_2 + ch_10_1) / 2%></td>

							<td>
								<%
									ResultSet rs_ch_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float ch_11_1 = 0;
											if (rs_ch_11_1.next()) {
												String Ch_11_1 = rs_ch_11_1.getString("total");
												ch_11_1 = Float.valueOf(Ch_11_1);

												out.print(ch_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_ch_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float ch_11_2 = 0;
											if (rs_ch_11_2.next()) {
												String Ch_11_2 = rs_ch_11_2.getString("total");
												ch_11_2 = Float.valueOf(Ch_11_2);

												out.print(ch_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(ch_11_1 + ch_11_2) / 2%></td>


							<td>
								<%
									ResultSet rs_ch_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float ch_12_1 = 0;
											if (rs_ch_12_1.next()) {
												String Ch_12_1 = rs_ch_12_1.getString("total");
												ch_12_1 = Float.valueOf(Ch_12_1);

												out.print(ch_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_ch_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chinese12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float ch_12_2 = 0;
											if (rs_ch_12_2.next()) {
												String Ch_12_2 = rs_ch_12_2.getString("total");
												ch_12_2 = Float.valueOf(Ch_12_2);

												out.print(ch_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(ch_12_1 + ch_12_2) / 2%></td>
						</tr>


						<tr>
							<td>Biology</td>

							<td>
								<%
									ResultSet rs_bio_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float bio_9_1 = 0;
											if (rs_bio_9_1.next()) {
												String Bio_9_1 = rs_bio_9_1.getString("total");
												bio_9_1 = Float.valueOf(Bio_9_1);

												out.print(bio_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>

							<td>
								<%
									ResultSet rs_bio_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float bio_9_2 = 0;
											if (rs_bio_9_2.next()) {
												String Bio_9_2 = rs_bio_9_2.getString("total");
												bio_9_2 = Float.valueOf(Bio_9_2);

												out.print(bio_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(bio_9_1 + bio_9_2) / 2%></td>
							<td>
								<%
									ResultSet rs_bio_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float bio_10_1 = 0;
											if (rs_bio_10_1.next()) {
												String Bio_10_1 = rs_bio_10_1.getString("total");
												bio_10_1 = Float.valueOf(Bio_10_1);

												out.print(bio_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_bio_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float bio_10_2 = 0;
											if (rs_bio_10_2.next()) {
												String Bio_10_2 = rs_bio_10_2.getString("total");
												bio_10_2 = Float.valueOf(Bio_10_2);

												out.print(bio_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(bio_10_1 + bio_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_bio_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float bio_11_1 = 0;
											if (rs_bio_11_1.next()) {
												String Bio_11_1 = rs_bio_11_1.getString("total");
												bio_11_1 = Float.valueOf(Bio_11_1);

												out.print(bio_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_bio_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float bio_11_2 = 0;
											if (rs_bio_11_2.next()) {
												String Bio_11_2 = rs_bio_11_2.getString("total");
												bio_11_2 = Float.valueOf(Bio_11_2);

												out.print(bio_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(bio_11_1 + bio_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_bio_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float bio_12_1 = 0;
											if (rs_bio_12_1.next()) {
												String Bio_12_1 = rs_bio_12_1.getString("total");
												bio_12_1 = Float.valueOf(Bio_12_1);

												out.print(bio_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_bio_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='Biology12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float bio_12_2 = 0;
											if (rs_bio_12_2.next()) {
												String Bio_12_2 = rs_bio_12_2.getString("total");
												bio_12_2 = Float.valueOf(Bio_12_2);

												out.print(bio_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td><%=(bio_12_1 + bio_12_2) / 2%></td>
						</tr>


						<tr>
							<td>Chemistry</td>

							<td>
								<%
									ResultSet rs_chem_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float chem_9_1 = 0;
											if (rs_chem_9_1.next()) {
												String Chem_9_1 = rs_chem_9_1.getString("total");
												chem_9_1 = Float.valueOf(Chem_9_1);

												out.print(chem_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_chem_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float chem_9_2 = 0;
											if (rs_chem_9_2.next()) {
												String Chem_9_2 = rs_chem_9_2.getString("total");
												chem_9_2 = Float.valueOf(Chem_9_2);

												out.print(chem_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(chem_9_1 + chem_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_chem_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float chem_10_1 = 0;
											if (rs_chem_10_1.next()) {
												String Chem_10_1 = rs_chem_10_1.getString("total");
												chem_10_1 = Float.valueOf(Chem_10_1);

												out.print(chem_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_chem_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float chem_10_2 = 0;
											if (rs_chem_10_2.next()) {
												String Chem_10_2 = rs_chem_10_2.getString("total");
												chem_10_2 = Float.valueOf(Chem_10_2);

												out.print(chem_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(chem_10_1 + chem_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_chem_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float chem_11_1 = 0;
											if (rs_chem_11_1.next()) {
												String Chem_11_1 = rs_chem_11_1.getString("total");
												chem_11_1 = Float.valueOf(Chem_11_1);

												out.print(chem_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_chem_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float chem_11_2 = 0;
											if (rs_chem_11_2.next()) {
												String Chem_11_2 = rs_chem_11_2.getString("total");
												chem_11_2 = Float.valueOf(Chem_11_2);

												out.print(chem_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(chem_11_1 + chem_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_chem_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float chem_12_1 = 0;
											if (rs_chem_12_1.next()) {
												String Chem_12_1 = rs_chem_12_1.getString("total");
												chem_12_1 = Float.valueOf(Chem_12_1);

												out.print(chem_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_chem_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='chemistry12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float chem_12_2 = 0;
											if (rs_chem_12_2.next()) {
												String Chem_12_2 = rs_chem_12_2.getString("total");
												chem_12_2 = Float.valueOf(Chem_12_2);

												out.print(chem_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(chem_12_2 + chem_12_1) / 2%></td>
						</tr>

						<tr>
							<td>Physics</td>

							<td>
								<%
									ResultSet rs_phy_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float phy_9_1 = 0;
											if (rs_phy_9_1.next()) {
												String Phy_9_1 = rs_phy_9_1.getString("total");
												phy_9_1 = Float.valueOf(Phy_9_1);

												out.print(phy_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_phy_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float phy_9_2 = 0;
											if (rs_phy_9_2.next()) {
												String Phy_9_2 = rs_phy_9_2.getString("total");
												phy_9_2 = Float.valueOf(Phy_9_2);

												out.print(phy_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(phy_9_1 + phy_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_phy_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float phy_10_1 = 0;
											if (rs_phy_10_1.next()) {
												String Phy_10_1 = rs_phy_10_1.getString("total");
												phy_10_1 = Float.valueOf(Phy_10_1);

												out.print(phy_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_phy_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float phy_10_2 = 0;
											if (rs_phy_10_2.next()) {
												String Phy_10_2 = rs_phy_10_2.getString("total");
												phy_10_2 = Float.valueOf(Phy_10_2);

												out.print(phy_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(phy_10_1 + phy_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_phy_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float phy_11_1 = 0;
											if (rs_phy_11_1.next()) {
												String Phy_11_1 = rs_phy_11_1.getString("total");
												phy_11_1 = Float.valueOf(Phy_11_1);

												out.print(phy_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_phy_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float phy_11_2 = 0;
											if (rs_phy_11_2.next()) {
												String Phy_11_2 = rs_phy_11_2.getString("total");
												phy_11_2 = Float.valueOf(Phy_11_2);

												out.print(phy_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(phy_11_1 + phy_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_phy_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float phy_12_1 = 0;
											if (rs_phy_12_1.next()) {
												String Phy_12_1 = rs_phy_12_1.getString("total");
												phy_12_1 = Float.valueOf(Phy_12_1);

												out.print(phy_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>


							</td>
							<td>
								<%
									ResultSet rs_phy_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='physics12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float phy_12_2 = 0;
											if (rs_phy_12_2.next()) {
												String Phy_12_2 = rs_phy_12_2.getString("total");
												phy_12_2 = Float.valueOf(Phy_12_2);

												out.print(phy_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(phy_12_1 + phy_12_2) / 2%></td>
						</tr>
						<tr>
							<td>Civics</td>


							<td>
								<%
									ResultSet rs_civ_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float civ_9_1 = 0;
											if (rs_civ_9_1.next()) {
												String Civ_9_1 = rs_civ_9_1.getString("total");
												civ_9_1 = Float.valueOf(Civ_9_1);

												out.print(civ_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_civ_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float civ_9_2 = 0;
											if (rs_civ_9_2.next()) {
												String Civ_9_2 = rs_civ_9_2.getString("total");
												civ_9_2 = Float.valueOf(Civ_9_2);

												out.print(civ_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(civ_9_1 + civ_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_civ_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float civ_10_1 = 0;
											if (rs_civ_10_1.next()) {
												String Civ_10_1 = rs_civ_10_1.getString("total");
												civ_10_1 = Float.valueOf(Civ_10_1);

												out.print(civ_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_civ_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float civ_10_2 = 0;
											if (rs_civ_10_2.next()) {
												String Civ_10_2 = rs_civ_10_2.getString("total");
												civ_10_2 = Float.valueOf(Civ_10_2);

												out.print(civ_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(civ_10_2 + civ_10_1) / 2%></td>

							<td>
								<%
									ResultSet rs_civ_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float civ_11_1 = 0;
											if (rs_civ_11_1.next()) {
												String Civ_11_1 = rs_civ_11_1.getString("total");
												civ_11_1 = Float.valueOf(Civ_11_1);

												out.print(civ_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_civ_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float civ_11_2 = 0;
											if (rs_civ_11_2.next()) {
												String Civ_11_2 = rs_civ_11_2.getString("total");
												civ_11_2 = Float.valueOf(Civ_11_2);

												out.print(civ_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(civ_11_1 + civ_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_civ_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float civ_12_1 = 0;
											if (rs_civ_12_1.next()) {
												String Civ_12_1 = rs_civ_12_1.getString("total");
												civ_12_1 = Float.valueOf(Civ_12_1);

												out.print(civ_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_civ_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='civics12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float civ_12_2 = 0;
											if (rs_civ_12_2.next()) {
												String Civ_12_2 = rs_civ_12_2.getString("total");
												civ_12_2 = Float.valueOf(Civ_12_2);

												out.print(civ_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(civ_12_1 + civ_12_2) / 2%></td>
						</tr>
						<tr>
							<td>ICT</td>

							<td>
								<%
									ResultSet rs_it_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float it_9_1 = 0;
											if (rs_it_9_1.next()) {
												String It_9_1 = rs_it_9_1.getString("total");
												it_9_1 = Float.valueOf(It_9_1);

												out.print(it_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_it_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float it_9_2 = 0;
											if (rs_it_9_2.next()) {
												String It_9_2 = rs_it_9_2.getString("total");
												it_9_2 = Float.valueOf(It_9_2);

												out.print(it_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(it_9_1 + it_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_it_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float it_10_1 = 0;
											if (rs_it_10_1.next()) {
												String It_10_1 = rs_it_10_1.getString("total");
												it_10_1 = Float.valueOf(It_10_1);

												out.print(it_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_it_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float it_10_2 = 0;
											if (rs_it_10_2.next()) {
												String It_10_2 = rs_it_10_2.getString("total");
												it_10_2 = Float.valueOf(It_10_2);

												out.print(it_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(it_10_2 + it_10_1) / 2%></td>

							<td>
								<%
									ResultSet rs_it_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float it_11_1 = 0;
											if (rs_it_11_1.next()) {
												String It_11_1 = rs_it_11_1.getString("total");
												it_11_1 = Float.valueOf(It_11_1);

												out.print(it_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_it_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float it_11_2 = 0;
											if (rs_it_11_2.next()) {
												String It_11_2 = rs_it_11_2.getString("total");
												it_11_2 = Float.valueOf(It_11_2);

												out.print(it_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(it_11_1 + it_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_it_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float it_12_1 = 0;
											if (rs_it_12_1.next()) {
												String It_12_1 = rs_it_12_1.getString("total");
												it_12_1 = Float.valueOf(It_12_1);

												out.print(it_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_it_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='it12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float it_12_2 = 0;
											if (rs_it_12_2.next()) {
												String It_12_2 = rs_it_12_2.getString("total");
												it_12_2 = Float.valueOf(It_12_2);

												out.print(it_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(it_12_1 + it_12_2) / 2%></td>
						</tr>


						<tr>
							<td>HPE</td>

							<td>
								<%
									ResultSet rs_hpe_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float hpe_9_1 = 0;
											if (rs_hpe_9_1.next()) {
												String Hpe_9_1 = rs_hpe_9_1.getString("total");
												hpe_9_1 = Float.valueOf(Hpe_9_1);

												out.print(hpe_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_hpe_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float hpe_9_2 = 0;
											if (rs_hpe_9_2.next()) {
												String Hpe_9_2 = rs_hpe_9_2.getString("total");
												hpe_9_2 = Float.valueOf(Hpe_9_2);

												out.print(hpe_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(hpe_9_1 + hpe_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_hpe_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float hpe_10_1 = 0;
											if (rs_hpe_10_1.next()) {
												String Hpe_10_1 = rs_hpe_10_1.getString("total");
												hpe_10_1 = Float.valueOf(Hpe_10_1);

												out.print(hpe_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_hpe_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float hpe_10_2 = 0;
											if (rs_hpe_10_2.next()) {
												String Hpe_10_2 = rs_hpe_10_2.getString("total");
												hpe_10_2 = Float.valueOf(Hpe_10_2);

												out.print(hpe_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(hpe_10_1 + hpe_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_hpe_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float hpe_11_1 = 0;
											if (rs_hpe_11_1.next()) {
												String Hpe_11_1 = rs_hpe_11_1.getString("total");
												hpe_11_1 = Float.valueOf(Hpe_11_1);

												out.print(hpe_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_hpe_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float hpe_11_2 = 0;
											if (rs_hpe_11_2.next()) {
												String Hpe_11_2 = rs_hpe_11_2.getString("total");
												hpe_11_2 = Float.valueOf(Hpe_11_2);

												out.print(hpe_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(hpe_11_1 + hpe_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_hpe_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float hpe_12_1 = 0;
											if (rs_hpe_12_1.next()) {
												String Hpe_12_1 = rs_hpe_12_1.getString("total");
												hpe_12_1 = Float.valueOf(Hpe_12_1);

												out.print(hpe_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_hpe_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='hpe12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float hpe_12_2 = 0;
											if (rs_hpe_12_2.next()) {
												String Hpe_12_2 = rs_hpe_12_2.getString("total");
												hpe_12_2 = Float.valueOf(Hpe_12_2);

												out.print(hpe_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(hpe_12_1 + hpe_12_2) / 2%></td>
						</tr>


						<tr>
							<td>BT.Drawing</td>

							<td>
								<%
									ResultSet rs_dra_9_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing9' and semister='I' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float dra_9_1 = 0;
											if (rs_dra_9_1.next()) {
												String Dra_9_1 = rs_dra_9_1.getString("total");
												dra_9_1 = Float.valueOf(Dra_9_1);

												out.print(dra_9_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_dra_9_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing9' and semister='II' and Grade='9' and Stud_id='"
															+ StudentID + "'");
											float dra_9_2 = 0;
											if (rs_dra_9_2.next()) {
												String Dra_9_2 = rs_dra_9_2.getString("total");
												dra_9_2 = Float.valueOf(Dra_9_2);

												out.print(dra_9_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(dra_9_1 + dra_9_2) / 2%></td>

							<td>
								<%
									ResultSet rs_dra_10_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing10' and semister='I' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float dra_10_1 = 0;
											if (rs_dra_10_1.next()) {
												String Dra_10_1 = rs_dra_10_1.getString("total");
												dra_10_1 = Float.valueOf(Dra_10_1);

												out.print(dra_10_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_dra_10_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing10' and semister='II' and Grade='10' and Stud_id='"
															+ StudentID + "'");
											float dra_10_2 = 0;
											if (rs_dra_10_2.next()) {
												String Dra_10_2 = rs_dra_10_2.getString("total");
												dra_10_2 = Float.valueOf(Dra_10_2);

												out.print(dra_10_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(dra_10_1 + dra_10_2) / 2%></td>

							<td>
								<%
									ResultSet rs_dra_11_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing11' and semister='I' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float dra_11_1 = 0;
											if (rs_dra_11_1.next()) {
												String Dra_11_1 = rs_dra_11_1.getString("total");
												dra_11_1 = Float.valueOf(Dra_11_1);

												out.print(dra_11_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td>
								<%
									ResultSet rs_dra_11_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing11' and semister='II' and Grade='11' and Stud_id='"
															+ StudentID + "'");
											float dra_11_2 = 0;
											if (rs_dra_11_2.next()) {
												String Dra_11_2 = rs_dra_11_2.getString("total");
												dra_11_2 = Float.valueOf(Dra_11_2);

												out.print(dra_11_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>

							</td>
							<td><%=(dra_11_1 + dra_11_2) / 2%></td>

							<td>
								<%
									ResultSet rs_dra_12_1 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing12' and semister='I' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float dra_12_1 = 0;
											if (rs_dra_12_1.next()) {
												String Dra_12_1 = rs_dra_12_1.getString("total");
												dra_12_1 = Float.valueOf(Dra_12_1);

												out.print(dra_12_1);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td>
								<%
									ResultSet rs_dra_12_2 = statement.executeQuery(
													"select total  from TBL_mark where Subject_id='drawing12' and semister='II' and Grade='12' and Stud_id='"
															+ StudentID + "'");
											float dra_12_2 = 0;
											if (rs_dra_12_2.next()) {
												String Dra_12_2 = rs_dra_12_2.getString("total");
												dra_12_2 = Float.valueOf(Dra_12_2);

												out.print(dra_12_2);
											}

											else {
								%><p style="color: red">0.0</p>
								<%
									}
								%>
							</td>
							<td><%=(dra_12_1 + dra_12_2) / 2%></td>
						</tr>
						<tr>
							<td><h5 class="text-right">Total</h5></td>
							<td>
								<%
									float tot_9_1 = 0;
											ResultSet rs_tot_9_1 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='9' and semister='I' and stud_id='" + StudentID
															+ "'");
											if (rs_tot_9_1.next()) {
												tot_9_1 = (rs_tot_9_1.getFloat(1));
												out.println(tot_9_1);
											}
								%>

							</td>
							<td>
								<%
									float tot_9_2 = 0;
											ResultSet rs_tot_9_2 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='9' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_9_2.next()) {
												tot_9_2 = (rs_tot_9_2.getFloat(1));
												out.println(tot_9_2);
											}
								%>
							</td>
							<td>
								<%
									out.print((tot_9_2 + tot_9_1) / 2);
								%>
							</td>
							<td>
								<%
									float tot_10_1 = 0;
											ResultSet rs_tot_10_1 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='10' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_10_1.next()) {
												tot_10_1 = (rs_tot_10_1.getFloat(1));
												out.println(tot_10_1);
											}
								%>

							</td>

							<td>
								<%
									float tot_10_2 = 0;
											ResultSet rs_tot_10_2 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='10' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_10_2.next()) {
												tot_10_2 = (rs_tot_10_2.getFloat(1));
												out.println(tot_10_2);
											}
								%>

							</td>
							<td>
								<%
									out.println((tot_10_2 + tot_10_1) / 2);
								%>
							</td>
							<td>
								<%
									float tot_11_1 = 0;
											ResultSet rs_tot_11_1 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='11' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_11_1.next()) {
												tot_11_1 = (rs_tot_11_1.getFloat(1));
												out.println(tot_11_1);
											}
								%>
							</td>
							<td>
								<%
									float tot_11_2 = 0;
											ResultSet rs_tot_11_2 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='11' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_11_2.next()) {
												tot_11_2 = (rs_tot_11_2.getFloat(1));
												out.println(tot_11_2);
											}
								%>
							</td>
							<td>
								<%
									out.print((tot_11_2 + tot_11_1) / 2);
								%>
							</td>
							<td>
								<%
									float tot_12_1 = 0;
											ResultSet rs_tot_12_1 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='12' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_12_1.next()) {
												tot_12_1 = (rs_tot_12_1.getFloat(1));
												out.println(tot_12_1);
											}
								%>

							</td>
							<td>
								<%
									float tot_12_2 = 0;
											ResultSet rs_tot_12_2 = statement.executeQuery(
													"select SUM(total) from TBL_mark where Grade='12' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_tot_12_2.next()) {
												tot_12_2 = (rs_tot_12_2.getFloat(1));
												out.println(tot_12_2);
											}
								%>
							</td>
							<td><%=(tot_12_2 + tot_12_1) / 2%></td>
						</tr>
						<tr>
							<td><h5 class="text-right">Average</h5></td>
							<td>
								<%
									float Average_9_1 = 0;
											ResultSet rs_av_9_1 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='9' and semister='I' and stud_id='" + StudentID
															+ "'");
											if (rs_av_9_1.next()) {
												Average_9_1 = (rs_av_9_1.getFloat(1));
												out.println(Average_9_1);
											}
								%>

							</td>
							<td>
								<%
									float Average_9_2 = 0;
											ResultSet rs_av_9_2 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='9' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_av_9_2.next()) {
												Average_9_2 = (rs_av_9_2.getFloat(1));
												out.println(Average_9_2);
											}
								%>

							</td>
							<td>
								<%
									Float tot_averag = (Average_9_2 + Average_9_1) / 2;

											out.println(tot_averag);
								%>


							</td>
							<td>
								<%
									float Average_10_1 = 0;
											ResultSet rs_av_10_1 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='10' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_av_10_1.next()) {
												Average_10_1 = (rs_av_10_1.getFloat(1));
												out.println(Average_10_1);
											}
								%>
							</td>
							<td>
								<%
									float Average_10_2 = 0;
											ResultSet rs_av_10_2 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='10' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_av_10_2.next()) {
												Average_10_2 = (rs_av_10_2.getFloat(1));
												out.println(Average_10_2);
											}
								%>

							</td>
							<td>
								<%
									out.print((Average_10_2 + Average_10_1) / 2);
								%>
							</td>
							<td>
								<%
									float Average_11_1 = 0;
											ResultSet rs_av_11_1 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='11' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_av_11_1.next()) {
												Average_11_1 = (rs_av_11_1.getFloat(1));
												out.println(Average_11_1);
											}
								%>
							</td>
							<td>
								<%
									float Average_11_2 = 0;
											ResultSet rs_av_11_2 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='11' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_av_11_2.next()) {
												Average_11_2 = (rs_av_11_2.getFloat(1));
												out.println(Average_11_2);
											}
								%>
							</td>
							<td>
								<%
									out.print((Average_11_2 + Average_11_1) / 2);
								%>
							</td>
							<td>
								<%
									float Average_12_1 = 0;
											ResultSet rs_av_12_1 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='12' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rs_av_12_1.next()) {
												Average_12_1 = (rs_av_12_1.getFloat(1));
												out.println(Average_12_1);
											}
								%>

							</td>
							<td>
								<%
									float Average_12_2 = 0;
											ResultSet rs_av_12_2 = statement.executeQuery(
													"select AVG(total) from TBL_mark where Grade='12' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rs_av_12_2.next()) {
												Average_12_2 = (rs_av_12_2.getFloat(1));
												out.println(Average_12_2);
											}
								%>
							</td>
							<td>
								<%
									out.println((Average_12_2 + Average_12_1) / 2);
								%>

							</td>
						</tr>

						<tr>
							<td><h5 class="text-right">Rank</h5></td>
							<td>
								<%
									String rank;
											ResultSet rank_9_1 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='9' and semister='I' and stud_id='" + StudentID
															+ "'");
											if (rank_9_1.next()) {
												rank = rank_9_1.getString(1);
												out.println(rank);
											}
								%>
							</td>
							<td>
								<%
									ResultSet rank_9_2 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='9' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rank_9_2.next()) {
												rank = rank_9_2.getString(1);
												out.println(rank);
											}
								%>
							</td>
							<td>
								<%
									String id = null;
											int ava_rank = 0;

											float average_mark = 0;
											ArrayList<String> ID_list = new ArrayList();
											ArrayList<Float> average = new ArrayList();

											ResultSet Stud_rset = statement.executeQuery(
													"select  Stud_id,sum(Average)/2 as semister_av from TBL_total_mark where Grade=9 and branch='"
															+ branch + "'and Section_id='" + sec_9
															+ "'group by stud_id order by semister_av desc ");
											while (Stud_rset.next()) {
												id = Stud_rset.getString(1);

												average_mark = Stud_rset.getFloat(2);

												ID_list.add(id);
												average.add(average_mark);
											}
											ava_rank = 1 + ID_list.indexOf(StudentID);

											out.print(ava_rank);
								%>


							</td>
							<td>
								<%
									ResultSet rank_10_1 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='10' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rank_10_1.next()) {
												rank = rank_10_1.getString(1);
												out.println(rank);
											}
								%>

							</td>
							<td>
								<%
									ResultSet rank_10_2 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='10' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rank_10_2.next()) {
												rank = rank_10_2.getString(1);
												out.println(rank);
											}
								%>

							</td>

							<td>
								<%
									//////////////////////////////////////////////////////////////
											//     Grade 10 average
											///////////////////////////////////////////////////////////////
								%> <%
 	String id_10 = null;
 			int rank_10;
 			float av_mark = 0;
 			ArrayList<String> Idlist = new ArrayList();
 			ArrayList<Float> Average = new ArrayList();
 			ResultSet rs_rank_10 = statement.executeQuery(
 					"select Stud_id,sum(Average)/2 as semister_av from TBL_Total_mark where Grade=10 and branch='"
 							+ branch + "'and Section_id='" + sec_10
 							+ "'group by Stud_id order by semister_av desc");
 			while (rs_rank_10.next()) {
 				id_10 = rs_rank_10.getString(1);
 				av_mark = rs_rank_10.getFloat(2);

 				Idlist.add(id_10);
 				Average.add(av_mark);
 			}
 			rank_10 = 1 + Idlist.indexOf(StudentID);
 			rank_10 = rank_10 + 1;
 			out.println(rank_10);
 %>
							</td>
							<td>
								<%
									ResultSet rank_11_1 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='11' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rank_11_1.next()) {
												rank = rank_11_1.getString(1);
												out.println(rank);
											}
								%>

							</td>
							<td>
								<%
									ResultSet rank_11_2 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='11' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rank_11_2.next()) {
												rank = rank_11_2.getString(1);
												out.println(rank);
											}
								%>
							</td>
							<td>
								<%
									String id_11;
											int rank_11;
											float av_mark_11 = 0;
											ArrayList<String> Idlist_11 = new ArrayList();
											ArrayList<Float> avarege_11 = new ArrayList();
											ResultSet rs_mark_11 = statement.executeQuery(
													"select  Stud_id ,sum(Average) as semister_av from TBL_total_mark where Grade=11 and branch='"
															+ branch + "'and Section_id='" + sec_11
															+ "'group by stud_id order by semister_av desc");
											while (rs_mark_11.next()) {
												id_11 = rs_mark_11.getString(1);
												av_mark_11 = rs_mark_11.getFloat(2);

												Idlist_11.add(id_11);
												avarege_11.add(av_mark_11);

											}
											rank_11 = 1 + Idlist_11.indexOf(StudentID);

											out.println(rank_11);
								%>
							</td>

							<td>
								<%
									ResultSet rank_12_1 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='12' and semister='I' and stud_id='"
															+ StudentID + "'");
											if (rank_12_1.next()) {
												rank = rank_12_1.getString(1);
												out.println(rank);
											}
								%>


							</td>
							<td>
								<%
									ResultSet rank_12_2 = statement.executeQuery(
													"select Rank from TBL_total_mark where Grade='12' and semister='II' and stud_id='"
															+ StudentID + "'");
											if (rank_12_2.next()) {
												rank = rank_12_2.getString(1);
												out.println(rank);
											}
								%>
							</td>
							<td>
								<%
									String id_12;
											int av_rank_12 = 0;
											float average_mark_12 = 0;
											ArrayList<String> Idlist_12 = new ArrayList();
											ArrayList<Float> av_mark_12 = new ArrayList();
											ResultSet rs_mark_12 = statement.executeQuery(
													"select  Stud_id,sum(Average) as semister_av  from TBL_total_mark where Grade=12 and branch='"
															+ branch + "'and Section_id='" + sec_12 + "'group by stud_id order by semister_av");
											while (rs_mark_12.next()) {
												id_12 = rs_mark_12.getString(1);
												average_mark_12 = rs_mark_12.getFloat(2);
												Idlist.add(id_12);
												av_mark_12.add(average_mark_12);
											}

											av_rank_12 = 1 + Idlist.indexOf(StudentID);

											out.print(av_rank_12);
								%>
							</td>
						</tr>
						<tr>
							<td><h5 class="text-right">conduct</h5></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="col-lg-12">

					<ol>
						<li><p>This Transcript is prepared by
								____________________________ checked by________________________
								Date_____/_________/__________</p></li>
						<li>
							<p>
								<%
									String Shehe = null;
											if (sex.equalsIgnoreCase("male")) {
												Shehe = "he";
											} else if (sex.equalsIgnoreCase("female")) {
												Shehe = "she";
											} else {
												Shehe = "he/she";
											}
								%>
								The acadamic record shows
								<%=Shehe%>
								has________________________________________.
							</p>
						</li>
						<li>
							<p>This transcript is valid only when it has no
								alterations,Erasures and bears the school seal on the student
								photo</p> ____________________________________________
							director's name and Signature
						</li>





					</ol>


				</div>
			</div>
		</div>
	</div>

	<%
		} else {
	%>
	<h4 class=" container ">Please enter valid Student ID</h4>
	<%
		}
	%>
	<script type="text/javascript"
		src="../resources/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
</body>
<%
	}
%>
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
</html>