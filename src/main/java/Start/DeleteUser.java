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
///**
// *
// * @author esraa
// */
@WebServlet(name = "DeleteUser", urlPatterns = {"/DeleteUser"})
public class DeleteUser extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("Deleteuser.jsp");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/grad", "postgres", "123");

            PreparedStatement checkStatement = con.prepareStatement(
                    "SELECT * FROM subscribers5 WHERE username = ?"
            );
            checkStatement.setString(1, username);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                PreparedStatement deleteStatement = con.prepareStatement(
                        "DELETE FROM subscribers5 WHERE username = ?"
                );
                deleteStatement.setString(1, username);

                int rowsAffected = deleteStatement.executeUpdate();
                if (rowsAffected > 0) {
//                    out.print("User deleted successfully");
                  request.setAttribute("status", "success");
//            //out.println("Invalid username or password. Please try again.");
                  request.getRequestDispatcher("Deleteuser.jsp").include(request, response);
                 }
            } else {
//                out.print("User does not exist");
                  request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
                  request.getRequestDispatcher("Deleteuser.jsp").include(request, response);
            }

            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
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
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//@WebServlet(name = "DeleteUser", urlPatterns = {"/DeleteUser"})
//
//public class DeleteUser extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//                  throws ServletException, IOException {
//        String username = request.getParameter("username");
////        String password = request.getParameter("password");
//
//        String sudoPassword = request.getParameter("sudoPassword");
//
//        // Construct the command to add the new user
//        String command = String.format("sudo userdel %s", username);
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
//            request.getRequestDispatcher("Deleteuser.jsp").include(request, response);
//            } else {
////                response.getWriter().println("Error creating user.");
//                  request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
//            request.getRequestDispatcher("Deleteuser.jsp").include(request, response);
//            }
//        } catch (InterruptedException e) {
////            response.getWriter().println("Error creating user.");
//              request.setAttribute("status", "failed");
//            //out.println("Invalid username or password. Please try again.");
//            request.getRequestDispatcher("Deleteuser.jsp").include(request, response);
//            e.printStackTrace();
//        }
//    }
//
//    private boolean isWindows() {
//        String os = System.getProperty("os.name").toLowerCase();
//        return os.startsWith("windows");
//    }
//}
