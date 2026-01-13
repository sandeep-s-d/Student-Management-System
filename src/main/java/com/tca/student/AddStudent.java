package com.tca.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("Add.jsp");
		rd.forward(request, response);
		//response.sendRedirect("Add.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con= null;
		PreparedStatement ps = null;
		
		final String DB_URL ="jdbc:postgresql://localhost/ajdb";
		final String DB_USER = "root";
		final String DB_PWD  = "root@123";
		
		/* fetching values*/
		
		int rno = Integer.parseInt(request.getParameter("rno"));
	    String name = request.getParameter("name");
	    double per = Double.parseDouble(request.getParameter("per"));
	    
	    String message = "";
	    
	    response.setContentType("text/html");
	   // PrintWriter out = response.getWriter();
	    
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			con.setAutoCommit(false);
			
			ps = con.prepareStatement("Insert into student values(?,?,?)");
			ps.setInt(1, rno);
			ps.setString(2, name);
			ps.setDouble(3, per);
			ps.executeUpdate();
			con.commit();
			
			message = "<div class='alert alert-success mt-3 container text-center' role='alert'> Record saved Succesfully !! </div>";
			
			
	}
	catch(Exception e) {
		
		e.printStackTrace();
		message = "<div class='alert alert-danger mt-3 container text-center' role='alert'>Unable to save record !!! </div>";
		
		try {
			con.rollback();
		} 
		catch (SQLException e1) {
			e1.printStackTrace();
		}
		
	}
	finally {
		try {
			
			con.close();
		} 
		catch (SQLException e) {

			e.printStackTrace();
			message = "<div class='alert alert-danger mt-3 container text-center' role='alert'>unalbe to save record !! </div>";
		}
	}
		request.setAttribute("msg", message);
		RequestDispatcher rd = request.getRequestDispatcher("Add.jsp");
		rd.forward(request, response);
}
}
