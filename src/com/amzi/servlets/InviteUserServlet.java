package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import java.io.PrintWriter;  
import java.util.Properties;

/**
 * Servlet implementation class InviteUserServlet
 */
@WebServlet("/InviteUserServlet")
public class InviteUserServlet extends HttpServlet {
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

		PrintWriter out = response.getWriter();  
		String userEmail=request.getParameter("userEmail");
		String fromemail = "test@gmail.com";
		String host = "localhost";
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "2525");  // set the required port

        Session session = Session.getDefaultInstance(properties);
        
        try {               

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromemail)); // set required email address 
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail)); // set required email address 

            message.setSubject("Derp Join Request");

            message.setText("You have received Derp request from"+fromemail);

          //  Transport.send(message);
            Transport transport = session.getTransport("smtp");
            transport.connect(host,fromemail);
            transport.send(message);
            transport.close();

            response.sendRedirect(response.encodeRedirectURL("email.jsp"));
        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}

}
