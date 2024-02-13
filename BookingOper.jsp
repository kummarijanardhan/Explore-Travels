<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<title>User Bookings page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="headingstyle.css">

<style>
.form-container {
	width: 100%;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
}

.form-container h1 {
	margin-block: 15px;
	font-size: 28px;
	color: #ff870f;
	display: inline-block;
	margin-left: 42%;
}

.form-container h1 span {
	color: white;
	margin-inline-start: 5px;
}

table {
	margin: auto;
	width: 99%;
	padding-block-end: 30px;
	border-top: 5px solid red;
	padding-top: 10px;
}

th {
	background: #ffa64d;
	width: 85px;
	text-align: center;
	padding-inline: 4px;
	padding-block: 7px;
	margin-block: 2px;
}

#input {
	background: black;
	color: white;
	width: 90%;
	text-align: center;
	padding-inline: 4px;
	padding-block: 7px;
	margin-block: 2px;
	border: none;
	outline: none;
}

#input:hover {
	background: red;
	color: white;
}

#input1 {
	width: 80%;
	font-size: 15px;
	height: 30px;
	text-align: center;
	border-radius: 5px;
	color: black;
	border: none;
	font-style: bold;
	font-weight: 20px;
	padding-inline: 4px;
	margin-block: 1px;
	margin-inline-start: 10px;
	border-radius: 5px;
	border: none;
	padding-block: 5px;
}

#input1:active {
	background: #00db00;
	color: white;
}

.notice {
	color: red;
	background-color: white;
	width: 80%;
	margin: auto;
	padding-block: 5px;
	padding-inline: 5px;
	margin-block-start: 20%;
}
</style>
</head>
<body>

	<%@page import="java.util.*,java.text.SimpleDateFormat"%>

	<%
	if (session.getAttribute("names") == null) {
		response.sendRedirect("sign-in.jsp");
	}
	String loginmail = (String) session.getAttribute("loginUserMail");
	String sqlQuery = "select * from bookings1 where 1=1";
	if (loginmail != null && !loginmail.isEmpty()) {
		sqlQuery += " AND login_user_mail = '" + loginmail + "'";
	}
	%>

	<input type="hidden" id="confirm"
		value="<%=request.getAttribute("confirm")%>" />

	<div class="nav1">
		<div class="nav1-h">
			<img
				src="https://cdn1.vectorstock.com/i/thumb-large/68/00/modern-bus-symbol-stylized-icon-for-logo-or-vector-22656800.jpg" />
			<h1>Explore Travels</h1>
		</div>
		<div class=" nav-links">
			<ul>
				<a href="registration.jsp" target="_blank"><li id="link">SIGNUP</li>
					<a href="sign-in.jsp" target="_blank"><li id="link">SIGNIN</li></a>
					<a href="Logout"><li id="link">LOGOUT</li></a> <i id="icon"
					class="fa fa-user-circle"></i>
					<li id="name"><u><b><%=session.getAttribute("names")%></b></u></li>
			</ul>
		</div>
	</div>
	<div class="adv">
		<marquee dirction="left">Choose the Explore Travels Buses
			And make your journey freely and more comfortably and get a more Cash
			back offers on Bus bookings</marquee>
	</div>
	<div class="form-container">
		<sql:setDataSource var="con" driver="oracle.jdbc.driver.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe" user="system"
			password="cscorner" />


		<sql:query var="rs" dataSource="${con}" sql="<%=sqlQuery %>" />
		<h1>
			<u>Booking<span>Details</span></u>
		</h1>

		<table>
			<tr>

				<th>User_Name</th>
				<th>Phone_NO</th>
				<th>From</th>
				<th>Destination</th>
				<th>Booking_Date</th>
				<th>Jounrey_Date</th>
				<th>Tickets_Price</th>
				<th>Tickets</th>
				<th>Dep_Time</th>
				<th>Ari_Time</th>
				<th>Gender</th>
				<th>user_Mail_id</th>
				<th>Bus_No</th>
				<th>B_Type</th>
				<th>Action_1</th>
				<th>Action_2</th>
			</tr>

			<c:forEach var="record" items="${rs.rows}">

				<form id="myForm" action="Cancel" method="post">
					<input id="input" type="hidden" name="sno" value=${record.s_no }
						readonly>

					<tr>


						<td><input id="input" type="text" name="name"
							value=${record.name } readonly></td>

						<td><input id="input" type="text" name="cellno"
							value="${record.phone_no}" readonly></td>

						<td><input id="input" type="text" name="fromplace"
							value="${record.from_place}" readonly></td>

						<td><input id="input" type="text" name="destination"
							value="${record.destination}" readonly></td>

						<td><input id="input" type="text" name="bookingdate"
							value="${record.booking_date}" readonly></td>

						<td><input id="input" type="text" name="journeydate"
							value="${record.journey_date}" readonly></td>

						<td><input id="input" type="text" name="ticketprice"
							value="${record.tickets_price}" readonly></td>

						<td><input id="input" type="text" name="nooftickets"
							value="${record.no_of_tickets}" readonly></td>

						<td><input id="input" type="text" name="departuretime"
							value="${record.departure_time}" readonly></td>

						<td><input id="input" type="text" name="arrivaltime"
							value="${record.arrival_time}" readonly></td>

						<td><input id="input" type="text" name="gender"
							value="${record.gender}" readonly></td>

						<td><input id="input" type="text" name="mailid"
							value="${record.mail_id}" readonly></td>

						<td><input id="input" type="text" name="busno"
							value="${record.bus_no}" readonly></td>

						<td><input id="input" type="text" name="bustype"
							value="${record.bus_type}" readonly><input id="input"
							type="hidden" name="acountno" value="${record.acount_no}" /></td>

						<c:set var="jdate" value="${record.journey_date}"></c:set>
						<%
						Date currentDate = new Date();
						String usedate = (String) pageContext.getAttribute("jdate");
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						Date expirationDate = sdf.parse(usedate); // Replace with your desired expiration date

						// Check if the current date is after the expiration date
						boolean isExpired = currentDate.after(expirationDate);
						%>

						<td><button id="input1" type="submit" value="Cancel"
								name="buttonvalue" <%=isExpired ? "disabled" : ""%>>Cancel</button>
						<td><button id="input1" type="submit" value="Reshedual"
								name="buttonvalue" <%=isExpired ? "disabled" : ""%>>Resedl</button></td>
					</tr>
				</form>
			</c:forEach>
		</table>

	</div>
	<div class="notice">
		<h3>* If You cancel the ticket we will refund up to 88 Percent ,
			12 Percentage will be Deducted for Charges</h3>
	</div>



	<script>
		var status = document.getElementById("confirm").value;
		if (status === "ok") {
			var addedBalanceAmount = "${addedBalanceAmount}";
			swal("Refunded Amount : " + addedBalanceAmount,
					"Your Ticket is Cancelled Successfully", "ok");
		} else if (status === "yes") {
			swal("Your Journey date is Reshedualled Successfully", " ", "yes");

		}
	</script>



</body>
</html>