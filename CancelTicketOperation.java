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
@WebServlet("/CancelTicketOperation")
public class CancelTicketOperation extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = connection.dataBaseConnectionMethod();

		HttpSession session = request.getSession();

		int sno = (int) session.getAttribute("sno");
		Object passacountnumber = session.getAttribute("passacountnumber");
		Double ticketRate = (Double) session.getAttribute("ticketRate");
		PrintWriter pw = response.getWriter();
		int passacountnumber1;
		long card;

		try {
			PreparedStatement ps1 = con.prepareStatement("delete from bookings1 where s_no=?");
			ps1.setInt(1, sno);
			int count = ps1.executeUpdate();
			if (count > 0) {

				if (passacountnumber.toString().length() < 10) {
					passacountnumber1 = (int) session.getAttribute("passacountnumber");
					System.out.println(passacountnumber1);
					Double deductionAmount = ticketRate * 0.12;
					Double addingamount = ticketRate - deductionAmount;
					PreparedStatement ps2 = con.prepareStatement("select * from userwallet1 where acount_no=?");
					ps2.setInt(1, passacountnumber1);
					ResultSet rs1 = ps2.executeQuery();
					if (rs1.next()) {

						ps2.setInt(1, 1000);
						ResultSet rs2 = ps2.executeQuery();
						if (rs2.next()) {
							double ownerBankblnce = rs2.getDouble(6);

							if (ownerBankblnce >= addingamount) {
								PreparedStatement ps3 = con.prepareStatement(
										"update userwallet1 set balance_amount = balance_amount + ? where acount_no = ?");
								ps3.setDouble(1, -addingamount);
								ps3.setInt(2, 1000);
								int ownerstatus = ps3.executeUpdate();

								ps3.setDouble(1, addingamount);
								ps3.setInt(2, passacountnumber1);
								int passstatus = ps3.executeUpdate();

								if (ownerstatus == 1 && passstatus == 1) {

									request.setAttribute("addedBalanceAmount", addingamount);
									request.setAttribute("confirm", "ok");
									RequestDispatcher rd2 = request.getRequestDispatcher("BookingOper.jsp");
									rd2.forward(request, response);

								} else {
									pw.println("your amount will be refund into within 2 days ");
								}

							} else {
								pw.println(
										"insufficint bank balance in owner Bank acount u will be refunded within two days");
							}

						} else {
							pw.println("invalid owner acount number");
						}

					} else {
						pw.println("invalid passanger acount number");
					}
				} else {
					card = (long) session.getAttribute("passacountnumber");
					System.out.println(card);
					Double deductionAmount = ticketRate * 0.12;
					Double addingamount = ticketRate - deductionAmount;
					PreparedStatement ps2 = con.prepareStatement("select * from userwallet1 where acount_no=?");

					ps2.setInt(1, 1000);
					ResultSet rs2 = ps2.executeQuery();
					if (rs2.next()) {
						double ownerBankblnce = rs2.getDouble(6);

						if (ownerBankblnce >= addingamount) {
							PreparedStatement ps3 = con.prepareStatement(
									"update userwallet1 set balance_amount = balance_amount + ? where acount_no = ?");
							ps3.setDouble(1, -addingamount);
							ps3.setInt(2, 1000);
							int ownerstatus = ps3.executeUpdate();

							if (ownerstatus == 1) {

								request.setAttribute("addedBalanceAmount", addingamount);
								session.setAttribute("confirm", "ok");
								RequestDispatcher rd2 = request.getRequestDispatcher("BookingOper.jsp");
								rd2.forward(request, response);

							} else {
								pw.println("your amount will be refund into within 2 days ");
							}

						} else {
							pw.println(
									"insufficint bank balance in owner Bank acount u will be refunded within two days");
						}

					} else {
						pw.println("invalid owner acount number");
					}

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
