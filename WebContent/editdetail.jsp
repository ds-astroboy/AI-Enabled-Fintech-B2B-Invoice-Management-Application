<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.Date" %>
    

<!DOCTYPE html>
<html>
<head>
<title>HighRadius</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a8e1a660e9.js" crossorigin="anonymous"></script>
<link href="https://blogfonts.com/css/aWQ9MTUzMjQ5JnN1Yj0yNDkmYz1mJnR0Zj1GdXR1cmFQVEJvb2sub3RmJm49ZnV0dXJhLXB0LTM/Futura PT.otf" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="style/style.css">
<script src="javascript/javascript.js">
</script>
<script type="text/javascript" src="
http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js">
</script>
</head>
<body>

  <!-- Header part-->
   <div class="header">
      <div class="abcproducts">
         <img src="images/Group.svg" id="highradius" onclick="home()">
       </div>
      
      <div class="logo">
       <img src="images/logo.svg" id="highradius" onclick="home()">
      </div>
   </div>
 <!-- Invoice List Title-->
   <div class="invoice_list">
      <p>Invoice List</p>
    </div>

 <!-- Invoice Table-->
    <div class="invoice_table">
    
         <div class="menu_bar">
            <!-- Add button-->
           <div>
            <button type="button" id="add_btn" onclick="addmyFunction()"><img src="images/plus.png"><p id="addtext">Add</p></span></button>
           </div>
            <!-- Edit button-->
          <div>
            <button type="button" id="edit_btn" onclick="editmyFunction()"><img src="images/pencil.png"><p id="edittext">Edit</p></span></button>
          </div>
          <!-- Delete button-->
          <div>
            <button type="button" id="delete_btn" onclick="deletemyFunction()"><img src="images/minus.png"><p id="deletetext">Delete</p></span></button>
          </div>
          <!-- Search Bar portion-->
          <div class="search_bar">
          <form method="GET" name="searchresult" id="searchresult">
            <!-- Search input -->
            <input type="text"  id="inputtext" placeholder="   Search by Invoice Number" name="searchtxt" onclick="searchboxcolormyFunction()">
            <!-- Search Button -->
            <button type="submit" id="search_btn" onclick="searchmyFunction()"><img src="images/search.svg"></button>
          </form>
         </div>   
      </div>
<!-- All Records in table format -->

 <form method="get" name="formvalidation" id="formvalidation">
 
      <div class="table" style="height: 620px;overflow-y: scroll;" id="tablepopup">
         <table id="tab" style="text-align:left;">
              
             <%
             String searchtext=request.getParameter("searchtxt");
             String url="jdbc:mysql://localhost:3306/invoicedata";
          	String u="root";
          	String p="kapil@9444106082";
             if(searchtext == null ||searchtext == ""||searchtext == " ")
             {
            	 %>
            	 <!-- Table Head -->
                 <tr>
                   <th><input type="checkbox" id="vehicle3" name="vehicle3" value="Boat"></th>
                   <th>Customer Name</th>
                   <th>Customer No</th> 
                   <th>Invoice Id</th>
                   <th>Invoice Amount</th>
                   <th>Due Date</th>
                   <th >Predicted Payment Date</th>
                   <th >Notes</th>
                 </tr>
                
                 <!-- Table Data  -->
                 <%
        	String query="select * from invoice LIMIT 50";
            try{  
            	Class.forName("com.mysql.cj.jdbc.Driver");  
            	Connection con=DriverManager.getConnection(url,u,p);  
            	
            	Statement stmt=con.createStatement();  
            	ResultSet rs=stmt.executeQuery(query); 
           
            	while(rs.next())  
            	{
            		String id="idno"+rs.getInt(26);
            		%>
            		
            		<tr id="<%=id%>">
            		<td><input type="checkbox" name="id" value="<%=rs.getInt(26)%>" onChange="myFunction(<%=id%>,this)" class="messageCheckbox"></td>
                    <td><%=rs.getInt(20) %></td>
                    <td><%=rs.getInt(6)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getFloat(4)%></td>
                    <td><%=rs.getDate(22)%></td>
                    <td><%=rs.getDate(23)%></td>
                    <td><%=rs.getString(25)%></td>
                    </tr>             
                    <% 
            	}
          
            	con.close(); 
            	
            	}
                catch(Exception e)
                {
                	System.out.println(e);
                } 
           
             }
             else
             {
               	String urll="jdbc:mysql://localhost:3306/invoicedata";
             	String un="root";
             	String pass="kapil@9444106082";
             	String queryy="select * from invoice where invoice_id="+searchtext+" ";
                 try{  
                 	Class.forName("com.mysql.cj.jdbc.Driver");  
                 	Connection connect=DriverManager.getConnection(urll,un,pass);           
                 	Statement st=connect.createStatement();  
                 	ResultSet res=st.executeQuery(queryy); 
                 	if(res.next()==false)
                 	{
                 		%>
                 		<div style="width:100%;height:100%;position:"absolute";" class="norecord">
                 		<div class="items">                 		
                 		<!-- No records image -->
                 		<div>
                 		<img src="images/error.svg" id="error">
                 		</div>
                 		<!-- No records text -->
                 		<div>
                 		<h1 id="norecords">No records found</h1>
                 		</div>
                 		<!-- No records msg -->
                 		<div>
                 		<h3>Try adjusting your search to find what you are looking for.</h3>
                 		</div>
                 		<!-- Clear search -->
                 		<div>
                 		<h4 onclick="home()">Clear Search</h4>
                 		</div>
                 		</div>
                 		
                 		</div>
                 		
                 		<%
                 	}
                 	else
                 	{
                 		 %>
                    	 <!-- Table Head -->
                         <tr>
                           <th><input type="checkbox" id="vehicle3" name="vehicle3" value="Boat"></th>
                           <th>Customer Name</th>
                           <th>Customer No</th> 
                           <th>Invoice Id</th>
                           <th>Invoice Amount</th>
                           <th>Due Date</th>
                           <th >Predicted Payment Date</th>
                           <th >Notes</th>
                         </tr>
                         
                         <!-- Table Data  -->
                         <%
                        do  
                      	{
                      		String id="idno"+res.getInt(26);
                      		%>
                      		<tr id="<%=id%>">
                      		<td><input type="checkbox" name="id" value="<%=res.getInt(26)%>" onChange="myFunction(<%=id%>,this)" id="checkboxx" class="messageCheckbox"></td>
                              <td><%=res.getInt(20) %></td>
                              <td><%=res.getInt(6)%></td>
                              <td><%=res.getInt(5)%></td>
                              <td><%=res.getFloat(4)%></td>
                              <td><%=res.getDate(22)%></td>
                              <td><%=res.getDate(23)%></td>
                              <td><%=res.getString(25)%></td>
                              </tr>
                              <%
                  	      }while(res.next());
                         %>
                         
                         <% 
                  	connect.close(); 
                 	}
                 	}
                      catch(Exception e)
                      {
                      	System.out.println(e);
                      }  
             }      
            %>    
         
          </table>
          
       </div>

      </div>
<!-- Edit Invoice POP UP Box  -->

      <div class="edit_invoice" id="edit_popup" style="display:block;">
      <form action="update" method="get" id="editedinvoicedetail" name="editedinvoicedetail" >
        <!-- Edit Invoice text and close button  -->
        <div class="title">
          <!-- Edit Invoice text -->
          <div>
            <h2>Edit Invoice</h2>
          </div>
          <!-- close button  -->
          <div>
            <img src="images/close.svg" alt="close" id="close_btn" onclick="home()">
          </div>
          </div>
          <!-- Invoice Amount div -->
          <div class="invoice_amount">
            <div>
              <h2>Invoice Amount</h2>
            </div>
            <div>
            <input type="hidden" name="invoice_id" value="<%=request.getAttribute("idd")%>">
              <input type="text"  id="inputamt" placeholder="$56354.52" name="invoice_amt" value="<%=request.getAttribute("invoiceamt")%>">
            </div>
        </div>
        <!-- Notes div  -->
        <div class="Notes">
          <div>
            <h2>Notes</h2>
          </div>
          <div>
            <input type="text"  id="inputnotes" placeholder="Enter Your Notes...." name="note" value="<%=request.getAttribute("notes")%>">
          </div>
        </div>
       <!-- Cancel Button,Reset btn and Save btn  -->
        <div class="footer_part"> 
          <div>
            <h2 onclick="home()">Cancel</h2>
          </div>
          <div>
            <button type="submit" id="save_btn" onclick="savechanges()">Save</button>
          </div>
          <div>
            <button type="button" id="reset_btn" onclick="resetvalue()">Reset</button>
            <script>
            function resetvalue()
            {
          	 
          	  var amt=<%=request.getAttribute("invoiceamt")%>;
          	  var notes=<%=request.getAttribute("notes")%>;
          	  document.getElementById("inputamt").value =amt; 
          	  document.getElementById("inputnotes").value =notes; 
          	  
            }
            </script>
          </div>
        </div> 
        </form>
      </div>
 <!-- Delete Invoice POP UP  -->
       <div class="delete_box" id="delete_popup">
         <!-- Header part   -->
         <div class="headerpart">
           <div>
           <h2>Delete Invoice</h2>
         </div>
         <div>
          <img src="images/close.svg" alt="close" id="close_btn" onclick="closedelete()">
         </div>
      </div>
<!-- Description part  -->
    <div>
      <p>You'll lose your record(s) after this action. We can't recover them once you delete.<br><br>Are you sure you want to <span style="color: #FF5E5E;">permanently delete</span> them?</p>
    </div>
<!-- Footer part delete,cancel option -->
<div class="footerpart">
<div >

  <button  type="button" id="deletebtn" onclick="deleteform()">Delete</button>
 
</div>
<div >
  <button  type="button" id="cancelbtn" onclick="closedelete()">Cancel</button>
</div>
</div>
</div>

<!-- Add Invoice POP UP -->
<div class="add_invoice" id="add_popup">
  <!-- Add Invoice text and close btn -->
  <div class="addheader">
    <div>
      <h2>Add Invoice</h2>
    </div>
    <div>
     <img src="images/close.svg" alt="close" id="close_btn" onclick="closeadd()">
    </div>
  </div>
  <!-- form method get-->
  <form action="add" method="get" name="addinvoiceform" id="addinvoiceform">
  <!-- Invoice Detail -->
  <div class="invoicedetails">
    <div class="row">
      <div class="part" style="width: 50%;">
        <div class="name">
          <h2>Customer Name <span style="color: #FF5B5B;">*</span></h2>
        </div>
        <div class="inputbox">
          <input type="text" class="inputtext" id="customer_name" placeholder="Jessica" onkeyup="success()"  name="customer_name" style="margin-left:35px">
        </div>
      </div>

      <div class="part" style="width: 50%;">
        <div class="name">
          <h2 style="margin-right: 80px;">Due Date <span style="color: #FF5B5B;">*</span></h2>
        </div>
        <div class="inputbox">
          <input type="date" class="inputtext" id="duedate" onkeyup="success()" name="duedate"  value=" ">
        </div>
      </div>
      
    </div>
      <!-- 2nd row -->
      <div class="roww">
        <div class="side">
          <div class="col">
            <div class="name">
              <h2 style="margin-right: 46px;">Customer No <span style="color: #FF5B5B;">*</span></h2>
            </div>
            <div class="inputbox">
              <input type="text" class="inputtext" id="customer_no" placeholder="" onkeyup="success()" name="customer_no" >
            </div>
          </div>
          <div class="col">
          <div class="name">
            <h2 style="margin-right: 70px;">Invoice No <span style="color: #FF5B5B;">*</span></h2>
          </div>
          <div class="inputbox">
            <input type="text" class="inputtext" id="invoice_no" placeholder="" onkeyup="success()" name="invoice_no" >
          </div>
          </div>
          <div class="col">
          <div class="name">
            <h2 style="margin-right: 27px;">Invoice Amount <span style="color: #FF5B5B;">*</span></h2>
          </div>
          <div class="inputbox">
            <input type="text"  class="inputtext" id="invoice_amount" placeholder="" onkeyup="success()" name="invoice_amount" >
          </div>
          </div>
        </div>
        <div class="otherside">
          <div class="col" style="margin-top: 30px;">
            <div class="name">
              <h2 style="margin-right: 128px;">Notes</h2>
            </div>
            <div class="inputbox">
              <input type="text" class="inputtext" id="notes" placeholder="" onkeyup="success()" name="notes" style="height: 191px;">
            </div>
            </div>
        </div>
      </div>
</div>

<div class="addfooter"> 
  <div>
    <h2 onclick="closeadd()">Cancel</h2>
  </div>
  <div>
    <button  type="submit" id="addbtn" disabled onclick="addformm()">Add</button>
  </div>
  
  <div>
    <button  type="button" id="clearbtn" onclick="clearform()">Clear</button>
  </div>
</div> 

</form>

</div>


<!--Search-->

</form>
</body>
</html>