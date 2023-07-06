<%-- 
    Document   : List_users
    Created on : Jul 2, 2023, 10:52:47 PM
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
  <meta charset="UTF-8">
  <title>CodePen - Fixed table header</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./style.css">

</head>
<style>
  
table{
  width:100%;
  
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
  /*width: 200px;*/
 }
.tbl-content{
  height:100px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 30px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 25px;
  color: #e70909;
  text-transform: uppercase;
}
td{
  padding: auto ;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 20px;
  color: #0a0a0a;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  /* background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4); */
  background: -webkit-linear-gradient(left, #e5e5e2, #6b6c6a);
  background: linear-gradient(to right, #e5e5e2, #6b6c6a);

  font-family: 'Roboto', sans-serif;
}
section{
  /*margin: 50px;*/
  width: 60%;
  margin: 50px auto;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}

        
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
<body>
<!-- partial:index.partial.html -->
<section>
  <!--for demo wrap-->
  <h1>All Users</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
              <th>user</th>
              <th>password</th>
               <th>password</th>
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
              String query = "SELECT * FROM subscribers";
              Connection conn = DriverManager.getConnection(url, username, password);
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery(query);
              while (rs.next()) {
          %>
         <tr>
            <td><%= rs.getString("subscriber_name") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("password") %></td>
            <!--<td><%= rs.getString("password") %></td>-->
            
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

