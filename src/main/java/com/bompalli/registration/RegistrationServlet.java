package com.bompalli.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher dispatcher=null;
		
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String upwd=request.getParameter("pass");
		String umobile=request.getParameter("contact");
		String confirmPwd=request.getParameter("re_pass");
		//PrintWriter out=response.getWriter();
		//out.print(uname+" "+uemail+" "+upwd+" "+umobile);
		Connection con=null;
		
		if(uname==null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(email==null || email.equals("")) {
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(upwd==null || upwd.equals("")) {
			request.setAttribute("status", "invalidPwd");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(!upwd.equals(confirmPwd)) {
			request.setAttribute("status", "invalidconfirmPwd");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(umobile==null || umobile.equals("")) {
			request.setAttribute("status","invalidMobile");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}else if(umobile.length()!=10) {
			request.setAttribute("status","invalidMobilelength");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/youtube?useSSL=false","root","root");
			PreparedStatement ps=con.prepareStatement("insert into users(uname,upwd,email,umobile) values(?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, upwd);
			ps.setString(3, email);
			ps.setString(4, umobile);
			int rowCount=ps.executeUpdate();
			dispatcher=request.getRequestDispatcher("registration.jsp");
			if(rowCount>0 ) {
				//System.out.println("record inserted");
				request.setAttribute("status", "success");	
		}else{
			request.setAttribute("status", "failure");
		}
		dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
			con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			}
		}

}
