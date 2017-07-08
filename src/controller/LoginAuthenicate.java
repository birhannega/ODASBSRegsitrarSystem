package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import databaseConnection.Dbconnection;
import model.AuthenticateUser;

@WebServlet({ "/LoginAuthenicate" })
public class LoginAuthenicate extends HttpServlet {
	Dbconnection dbconnection = new Dbconnection();
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String branch = request.getParameter("branch");
		String type = null;
		String branch = null;
		// String type = request.getParameter("type");
		String UserName = request.getParameter("user");
		String password = request.getParameter("password");
		try {
			Statement statement = dbconnection.getConnection().createStatement();
			ResultSet res = statement.executeQuery("select * from TBL_Users where userName='" + UserName + "'");
			if (res.next()) {
				type = res.getString("type");
				branch = res.getString("branch");

			}

			HttpSession session = request.getSession();
			if (AuthenticateUser.validate(UserName, password, branch, type)) {
				if (type.equals("T")) {

					session.setAttribute("user", UserName);
					response.sendRedirect("Teacher/Tindex.jsp");
				} else if (type.equals("R")) {

					session.setAttribute("registrar", UserName);
					response.sendRedirect("RegistrarOffice/MainConsole.jsp");
				} else if (type.equals("super")) {
					session.setAttribute("super", UserName);
					response.sendRedirect("super/MainMenu.jsp");
				}
			} else {
				request.setAttribute("error", "user name or password is incorrect");
				request.getRequestDispatcher("index.jsp").include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
