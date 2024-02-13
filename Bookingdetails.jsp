<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Details page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="headingstyle.css">

<style>
.div1 {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 2));
	width: 100%;
	padding-block: 10px;
}

.div2 {
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	width: 100%;
	color: white;
	display: flex;
	padding-block: 5px;
	height: 82px;
}

.div2 #bank {
	color: white;
	font-size: 25px;
	text-align: center;
	padding-block-start: 20px;
	padding-inline: 10px;
}

.div3 {
	display: grid;
	width: 80%;
	margin-inline-start: 25px;
	grid-template-columns: auto auto auto;
}

.div2-1 {
	display: flex;
	height: 35px;
	width: 320px;
	text-align: center;
	display: flex;
	display: flex;
}

.left {
	margin-inline-start: 10px;
	width: 90px;
	padding-block-start: 8px;
	font-size: 16px;
	width: 90px;
	font-size: 17px;
}

.middle {
	width: 10px;
	text-align: center;
	padding-block-start: 8px;
}

.select {
	margin-inline-start: 1.5%;
}

.select h3 {
	color: black;
}

.select #tools {
	display: none;
}

.options a {
	border: 1px solid red;
	background-color: red;
	border-radius: 5px;
	font-size: 15px;
	text-decoration: none;
	color: white;
	margin-inline-start: 20px;
}

.bcontent {
	height: 70vh;
	width: 100%;
}

.btools {
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	color: white;
	margin-block-start: 1%;
	width: 350px;
	margin-inline-start: 35%;
}

.btools .h3 {
	padding-block: 15px;
}

.btools #h3 {
	margin-inline-start: 25px;
	cursor: pointer;
	border-radius: 5px;
	height: 25px;
	padding: 5px;
	width: 250px;
	padding-inline-start: 10px;
	background-color: red;
	color: white;
}

.btools #form {
	display: none;
}

.passengerDetails {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 2));
	width: 96%;
	margin-inline: auto;
	height: 400px;
	margin-block-start: 1.5%;
	border-radius: 5px;
}

.passengerhd1 {
	text-align: center;
	padding-block: 9px 11px;
	background: #ff6600;
	color: white;
}

.passengerhd1 lable {
	font-size: 23px;
}

.passengerdiv1 {
	margin-inline: auto;
	margin-block-start: 1%;
	width: 98%;
	height: 340px;
	display: grid;
	grid-template-columns: auto auto auto;
}

.passengerdiv2 {
	display: flex;
	height: 38px;
	border: 1px solid green;
}

.pleft {
	background: #0080ff;
	width: 105px;
	padding-block-start: 10px;
	padding-inline: 50px;
	font-size: 16px;
	color: white;
}

.pmiddle {
	width: 10px;
	background: red;
	text-align: center;
	font-size: 30px;
	color: white;
}

.pright {
	background: #ff6f6f;
	width: 150px;
	padding-block-start: 10px;
	padding-inline: 50px;
	font-size: 16px;
	color: white;
}

.ok {
	margin-block-start: 1.5%;
	text-align: center;
}

.ok button {
	width: 90px;
	height: 30px;
	background-color: white;
	border: none;
	border-radius: 5px;
}

.ok a {
	text-decoration: none;
	font-size: 15px;
	color: black;
	font-style: bold;
}

.ok button:active {
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
	<div class="div1">
		<div class="div2">
			<div id="bank">
				<u>Bank Details :</u>
			</div>
			<div class="div3">
				<div class="div2-1">
					<div class="left">Acount No</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("acountno")%></div>
				</div>
				<div class="div2-1">
					<div class="left">Mail Id</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("mail")%></div>
				</div>
				<div class="div2-1">
					<div class="left">IFSE Code</div>
					<div class="middle">:</div>
					<div class="left"><%="EpBank123J78"%></div>
				</div>

				<div class="div2-1">
					<div class="left">Name</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("name")%></div>
				</div>
				<div class="div2-1">
					<div class="left">Phone No</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("phoneno")%></div>
				</div>
				<div class="div2-1">
					<div class="left">Acount Type</div>
					<div class="middle">:</div>
					<div class="left"><%=session.getAttribute("type")%></div>
				</div>
			</div>
			<div class="select">
				<h3 id="h3" onclick="display()">
					Tools&ensp;<i class="fa fa-navicon "></i>
				</h3>
				<div class="options" id="tools">
					<h3>
						<a href="Bankdtls.jsp">SignUp</a>
					</h3>
					<h3>
						<a href="Bankdtls.jsp">SignIn</a>
					</h3>
					<h3>
						<a href="Banklogout">LogOut</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="passengerDetails">
		<div class="passengerhd1">
			<lable> <u><b>Check Your Bus Reservation Details</b></u></lable>
			<br>
		</div>
		<div class="passengerdiv1">
			<div class="passengerdiv2">
				<div class="pleft">Name</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bname")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Gender</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bgender")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Mail Id</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bmail")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">phone Number</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bnumber")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">from place</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bfromplace")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Destination</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bdestination")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Booking Date</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bpresentdate")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Journey Date</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("buserdate")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Tickets Price</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bTotalAmount")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">No Of Tickets</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bNoOfticktes")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Bus Number</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bbusno")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Departure Time</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bdtime")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Arrival Time</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("batime")%></div>
			</div>
			<div class="passengerdiv2">
				<div class="pleft">Bus Type</div>
				<div class="pmiddle">:</div>
				<div class="pright"><%=session.getAttribute("bbtype")%></div>
			</div>
		</div>
	</div>
	<div class="ok">
		<button>
			<a href="mainpage.jsp">OK</a>
		</button>
	</div>
	<script>
		function display() {
			var div = document.getElementById("tools")
			if (div.style.display === "none") {
				div.style.display = "block";
			} else {
				div.style.display = "none";
			}
		}
	</script>
</body>
</html>