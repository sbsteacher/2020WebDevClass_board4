package com.koreait.board4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller {
	private static UserController uCont = new UserController();
	
	public static void goToErr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsp = "/WEB-INF/view/err.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}
	
	public static void nav(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String url = "/user/login.korea";
		String[] urlArr = request.getRequestURI().split("/");						

		switch(urlArr[1]) {
			case "user":				
				switch(urlArr[2]) {
					case "login.korea":
					uCont.login(request, response);
					return;
				}	
			break;
			case "board":
				
			break;	
			
		}
		goToErr(request, response);
	}
}
