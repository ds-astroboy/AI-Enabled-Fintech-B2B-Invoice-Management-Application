package com.highradius.internship;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customer_name=request.getParameter("customer_name");
		String duedate=request.getParameter("duedate");
		String customer_no=request.getParameter("customer_no");
		String invoice_no=request.getParameter("invoice_no");
		String invoice_amount=request.getParameter("invoice_amount");
		String notes=request.getParameter("notes");
		
         try{  
        	String urll="jdbc:mysql://localhost:3306/invoicedata";
          	String un="root";
          	String pass="kapil@9444106082";
          	String queryy="INSERT INTO invoice (name_customer_en,cust_number_en,invoice_id,total_open_amount,due_date,Notes) VALUES (?,?,?,?,?,?)";
          	
         	Class.forName("com.mysql.cj.jdbc.Driver");  
         	Connection connect=DriverManager.getConnection(urll,un,pass);           
         	PreparedStatement st=connect.prepareStatement(queryy);  
         	st.setString(1,customer_name); 
         	st.setString(2,customer_no); 
         	st.setString(3,invoice_no); 
         	st.setString(4,invoice_amount); 
         	st.setString(5,duedate); 
         	st.setString(6,notes); 
         	st.executeUpdate();
         	connect.close(); 
         	System.out.println("Added Successfully");
         	request.getRequestDispatcher("index.jsp").forward(request, response);
         }         
        catch(Exception e)
           {
      	    System.out.println(e);
           }  
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
