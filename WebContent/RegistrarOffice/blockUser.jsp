<%if(session.getAttribute("registrar")==null){
	response.sendRedirect("../index.jsp");
} 
else
{
	Dbconnection dbc=new Dbconnection();
	Connection connection=dbc.getConnection();
	Statement statement=connection.createStatement();
	
	if(session.getAttribute("registrar")!=null)
	         {
				String user=session.getAttribute("registrar").toString();
				out.println("current user is "+user);
				String updateStatusSql="select currentstate from TBL_Users where userName='"+user+"'";
				ResultSet stupdate= statement.executeQuery(updateStatusSql);
				if(stupdate.next())
				{
					String state=stupdate.getString(1);
					out.println("and state is "+state);
					if(state.equalsIgnoreCase("Blocked")){
						session.invalidate();
						//response.sendRedirect("../index.jsp");
						
					}
					
				}
	
	        }

%>


<%@page import="java.sql.*"%>

<%@page import="databaseConnection.Dbconnection"%>


<div class="container-fluid">
<div class="panel ">
<div class="panel-heading"><strong>Block User account</strong></div>
<div class="panel-body">
<strong>${blocked} ${notblocked } ${idnotfound}</strong>
<form class="form-inline" method="post" action="${pageContext.request.contextPath}/ManageAccounts">
  <div class="form-group">
    
    <div class="input-group">
      <div class="input-group-addon">Teacher ID</div>
      <select class="form-control" name="teacherid" required="required">
      <%
      request.getSession().setAttribute("blocked", null);
      request.getSession().setAttribute("notblocked", null);
      request.getSession().setAttribute("idnotfound", null);

ResultSet Res=statement.executeQuery("select TeacherId from TBL_Users where currentstate='active'");
 while(Res.next())
 {
 %>
 <option><%=Res.getString(1) %></option>
 <%}
 } %>     
      </select>
      
    </div>
  </div>
  <button type="submit" class="btn btn-danger"><strong>Block User</strong></button>
</form>





</div>
</div>
 </div>