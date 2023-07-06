<%-- 
    Document   : index2
    Created on : Jul 4, 2023, 6:52:44 PM
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
<html lang="en" >
<head>
    <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
  <meta charset="UTF-8">
  <title>CodePen - Fixed table header</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./style.css">
<style>
    
.b3 {
  /* display: block; */
     display: inline; 
     float: left;
  width: 35%;
  border: none;
  background-color: #e87d6a;
  /* padding: 14px 28px; */
  font-size: 30px;
  cursor: pointer;
  text-align: center;
  padding: 20px;
  margin:100px;
  border-radius: 20%;
}
a{
  text-decoration: none;
}

</style>
</head>
<body>
    
<!-- partial:index.partial.html -->
<section>
  <!--for demo wrap-->

<!-- 
<button> <a href="index.html">list all users</a></button> -->
<h2>Sip network</h2>
<h2>Welcome to your dashboard</h2>
<button type="button" class="b1"><a href="All_calls.jsp">list All Calls</a></button> 

<button type="button" class="b1"><a href="Missed_Calls.jsp">List Missed Calls</a></button> 

<button type="button" class="b1"><a href="users.jsp">List All Users</a></button>

<button type="button" class="b1"><a href="Adduser.jsp">Add User</a></button> 

<button type="button" class="b3"><a href="Deleteuser.jsp">Delete User</a></button> 
<button type="button" class="b3"><a href="/graduation_template/Logout">Logout</a></button> 


</section>


<!-- follow me template -->
<div class="made-with-love">
  Telecom application development
  <i>♥</i> 
  <a target="_blank" href="https://www.iti.gov.eg/">ITI</a>
</div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
</body>
</html>

