

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseConnection.Dbconnection"%>
<div class="container-fluid">
<form class="form-inline pull-right" method="post" >
  <div class="form-group">
    <label class="sr-only" for="id">Student ID</label>
    <div class="input-group">
      <div class="input-group-addon  alert-info">Enter Student ID</div>
      <input type="text" class="form-control"  name="TID" required="required"/>
     
    </div>
  </div>
  <button type="submit" class="btn btn-primary"> Go <span class="fa fa-arrow-right fa-1x"></span></button>
</form>
</div>
${updated}
<%



request.getSession().setAttribute("updated", null);

String ID=request.getParameter("TID");
if(ID==null||ID.trim()=="")
{
	%>
	<div>

	
	
	</div>
	<%
}else
{
	
	
	
Dbconnection dbconnection=new Dbconnection();
Statement statement=dbconnection.getConnection().createStatement();
ResultSet resultSet=statement.executeQuery("select * from TBL_student where Stud_id='"+ID+"'");
%>
<div class="form-group">
<form class="form-group" method="post" action="${pageContext.request.contextPath}/Edit_stud_profile">
<%
int i=0;
String field="field";

while(resultSet.next())
{
%>

<div class="form-group col-md-4 col-lg-4">
 Student ID:<input readonly="readonly"  value="<%=resultSet.getString("stud_id") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 First Name:<input value="<%=resultSet.getString("FirstName") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 Middle Name:<input value="<%=resultSet.getString("middlename") %>" name="<%=field+i %>"  class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 Last Name:<input value="<%=resultSet.getString("lastname") %>" name="<%=field+i %>"  class="form-control"> 
</div>
<%i=i+1; %>


<div class="form-group col-md-4 col-lg-4">
 Birth Date:<input value="<%=resultSet.getString("BirthDate") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
Gender:<input value="<%=resultSet.getString("Gender") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 Contact Person:<input value="<%=resultSet.getString("ContactPerson") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 Year of registration:<input readonly="readonly" value="<%=resultSet.getString("AcademicYear") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 Zone:<input value="<%=resultSet.getString("zone") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 wereda:<input value="<%=resultSet.getString("wereda") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
 hobby:<input  value="<%=resultSet.getString("hobby") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
Specific address:<input value="<%=resultSet.getString("Address") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
Section :<input value="<%=resultSet.getString("Section_id") %>" name="<%=field+i %>" class="form-control"> 
</div>
<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
Phone number :<input value="<%=resultSet.getString("phone") %>" name="<%=field+i %>" class="form-control"> 
</div>

<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
ODA Score :<input value="<%=resultSet.getString("odascore") %>" name="<%=field+i %>" class="form-control"> 
</div>

<%i=i+1; %>
<div class="form-group col-md-4 col-lg-4">
current status :<input value="<%=resultSet.getString("status") %>" name="<%=field+i %>" class="form-control"> 
</div>
<div class="form-group ">
<input type="submit" class="btn btn-info pull-right " value="save changes"> 
</div>
<%
}
%>

</form>
</div>
<%

}

%>