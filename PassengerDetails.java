package bus_Booking;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/PassengerDetails")
public class PassengerDetails extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Passname =  request.getParameter("uname");
		String Passgender =  request.getParameter("gender");
		String Passmail =  request.getParameter("mail");
		String Passnum =  request.getParameter("num");
		int Availableseats = Integer.valueOf(request.getParameter("Availableseats"));
		int PassTickets =  Integer.valueOf(request.getParameter("nTks"));
		Double singleticketrate = Double.valueOf(request.getParameter("singleticketrate"));
		Double TotalTicketsPrice  = singleticketrate*PassTickets;
		HttpSession passdetail = request.getSession();

		passdetail.setAttribute("Passname",Passname);
		passdetail.setAttribute("Passgender",Passgender);
		passdetail.setAttribute("Passmail",Passmail);
		passdetail.setAttribute("Passnum",Passnum);
		passdetail.setAttribute("PassTickets",PassTickets);
		passdetail.setAttribute("TotalTicketsPrice",TotalTicketsPrice);
		passdetail.setAttribute("totalSeats", Availableseats);
		
		RequestDispatcher rst = request.getRequestDispatcher("Bankdtls.jsp");
		rst.forward(request, response);
	}

}
