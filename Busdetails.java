package bus_Booking;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/exser")
public class Busdetails extends HttpServlet implements Servlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		double tp = Double.valueOf(request.getParameter("tprice"));
		String st = request.getParameter("st");
		String at = request.getParameter("at");
		String typ = request.getParameter("type");
		int seatsAvailable = Integer.valueOf(request.getParameter("seats"));
		double singleTiketRate = (0.02*tp)+tp;
		
		int pbusno = Integer.valueOf(request.getParameter("psbusno"));
		String userdate = request.getParameter("udate");
		String presentdate = request.getParameter("date");
		
		HttpSession detail = request.getSession();

		detail.setAttribute("spoint",from);
		detail.setAttribute("destination",to);
		detail.setAttribute("rate",tp);
		detail.setAttribute("dtime",st);
		detail.setAttribute("atime",at);
		detail.setAttribute("Btype",typ);
		detail.setAttribute("singleticketrate", singleTiketRate);
		
		detail.setAttribute("SeatsAvailable",seatsAvailable);
		detail.setAttribute("pabusno",pbusno);
		detail.setAttribute("userdate", userdate);
		detail.setAttribute("presentdate", presentdate);
		
		RequestDispatcher rst = request.getRequestDispatcher("passDtls.jsp");
		rst.forward(request, response);
		
	}

}
