
<%@page import="controller.imagetestServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Insert title here</title>
</head>
<body>

	<%

if(session.getAttribute("user")!=null)
{
	String id,user_id=session.getAttribute("user").toString();
	//out.println(user_id);
	
	Dbconnection db= new Dbconnection();

	Statement stmt=db.getConnection().createStatement();
	ResultSet rs_id=stmt.executeQuery("select  * from TBL_Users where userName='"+user_id+"'");
	while(rs_id.next())
	{
		 id=rs_id.getString("TeacherId");
		 
		 String fname=null,lname=null,major=null; Date hdate=null; String image=null; 
		 
		 Statement st_user=db.getConnection().createStatement();
		 ResultSet rs_pro=st_user.executeQuery("select FirstName,LastName,image,hiredate,Qualified from TBL_teacher where TeacherId='"+id+"'");
	if(rs_pro.next())
	{
		
		fname=rs_pro.getString(1);
		lname=rs_pro.getString(2);
		image=rs_pro.getString(3);
	   hdate=rs_pro.getDate("hiredate");
	   major=rs_pro.getString("Qualified");
	  // out.println(hdate);
	  //get year of hire
   
	}
	%>

	<div class="row">
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="text-center">
						User Profile<span class="glyphicon glyphicon-user pull-right"><img
							src="<%=image%>"></span>
					</h4>
				</div>
				<div class="panel-body text-center">
					<p class="lead">
						<strong><%=fname+" "+lname %></strong>
					</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item liitem"><strong>Position:</strong>
						<span class="pull-right">Teacher</span></li>
					<li class="list-group-item liitem"><strong>School:</strong> <span
						class="pull-right">ODASBS</span></li>
					<li class="list-group-item liitem"><strong>Graduted
							in:</strong> <span class="pull-right"><%=major%></span></li>

					<%
                        
                        SimpleDateFormat getyear=new SimpleDateFormat("y");
                        String birth_year=getyear.format(hdate);
                      //get month
                        SimpleDateFormat getmonth=new SimpleDateFormat("M");
                        String birth_month=getmonth.format(hdate);
                        //get date
                        SimpleDateFormat getdate=new SimpleDateFormat("d");
                        String birth_date=getdate.format(hdate);
                            //out.println(birth_date);
                            
                    
                     int hireyear=Integer.valueOf(birth_year);
                     int hiremonth=Integer.valueOf(birth_month);
                     int hiredate=Integer.valueOf(birth_date);
                     
                     //////// get current date/////////////////////////
                     ////////////////////////////////////
                        Date date=new Date();
                        SimpleDateFormat get_current_year=new SimpleDateFormat("YYYY");
                        ///get current year
                        String current_year=get_current_year.format(date);
                        int currentyear=Integer.valueOf(current_year);
                        ///get current month
                        SimpleDateFormat getcurrentmonth=new SimpleDateFormat("M");
                        String current_month=getcurrentmonth.format(date);
                        int currentmonth=Integer.valueOf(current_month);
                        
                        //get current day//
                        SimpleDateFormat getcurrentday=new SimpleDateFormat("d");
                        String current_day=getcurrentday.format(date);
                        
                        int currentday=Integer.valueOf(current_day);
                        ///total service
                        
                        int servicemonth=0,serviceyear=0,serviceday=0;
                        ////calculate service year///////
                        if(currentyear!=0||hireyear!=0)
                        {
                        serviceyear=currentyear-hireyear;
                        }
                        //// calculate Service month
                        if(currentmonth<hiremonth)
                        {
                        	servicemonth=12+currentmonth-hiremonth;	
                        	serviceyear=serviceyear-1;
                        }
                        else
                        {
                        	servicemonth=currentmonth-hiremonth;	
                        }
                        /// calculate service Days
                        
                        if(currentday<hiredate)
                        {
                        	serviceday=30+currentday-hiredate;
                        	servicemonth=servicemonth-1;
                        }
                        else
                        {
                        	serviceday=currentday-hiredate;
                        }
                        ////////////////////////////////////
                        
                         
                         
                        //// get current date
                        
                    // out.print(serviceyear+" year "+servicemonth+" month "+serviceday+" days");
                        
                        %>
					<li class="list-group-item li-item">service Duration: <span
						class="pull-right"><small style="color: blue"><%=serviceyear+" years "+servicemonth+" months "+serviceday+" days"%></small>
							<br> </span>
					</li>
				</ul>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>



	<%
	
	//out.println(id);
}
	
	
}
else
{
out.println("id not found");	
}
//imagetestServlet imser=new imagetestServlet();

//imser.doGet(request, response);
%>



</body>
</html>