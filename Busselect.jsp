<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=\"UTF-8\">

<title>Explore Travels bus details page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="headingstyle.css">

<style>
.routs {
	height: 500px;
	width: 80%;
	margin-block-start: 5%;
	margin-inline-start: 10%;
}

.routs .heading {
	margin-inline-start: 40px;
	margin-block-start: 10px;
	color: red;
	font-size: 28px;
}

.rout1 {
	height: 75px;
	margin-block-start: 30px;
}

.rout1 .click {
	background-color: white;
	width: 90%;
	height: 75px;
	margin-inline-start: 40px;
	width: 90%;
	display: flex;
	border-radius: 5px;
}

.click .div1 {
	width: 85%;
	height: 55px;
	margin-block-start: 10px;
}

.up {
	display: flex;
	width: 95%;
	height: 25px;
	list-style: none;
}

.left {
	display: flex;
	width: 45%;
	margin-inline-start: 45px;
}

.left #from {
	outline: none;
	font-size: 20px;
	border: none;
	width: 48%;
	text-align: center;
	font-weight: bold;
	letter-spacing: 0.5px;
}

.right {
	display: flex;
	width: 55%;
	padding-block: 3px;
	text-align: center;
	margin-inline-start: 9%;
}

.right #BD1 {
	border: none;
	letter-spacing: 1px;
	width: 25px;
	font-style: serif;
	outline: none;
	text-align: center;
	margin-inline-start: 10px;
	margin-inline-end: 25%;
}

.right #BD2 {
	border: none;
	letter-spacing: 1px;
	width: 40px;
	font-style: serif;
	outline: none;
	text-align: center;
	margin-inline-start: 10px;
}

.down {
	display: flex;
	width: 80%;
	height: 30px;
	list-style: none;
	margin-inline-start: 15%;
	margin-block-start: 10px;
}

.down #Dtime {
	border: none;
	height: 20px;
	margin-inline-start: 10px;
	margin-inline-end: 19%;
	width: 60px;
	text-align: center;
	outline: none;
	letter-spacing: 1px;
	font-style: serif;
}

.down #Atime {
	border: none;
	height: 20px;
	width: 55px;
	margin-inline-end: 15%;
	margin-inline-start: 10px;
	outline: none;
	letter-spacing: 1px;
	font-style: serif;
	text-align: center;
}

.down #type {
	border: none;
	height: 20px;
	width: 50px;
	margin-inline-start: 10px;
	outline: none;
	letter-spacing: 1px;
	font-style: serif;
}

.buttons {
	display: inline-block;
	margin-block-start: 2.5%;
	text-align: center;
}

.down #layout {
	width: 50%;
	height: 50%;
}

.buttons #create {
	border: none;
	font-size: 15px;
	display: inline-block;
	background-color: deeppink;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	height: 25px;
	width: 100px;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("names") == null) {
		response.sendRedirect("mainpage.jsp");
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
	<div class="routs">
		<b><div class="heading">
				Buses From &ensp;:&ensp;
				<%=session.getAttribute("from")%>
				&ensp;to&ensp;
				<%=session.getAttribute("to")%></div></b>
		<div class="rout1">
			<form class="click" action="exser" method="post">
				<input type="hidden" name="psbusno"
					value="<%=session.getAttribute("busid")%>" /> <input type="hidden"
					name="udate" value="<%=session.getAttribute("udate")%>" /> <input
					type="hidden" name="date" value="<%=session.getAttribute("date")%>" />
				<div class="div1">
					<div class="up">
						<div class="left">
							<input id="from" type="text" name="from"
								value="<%=session.getAttribute("from")%>" readonly /><b>to</b>
							<input id="from" type="text" name="to"
								value="<%=session.getAttribute("to")%>" readonly />
						</div>
						<div class="right">
							Available Seats&ensp;:<input type="text" id="BD1" name="seats"
								value="<%=session.getAttribute("seats")%>" readonly /> Ticket
							Price&ensp;:<input type="text" id="BD2" name="tprice"
								value="<%=session.getAttribute("tprice")%>" readonly />
						</div>
					</div>

					<div class="down">
						Diparture Time&ensp;:<input id="Dtime" name="st"
							value="<%=session.getAttribute("st")%>" readonly /> Arrival
						Time&ensp;:<input id="Atime" name="at"
							value="<%=session.getAttribute("at")%>" readonly /> Bus
						Type&ensp;:<input id="type" name="type"
							value="<%=session.getAttribute("type")%>" readonly />
					</div>
				</div>
				<div class="buttons">
					<input id="create" type="submit" value="Book Now" />
				</div>
				<br>
			</form>
		</div>
		<div class="rout1">
			<form class="click" action="exser" method="post">
				<input type="hidden" name="psbusno"
					value="<%=session.getAttribute("busid")%>" /> <input type="hidden"
					name="udate" value="<%=session.getAttribute("udate")%>" /> <input
					type="hidden" name="date" value="<%=session.getAttribute("date")%>" />
				<div class="div1">
					<div class="up">
						<div class="left">
							<input id="from" type="text" name="from"
								value="<%=session.getAttribute("from")%>" readonly /><b>to</b>
							<input id="from" type="text" name="to"
								value="<%=session.getAttribute("to")%>" readonly />
						</div>
						<div class="right">
							Available Seats&ensp;:<input type="text" id="BD1" name="seats"
								value="<%=session.getAttribute("Nseats")%>" readonly /> Arrival
							Time&ensp;:<input type="text" id="BD2" name="tprice"
								value="<%=session.getAttribute("Ntprice")%>" readonly />
						</div>
					</div>

					<div class="down">
						Diparture Time&ensp;:<input id="Dtime" name="st"
							value="<%=session.getAttribute("Nst")%>" readonly /> Arrival
						Time&ensp;:<input id="Atime" name="at"
							value="<%=session.getAttribute("Nat")%>" readonly /> Bus
						Type&ensp;:<input id="type" name="type"
							value="<%=session.getAttribute("type1")%>" readonly />
					</div>
				</div>
				<div class="buttons">
					<input id="create" type="submit" value="Book Now" />
				</div>
				<br>
			</form>
		</div>

		<div class="rout1">
			<form class="click" action="exser" method="post">
				<input type="hidden" name="psbusno"
					value="<%=session.getAttribute("busid")%>" /> <input type="hidden"
					name="udate" value="<%=session.getAttribute("udate")%>" /> <input
					type="hidden" name="date" value="<%=session.getAttribute("date")%>" />
				<div class="div1">
					<div class="up">
						<div class="left">
							<input id="from" type="text" name="from"
								value="<%=session.getAttribute("from")%>" readonly /><b>to</b>
							<input id="from" type="text" name="to"
								value="<%=session.getAttribute("to")%>" readonly />
						</div>
						<div class="right">
							Available Seats&ensp;:<input type="text" id="BD1" name="seats"
								value="<%=session.getAttribute("seats")%>" readonly /> Arrival
							Time&ensp;:<input type="text" id="BD2" name="tprice"
								value="<%=session.getAttribute("tprice")%>" readonly />
						</div>
					</div>

					<div class="down">
						Diparture Time&ensp;:<input id="Dtime" name="st"
							value="<%=session.getAttribute("st1")%>" readonly /> Arrival
						Time&ensp;:<input id="Atime" name="at"
							value="<%=session.getAttribute("at1")%>" readonly /> Bus
						Type&ensp;:<input id="type" name="type"
							value="<%=session.getAttribute("type")%>" readonly />
					</div>
				</div>
				<div class="buttons">
					<input id="create" type="submit" value="Book Now" />
				</div>
				<br>
			</form>
		</div>
		<div class="rout1">
			<form class="click" action="exser" method="post">
				<input type="hidden" name="psbusno"
					value="<%=session.getAttribute("busid")%>" /> <input type="hidden"
					name="udate" value="<%=session.getAttribute("udate")%>" /> <input
					type="hidden" name="date" value="<%=session.getAttribute("date")%>" />
				<div class="div1">
					<div class="up">
						<div class="left">
							<input id="from" type="text" name="from"
								value="<%=session.getAttribute("from")%>" readonly /><b>to</b>
							<input id="from" type="text" name="to"
								value="<%=session.getAttribute("to")%>" readonly />
						</div>
						<div class="right">
							Available Seats&ensp;:<input type="text" id="BD1" name="seats"
								value="<%=session.getAttribute("Nseats")%>" readonly /> Arrival
							Time&ensp;:<input type="text" id="BD2" name="tprice"
								value="<%=session.getAttribute("Ntprice")%>" readonly />
						</div>
					</div>

					<div class="down">
						Diparture Time&ensp;:<input id="Dtime" name="st"
							value="<%=session.getAttribute("Nst1")%>" readonly /> Arrival
						Time&ensp;:<input id="Atime" name="at"
							value="<%=session.getAttribute("Nat1")%>" readonly /> Bus
						Type&ensp;:<input id="type" name="type"
							value="<%=session.getAttribute("type1")%>" readonly />
					</div>
				</div>
				<div class="buttons">
					<input id="create" type="submit" value="Book Now" />
				</div>
				<br>
			</form>
		</div>

	</div>


</body>

</html>