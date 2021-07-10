package com.highradius.internship;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id[]=request.getParameterValues("id");
				
		try{  
        	String urll="jdbc:mysql://localhost:3306/invoicedata";
          	String un="root";
          	String pass="kapil@9444106082";
          	Class.forName("com.mysql.cj.jdbc.Driver");  
         	Connection connect=DriverManager.getConnection(urll,un,pass);  
         	Statement st=connect.createStatement(); 
          	
          	for(int i=0;i<id.length;i++)
    		{
          		String queryy="DELETE FROM invoice WHERE id="+id[i]+"";
                st.executeUpdate(queryy);
    			System.out.println(id[i] +" Deleted");
    		}
          	connect.close();
            System.out.println("Successfully deleted");
           // request.getRequestDispatcher("index.jsp").forward(request, response);
            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);
         	
         	
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
