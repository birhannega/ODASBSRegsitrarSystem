package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import databaseConnection.Dbconnection;

public class Homeroom_List {

	String id,fname,lastname,room,Grade,section;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getGrade() {
		return Grade;
	}

	public void setGrade(String grade) {
		Grade = grade;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	boolean teacchers=false;
	
	
	public boolean ListHomeRomm(String Branch)
	{
		Dbconnection dbconnection=new Dbconnection();
		try {
			Connection connection=dbconnection.getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from TBL_HomeRoom where Branch=? ");
			ps.setString(1, Branch);
			ResultSet res=ps.executeQuery();
			teacchers=res.next();
			
			while(res.next())
			{
				id=res.getString("TeacherId");	
				section=res.getString("Section_id");
				Grade=res.getString("Grade");
			}
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return teacchers; 
	}

	
	
}
