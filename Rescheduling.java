package bus_Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/Rescheduling")
public class Rescheduling extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = connection.dataBaseConnectionMethod();
		
		int sno = Integer.valueOf(request.getParameter("sno"));
		String userdate = request.getParameter("date");
		
		LocalDate checkingDate = LocalDate.parse(userdate);
		LocalDate date = LocalDate.now();
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		
		if (checkingDate.getDayOfYear() >= date.getDayOfYear() && checkingDate.getMonthValue() >= date.getMonthValue()
				&& checkingDate.getYear() >= date.getYear() || checkingDate.getYear() > date.getYear()) {
			try {
				PreparedStatement ps1 = con.prepareStatement("update bookings1 set journey_date = ? where s_no=?");
				ps1.setString(1, userdate);
				ps1.setInt(2, sno);
				int rs = ps1.executeUpdate();
				if (rs == 1) {
					
					request.setAttribute("confirm","yes");
					RequestDispatcher rd2 = request.getRequestDispatcher("BookingOper.jsp");
					rd2.forward(request,response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pw.println("<html><head></head>");
			pw.println("<body><script>alert('Please Select the valid date')</script></body>");
			RequestDispatcher rd1 = request.getRequestDispatcher("Reshedualticket.jsp");
			rd1.include(request, response);
			pw.println("</html>");
		}
	}

}
