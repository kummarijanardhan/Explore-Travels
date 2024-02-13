<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus booking Registration page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>


<style>
body {
	background-image:
		url(https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1769&q=80);
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
}

form {
	border-radius: 5px;
	padding-top: 20px;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	width: 500px;
	height: 500px;
	margin-block-start: 10%;
	margin-inline-start: 50%;
	text-align: center;
	color: white;
}

.hd lable {
	font-size: 30px;
}

.inputfield {
	margin-block-start: 1%;
}

.name {
	display: inline-block;
	margin-block-start: 5%;
	text-align: center;
	width: 280px;
	height: 35px;
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
	height: 24px;
}

.name input::placeholder {
	color: white;
}

.link {
	margin-block-start: 15px;
}

.link a {
	text-decoration-color: red;
	color: white;
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
</style>
</head>
<body>
	<input type="hidden" id="status1"
		value="<%=request.getAttribute("status")%>" />

	<form action="register" method="post">
		<div class="hd">
			<lable> <u><b>Sign up</b></u></lable>
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
				<lable> <i class="fa fa-lock"></i></lable>
				<input type="password" name="pword" placeholder="password"
					id="password" required />
			</div>
			<br>
			<div class="name">
				<lable> <i class="fa fa-lock"></i></lable>
				<input type="password" name="cpword" id="cpassword"
					placeholder="Confirm password" required onkeyup="check()" /><br>
				<span id="message_to_user"></span>
			</div>
			<br>
			<div class="name">
				<lable> <i class="fa-solid fa-address-book"></i></lable>
				<input type="number" minlength="10" maxlength="10" name="num"
					id="phoneNo" placeholder="Mobile" required
					onkeyup="checkPhonenumber()" /><br> <span id="number_msg"></span>

			</div>
			<br>
			<div class="link">
				<a href="sign-in.jsp" target="_blank">Iam already a member</a>
			</div>
			<br> <span id="status_msg"></span><br><br>

			<div class="buttons">
				<input id="create" type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" />
			</div>
			<br>


		</div>
	</form>



	<script>
		function check() {
			var password = document.getElementById('password').value;
			var confirmpassword = document.getElementById('cpassword').value;
			if (password != confirmpassword) {
				document.getElementById('message_to_user').style.color = 'red';
				document.getElementById('message_to_user').innerHTML = 'password not matched';
				document.getElementById('create').disabled = true;
				document.getElementById('create').style.opacity = (0.4);

			} else {
				document.getElementById('message_to_user').style.color = 'green';
				document.getElementById('message_to_user').innerHTML = 'password matched';
				document.getElementById('create').disabled = false;
				document.getElementById('create').style.opacity = (1);
			}
		}

		var status = document.getElementById("status1").value;
		if(status == "Registartion is failed" ){
			document.getElementById("status_msg").innerHTML = '* This mail Id is Already Registered please go with Login Page';
			document.getElementById("status_msg").style.color = 'red';
		}
		
		function checkPhonenumber() {
			var number_msg = document.getElementById("number_msg");
			var phoneNo = document.getElementById("phoneNo");
			if (phoneNo.value.length === 10) {
				document.getElementById('number_msg').style.color = '#33ff00';
				document.getElementById("number_msg").innerHTML = '';
				document.getElementById("create").disabled = false;
				document.getElementById("create").style.opacity = (1);

			} else {
				document.getElementById('number_msg').style.color = 'red';
				document.getElementById("number_msg").innerHTML = 'PhoneNo must be have 10 digits';
				document.getElementById("create").disabled = true;
				document.getElementById('create').style.opacity = (0.4);

			}
		}
	</script>
</body>

</html>
