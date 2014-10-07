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
import com.amzi.dao.AddContactDao;

/**
 * Servlet implementation class AddContactServlet
 */
@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String e=request.getParameter("email");    
		String d=request.getParameter("derpname");    
			          
			if(AddContactDao.addContact(n, e, d)){    
			    RequestDispatcher rd=request.getRequestDispatcher("success.jsp");    
			    rd.forward(request,response);  
			    //ToDo a proper redirect
			}    
			else{    
			   RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
			   rd.include(request,response);    
			}    
		out.close(); 
	}

}
