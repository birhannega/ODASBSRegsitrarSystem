<%if(session.getAttribute("registrar")==null) {
	
	response.sendRedirect("../index.jsp");
}
else{%>


    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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



<%String userid=session.getAttribute("registrar").toString()
,branch=null;
Statement sttotal=dbcon.getConnection().createStatement();
ResultSet rsttotal=sttotal.executeQuery("select *from tbl_users where username='"+userid+"'");
while(rsttotal.next()){
	branch=rsttotal.getString("branch");
	//out.println(branch);
}
String ademicyear=null;int total_m=0,total_f=0,total_stud=0;
ResultSet rsgrade=sttotal.executeQuery("select AcademicYear from tbl_setup where calandar_status='1' ");
while(rsgrade.next()){
	ademicyear=rsgrade.getString("AcademicYear");
	}
int male_9=0;
ResultSet totalstud=sttotal.executeQuery("select count(stud_id)from tbl_student where gender='male'and branch='"+branch+"'and Grade='9' and Status='Active'");
while(totalstud.next()){
	male_9=totalstud.getInt(1);
}

int female_9=0;int total_9=0;
ResultSet rsfemaletotal=sttotal.executeQuery("select count(stud_id) from tbl_student where branch='"+branch+"'and gender='female'and grade='9'and Status='Active' ");
while(rsfemaletotal.next()){
	female_9=rsfemaletotal.getInt(1);
	//grade=rsfemaletotal.getInt(2);
	total_9=male_9+female_9;
	//out.println(female);
}%>
<div>
<span>Table of students of ODASBS <%=branch%>      branch in <%=ademicyear %>  </span>
<hr>
	  <table id="table"class="table table-responsive table-bordered"><thead>
<tr>
<th>Grade</th>
<th>Male</th>
<th>Female</th>
<th>Total</th>

</tr>
<tr>
<td>9</td>
<td><%=male_9%></td>
<td><%=female_9 %></td>
<td><%=total_9 %></td>

</tr>
<tr>
<%
int total_10=0;
int grade_10=0;
Statement st_grade_10=dbcon.getConnection().createStatement();
ResultSet rs_grade_10=st_grade_10.executeQuery("select *from tbl_student where  Grade='10' and Status='Active'");
while(rs_grade_10.next()){
	grade_10=rs_grade_10.getInt("Grade");
	//out.println(grade-10);
}
int male_10=0;
ResultSet rs_male_stud=st_grade_10.executeQuery("select count(stud_id) from tbl_student where branch='"+branch+"'and Grade='10' and Gender='male' and Status='Active'" );
while(rs_male_stud.next()){
	male_10=rs_male_stud.getInt(1);
}int femal_10=0;
ResultSet rs_female_10=st_grade_10.executeQuery("select count(stud_id) from tbl_student where branch='"+branch+"'and Grade='10'and Gender ='female' and Status='Active'");
while(rs_female_10.next()){
	femal_10=rs_female_10.getInt(1);
}
total_10=male_10+femal_10;
%>
<td>10</td>
<td><%=male_10%></td>
<td><%=femal_10%></td>
<td><%=total_10%></td>
</tr>
<tr>
<%
int male_11=0;
Statement st_11=dbcon.getConnection().createStatement();
ResultSet rs_11=st_11.executeQuery("select count(stud_id) from tbl_student where branch='"+branch+"'and Grade='11'and gender='male' and Status='Active'" );
while(rs_11.next()){
	male_11=rs_11.getInt(1);
}
int female_11=0,total_11=0;
ResultSet rs_female_11=st_11.executeQuery("select count(stud_id)from tbl_student where grade='11'and branch='"+branch+"'and gender='female' and Status='Active'");
while(rs_female_11.next()){
	female_11=rs_female_11.getInt(1);
	total_11=male_11+female_11;
}%>
<td>11</td>
<td><%=male_11 %></td>
<td><%=female_11 %></td>
<td><%=total_11 %></td>
</tr>
<tr>
<td>12</td>
<%int male_12=0,female_12=0,total_12=0;
Statement st_12=dbcon.getConnection().createStatement();
ResultSet rs_12=st_12.executeQuery("select count(stud_id) from tbl_student where branch='"+branch+"'and gender='male'and grade='12'and Status='Active'");
while(rs_12.next()){
	male_12=rs_12.getInt(1);
}
ResultSet rs_12_female=st_12.executeQuery("select count(stud_id)from tbl_student where grade='12'and gender='female'and branch='"+branch+"' and Status='Active' ");
while(rs_12_female.next()){
	female_12=rs_12_female.getInt(1);
	total_12=male_12+female_12;
	total_m=male_9+male_10+male_11+male_12;
	total_f=female_9+femal_10+female_11+female_12;
	total_stud=total_9+total_10+total_11+total_12;
}
%>
<td><%=male_12 %></td>
<td><%=female_12 %></td>
<td><%=total_12 %></td>
</tr>
<tr>
<td>All</td>
<td><%=total_m %></td>
<td><%=total_f %></td>
<td><%=total_stud %></td>
</tr>
</table>
  		<div class="container-fluid">
<input type="submit" onclick="printpage();" value="print this report"  id="printpagebutton"class="pull-right btn btn-primary"/> 
</div>
	
<%} %>

</html>