package com.amzi.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;  
import javax.servlet.RequestDispatcher;   
import javax.servlet.http.HttpSession; 
import com.amzi.dao.RegistrationDao;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				response.setContentType("text/html");    
		        PrintWriter out = response.getWriter();    
		          
		        String n=request.getParameter("name");    
		        String p=request.getParameter("pass");   
		        String e=request.getParameter("email");    
		          
		        HttpSession session = request.getSession(false);  
		        if(session!=null)  
		        session.setAttribute("name", n);  
		  
		        if(RegistrationDao.registration(n, p, e)){    
		            RequestDispatcher rd=request.getRequestDispatcher("success.jsp");    
		            rd.forward(request,response);    
		        }    
		        else{    
		            out.print("<p style=\"color:red\">Sorry we had some issue come back later</p>");    
		            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
		            rd.include(request,response);    
		        }    
		  
		        out.close(); 
	}

}
