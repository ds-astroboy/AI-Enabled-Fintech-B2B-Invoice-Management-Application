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
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id=request.getParameter("id");
		 String invoiceid=request.getParameter("invoice_id");
		 if(invoiceid==null)
		 {
			
		       try{  
		        	String urll="jdbc:mysql://localhost:3306/invoicedata";
		          	String un="root";
		          	String pass="kapil@9444106082";
		          	String queryy="select * from invoice where id="+id+" ";
		          	
		         	Class.forName("com.mysql.cj.jdbc.Driver");  
		         	Connection connect=DriverManager.getConnection(urll,un,pass);           
		         	Statement st=connect.createStatement();  
		         	ResultSet res=st.executeQuery(queryy); 
		         	res.next();
		         	if(res==null)
		         	{
		         		System.out.println("resultset empty");
		         	}
		         	else
		         	{
		         		
		         		float invoiceamt=res.getFloat(4);
		             	String notes=res.getString(25);
		             	request.setAttribute("idd", id);
		             	request.setAttribute("invoiceamt", invoiceamt);
		             	request.setAttribute("notes", notes);
		             	System.out.println(invoiceamt+"   "+notes);
		             	request.getRequestDispatcher("editdetail.jsp").forward(request, response);
		             	
		         	}
		         	connect.close(); 
		         	
		         }         
		        catch(Exception e)
		           {
		      	    System.out.println(e);
		           }  
		 }
		 else if(id ==null)
		 {
			    String idd=request.getParameter("invoice_id");
				String invoice_amt=request.getParameter("invoice_amt");
				String notes=request.getParameter("note");
				if(id==null || invoice_amt ==null || notes == null)
				{
					 System.out.println("id is empty");
				}
				else
				{
					System.out.println("id,amt,note Not empty");
				}
				
				try{  
		        	String urll="jdbc:mysql://localhost:3306/invoicedata";
		          	String un="root";
		          	String pass="kapil@9444106082";
		          	Class.forName("com.mysql.cj.jdbc.Driver");  
		         	Connection connect=DriverManager.getConnection(urll,un,pass);  
		         	Statement st=connect.createStatement(); 
		          	String query = "UPDATE invoice SET total_open_amount ='"+invoice_amt+"', Notes ='"+notes+"' WHERE id ="+idd+";";
		            st.executeUpdate(query);  		
		            
		          	connect.close();
		          	
		            System.out.println("Updated Invoice id: "+idd);
		           // request.getRequestDispatcher("index.jsp").forward(request, response);
		            String redirectURL = "index.jsp";
		            response.sendRedirect(redirectURL);
		         	
		         	
		         }         
		        catch(Exception e)
		           {
		      	    System.out.println(e);
		           }  
		 }
		 else
		 {
			 System.out.println("no null values");
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
