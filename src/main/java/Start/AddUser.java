/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Start;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*; 
/**
 *
 * @author esraa
// */
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("Adduser.jsp");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String domain = request.getParameter("domain");
        String password = request.getParameter("password");

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/grad", "postgres", "123");

            PreparedStatement checkStatement = con.prepareStatement(
                    "SELECT * FROM subscribers5 WHERE username = ?"
            );
            checkStatement.setString(1, username);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
//                out.print("Username already exists. Please choose a different username.");
                  request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
            request.getRequestDispatcher("Adduser.jsp").include(request, response);
            } else {
                PreparedStatement insertStatement = con.prepareStatement(
                        "INSERT INTO subscribers5 (username, domain, password, ha1, ha1b) " +
                                "VALUES (?, ?, ?, md5(concat(?, ':', ?, ':', ?)), md5(concat(md5(concat(?, ':', ?, ':', ?)), ':', 'nonce', ':', 'ha2')))"
                );

                insertStatement.setString(1, username);
                insertStatement.setString(2, domain);
                insertStatement.setString(3, password);
                insertStatement.setString(4, username);
                insertStatement.setString(5, domain);
                insertStatement.setString(6, password);
                insertStatement.setString(7, username);
                insertStatement.setString(8, domain);
                insertStatement.setString(9, password);

                int rowsAffected = insertStatement.executeUpdate();
                if (rowsAffected > 0) {
//                    out.print("You are successfully registered...");
                     request.setAttribute("status", "success");
//            //out.println("Invalid username or password. Please try again.");
            request.getRequestDispatcher("Adduser.jsp").include(request, response);
                }
            }

            con.close();
        } catch (Exception ex) {
//            System.out.println(ex);
 request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
            request.getRequestDispatcher("Adduser.jsp").include(request, response);
        }

        out.close();
    }
}

//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
//
//public class AddUser extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        String sudoPassword = request.getParameter("sudoPassword");
//
//        // Construct the command to add the new user
//        String command = String.format("sudo useradd %s", username);
//        String[] cmd;
//        if (isWindows()) {
//            cmd = new String[]{"cmd.exe", "/c", command};
//        } else {
//            cmd = new String[]{"/bin/sh", "-c", "echo " + sudoPassword + " | sudo -S " + command};
//        }
//
//        Process process = Runtime.getRuntime().exec(cmd);
//
//        try {
//            int exitCode = process.waitFor();
//            if (exitCode == 0) {
////                response.getWriter().println("User created successfully!");
//request.setAttribute("status", "success");
//            //out.println("Invalid username or password. Please try again.");
//            request.getRequestDispatcher("Adduser.jsp").include(request, response);
//            } else {
////                response.getWriter().println("Error creating user.");
//                  request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
//            request.getRequestDispatcher("Adduser.jsp").include(request, response);
//            }
//        } catch (InterruptedException e) {
////            response.getWriter().println("Error creating user.");
//              request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
//            request.getRequestDispatcher("Adduser.jsp").include(request, response);
//            e.printStackTrace();
//        }
//    }
//
//    private boolean isWindows() {
//        String os = System.getProperty("os.name").toLowerCase();
//        return os.startsWith("windows");
//    }
//}
