<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Bus booking signIn page</title>
<script src="https://kit.fontawesome.com/11d61c8f58.js"
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<style>
body {
	background-image:
		url(https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1769&q=80);
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
}

form {
	padding-top: 20px;
	background: linear-gradient(rgba(4, 9, 30, 0.4), rgba(4, 9, 30, 0.4));
	width: 450px;
	height: 250px;
	margin-block-start: 12%;
	margin-inline-start: 50%;
	text-align: center;
	color: white;
}

.hd lable {
	font-size: 30px;
}

.inputfield {
	margin-block-start: 2%;
}

.inputs {
	
	display: inline-block;
	margin-block-start: 5%;
	text-align: center;
	width: 280px;
	height: 35px;
}

.inputs input {
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

.inputs input::placeholder {
	color:white;
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
		
	<form action="login" method="post">
		<div class="hd">
			<lable>
			<u><b>Sign In</b></u></lable>
			<br>
		</div>
		<div class="inputfield">
			<div class="inputs">
				<lable>
				<i class="fa-solid fa-envelope"></i></lable>
				<input type="email" name="mail" placeholder="Mail id" required />
			</div>
			<br>
			<div class="inputs">
				<lable>
				<i class="fa fa-lock"></i></lable>
				<input type="password" name="pword" placeholder="password" required />
			</div>
			<br>
			<div class="link">
				New user - <a href="registration.jsp">Click here</a>
			</div>
			<br>
			<div class="buttons">
				<input type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" />
			</div>
			<br>

		</div>
	</form>
	<script>
		var status = document.getElementById("status1").value;
		if (status == "fail") {
			swal("sorry", "please check Your mailId/password Wrong", "fail");
		}
		
	</script>

</body>
</html>