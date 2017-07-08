<%if (session.getAttribute("user") == null)

{
	response.sendRedirect("../index.jsp");
}
else {
	String ActiveUser = session.getAttribute("user").toString();

 %>
 <%@ page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.Dbconnection"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<link rel="stylesheet" type="text/css" href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$('#mark').bdt();

	})
</script>

<style>
.error {
	color: red;
	
}
.id{
background: teal;
}
header,footer{
display: none;
}
</style>

<title>Roaster</title>
</head>
<body>
	<div class="container-fluid">

         <div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-left text-uppercase">ODA Special boarding
					school student Record Management System</h3>
			</div>
		</div>
		<%
					String grade = null, section = null,branch=null;
				Dbconnection dbcon = new Dbconnection();
				Connection connection = dbcon.getConnection();
				Statement statement = connection.createStatement();
				ResultSet result = statement.executeQuery(
						"select * from TBL_HomeRoom where TeacherId=(select TeacherId from TBL_Users where userName='"
								+ ActiveUser + "' )");

				if (result.next()) {
					grade = result.getString("Grade");
					section = result.getString("Section_id");
					branch = result.getString("branch");
		%>
		<div class="panel-body">

			<div class="panel-content" style="margin-bottom: 4px">

				<form class="form-inline pull-right" action="" method="post"
					style="margin-bottom: 10px">

					<div class="form-group">


						<label for="semister">Semister</label> <select
							class="form-control" name="semister" required="required" id="semister">
							<option value="">choose semister</option>
							<option value="I">First Semister</option>
							<option value="II">Second Semister</option>
							<option value="both">Both Semisters'</option>
						</select>

					</div>

					<button type="submit" class="btn btn-success">Generate
						Roaster</button>
				</form>
				<div >
					<a href="Tindex.jsp"><span class="fa fa-arrow-left"></span><strong>
							back to Menu</strong></a>
				</div>
				<%
				String semister=request.getParameter("semister");
				
				if(semister==null||semister.trim().equals(""))
						{
					%>
					<br>
					<hr>
					 <div class="container">
					 <strong class="error">No semester choosen</strong>
					 </div>
					<%
						}
				else
				{
				%>
				<table class="table  table-responsive table-condensed table-bordered" id="mark">
						<thead>
						<tr>
						<th colspan="21" class="text-center"><strong> <span class="text-uppercase "> ODA Special Boarding school <strong></strong> branch Grade <%=grade+""+section%></span></strong></th>
						</tr>
							<tr class="info">
								<th>Student ID</th>
								<th>Students' Name</th>
								<th>Gender</th>
								<th>Age</th>
								<th>semister</th>
								<th>Afan Oromo</th>
								<th>Amharic</th>
								<th>Biology</th>
								<th>Chemistry</th>
								<th>Chinese</th>
								<th>Civics</th>
								<th>Drawing</th>
								<th>English</th>
								<th>HPE</th>
								<th>ICT</th>
								<th>Maths</th>
								<th>Physics</th>
								<th>Total</th>
								<th>Average</th>
								<th>Rank</th>
								<th>p?f</th>
							</tr>

						</thead>
						<tbody>
						<%if(semister.equals("I"))
						{
							String full_name=null,Firstname=null,lastname=null,gender=null; Date bdate=null; int age=0;
							ResultSet rs_first=statement.executeQuery("select * from TBL_student where Grade='"+grade+"' and Section_id='"+section+"'");
							while(rs_first.next())
							{
								String Student_id=rs_first.getString("Stud_id");
								
								int birthdate=0,currentYear=0;
								Statement st_stud=connection.createStatement();
							 ResultSet rs_fir=st_stud.executeQuery("select FirstName,LastName,Gender,BirthDate from TBL_student where Stud_id='"+Student_id+"'" );
								if(rs_fir.next())
								{
									Firstname=rs_fir.getString(1);
									lastname=rs_fir.getString(2);
									gender=rs_fir.getString(3);
									bdate=rs_fir.getDate(4);
									full_name=Firstname+" "+lastname;
									
									SimpleDateFormat simple=new SimpleDateFormat("yyyy");
									String byear=simple.format(bdate);
									//out.println(year);
									Date current_date=new Date();
									String current_year=simple.format(current_date);
									//out.println("year"+current_year);
									 currentYear=Integer.valueOf(current_year);
									 birthdate=Integer.valueOf(byear);
									age=currentYear-birthdate;
									//out.println(currentYear);
									
									age=Integer.valueOf(current_year)-Integer.valueOf(current_year);
									//out.println(age);
								} 
						%>
						<tr>
						<td><%=rs_first.getString(1) %></td>
						<td><%=full_name %></td>
						<td><%=gender %></td>
						<td><%=currentYear-birthdate %></td>
						<td><%=semister %></td>
						<%
						Statement st_sub=connection.createStatement();
						float total=0,Average=0;
						ResultSet rs_sub=st_sub.executeQuery("select Subject_id from TBL_SUBJ where Grade='"+grade+"'");
						while(rs_sub.next())
						{
							String subid=rs_sub.getString(1);
							
							Statement st_mark=connection.createStatement();
							ResultSet rs_mark=st_mark.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"' and Subject_id='"+subid+"' and semister='"+semister+"'");
						int i=0;
						while(rs_mark.next())
						{
							
						String mark=rs_mark.getString(1);
						float sub_mark=Float.valueOf(mark);
						total=total+sub_mark;
							%>
							<td><%=rs_mark.getString(1) %></td>
							<%
							
						}
						
						}
						%>
					
						<td><%= total%></td>
						<td><%= total/12%></td>
						<td>
						<%
						Statement statement2=connection.createStatement();
						ResultSet rs_rank=statement2.executeQuery("select Rank from TBL_total_mark where Grade='"+grade+"' and semister='"+semister+"' and Stud_id='"+Student_id+"'");
							if(rs_rank.next())
							{
								out.println(rs_rank.getString(1));
							}
							else{
								out.print("---");
							}
						
						%></td>
						<td>
							<%
						Statement statement_pf=connection.createStatement();
						ResultSet rs_pf=statement_pf.executeQuery("select [Pass_fail] from TBL_total_mark where Grade='"+grade+"' and semister='"+semister+"' and Stud_id='"+Student_id+"'");
							if(rs_pf.next())
							{
								out.println(rs_pf.getString(1));
							}
							else{
								out.print("rank not updated");
							}
						
						%>
						
						
						</td>
						</tr>
						
						<%
					  }
							%>
			
							<%
						}
						
						else if (semister.equals("II")){
							

							String full_name=null,Firstname=null,lastname=null,gender=null; Date bdate=null; int age=0;
							ResultSet rs_first=statement.executeQuery("select * from TBL_student where Grade='"+grade+"' and Section_id='"+section+"'");
							while(rs_first.next())
							{
								String Student_id=rs_first.getString("Stud_id");
								
								int birthdate=0,currentYear=0;
								Statement st_stud=connection.createStatement();
							 ResultSet rs_fir=st_stud.executeQuery("select FirstName,LastName,Gender,BirthDate from TBL_student where Stud_id='"+Student_id+"'" );
								if(rs_fir.next())
								{
									Firstname=rs_fir.getString(1);
									lastname=rs_fir.getString(2);
									gender=rs_fir.getString(3);
									bdate=rs_fir.getDate(4);
									full_name=Firstname+" "+lastname;
									
									SimpleDateFormat simple=new SimpleDateFormat("yyyy");
									String byear=simple.format(bdate);
									//out.println(year);
									Date current_date=new Date();
									String current_year=simple.format(current_date);
									//out.println("year"+current_year);
									 currentYear=Integer.valueOf(current_year);
									 birthdate=Integer.valueOf(byear);
									age=currentYear-birthdate;
									//out.println(currentYear);
									
									age=Integer.valueOf(current_year)-Integer.valueOf(current_year);
									//out.println(age);
								} 
						%>
						<tr>
						<td><%=rs_first.getString(1) %></td>
						<td><%=full_name %></td>
						<td><%=gender %></td>
						<td><%=currentYear-birthdate %></td>
						<td><%=semister %></td>
						<%
						float total=0,Average=0;
						Statement st_sub=connection.createStatement();
						ResultSet rs_sub=st_sub.executeQuery("select Subject_id from TBL_SUBJ where Grade='"+grade+"'");
						while(rs_sub.next())
						{
							String subid=rs_sub.getString(1);
							Statement st_mark=connection.createStatement();
							ResultSet rs_mark=st_mark.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"' and Subject_id='"+subid+"' and semister='"+semister+"'");
						while(rs_mark.next())
						{
							String mark=rs_mark.getString(1);
							float sub_mark=Float.valueOf(mark);
							total=total+sub_mark;
							%>
							<td><%=rs_mark.getString(1) %></td>
							<%
						}
						}
						%>
						<td><%=total %></td>
						<td><%=total/12 %></td>
						<td>
						<%
						Statement statement_ra=connection.createStatement();
						ResultSet rs_ra=statement_ra.executeQuery("select Rank from TBL_total_mark where Grade='"+grade+"' and semister='"+semister+"' and Stud_id='"+Student_id+"'");
							if(rs_ra.next())
							{
								out.println(rs_ra.getString(1));
							}
							else{
								out.print("--");
							}
						
						%>
						</td>
						<td>
							<%
						Statement statement_pf=connection.createStatement();
						ResultSet rs_pf=statement_pf.executeQuery("select [Pass_fail] from TBL_total_mark where Grade='"+grade+"' and semister='"+semister+"' and Stud_id='"+Student_id+"'");
							if(rs_pf.next())
							{
								out.println(rs_pf.getString(1));
							}
							else{
								out.print("--");
							}
						
						%>
						</td>
						</tr>
						<%
							}
							
							
						}
						else if (semister.equals("both"))
						{

							String full_name=null,Firstname=null,lastname=null,gender=null; Date bdate=null; int age=0;
							ResultSet rs_first=statement.executeQuery("select * from TBL_student where Grade='"+grade+"' and Section_id='"+section+"'");
							while(rs_first.next())
							{
								String Student_id=rs_first.getString("Stud_id");
								
								int birthdate=0,currentYear=0;
								Statement st_stud=connection.createStatement();
							 ResultSet rs_fir=st_stud.executeQuery("select FirstName,LastName,Gender,BirthDate from TBL_student where Stud_id='"+Student_id+"'" );
								if(rs_fir.next())
								{
									Firstname=rs_fir.getString(1);
									lastname=rs_fir.getString(2);
									gender=rs_fir.getString(3);
									bdate=rs_fir.getDate(4);
									full_name=Firstname+" "+lastname;
									
									SimpleDateFormat simple=new SimpleDateFormat("yyyy");
									String byear=simple.format(bdate);
									//out.println(year);
									Date current_date=new Date();
									String current_year=simple.format(current_date);
									//out.println("year"+current_year);
									 currentYear=Integer.valueOf(current_year);
									 birthdate=Integer.valueOf(byear);
									age=currentYear-birthdate;
									//out.println(currentYear);
									
									age=Integer.valueOf(current_year)-Integer.valueOf(current_year);
									//out.println(age);
								} 
						%>
						<tr>
						<td rowspan="3"><%=rs_first.getString(1) %></td>
						<td rowspan="3"><%=full_name %></td>
						<td rowspan="3"><%=gender %></td>
						<td rowspan="3"><%=currentYear-birthdate %></td>
						<td>First</td>
						
						<%
						float average=0,total=0;
						String subjects=null;
						Statement statement_first=connection.createStatement();
						ResultSet list_first=statement_first.executeQuery("select Subject_id from TBL_SUBJ where Grade='"+grade+"' ");
						while(list_first.next())
						{
							subjects=list_first.getString(1);
							
							Statement st_mark_list=connection.createStatement();
							ResultSet markresult=st_mark_list.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"' and Subject_id='"+subjects+"' and semister='I'");
							while(markresult.next())
							{
								String mark=markresult.getString(1);
								float sub_mark=Float.valueOf(mark);
								total=total+sub_mark;
								
								%>
								<td><%=mark %></td>
								<% 
							}
						}
						%>
					
						<td><%=total %></td>
						<td><%=total/12 %></td>
						<td>
						<%
						Statement statement_ra=connection.createStatement();
						ResultSet rs_ra=statement_ra.executeQuery("select Rank from TBL_total_mark where Grade='"+grade+"' and semister='I' and Stud_id='"+Student_id+"'");
							if(rs_ra.next())
							{
								out.println(rs_ra.getString(1));
							}
							else{
								out.print("rank not updated");
							}
						
						%>
						
						</td>
						<td>
						<%
						Statement statement_pf=connection.createStatement();
						ResultSet rs_pf=statement_ra.executeQuery("select Pass_Fail from TBL_total_mark where Grade='"+grade+"' and semister='I' and Stud_id='"+Student_id+"'");
							if(rs_pf.next())
							{
								out.println(rs_pf.getString(1));
							}
							else{
								out.print("rank not updated");
							}
						
						%>
						
						</td>
						<tr>
						<td>second</td>
						<%
						String subject_id=null;float total_second=0;
						Statement statement_second=connection.createStatement();
						ResultSet list_second=statement_second.executeQuery("select Subject_id from TBL_SUBJ where Grade='"+grade+"' ");
						while(list_second.next())
						{
							subjects=list_second.getString(1);
							
							Statement st_mark_list=connection.createStatement();
							ResultSet markresult=st_mark_list.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"' and Subject_id='"+subjects+"' and semister='II'");
							while(markresult.next())
							{
								String mark=markresult.getString(1);
								
								float sub_mark=Float.valueOf(mark);
								total_second=total_second+sub_mark;
								%>
								<td><%=mark %></td>
								<% 
							}
						}
						%>
						<td><%=total_second %></td>
						<td><%=total_second/12 %></td>
						<td>
							<%
						Statement statement_2nd_ra=connection.createStatement();
						ResultSet rs__2nd_ra=statement_ra.executeQuery("select Rank from TBL_total_mark where Grade='"+grade+"' and semister='II' and Stud_id='"+Student_id+"'");
							if(rs__2nd_ra.next())
							{
								out.println(rs__2nd_ra.getString(1));
							}
							else{
								out.print("rank not updated");
							}
						
						%>
						
						</td>
						<td>
						<%
						Statement statement_2nd_pf=connection.createStatement();
						ResultSet rs__2nd_pf=statement_ra.executeQuery("select Pass_fail from TBL_total_mark where Grade='"+grade+"' and semister='II' and Stud_id='"+Student_id+"'");
							if(rs__2nd_pf.next())
							{
								out.println(rs__2nd_pf.getString(1));
							}
							else{
								out.print("rank not updated");
							}
						
						%>
						
						</td>
						</tr>
						
						<tr>
						<td>Avergae</td>
						<%
						 float averagetotal=0;
						Statement st_sub=connection.createStatement();
				        ResultSet subject=st_sub.executeQuery("select Subject_id from TBL_SUBJ Where Grade='"+grade+"'");
				        while(subject.next())
				        { 
				        String ave_sub=subject.getString(1);
				  
						Statement statement_1st=connection.createStatement();
				        String afanoro_1st=null; float af_1st=0; float firstTotal=0;
						ResultSet rs_1st=statement_1st.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"'and Subject_id='"+ave_sub+"' and semister='I'");
						while(rs_1st.next())
						{
							afanoro_1st=rs_1st.getString(1);
							af_1st=Float.valueOf(afanoro_1st);
							firstTotal=af_1st;
							firstTotal=firstTotal+af_1st;
							  
				        }
						
						Statement statement_ave=connection.createStatement();
				        String afanoro_2nd=null; float af_2n=0;float secondTotal=0; float semisters_average=0;
						ResultSet rs_2nd=statement_ave.executeQuery("select total from TBL_mark where Stud_id='"+Student_id+"'and Subject_id='"+ave_sub+"' and semister='II'");
						while(rs_2nd.next())
						{
							afanoro_2nd=rs_2nd.getString(1);
							af_2n=Float.valueOf(afanoro_2nd);
							secondTotal=af_2n;
							
							secondTotal=secondTotal+af_2n;
							
							semisters_average=((af_1st+ af_2n)/2);
							
							
							
							
				        }
						%>
						<td><%= semisters_average%></td>
						
						
					     
				<%
				
				        }
				        Statement Sta1st=connection.createStatement();
				        ResultSet rs1st=Sta1st.executeQuery("select total from TBL_mark where Grade='"+grade+"' and Stud_id='"+Student_id+"' and (semister='I' or semister='II')");
				        while(rs1st.next())
				        {
				        	String totl=rs1st.getString(1);
				        	Float frst=Float.valueOf(totl);
				        	averagetotal=averagetotal+frst;
				        
				        }
				        
				        %>
				        
				        <td>
				      
				      <%=averagetotal/2 %>
				       
				        </td>
				        <td><%=(averagetotal/2)/12 %></td>
				        
				        <td><%
						String id=null;
						int ava_rank=0;
						
						float average_mark=0;
						 ArrayList<String> ID_list = new ArrayList();
					       ArrayList<Float> averagerank = new ArrayList();
					      
						ResultSet Stud_rset=Sta1st.executeQuery("select  Stud_id,sum(Average)/2 as semister_av from TBL_total_mark where Grade='"+grade+"'and branch='"+branch+"' group by stud_id order by semister_av desc ");
						while(Stud_rset.next())
						{
							id=Stud_rset.getString(1);
						
							average_mark=Stud_rset.getFloat(2);
						
							ID_list.add(id);
							averagerank.add(average_mark);
						}
						ava_rank=1+ID_list.indexOf(Student_id);
						
							out.print(ava_rank);
						%> 
						 <%
						   float mark=0;
						   ResultSet rs_average_rank=Sta1st.executeQuery("select * from TBL_policy"); 
						   while(rs_average_rank.next()){
							   mark= rs_average_rank.getFloat( "min_ave");
							      }%><td>
							     <%if(mark>=(averagetotal/2)/12 )
								   { 
									   out.print("pass");
								   }
								   else{out.print("faill");}
							 %>
							
						</td>
				        <%							}
						}
				%>
						
							</tbody>
							</table>
							<div class="nopint col-lg-offset-10">
			<button id="printpagebutton" type="button" class="btn btn-primary " onclick="printpage()"><span class="glyphicon glyphicon-print"> <strong>print  roaster</strong> </span></button>
			</div>
							</div>
							<%} 
							}%>
							</div>
							</div>
						
							</body>
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
		
				%>
							</html>
						