
<%@ page import="databaseConnection.Dbconnection"%>
<%@ page import="java.sql.*"%>

<%
//      if(session.getAttribute("user")==null)
//      {
//     	 response.sendRedirect("../index.jsp");
//      }
//      else
//     	 {
    		
     
 Dbconnection courseCounterDbcon=new Dbconnection();
 Connection con=courseCounterDbcon.getConnection();
 Statement Userstatement=con.createStatement();
 String UserId=session.getAttribute("user").toString();
 
 int numberOfSubjects=0;
 
// ResultSet res=statement.executeQuery("");
 //if(res.next())
 //{
	// String ActiveUserID=res.getString(1);
 ResultSet results=Userstatement.executeQuery("select count(Subject_id) from TBL_Subject_Teacher where TeacherId=(select TeacherId from TBL_Users where userName='"+UserId+"')");
 while(results.next())
 {
	 
	 numberOfSubjects=results.getInt(1);
	 //out.println(numberOfSubjects);
 }
 

 %>

<div class="panel panel-default" style="margin-left: -12px;">
	<div class="panel-heading">
		<h3>Menu</h3>
	</div>

	<div class="panel-content ">
		<ul class="list-group ">
			<li class="list-group-item"><span
				class="glyphicon glyphicon-book"></span><span class="badge"><%= numberOfSubjects%></span>
				<a href="mysubjects.jsp" id="subjects"><strong>My
						Subjects</strong> </a></li>

			<li class="list-group-item"><span
				class="glyphicon glyphicon-home"></span> <a href="grade_report.jsp"
				id="room"><strong>Grade Reporting</strong> </a></li>
			<li class="list-group-item"><span
				class=" glyphicon glyphicon-print"></span> <a href="myroom.jsp"
				id="report"><strong>My home Room</strong> </a></li>

			<li class="list-group-item"><span
				class="glyphicon  glyphicon-edit"></span> <a href="Testpanel.jsp"
				id="broadcast"><strong>Test Panel</strong></a></li>

			<li class="list-group-item"><span
				class="glyphicon glyphicon glyphicon glyphicon-user"></span> <a
				href="mystudents.jsp" id="broadcast"><strong>my
						students</strong> </a></li>
			<li class="list-group-item"><span
				class="glyphicon glyphicon glyphicon-off"></span> <a
				href="../logout.jsp" id="broadcast"><strong>Logout</strong></a></li>



		</ul>
	</div>
</div>




<%-- <%}%> --%>