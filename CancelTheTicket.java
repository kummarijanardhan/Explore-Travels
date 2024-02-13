package bus_Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings({ "unused", "serial" })
@WebServlet("/Cancel")
public class CancelTheTicket extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		int sno = Integer.valueOf(request.getParameter("sno"));
		String name = request.getParameter("name");
		String cellno = request.getParameter("cellno");
		String from = request.getParameter("fromplace");
		String destination = request.getParameter("destination");
		String bdate = request.getParameter("bookingdate");
		String jdate = request.getParameter("journeydate");
		double tprice = Double.valueOf(request.getParameter("ticketprice"));
		int notkts = Integer.valueOf(request.getParameter("nooftickets"));
		String dtime = request.getParameter("departuretime");
		String atime = request.getParameter("arrivaltime");
		String gender = request.getParameter("gender");
		String mailid = request.getParameter("mailid");
		int busno = Integer.valueOf(request.getParameter("busno"));
		String bustp = request.getParameter("bustype");
		
		String acountno = request.getParameter("acountno");
		int passacountnumber;
		long PassAtmCardNum;
		
		String values = request.getParameter("buttonvalue");

		HttpSession session = request.getSession();

		if (values.equals("Cancel")) {
			if(acountno.length()<10) {
				passacountnumber = Integer.valueOf(request.getParameter("acountno"));
				session.setAttribute("passacountnumber",passacountnumber);
				session.setAttribute("ticketRate", tprice);
				session.setAttribute("sno", sno);
				RequestDispatcher rs = request.getRequestDispatcher("CancelTicketOperation");
				rs.forward(request, response);
			}else {
				PassAtmCardNum = Long.valueOf(request.getParameter("acountno"));
				session.setAttribute("passacountnumber",PassAtmCardNum);
				session.setAttribute("ticketRate", tprice);
				session.setAttribute("sno", sno);
				RequestDispatcher rs = request.getRequestDispatcher("CancelTicketOperation");
				rs.forward(request, response);
				
			}
		} else if (values.equals("Reshedual")) {

			session.setAttribute("name", name);
			session.setAttribute("gender", gender);
			session.setAttribute("phone_no", cellno);
			session.setAttribute("from", from);
			session.setAttribute("destination", dtime);
			session.setAttribute("busno", busno);
			session.setAttribute("journey_date", jdate);
			session.setAttribute("sno", sno);
			RequestDispatcher rs = request.getRequestDispatcher("Reshedualticket.jsp");
			rs.forward(request, response);

		}
	}
}
