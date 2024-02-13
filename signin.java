package bus_Booking;

import java.io.IOException;
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
@WebServlet("/login")
public class signin extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = connection.dataBaseConnectionMethod();
		
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pword");
		try {
			PreparedStatement dataCredentials = con.prepareStatement("select * from traveller1 where user_mail=? and Password=?");
			dataCredentials.setString(1, mail);
			dataCredentials.setString(2, pass);
			ResultSet rs = dataCredentials.executeQuery();
			HttpSession session = request.getSession();
			
			if(rs.next()){
				session.setAttribute("names",rs.getString(2).toUpperCase());
				session.setAttribute("loginUserMail", rs.getString(4));
				RequestDispatcher rst =request.getRequestDispatcher("mainpage.jsp");
				rst.forward(request,response);
				
				
			}
		
			else{
				RequestDispatcher di = request.getRequestDispatcher("sign-in.jsp");
				request.setAttribute("status","fail");
				di.forward(request, response);
//				PrintWriter pw = response.getWriter();
//				pw.println("<html><head></head>");
//				pw.println("<body><script>alert('Please check Your mailId/password Wrong')</script></body>");
//				RequestDispatcher rst =request.getRequestDispatcher("sign-in.jsp");
//			    rst.include(request, response);
//				pw.println("</html>");
			}
			
		} catch (SQLException e) {
			e.getMessage();
		} 
		
		
		
		
	}
	

}
