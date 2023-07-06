<%-- 
    Document   : users
    Created on : Jul 3, 2023, 5:48:09 PM
    Author     : esraa
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    </style>
  <meta charset="UTF-8">
  <title>CodePen - Fixed table header</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<section>
  <!--for demo wrap-->
  <h1>All Users</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
              <th>id</th>
              <th>username</th>
              <th>domain</th>
              <th>password</th>
              
            </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
          <%
            try {
              Class.forName("org.postgresql.Driver");
              String url = "jdbc:postgresql://localhost:5432/grad";
              String username = "postgres";
              String password = "123";
              String query = "SELECT * FROM subscriber";
              Connection conn = DriverManager.getConnection(url, username, password);
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery(query);
              while (rs.next()) {
          %>
         <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("domain") %></td>
            <td><%= rs.getString("password") %></td>
            
          </tr>
        <%
              }
              rs.close();
              stmt.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
      </tbody>
    </table>
  </div>
</section>
<button type="button" class="b2"><a href="index2.jsp">return to main page</a></button> 


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
