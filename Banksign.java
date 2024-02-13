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
@WebServlet("/Banksign")
public class Banksign extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = connection.dataBaseConnectionMethod();
		
		int acountno = Integer.valueOf(request.getParameter("Anum"));
		String pword = request.getParameter("pword");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		try {
			PreparedStatement ps2 = con.prepareStatement("select * from userwallet1 where acount_no=? and password=?");
			ps2.setInt(1,acountno);
			ps2.setString(2,pword);
			ResultSet rs1 = ps2.executeQuery();
			if (rs1.next()) {
				session.setAttribute("acountno", rs1.getInt(1));
				session.setAttribute("name", rs1.getString(2));
				session.setAttribute("mail", rs1.getString(4));
				session.setAttribute("phoneno", rs1.getLong(5));
				session.setAttribute("amount", rs1.getDouble(6));
				session.setAttribute("type", rs1.getString(7));
				RequestDispatcher rs = request.getRequestDispatcher("Bmainpage.jsp");
				rs.forward(request, response);
				

			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("Bankdtls.jsp");
				request.setAttribute("loginStatus", "fail");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
