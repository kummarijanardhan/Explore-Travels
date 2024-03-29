package bus_Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/payment")
public class PaymentDtls extends HttpServlet {

	@SuppressWarnings("unused")
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = connection.dataBaseConnectionMethod();

		HttpSession session = request.getSession();

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String mail = request.getParameter("mail");
		String number = request.getParameter("number");
		String fromplace = request.getParameter("fromplace");
		String destination = request.getParameter("destination");
		String presentdate = request.getParameter("presentdate");
		String userdate = request.getParameter("userdate");
		int busno = Integer.valueOf(request.getParameter("busno"));
		String dtime = request.getParameter("dtime");
		String atime = request.getParameter("atime");
		String btype = request.getParameter("btype");
		int totalseats = Integer.valueOf(request.getParameter("totalseats"));

		double tickteRate = Double.valueOf(request.getParameter("ST"));
		int NoOfticktes = Integer.valueOf(request.getParameter("NT"));
		double TotalAmount = Double.valueOf(request.getParameter("TA"));

		int BAccNo = Integer.valueOf(request.getParameter("acountno"));
		String password = request.getParameter("password");
		PrintWriter pw = response.getWriter();

		
		// inserting this login mailId in to bookings1 table for retriving data based on login mail id
		String loginUserMail = (String)session.getAttribute("loginUserMail");
		try {
			PreparedStatement ps1 = con.prepareStatement("select * from userwallet1 where acount_no=? and password=?");
			PreparedStatement ps2 = con
					.prepareStatement("update userwallet1 set balance_amount=balance_amount+? where acount_no=?");
			ps1.setInt(1, BAccNo);
			ps1.setString(2, password);
			ResultSet rs1 = ps1.executeQuery();

			if (rs1.next()) {
				double BAccBlce = rs1.getDouble(6);

				ps1.setInt(1, 1000);
				ps1.setString(2, "Kingdom@786");
				ResultSet rs2 = ps1.executeQuery();

				if (rs2.next()) {
					int ownerAcountNo = rs2.getInt(1);
					double ownerblce = rs2.getDouble(6);

					if (btype.equalsIgnoreCase("AC")) {
						if (TotalAmount <= BAccBlce) { /* BAccBlce == Benficiery acount balance */

							ps2.setDouble(1, -TotalAmount);
							ps2.setInt(2, BAccNo);
							int guest = ps2.executeUpdate();

							ps2.setDouble(1, TotalAmount);
							ps2.setInt(2, ownerAcountNo);
							int owner = ps2.executeUpdate();

							PreparedStatement ps3 = con
									.prepareStatement("update places set seats_available = ? where bus_id=?");
							ps3.setInt(1, totalseats - NoOfticktes);
							ps3.setInt(2, busno);
							int useats = ps3.executeUpdate();

							if (guest > 0 && owner > 0 && useats > 0) {
								/*
								 * create table bookings1(s_no number generated by default on null as identity
								 * start with 1 increment by 1,name varchar2(30),phone_no
								 * varchar2(10),from_place varchar2(16),destination varchar2(16), Booking_date
								 * varchar2(12),journey_date varchar2(12),Tickets_price number(7,2),
								 * no_of_tickets number(1),departure_time varchar2(8),arrival_time
								 * varchar2(8),gender varchar(6) ,mail_id varchar2(30),bus_no number(2),
								 * bus_type varchar2(8),acount_no int,login_user_mail varchar2(40));
								 * 
								 * 
								 */
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
								ps4.setInt(15, BAccNo);
								ps4.setString(16,loginUserMail);
								ps4.executeUpdate();
								PreparedStatement ps5 = con.prepareStatement(
										"select * from bookings1 where name=? and phone_no = ? and journey_date = ? and bus_no = ? and mail_id=? and acount_no=?");
								ps5.setString(1, name);
								ps5.setString(2, number);
								ps5.setString(3, userdate);
								ps5.setInt(4, busno);
								ps5.setString(5, mail);
								ps5.setInt(6, BAccNo);
								ResultSet rs4 = ps5.executeQuery();
								if (rs4.next()) {
									session.setAttribute("bname", rs4.getString(2));
									session.setAttribute("bnumber", rs4.getString(3));
									session.setAttribute("bfromplace", rs4.getString(4));
									session.setAttribute("bdestination", rs4.getString(5));
									session.setAttribute("bpresentdate", rs4.getString(6));
									session.setAttribute("buserdate", rs4.getString(7));
									session.setAttribute("bTotalAmount", rs4.getDouble(8));
									session.setAttribute("bNoOfticktes", rs4.getInt(9));
									session.setAttribute("bdtime", rs4.getString(10));
									session.setAttribute("batime", rs4.getString(11));
									session.setAttribute("bgender", rs4.getString(12));
									session.setAttribute("bmail", rs4.getString(13));
									session.setAttribute("bbusno", rs4.getInt(14));
									session.setAttribute("bbtype", rs4.getString(15));
									pw.println("<html><head></head>");
									pw.println(
											"<body><script>confirm('Congrauts Your payment is successfull')</script></body>");
									RequestDispatcher rd = request.getRequestDispatcher("Bookingdetails.jsp");
									rd.forward(request, response);
									pw.println("</html>");

								}
							} else {
								pw.println("<html><head></head>");
								pw.println("<body><script>alert('Sorry Your payment is Fail')</script></body>");
								RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
								rd.include(request, response);
								pw.println("</html>");
							}
						} else {
							pw.println("<html><head></head>");
							pw.println("<body><script>alert('Sorry You have a Insufficient Balance')</script></body>");
							RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
							rd.include(request, response);
							pw.println("</html>");
						}
					} else {
						if (TotalAmount <= BAccBlce) { /* BAccBlce == Benficiery acount balance */

							ps2.setDouble(1, -TotalAmount);
							ps2.setInt(2, BAccNo);
							int guest = ps2.executeUpdate();

							ps2.setDouble(1, TotalAmount);
							ps2.setInt(2, ownerAcountNo);
							int owner = ps2.executeUpdate();

							PreparedStatement ps6 = con
									.prepareStatement("update places1 set seats_available = ? where bus_id=?");
							ps6.setInt(1, totalseats - NoOfticktes);
							ps6.setInt(2, busno);
							int useats = ps6.executeUpdate();
							if (guest == 1 && owner == 1 && useats == 1) {

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
								ps4.setInt(15, BAccNo);
								ps4.setString(16, loginUserMail);
								ps4.executeUpdate();
								PreparedStatement ps5 = con.prepareStatement(
										"select * from bookings1 where name=? and phone_no = ? and journey_date = ? and bus_no = ? and mail_id=? and acount_no=?");
								ps5.setString(1, name);
								ps5.setString(2, number);
								ps5.setString(3, userdate);
								ps5.setInt(4, busno);
								ps5.setString(5, mail);
								ps5.setInt(6, BAccNo);
								ResultSet rs4 = ps5.executeQuery();
								if (rs4.next()) {
									session.setAttribute("bname", rs4.getString(2));
									session.setAttribute("bnumber", rs4.getString(3));
									session.setAttribute("bfromplace", rs4.getString(4));
									session.setAttribute("bdestination", rs4.getString(5));
									session.setAttribute("bpresentdate", rs4.getString(6));
									session.setAttribute("buserdate", rs4.getString(7));
									session.setAttribute("bTotalAmount", rs4.getDouble(8));
									session.setAttribute("bNoOfticktes", rs4.getInt(9));
									session.setAttribute("bdtime", rs4.getString(10));
									session.setAttribute("batime", rs4.getString(11));
									session.setAttribute("bgender", rs4.getString(12));
									session.setAttribute("bmail", rs4.getString(13));
									session.setAttribute("bbusno", rs4.getInt(14));
									session.setAttribute("bbtype", rs4.getString(15));
									pw.println("<html><head></head>");
									pw.println(
											"<body><script>alert('Congrauts Your payment is successfull')</script></body>");
									RequestDispatcher rd = request.getRequestDispatcher("Bookingdetails.jsp");
									rd.include(request, response);
									pw.println("</html>");

								}
							} else {
								pw.println("<html><head></head>");
								pw.println("<body><script>alert('Sorry Your payment is Fail')</script></body>");
								RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
								rd.include(request, response);
								pw.println("</html>");
							}
						} else {
							pw.println("<html><head></head>");
							pw.println("<body><script>alert('Sorry You have a Insufficient Balance')</script></body>");
							RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
							rd.include(request, response);
							pw.println("</html>");
						}
					}
				} else {
					pw.println("<html><head></head>");
					pw.println("<body><script>alert('Benficiery Acount number is wrong')</script></body>");
					RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
					rd.include(request, response);
					pw.println("</html>");

				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");
				request.setAttribute("passwordStatus", "password is wrong");
				rd.forward(request, response);
			}

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
