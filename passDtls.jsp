<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus booking User details</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="headingstyle.css">
<style>
.div {
	display: flex;
}

form {
	border-radius: 5px;
	padding-top: 20px;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	width: 400px;
	height: 420px;
	margin-block-start: 7%;
	margin-inline-start: 10%;
	text-align: center;
	color: white;
}

.hd lable {
	font-size: 25px;
}

.inputfield {
	margin-block-start: 6%;
}

.name {
	margin-block-end: 25px;
	width: 280px;
	height: 35px;
	margin-block-end: 25px;
	display: inline-block;
	text-align: center;
}

.name input {
	margin-inline-start: 20px;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	padding-left: 10px;
	border: none;
	outline: none;
	color: rgb(255, 255, 255);
	font-size: 15px;
	padding-block: 5px;
	border-radius: 5px;
	width: 220px;
	height: 26px;
}

.name input::placeholder {
	color: #cccccc;
}

.buttons {
	display: inline-block;
	margin-block-start: 1%;
	text-align: center;
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

.busdtls {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 2));
	width: 350px;
	height: 360px;
	margin: 7% 20%;
	border-radius: 5px;
}

.hd1 {
	text-align: center;
	margin-block: 15px 20px;
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
			And make your journey freely and more comfortably and get a more Cash
			back offers on Bus bookings</marquee>
	</div>
	<div class="div">
		<form action="PassengerDetails" method="post">
			<input type="hidden" id="ticketrate" name="singleticketrate"
				value="<%=session.getAttribute("singleticketrate")%>" /> <input
				type="hidden" id="seatsAvailable" name="Availableseats"
				value="<%=session.getAttribute("SeatsAvailable")%>" />
			<div class="hd">
				<lable> <u><b>Enter Passenger Details</b></u></lable>
				<br>
			</div>
			<div class="inputfield">
				<div class="name">
					<lable> <i class="fa fa-user"></i></lable>
					<input type="text" name="uname" placeholder="Your Name" required />
				</div>
				<br>
				<div class="name">
					<lable> <i class="fa fa-genderless"></i></lable>
					<input type="text" name="gender" placeholder="gender" required />
				</div>
				<br>
				<div class="name">
					<lable> <i class="fa-solid fa-envelope"></i></lable>
					<input type="email" name="mail" placeholder="Mail id" required />
				</div>
				<br>
				<div class="name">
					<lable> <i class="fa-solid fa-address-book"></i></lable>
					<input type="number" minlength="10" maxlength="10" name="num" id="phoneNo"
						placeholder="Mobile" onkeyup="checkPhonenumber()" required /><br>
					<span id="message_to_user"></span>
				</div>
				<br>
				<div class="name">
					<lable> <i class="fa-solid fa-address-book"></i></lable>
					<input type="number" name="nTks" placeholder="No Of Tickets"
						required />
				</div>
				<br>

				<div class="buttons">
					<input id="create" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" />
				</div>
			</div>
		</form>

		<div class="busdtls">
			<div class="hd1">
				<lable> <u><b>Check Your Bus Details</b></u></lable>
				<br>
			</div>
			<div class="div1">
				<div class="div2">
					<div class="left">Bus No</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("pabusno")%></div>
				</div>
				<div class="div2">
					<div class="left">Bording point</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("spoint")%></div>
				</div>
				<div class="div2">
					<div class="left">Droping point</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("destination")%></div>
				</div>
				<div class="div2">
					<div class="left">Single Ticket Price</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("rate")%></div>
				</div>
				<div class="div2">
					<div class="left">Journey Date</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("udate")%></div>
				</div>
				<div class="div2">
					<div class="left">Bording Time</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("dtime")%></div>
				</div>
				<div class="div2">
					<div class="left">Arrival Time</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("atime")%></div>
				</div>
				<div class="div2">
					<div class="left">Bus Type</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("Btype")%></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function checkPhonenumber() {
			var number_msg = document.getElementById("number_msg");
			var phoneNo = document.getElementById("phoneNo");
			if (phoneNo.value.length === 10) {
				document.getElementById('message_to_user').style.color = '#33ff00';
				document.getElementById("message_to_user").innerHTML = '';
				document.getElementById("create").disabled = false;
				document.getElementById("create").style.opacity = (1);

			} else {
				document.getElementById('message_to_user').style.color = 'red';
				document.getElementById("message_to_user").innerHTML = 'PhoneNo must be have 10 digits';
				document.getElementById("create").disabled = true;
				document.getElementById('create').style.opacity = (0.4);

			}
		}
	</script>
</body>
</html>

