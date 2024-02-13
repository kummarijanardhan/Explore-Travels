package bus_Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/register")
public class Registration extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = connection.dataBaseConnectionMethod();
		RequestDispatcher rs = request.getRequestDispatcher("registration.jsp");
		RequestDispatcher rs1 = request.getRequestDispatcher("mainpage.jsp");

		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		try {

			String name = request.getParameter("uname");
			String gender = request.getParameter("gender");
			String mail = request.getParameter("mail");
			String pword = request.getParameter("pword");
			String num = request.getParameter("num");

			PreparedStatement result = con.prepareStatement(
					"insert into traveller1(user_name,gender,user_mail,password,phone_no) values(?,?,?,?,?)");
			result.setString(1, name);
			result.setString(2, gender);
			result.setString(3, mail.toLowerCase());
			result.setString(4, pword);
			result.setString(5, num);
			int total = result.executeUpdate();
			if (total > 0) {
				session.setAttribute("names",name.toUpperCase());
				session.setAttribute("loginUserMail", mail);
				request.setAttribute("status", "success");
				rs1.forward(request, response);
			}

		} catch (Exception e) {
			request.setAttribute("status", "Registartion is failed");
			rs.forward(request, response);

		}

	}
}
