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
@WebServlet("/Bankbalnce")
public class Bankbalnce extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = connection.dataBaseConnectionMethod();
		
		HttpSession session = request.getSession();
		int acountno = Integer.valueOf(request.getParameter("acountno"));
		String password = request.getParameter("pword");
		PrintWriter pw = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("Bmainpage.jsp");

		try {
			PreparedStatement ps = con.prepareStatement("select * from userwallet1 where acount_no = ? and  password = ?");	
			ps.setInt(1, acountno);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				double balance = rs.getDouble(6);
				String Acntname = rs.getString(2);
				request.setAttribute("bankblce", balance);
				request.setAttribute("acountholdername", Acntname);
				request.setAttribute("correctdetails", "okk");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("correctdetails", "fail");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
