package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;  

import javax.servlet.RequestDispatcher;   
import javax.servlet.http.HttpSession; 

import com.amzi.dao.DeleteDao;
import com.amzi.dao.LoginDao;
import com.amzi.dao.DeleteDao;

import java.util.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub response.setContentType("text/html");    
		PrintWriter out = response.getWriter();  
		String i=request.getParameter("id");      
			          
		HttpSession session = request.getSession(false);  
		if(session!=null)  
			session.setAttribute("id", i);  
		System.out.println("session");
			if(DeleteDao.deleteFriend(i)){    
			    RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
			    rd.forward(request,response);  
			    //ToDo a proper redirect
			}    
			else{    
			    RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
			   rd.include(request,response);    
			}    
		out.close(); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");   
          
        HttpSession session = request.getSession(false);  
        if(session!=null)  
        session.setAttribute("name", n);  
  
        if(LoginDao.validate(n, p)){    
            RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
            rd.forward(request,response);   
            List list=LoginDao.fetchUser();

            request.setAttribute("data", list);
            rd.forward(request, (ServletResponse) request);
        }    
        else{    
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
            rd.include(request,response);    
        } 
        
  
        out.close();    
	}

}
