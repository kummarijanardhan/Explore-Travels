<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore Travels Bank Details Page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
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

.text {
	margin-inline-start: 25px;
	margin-block-start: 10px;
}

.text input {
	padding-inline-start: 15px;
	width: 220px;
	outline: none;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	border-radius: 3px;
	color: white;
	font-size: 15px;
	margin-block-end: 5px;
	height: 35px;
	border: none;
}

.text input::placeholder {
	color: white;
	font-style: bold;
	font-size: 15px;
	color: white;
}

.buttons {
	display: inline-block;
	margin-block: 2%;
	text-align: center;
	margin-inline-start: 35px;
}

.buttons #create {
	border: none;
	font-size: 15px;
	display: inline-block;
	background-color: deeppink;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	height: 25px;
	width: 70px;
}

.Tprices {
	margin-inline-start: 35%;
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.4),
		rgba(255, 255, 255, 2));
	width: 350px;
	height: 350px;
	margin-block-start: 2%;
	border-radius: 5px;
}

.Tprices #password_Status {
	display: none;
	font-size: 18px;
	font-family: Times New Roman, serif;
	padding-inline: 50px;
	padding-block: 5px;
}

.Tprices #ph3 {
	text-align: center;
	padding-block: 15px;
}

.price1 {
	width: 350px;
	height: 300px;
	margin-inline: 5%;
}

.price2 {
	display: flex;
	height: 35px;
}

.pleft {
	width: 130px;
	padding-block-start: 6px;
	padding-inline: 10px;
	font-size: 16px;
	text-align: center;
}

.pmiddle {
	width: 10px;
	text-align: center;
	padding-block-start: 6px;
}

.pright {
	padding-block-start: 6px;
	font-size: 16px;
	width: 130px;
	padding-inline: 10px;
}

.pright input {
	width: 100px;
	padding-block: 2.5px;
	text-align: center;
	font-size: 16px;
	border: none;
	outline: none;
	background: none;
}

.buttons1 {
	margin-block-start: 5%;
	text-align: center;
	width: 300px;
	display: inline-block;
}

.password {
	padding-block-start: 6px;
	font-size: 16px;
	width: 130px;
	padding-inline: 10px;
}

.password input {
	width: 150px;
	padding-block: 2.5px;
	text-align: center;
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
}

.buttons1 #create1 {
	border: none;
	font-size: 15px;
	display: inline-block;
	background-color: deeppink;
	color: rgb(255, 255, 255);
	height: 30px;
	width: 220px;
	border-radius: 5px;
	font-size: 17.5px;
}

.buttons1 #create1:active {
	background-color: black;
	color: white;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("names") == null) {
		response.sendRedirect("mainpage.jsp");
	}
	%>

	<input type="hidden" id="correctdetails"
		value="<%=request.getAttribute("correctdetails")%>" />

	<input type="hidden" id="passwordStatus"
		value="<%=request.getAttribute("passwordStatus")%>" />

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
		<marquee dirction="left">Choose the Explore Travels Buses
			And make your journey freely and more comfortably and get a more
			Cashback offers on Bus bookings</marquee>
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
						<a href="Bankdtls.jsp" target="_blank">SignUp</a>
					</h3>
					<h3>
						<a href="Bankdtls.jsp" target="_blank">SignIn</a>
					</h3>
					<h3>
						<a href="Banklogout">LogOut</a>
					</h3>
				</div>
			</div>
		</div>

	</div>

	<div class="bcontent">
		<div class="btools">
			<div class="h3">
				<h3 id="h3" onclick="display1()">1. Check the Bank Balance</h3>
			</div>

			<form action="Bankbalnce" id="form" method="post">

				<input type="hidden" name="acountno"
					value="<%=session.getAttribute("acountno")%>" required />
				<div class="text">
					<input type="password" name="pword" placeholder="Password" required />
				</div>
				<div class="buttons">
					<input id="create" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						id="create" type="reset" />
				</div>
			</form>

		</div>
		<div class="Tprices">
			<h3 id="ph3">
				<u><b>Price Details</b></u>
			</h3>
			<div class="price1">
				<form action="payment" method="post">

					<input type="hidden" name="name"
						value="<%=session.getAttribute("Passname")%>" /> <input
						type="hidden" name="gender"
						value="<%=session.getAttribute("Passgender")%>" /> <input
						type="hidden" name="mail"
						value="<%=session.getAttribute("Passmail")%>" /> <input
						type="hidden" name="number"
						value="<%=session.getAttribute("Passnum")%>" /> <input
						type="hidden" name="fromplace"
						value="<%=session.getAttribute("spoint")%>" /> <input
						type="hidden" name="destination"
						value="<%=session.getAttribute("destination")%>" /> <input
						type="hidden" name="presentdate"
						value="<%=session.getAttribute("presentdate")%>" /> <input
						type="hidden" name="userdate"
						value="<%=session.getAttribute("userdate")%>" /> <input
						type="hidden" name="busno"
						value="<%=session.getAttribute("pabusno")%>" /> <input
						type="hidden" name="dtime"
						value="<%=session.getAttribute("dtime")%>" /> <input
						type="hidden" name="atime"
						value="<%=session.getAttribute("atime")%>" /> <input
						type="hidden" name="btype"
						value="<%=session.getAttribute("Btype")%>" /> <input
						type="hidden" name="totalseats"
						value="<%=session.getAttribute("totalSeats")%>" /> <input
						type="hidden" name="acountno"
						value="<%=session.getAttribute("acountno")%>" />

					<div class="price2">
						<div class="pleft">Single Ticket Price</div>
						<div class="pmiddle">:</div>
						<div class="pright">
							<input type="text" name="ST"
								value="<%=session.getAttribute("rate")%>" readonly />
						</div>
					</div>
					<div class="price2">
						<div class="pleft">No Of Tickets</div>
						<div class="pmiddle">:</div>
						<div class="pright">
							<input type="text" name="NT"
								value="<%=session.getAttribute("PassTickets")%>" readonly />
						</div>
					</div>
					<div class="price2">
						<div class="pleft">GST</div>
						<div class="pmiddle">:</div>
						<div class="pright">
							<input type="text" name="GST" value="<%="0.02%"%>" readonly />
						</div>
					</div>
					<div class="price2">
						<div class="pleft">Total Amount</div>
						<div class="pmiddle">:</div>
						<div class="pright">
							<input type="text" name="TA"
								value="<%=session.getAttribute("TotalTicketsPrice")%>" readonly />
						</div>
					</div>

					<div class="price2">
						<div class="pleft">Acount Password</div>
						<div class="pmiddle">:</div>
						<div class="password">
							<input type="password" name="password" required />
						</div>
					</div>
					<br> <span id="password_Status"></span>

					<div class="buttons1">
						<input id="create1" type="submit" value="Proceed to Payment" />
					</div>
				</form>

			</div>
		</div>
	</div>
	<script>
		var passwordStatus = document.getElementById("passwordStatus").value;
		if (passwordStatus == "password is wrong") {
			document.getElementById("password_Status").innerHTML = '* please check the password';
			document.getElementById("password_Status").style.color = 'red';
			document.getElementById("password_Status").style.display = 'block';
		} else {
			document.getElementById("password_Status").style.display = 'none';
		}
		function display() {
			var div = document.getElementById("tools")
			if (div.style.display === "none") {
				div.style.display = "block";
			} else {
				div.style.display = "none";
			}
		}
		function display1() {
			var div1 = document.getElementById("form")
			if (div1.style.display === "none") {
				div1.style.display = "block";
			} else {
				div1.style.display = "none";
			}
		}
		var status = document.getElementById("correctdetails").value;
		if (status === "okk") {
			var bankblce = "${bankblce}";
			var acountholdername = "${acountholdername}";
			swal(acountholdername ,"Your Bank Balance is : " + bankblce, "okk");
		}else if(status == "fail"){
			swal("Sorry","please check the password","fail")
		}
	</script>
</body>
</html>