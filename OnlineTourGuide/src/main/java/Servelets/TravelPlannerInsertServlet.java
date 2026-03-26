package Servelets;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.TravelPlanner;
import Services.TravelPlannerDBUtil;


@WebServlet("/TravelPlannerInsertServlet")
@MultipartConfig
public class TravelPlannerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       

	//Polymorphism
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TravelPlanner tPlanner=new TravelPlanner();
		String UserName = request.getParameter("UserName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        
        // Handle Profile Picture upload
        String profi=null;
        Part filePart = request.getPart("ProfilePic"); // Retrieve the file part
        if(filePart!=null && filePart.getSize()>0) {
        	String fileName=filePart.getSubmittedFileName();
        	String uploadPath=getServletContext().getRealPath("") + File.separator + "uploads";
        	File uploadDir=new File(uploadPath);
        	if(!uploadDir.exists()) {
        		uploadDir.mkdir();
        	}
        	String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            profi="uploads/" + fileName;
        }
       /* byte[] ProfilePic = null;
        if (filePart != null && filePart.getSize() > 0) {  // Check if file is not null or empty
            try (InputStream inputStream = filePart.getInputStream();
                 ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    byteArrayOutputStream.write(buffer, 0, bytesRead);
                }

                ProfilePic = byteArrayOutputStream.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error uploading profile picture.");
                RequestDispatcher dis = request.getRequestDispatcher("ErrorPage.jsp");
                dis.forward(request, response);
                return; // Exit if there is an error
            	}
        	}*/

	        // Parse Create Date from string
	        String createDateStr = request.getParameter("CreateDate");
	        Date CreateDate = null;
	        if (createDateStr != null && !createDateStr.isEmpty()) {
	            try {
	                // Use LocalDate for safer date parsing
	                LocalDate localDate = LocalDate.parse(createDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
	                CreateDate = Date.valueOf(localDate);
	            } catch (DateTimeParseException e) {
	                request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-mm-dd.");
	                RequestDispatcher dis = request.getRequestDispatcher("ErrorPage.jsp");
	                dis.forward(request, response);
	                return; // Exit if there is an error
	            }
	        } else {
	            request.setAttribute("errorMessage", "Create Date cannot be empty.");
	            RequestDispatcher dis = request.getRequestDispatcher("ErrorPage.jsp");
	            dis.forward(request, response);
	            return; // Exit if there is an error
	        }
	        String phone = request.getParameter("mobile");
	        // Call the database utility to insert the travel planner
	        //String UserName, String password, String email, String FirstName, String LastName, byte[] ProfilePi, Date CreateDate,String mobile
	        boolean isTrue = TravelPlannerDBUtil.InsertTravelPlanner(UserName, password, email, FirstName, LastName, profi, CreateDate,phone);
	        
	        // Redirect based on the result of the insert operation
	        if (isTrue) {
	            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
	            dis.forward(request, response);
	        } else {
	            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
	            dis2.forward(request, response);
	        }
	    
	}

}
