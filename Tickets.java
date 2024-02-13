package bus_Booking;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/Tickets")
public class Tickets extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = connection.dataBaseConnectionMethod();

		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String udate = request.getParameter("date");
		LocalDate checkingDate = LocalDate.parse(udate);
		LocalDate date = LocalDate.now();
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");

		if (checkingDate.getDayOfYear() >= date.getDayOfYear() && checkingDate.getMonthValue() >= date.getMonthValue()
				&& checkingDate.getYear() >= date.getYear() || checkingDate.getYear() > date.getYear()) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "cscorner");
				PreparedStatement ps = con
						.prepareStatement("select * from places where from_place=? and to_destination=?");
				ps.setString(1, from);
				ps.setString(2, to);
				ResultSet rs = ps.executeQuery();
				PreparedStatement ps1 = con
						.prepareStatement("select * from places1 where from_place=? and to_destination=?");
				ps1.setString(1, from);
				ps1.setString(2, to);
				ResultSet rs1 = ps1.executeQuery();
				if (rs.next()) {
					if (rs1.next()) {
						session.setAttribute("busid", rs.getInt(1));
						session.setAttribute("from", rs.getString(2));
						session.setAttribute("to", rs.getString(3));
						session.setAttribute("seats", rs.getInt(4));
						session.setAttribute("tprice", rs.getInt(5));
						session.setAttribute("st", "8:00PM");
						session.setAttribute("st1", "11:00PM");
						session.setAttribute("at", rs.getString(6));
						session.setAttribute("at1", rs.getString(7));
						session.setAttribute("type", "AC");

						session.setAttribute("Nbusid", rs1.getInt(1));
						session.setAttribute("Nseats", rs1.getInt(4));
						session.setAttribute("Ntprice", rs1.getInt(5));
						session.setAttribute("Nst", "9:00PM");
						session.setAttribute("Nst1", "12:00PM");
						session.setAttribute("Nat", rs1.getString(6));
						session.setAttribute("Nat1", rs1.getString(7));
						session.setAttribute("type1", "Non/Ac");

						session.setAttribute("udate", udate);
						session.setAttribute("date", date);

						RequestDispatcher rst = request.getRequestDispatcher("Busselect.jsp");
						rst.forward(request, response);
					}
				} else {
					request.setAttribute("BusStatus","fail");
					rd.forward(request, response);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			request.setAttribute("datesStatus","please enter the valid date");
			rd.forward(request, response);
			
		}

	}

}
