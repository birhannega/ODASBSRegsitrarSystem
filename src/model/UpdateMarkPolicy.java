package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import databaseConnection.Dbconnection;

public class UpdateMarkPolicy 
  {
  int actions=0;
	
	Dbconnection dbconnection=new Dbconnection();
	public int updatePolicy(int Grade,float mark, int AcadamicYear) throws ClassNotFoundException, SQLException
	{
	
		PreparedStatement ps=dbconnection.getConnection().prepareStatement("update TBL_policy set min_ave=?,AcadamicYear=? where Grade=?");
		ps.setFloat(1, mark);
		ps.setInt(2, AcadamicYear);
		ps.setInt(3, Grade);
		actions=ps.executeUpdate();
		return actions;
		
	}
	
	public int CreatePolicy(int Grade,float mark, int AcadamicYear) throws ClassNotFoundException, SQLException
	{

		PreparedStatement ps=dbconnection.getConnection().prepareStatement("insert into TBL_policy values (?,?, ?)");
		ps.setInt(1, Grade);
		ps.setFloat(2, mark);
		ps.setInt(3, AcadamicYear);
		
		actions=ps.executeUpdate();
		return actions;
		
	}

}
