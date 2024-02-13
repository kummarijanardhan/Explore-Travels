<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore Travels main page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="headingstyle.css">
<style>
.Bookings {
	background: red;
	margin-inline-start: 26%;
	margin-block-start: 8%;
	width: 320px;
	text-align: center;
	padding-block: 7px;
	color: red;
	border-radius: 5px;
}

.Bookings a {
	color: white;
}

.search {
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	height: 330px;
	width: 320px;
	margin-block-start: 1%;
	margin-inline-start: 26%;
	align-items: center;
	padding-block-start: 10px;
	border-radius: 5px;
}

.title1 {
	font-size: 25px;
	text-align: center;
	color: white;
	margin-block: 5%;
}

.form {
	margin-block-start: 6%;
	width: 300px;
	height: 220px;
	margin-inline: 2.5%;
}

.form #from, #date {
	margin-block-end: 25px;
	width: 220px;
	height: 35px;
	padding-inline-start: 4%;
	margin-inline-start: 13%;
	border: none;
	outline: none;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	border-radius: 3px;
	color: white;
	font-size: 15px;
}

.buttons {
	display: inline-block;
	margin-block-start: 3%;
	text-align: center;
	margin-inline-start: 20%;
}

.buttons input {
	border: none;
	font-size: 15px;
	display: inline-block;
	background-color: deeppink;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	height: 25px;
	width: 70px;
}

.form input::placeholder {
	color: white;
	font-style: bold;
	font-size: 15px;
}

#date_msg {
	margin-inline-start: 50px;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("names") == null) {
		response.sendRedirect("sign-in.jsp");
	}
	%>
	<input type="hidden" id="status1"
		value="<%=request.getAttribute("status")%>" />

	<input type="hidden" id="BusStatus"
		value="<%=request.getAttribute("BusStatus")%>" />

	<input type="hidden" id="datesStatus"
		value="<%=request.getAttribute("datesStatus")%>" />

	<div class="nav1">
		<div class="nav1-h">
			<img
				src="https://cdn1.vectorstock.com/i/thumb-large/68/00/modern-bus-symbol-stylized-icon-for-logo-or-vector-22656800.jpg" />
			<h1>Explore Travels</h1>
		</div>
		<div class=" nav-links">
			<ul>
				<a href="registration.jsp" target="_blank"><li id="link">SIGNUP</li></a>
				<a href="sign-in.jsp" target="_blank"><li id="link">SIGNIN</li></a>
				<a href="Logout"><li id="link">LOGOUT</li></a>
				<i id="icon" class="fa fa-user-circle"></i>
				<li id="name"><u><b><%=session.getAttribute("names")%></b></u></li>
			</ul>
		</div>
	</div>
	<div class="adv">
		<marquee direction="left">Choose the Explore Travels Buses
			And make your journey freely and more comfortably and get a more Cash
			back offers on Bus bookings</marquee>
	</div>
	<div class="Bookings">

		<h2>
			<a href="BookingOper.jsp">Your Bookings</a>
		</h2>
	</div>
	<div class="search">
		<div class="title1">
			<b>Search Buses</b>
		</div>
		<form class="form" action="Tickets" method="post">
			<%
			session.getAttribute("name");
			%>
			<input type="text" id="from" name="from" placeholder="From" required></input><br>
			<input type="text" id="from" name="to" placeholder="To" required></input><br>
			<input type="date" id="date" name="date" required></input> <span
				id="date_msg"></span><br>

			<div class="buttons">
				<input id="create" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" />
			</div>
		</form>
	</div>

	<script>
		var status = document.getElementById("status1").value;
		var BusStatus = document.getElementById("BusStatus").value;
		var datesStatus = document.getElementById("datesStatus").value;
		if (status == "success") {
			swal("Congrats", "Acount is Created Successfully", "success");
		} else if (BusStatus === "fail") {
			swal("sorry", "No Buses Availble On this Rout", "fail");
		} else if (datesStatus === "please enter the valid date") {
			document.getElementById("date_msg").innerHTML = '* Please select the valid Date';
			document.getElementById("date_msg").style.color = 'red';
		}
	</script>
</body>
</html>






