package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.DeleteDao;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
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
		String id=request.getParameter("id");
		//String i=request.getParameter("id");      
			          
		HttpSession session = request.getSession(false);  
		if(session!=null)  
			session.setAttribute("id", id);  
		System.out.println(id);
			if(DeleteDao.deleteFriend(id)){    
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

	}

