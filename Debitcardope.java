package bus_Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.time.LocalDate;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Example
 */
@SuppressWarnings("serial")
@WebServlet("/viadebit")
public class Debitcardope extends HttpServlet {

	@SuppressWarnings("unused")
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
		Connection con = connection.dataBaseConnectionMethod();
		
		HttpSession session = request.getSession();
		
		long cardnum = Long.valueOf(request.getParameter("cardnum"));
		String expmonth = request.getParameter("expmonth");
		int cvv = Integer.valueOf(request.getParameter("cvv"));

		String year = expmonth.substring(0, 4);
		String yearmonth = expmonth + "-12";

		LocalDate date = LocalDate.now();
		LocalDate checkingDate = LocalDate.parse(yearmonth);

		String name = (String) session.getAttribute("Passname");
		String gender = (String) session.getAttribute("Passgender");
		String mail = (String) session.getAttribute("Passmail");
		String number = (String) session.getAttribute("Passnum");
		String fromplace = (String) session.getAttribute("spoint");
		String destination = (String) session.getAttribute("destination");
		String presentdate = (String) session.getAttribute("presentdate");
		String userdate = (String) session.getAttribute("userdate");
		int busno = (int) session.getAttribute("pabusno");
		String dtime = (String) session.getAttribute("dtime");
		String atime = (String) session.getAttribute("atime");
		String btype = (String) session.getAttribute("Btype");
		int totalseats = (int) session.getAttribute("totalSeats");
		int NoOfticktes = (int) session.getAttribute("PassTickets");
		double TotalAmount = (double) session.getAttribute("TotalTicketsPrice");
		String loginUserMail = (String)session.getAttribute("loginUserMail");
		if (checkingDate.getDayOfYear() >= date.getDayOfYear() && checkingDate.getMonthValue() >= date.getMonthValue()
				&& checkingDate.getYear() >= date.getYear() || checkingDate.getYear() > date.getYear()) {

			try {
				PreparedStatement ps1 = con
						.prepareStatement("select * from userwallet1 where acount_no=? and password=?");
				PreparedStatement ps2 = con
						.prepareStatement("update userwallet1 set balance_amount=balance_amount+? where acount_no=?");
				ps1.setInt(1, 1000);
				ps1.setString(2, "Kingdom@786");
				ResultSet rs1 = ps1.executeQuery();
				while (rs1.next()) {
					double ownerblce = rs1.getDouble(6);
					ps2.setDouble(1, TotalAmount);
					ps2.setInt(2, 1000);
					int ownerbalceupdation = ps2.executeUpdate();

					if (btype.equalsIgnoreCase("AC")) {

						if (ownerbalceupdation > 0) {
							PreparedStatement ps3 = con
									.prepareStatement("update places set seats_available = ? where bus_id=?");
							ps3.setInt(1, totalseats - NoOfticktes);
							ps3.setInt(2, busno);
							int busseatsupdation = ps3.executeUpdate();
							if (busseatsupdation > 0) {
								
								PreparedStatement ps4 = con.prepareStatement(
										"insert into bookings1(name,phone_no,from_place,destination,"
												+ "Booking_date,journey_date,Tickets_price,no_of_tickets,"
												+ "departure_time,arrival_time,gender,mail_id,bus_no,"
												+ "bus_type,acount_no,login_user_mail)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
								ps4.setString(1, name);
								ps4.setString(2, number);
								ps4.setString(3, fromplace);
								ps4.setString(4, destination);
								ps4.setString(5, presentdate);
								ps4.setString(6, userdate);
								ps4.setDouble(7, TotalAmount);
								ps4.setInt(8, NoOfticktes);
								ps4.setString(9, dtime);
								ps4.setString(10, atime);
								ps4.setString(11, gender);
								ps4.setString(12, mail);
								ps4.setInt(13, busno);
								ps4.setString(14, btype);
								ps4.setLong(15, cardnum);
								ps4.setString(16, loginUserMail);
								ps4.executeUpdate();
								PreparedStatement ps5 = con.prepareStatement(
										"select * from bookings1 where name=? and phone_no = ? and journey_date = ? and bus_no = ? and mail_id=? and acount_no=?");
								ps5.setString(1, name);
								ps5.setString(2, number);
								ps5.setString(3, userdate);
								ps5.setInt(4, busno);
								ps5.setString(5, mail);
								ps5.setLong(6, cardnum);
								ResultSet rs5 = ps5.executeQuery();
								if (rs5.next()) {
									session.setAttribute("bname", rs5.getString(2));
									session.setAttribute("bnumber", rs5.getString(3));
									session.setAttribute("bfromplace", rs5.getString(4));
									session.setAttribute("bdestination", rs5.getString(5));
									session.setAttribute("bpresentdate", rs5.getString(6));
									session.setAttribute("buserdate", rs5.getString(7));
									session.setAttribute("bTotalAmount", rs5.getDouble(8));
									session.setAttribute("bNoOfticktes", rs5.getInt(9));
									session.setAttribute("bdtime", rs5.getString(10));
									session.setAttribute("batime", rs5.getString(11));
									session.setAttribute("bgender", rs5.getString(12));
									session.setAttribute("bmail", rs5.getString(13));
									session.setAttribute("bbusno", rs5.getInt(14));
									session.setAttribute("bbtype", rs5.getString(15));
									pw.println("<html><head></head>");
									pw.println(
											"<body><script>confirm('Congrauts Your payment is successfull')</script></body>");
									RequestDispatcher rd = request.getRequestDispatcher("Bookingdetails.jsp");
									rd.forward(request, response);
									pw.println("</html>");

								}
							}
						} else {
							pw.println("<html><head></head>");
							pw.println("<body><script>alert('Sorry Your payment is Fail')</script></body>");
							RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
							rd.include(request, response);
							pw.println("</html>");
						}

					} else {
						if (ownerbalceupdation > 0) {
							PreparedStatement ps3 = con
									.prepareStatement("update places1 set seats_available = ? where bus_id=?");
							ps3.setInt(1, totalseats - NoOfticktes);
							ps3.setInt(2, busno);
							int busseatsupdation = ps3.executeUpdate();
							if (busseatsupdation > 0) {
								
								PreparedStatement ps4 = con.prepareStatement(
										"insert into bookings1(name,phone_no,from_place,destination,"
												+ "Booking_date,journey_date,Tickets_price,no_of_tickets,"
												+ "departure_time,arrival_time,gender,mail_id,bus_no,"
												+ "bus_type,acount_no,login_user_mail)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
								ps4.setString(1, name);
								ps4.setString(2, number);
								ps4.setString(3, fromplace);
								ps4.setString(4, destination);
								ps4.setString(5, presentdate);
								ps4.setString(6, userdate);
								ps4.setDouble(7, TotalAmount);
								ps4.setInt(8, NoOfticktes);
								ps4.setString(9, dtime);
								ps4.setString(10, atime);
								ps4.setString(11, gender);
								ps4.setString(12, mail);
								ps4.setInt(13, busno);
								ps4.setString(14, btype);
								ps4.setLong(15, cardnum);
								ps4.setString(16, loginUserMail);
								ps4.executeUpdate();
								PreparedStatement ps5 = con.prepareStatement(
										"select * from bookings1 where name=? and phone_no = ? and journey_date = ? and bus_no = ?");
								ps5.setString(1, name);
								ps5.setString(2, number);
								ps5.setString(3, userdate);
								ps5.setInt(4, busno);
								ResultSet rs5 = ps5.executeQuery();
								if (rs5.next()) {
									session.setAttribute("bname", rs5.getString(2));
									session.setAttribute("bnumber", rs5.getString(3));
									session.setAttribute("bfromplace", rs5.getString(4));
									session.setAttribute("bdestination", rs5.getString(5));
									session.setAttribute("bpresentdate", rs5.getString(6));
									session.setAttribute("buserdate", rs5.getString(7));
									session.setAttribute("bTotalAmount", rs5.getDouble(8));
									session.setAttribute("bNoOfticktes", rs5.getInt(9));
									session.setAttribute("bdtime", rs5.getString(10));
									session.setAttribute("batime", rs5.getString(11));
									session.setAttribute("bgender", rs5.getString(12));
									session.setAttribute("bmail", rs5.getString(13));
									session.setAttribute("bbusno", rs5.getInt(14));
									session.setAttribute("bbtype", rs5.getString(15));
									pw.println("<html><head></head>");
									pw.println(
											"<body><script>confirm('Congrauts Your payment is successfull')</script></body>");
									RequestDispatcher rd = request.getRequestDispatcher("Bookingdetails.jsp");
									rd.forward(request, response);
									pw.println("</html>");

								}
							}
						} else {
							pw.println("<html><head></head>");
							pw.println("<body><script>alert('Sorry Your payment is Fail')</script></body>");
							RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
							rd.include(request, response);
							pw.println("</html>");
						}

					}

				}
			} catch (Exception e) {

			}
		} else {
			pw.println("<html><head></head>");
			pw.println(
					"<body><script>alert('This Card validity will be Already Expired \n please choose validate card')</script></body>");
			RequestDispatcher rd = request.getRequestDispatcher("Bankdtls.jsp");
			rd.include(request, response);
			pw.println("</html>");
		}

	}

}
