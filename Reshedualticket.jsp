<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket rescheduling process</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="headingstyle.css">
<style>
.search {
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	margin: auto;
	margin-block-start: 2.5%;
	align-items: center;
	width: 500px;
	height: 550px;
	align-items: center;
}

.title1 {
	font-size: 25px;
	text-align: center;
	color: white;
	padding-block-start: 5%;
}

.busdtls {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 2));
	width: 350px;
	height: 360px;
	margin: auto;
	margin-block-start: 15px;
	border-radius: 5px;
}

.hd1 {
	text-align: center;
	padding-block: 15px 20px;
}

.hd1 lable {
	font-size: 23px;
}

.div1 {
	width: 350px;
	height: 300px;
}

.div2 {
	display: flex;
	height: 35px;
}

.left {
	width: 170px;
	padding-block-start: 6px;
	padding-inline-start: 40px;
	font-size: 16px;
}

.middle {
	width: 10px;
	text-align: center;
	padding-block-start: 6px;
}

.form {
	margin-block-start: 1%;
	width: 300px;
	height: 220px;
	margin-inline: 2.5%;
}

.form .data {
	display: flex;
	color: white;
	width: 150%;
	height: 50px;
	margin-inline-start: 5%;
}

.data span {
	margin-block: 10px;
	width: 160px;
	height: 35px;
	font-size: 18px;
	padding-block-start: 5px;
	color: red;
	margin-inline-start: 30px;
}

.data #date {
	color: white;
	font-size: 15px;
	margin-block: 10px;
	width: 220px;
	height: 35px;
	padding-inline-start: 4%;
	border: none;
	outline: none;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	border-radius: 3px;
	color: white;
}

.form #sub {
	margin-block-start: 5px;
	margin-block-end: 25px;
	width: 80px;
	font-size: 15px;
	height: 30px;
	text-align: center;
	background: deeppink;
	border-radius: 5px;
	color: white;
	margin-inline-start: 60%;
	border: none;
	font-style: bold;
}

.form input::placeholder {
	color: white;
	font-style: bold;
	font-size: 15px;
}

#sub:active {
	background: #00db00;
	color: white;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("names") == null) {
		response.sendRedirect("sign-in.jsp");
	}
	%>
	<div class="nav1">
		<div class="nav1-h">
			<img
				src="https://cdn1.vectorstock.com/i/thumb-large/68/00/modern-bus-symbol-stylized-icon-for-logo-or-vector-22656800.jpg" />
			<h1>Explore Travels</h1>
		</div>
		<div class=" nav-links">
			<ul>
				<a href="registration.jsp" target="_black"><li id="link">SIGNUP</li></a>
				<a href="sign-in.jsp" target="_black"><li id="link">SIGNIN</li></a>
				<a href="Logout"><li id="link">LOGOUT</li></a>
				<i id="icon" class="fa fa-user-circle"></i>
				<li id="name"><u><b><%=session.getAttribute("names")%></b></u></li>
			</ul>
		</div>
	</div>
	<div class="adv">
		<marquee dirction="left">Choose the Explore Travels Buses
			And make your journey freely and more comfortably and get a more
			Cash back offers on Bus bookings</marquee>
	</div>
	<div class="search">
		<div class="title1">
			<b><u>Reshedule the Journey</u></b>
		</div>
		<div class="busdtls">
			<div class="hd1">
				<lable> <u><b>Check Your Booking Details</b></u></lable>
				<br>
			</div>
			<div class="div1">
				<div class="div2">
					<div class="left">Name</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("name")%></div>
				</div>
				<div class="div2">
					<div class="left">Gender</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("gender")%></div>
				</div>
				<div class="div2">
					<div class="left">Phone Number</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("phone_no")%></div>
				</div>
				<div class="div2">
					<div class="left">From</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("from")%></div>
				</div>
				<div class="div2">
					<div class="left">Destination</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("destination")%></div>
				</div>
				<div class="div2">
					<div class="left">Bus No</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("busno")%></div>
				</div>

				<div class="div2">
					<div class="left">Previous journey Date</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("journey_date")%></div>
				</div>
			</div>

		</div>
		<form class="form" action="Rescheduling" method="post" />
		<input type="hidden" name="sno"
			value="<%=session.getAttribute("sno")%>" />
		<div class="data">
			<span>New Journey Date&ensp;-&ensp;</span><input type="date"
				id="date" name="date" required></input><br>
		</div>
		<input type="submit" id="sub"></input>
		</form>

	</div>
	<script>
		
	</script>
</body>
</html>

