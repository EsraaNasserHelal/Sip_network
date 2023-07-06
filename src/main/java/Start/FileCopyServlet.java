/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Start;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author esraa
 */
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(name = "Uploadaudiofile", urlPatterns = {"/Uploadaudiofile"})
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileCopyServlet")
public class FileCopyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WatchService watchService;

    @Override
    public void init() throws ServletException {
        super.init();

        // Path of the source directory to watch for new files
        String sourceDirectory = "./css";

        try {
            // Create a WatchService
            watchService = FileSystems.getDefault().newWatchService();

            // Register the source directory for ENTRY_CREATE events
            Path sourcePath = Paths.get(sourceDirectory);
            sourcePath.register(watchService, StandardWatchEventKinds.ENTRY_CREATE);
        } catch (IOException e) {
            throw new ServletException("Error initializing WatchService", e);
        }

        // Start a separate thread to handle file copy events
        Thread thread = new Thread(this::processEvents);
        thread.start();
    }

    private void processEvents() {
        try {
            while (true) {
                WatchKey key = watchService.take(); // Wait for events
                for (WatchEvent<?> event : key.pollEvents()) {
                    if (event.kind() == StandardWatchEventKinds.ENTRY_CREATE) {
                        // Get the file name of the newly created file
                        String fileName = event.context().toString();
                        String sourceFilePath = "./css" + fileName;
                        String destinationFolder = getServletContext().getRealPath("./folder");
                        String destinationFilePath = destinationFolder + File.separator + fileName;

                        // Copy the file to the destination folder
                        try {
                            Files.copy(Paths.get(sourceFilePath), Paths.get(destinationFilePath), StandardCopyOption.REPLACE_EXISTING);
                            System.out.println("File copied successfully: " + fileName);
                        } catch (IOException e) {
                            System.out.println("Error copying file: " + fileName);
                            e.printStackTrace();
                        }
                    }
                }
                key.reset(); // Reset the key
            }
        } catch (InterruptedException e) {
            System.out.println("File copy thread interrupted");
        } finally {
            try {
                watchService.close(); // Close the WatchService
            } catch (IOException e) {
                System.out.println("Error closing WatchService");
                e.printStackTrace();
            }
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            watchService.close(); // Close the WatchService
        } catch (IOException e) {
            System.out.println("Error closing WatchService");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("FileCopyServlet is running");
    }
}
