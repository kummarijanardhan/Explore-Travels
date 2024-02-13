<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore Traveles bank Registration & signIn page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="headingstyle.css">

<style>
.title {
	text-align: center;
	margin-block: 10px 15px;
	color: red;
}

.div1 {
	margin-inline: 15%;
	height: 510px;
	width: 70%;
}

.div2, .div3, .div4 {
	color: white;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	width: 80%;
	margin-inline: 15%;
	display: flex;
	padding-inline-start: 3%;
}

#h3 {
	cursor: pointer;
	border: 1px solid red;
	border-radius: 5px;
	height: 25px;
	margin-block: 2% 1%;
	padding: 5px;
	background-color: red;
}

.Breg {
	display: none;
	margin-inline-start: 5%;
	padding-block-start: 2%;
}

.login {
	display: none;
	margin-inline-start: 25%;
	padding-block-start: 2%;
}

.cardOper {
	display: none;
	margin-inline-start: 25%;
	padding-block-start: 2%;
	padding-block-end: 15px;
}

.text input, select {
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

select option {
	background-color: black;
	color: white;
}

.text #tprice {
	color: #ffff00;
}

.text input::placeholder {
	font-style: bold;
	font-size: 15px;
	color: white;
}

.buttons {
	display: inline-block;
	margin-block-start: 1%;
	text-align: center;
}

.buttons #create, #create1, #RegSubButton {
	border: none;
	font-size: 15px;
	display: inline-block;
	background-color: deeppink;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	height: 25px;
	width: 70px;
}

</style>
</head>
<body>


	<input type="hidden" id="confirm"
		value="<%=request.getAttribute("confirm")%>" />

	<input type="hidden" id="loginStatus"
		value="<%=request.getAttribute("loginStatus")%>" />

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
			And make your journey freely and more comfortably and get a more Cash
			back offers on Bus bookings</marquee>
	</div>

	<div class="title">
		<h1>
			<u>Choose Your Payment Options</u>
		</h1>
	</div>
	<div class="div1">
		<div class="div2">
			<h3 id="h3" onclick="display()">1. Creat a Explore Travels Bank
				Acount</h3>
			<div class="Breg" id="Bform">
				<form action="Bankdetails" method="post">
					<div class="text">
						<lable> <input type="text" name="name"
							placeholder="user Name" required /></lable>
					</div>
					<div class="text">
						<lable> <input type="email" name="mail"
							placeholder="Email" required /></lable>
					</div>
					<div class="text">
						<lable> <input type="password" name="pword" id="password"
							placeholder="Password" required /></lable>
					</div>
					<div class="text">
						<lable> <input type="password" id="cpassword"
							placeholder="Confirm Password" onkeyup="check()" required /></lable>
						<br> <span id="message_to_user"></span>
					</div>
					<div class="text">
						<lable> <input type="number" name="pnum" minlength="10"
							maxlength="10" placeholder="Phone Number"
							onkeyup="checkPhonenumber()" id="pnum" required /></lable>
						<br> <span id="number_msg"></span>
					</div>

					<div class="text">
						<lable> <input type="number" name="amount"
							placeholder="Deposite ur Blce Amount" required /></lable>
					</div>
					<div class="text">
						<lable> <select required name="Atype">
							<option value="current">Current</option>
							<option value="savings">Savings</option>
						</select></lable>
					</div>
					<div class="buttons">
						<input id="RegSubButton" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							id="create" type="reset" />
					</div>
					<br>
				</form>
			</div>
		</div>
		<div class="div3">
			<h3 id="h3" onclick="display1()">2. Bank Acount Login</h3>
			<div class="login" id="lform">
				<form action="Banksign" method="post">
					<div class="text">
						<lable> <input type="text" name="Anum"
							placeholder="Acount No" required /></lable>
					</div>
					<div class="text">
						<lable> <input type="password" name="pword"
							placeholder="Password" required /></lable>
					</div>

					<div class="buttons">
						<input id="create" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							id="create" type="reset" />
					</div>
				</form>
			</div>
		</div>
		<div class="div4">
			<h3 id="h3" onclick="display2()">3. Pay via Debit Card</h3>
			<div class="cardOper" id="cardope">
				<form action="viadebit" method="post">
					<div class="text">
						<lable> <input type="number" id="cardnum" name="cardnum"
							placeholder="Atm Card number" minlength="16" maxlength="16"
							onkeyup="checkATMnumber()" required /></lable>
						<br> <span id="message_to_atmuser"></span>
					</div>
					<div class="text">
						<lable> <input type="month" name="expmonth"
							placeholder="foo" required /></lable>
					</div>
					<div class="text">
						<lable> <input type="number" name="cvv" placeholder="CVV"
							onkeyup="checkcvv()" id="cvv" minlength="3" maxlength="3"
							required /></lable>
						<br> <span id="message_to_cvvuser"></span>
					</div>
					<br>
					<div class="buttons">
						<input id="create1" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							id="create1" type="reset" />
					</div>
				</form>
			</div>
		</div>

	</div>



	<script type="text/javascript">
		var loginStatus = document.getElementById("loginStatus").value;
		if (loginStatus === "fail") {
			swal("sorry", "please check Your AcountNo/password wrong", "fail");

		} 

		function display() {
			var div = document.getElementById("Bform")
			if (div.style.display === "none") {
				div.style.display = "block";
			} else {
				div.style.display = "none";
			}
		}
		function display1() {
			var form = document.getElementById("lform")
			if (form.style.display === "none") {
				form.style.display = "block";
			} else {
				form.style.display = "none";
			}
		}
		function display2() {
			var form = document.getElementById("cardope")
			if (form.style.display === "none") {
				form.style.display = "block";
			} else {
				form.style.display = "none";
			}
		}

		function check() {
			var password = document.getElementById('password').value;
			var confirmpassword = document.getElementById('cpassword').value;
			if (password != confirmpassword) {
				document.getElementById('message_to_user').style.color = 'red';
				document.getElementById('message_to_user').innerHTML = 'password not matched';
				document.getElementById('create').disabled = true;
				document.getElementById('create').style.opacity = (0.4);

			} else {
				document.getElementById('message_to_user').style.color = '#33ff00';
				document.getElementById('message_to_user').innerHTML = 'password matched';
				document.getElementById('create').disabled = false;
				document.getElementById('create').style.opacity = (1);
			}
		}
		function checkATMnumber() {
			var cardnumbers = document.getElementById("cardnum");
			if ((cardnumbers.value.length === 16)) {
				document.getElementById('message_to_atmuser').innerHTML = '';
				document.getElementById('create1').disabled = false;
				document.getElementById('create1').style.opacity = (1);

			} else {
				document.getElementById('message_to_atmuser').style.color = 'red';
				document.getElementById('message_to_atmuser').innerHTML = 'Card number must be 16 digits';
				document.getElementById('create1').disabled = true;
				document.getElementById('create1').style.opacity = (0.4);
			}
		}
		function checkPhonenumber() {
			var number_msg = document.getElementById("number_msg");
			var phoneNo = document.getElementById("pnum");
			if (phoneNo.value.length === 10) {
				document.getElementById('number_msg').style.color = '#33ff00';
				document.getElementById("number_msg").innerHTML = '';
				document.getElementById("RegSubButton").disabled = false;
				document.getElementById("RegSubButton").style.opacity = (1);

			} else {
				document.getElementById('number_msg').style.color = 'red';
				document.getElementById("number_msg").innerHTML = 'PhoneNo must be have 10 digits';
				document.getElementById("RegSubButton").disabled = true;
				document.getElementById('RegSubButton').style.opacity = (0.4);

			}
		}
		function checkcvv() {
			var cvvnumbers = document.getElementById("cvv");
			if ((cvvnumbers.value.length === 3)) {
				document.getElementById('message_to_cvvuser').innerHTML = '';
				document.getElementById('create1').disabled = false;
				document.getElementById('create1').style.opacity = (1);

			} else {
				document.getElementById('message_to_cvvuser').style.color = 'red';
				document.getElementById('message_to_cvvuser').innerHTML = 'cvv number is must be 3 digits';
				document.getElementById('create1').disabled = true;
				document.getElementById('create1').style.opacity = (0.4);
			}
		}
		var status = document.getElementById("confirm").value;
		if (status == "ok") {
			var acountno = "${acno}";
			swal(acountno,"YOUR BANK ACOUNT NUMBER IS","ok")
		}
	</script>
</body>
</html>

