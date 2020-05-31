package com.learn.mycart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         HttpSession httpSession=request.getSession();
         httpSession.removeAttribute("current-user");
         httpSession.setAttribute("message", "You are Successfully logout !!!");
		   
		 response.sendRedirect("login.jsp");
		
		
	}

}
