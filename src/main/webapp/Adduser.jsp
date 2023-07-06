<%-- 
    Document   : index
    Created on : Jun 26, 2023, 3:19:26 PM
    Author     : esraa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// Check if session exists and user is logged in
if (session == null || session.getAttribute("username") == null) {
    // User is not logged in, redirect to the login page
    response.sendRedirect("index.jsp");
    return; // Return to prevent further processing of the JSP
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    
    <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
 <style>
        
.b2 {
  /* display: block; */
     display: inline; 
     /*float: left;*/
  width: 20%;
  border: none;
  background-color: #e87d6a;
  /* padding: 14px 28px; */
  font-size: 30px;
  cursor: pointer;
  text-align: center;
  padding: 20px;
  margin-left:725px;
  border-radius: 20%;
}
a{
  text-decoration: none;
}
.btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.btnn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  min-width: 120px;
  height: 50px;
  border-radius: 25px;

  background: #9152f8;
  background: -webkit-linear-gradient(bottom, #7579ff, #b224ef);
  background: -o-linear-gradient(bottom, #7579ff, #b224ef);
  background: -moz-linear-gradient(bottom, #7579ff, #b224ef);
  background: linear-gradient(bottom, #7579ff, #b224ef);
  position: relative;
  z-index: 1;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.btnn::before {
  content: "";
  display: block;
  position: absolute;
  z-index: -1;
  width: 100%;
  height: 100%;
  border-radius: 25px;
  background-color: #fff;
  top: 0;
  left: 0;
  opacity: 1;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.btnn:hover {
  color: #fff;
}

.btnn:hover:before {
  opacity: 0;
}

    </style>
</head>
<body>
	    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="AddUser">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Add user
					</span>

					<div class="wrap-input100 validate-input" data-validate = "enter user name">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
                                    <div class="wrap-input100 validate-input" data-validate="Enter sudo password">
						<input class="input100" type="text" name="domain" placeholder="domain">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							create new user
						</button>
                                            
					</div>
                                    

				</form>
                                        <div class="btn">
                                                <a href="index2.jsp" class="btnn">
                                                        return to main page
                                                </a>
                                        </div>

			</div>
		</div>
	</div>
	
<!--<button type="button" class="b2"><a href="index2.html">return to main page</a></button>--> 
	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "failed") {
            swal("Username already exists. Please choose a different username.");
        }
        if (status === "success") {
            swal("user added");
        }
    </script>
</body>
</html>
<!--
<html>
<head>
    <title>Add User</title>
</head>
<body>
    <h2>Add User</h2>
    <form action="AddUser" method="post">
        Username: <input type="text" name="username"><br>
        password:<input type="password" name="password"><br>
        Sudo Password: <input type="password" name="sudoPassword"><br>
        <input type="submit" value="Add User">
    </form>
</body>
</html>-->
