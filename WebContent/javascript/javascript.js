

function addmyFunction() {

    if (document.getElementById("add_popup").style.display == "none") {
    	
    	document.getElementById("add_popup").style.display = "block";
    	
      document.getElementById("edit_btn").style.borderColor = "#97A1A9";
      document.getElementById("add_btn").style.borderColor = "#14AFF1";
      document.getElementById("delete_btn").style.borderColor = "#97A1A9";

      document.getElementById("edittext").style.color = "#97A1A9";
      document.getElementById("addtext").style.color = "#FFFFFF";
      document.getElementById("deletetext").style.color = "#97A1A9";

      document.getElementById("inputtext").style.borderColor = "#356680";
      document.getElementById("search_btn").style.borderColor = "#356680";
  } else {
      document.getElementById("add_popup").style.display = "none";
      
  }

  }
  
  var checkedValue;
  
  function editmyFunction() {  
    if (document.getElementById("edit_popup").style.display === "none") {
        document.getElementById("edit_popup").style.display = "block";
        document.getElementById("edit_btn").style.borderColor = "#14AFF1";
        document.getElementById("add_btn").style.borderColor = "#97A1A9";
        document.getElementById("delete_btn").style.borderColor = "#97A1A9";

        document.getElementById("edittext").style.color = "#FFFFFF";
        document.getElementById("addtext").style.color = "#97A1A9";
        document.getElementById("deletetext").style.color = "#97A1A9";

        document.getElementById("inputtext").style.borderColor = "#356680";
        document.getElementById("search_btn").style.borderColor = "#356680";
   
    } else {
        document.getElementById("edit_popup").style.display = "none"; 
        document.getElementById("edit_btn").style.borderColor = "#14AFF1";
        document.getElementById("add_btn").style.borderColor = "#97A1A9";
        document.getElementById("delete_btn").style.borderColor = "#97A1A9";

        document.getElementById("edittext").style.color = "#FFFFFF";
        document.getElementById("addtext").style.color = "#97A1A9";
        document.getElementById("deletetext").style.color = "#97A1A9";

        document.getElementById("inputtext").style.borderColor = "#356680";
        document.getElementById("search_btn").style.borderColor = "#356680";
    }
    
    checkedValue = document.querySelector('.messageCheckbox:checked').value;
    document.getElementById("formvalidation").action = 'edit';
    document.getElementById("formvalidation").submit();
      
 }
  
  function id()
  {
	  return checkedValue;
  }
  
  function deletemyFunction() {

    if (document.getElementById("delete_popup").style.display === "none") {
      document.getElementById("delete_popup").style.display = "block";
  } else {
      document.getElementById("delete_popup").style.display = "none";
  }

    document.getElementById("edit_btn").style.borderColor = "#97A1A9";
    document.getElementById("add_btn").style.borderColor = "#97A1A9";
    document.getElementById("delete_btn").style.borderColor = "#14AFF1";

    document.getElementById("edittext").style.color = "#97A1A9";
    document.getElementById("addtext").style.color = "#97A1A9";
    document.getElementById("deletetext").style.color = "#FFFFFF";

    document.getElementById("inputtext").style.borderColor = "#356680";
    document.getElementById("search_btn").style.borderColor = "#356680";
    
  }
  function searchmyFunction() {
	  //document.getElementById("searchresult").submit();
	  if(document.getElementById("inputtext").value.length == 0)
	    {
	      alert("Enter Invoice Id ,inorder to Search"); 
	      window.location.replace("http://localhost:8080/Highradiu/index.jsp");
	    }

    document.getElementById("edit_btn").style.borderColor = "#97A1A9";
    document.getElementById("add_btn").style.borderColor = "#97A1A9";
    document.getElementById("delete_btn").style.borderColor = "#97A1A9";
    document.getElementById("search_btn").style.borderColor = "#14AFF1";
    document.getElementById("inputtext").style.borderColor = "#14AFF1";
  }

  function searchboxcolormyFunction() {
	 
    document.getElementById("edit_btn").style.borderColor = "#97A1A9";
    document.getElementById("add_btn").style.borderColor = "#97A1A9";
    document.getElementById("delete_btn").style.borderColor = "#97A1A9";
    document.getElementById("inputtext").style.borderColor = "#14AFF1";
    document.getElementById("search_btn").style.borderColor = "#14AFF1";
  }
 
  function closebox()
  {
    document.getElementById("edit_popup").style.display = "none";
  }
  function closedelete()
  {
    document.getElementById("delete_popup").style.display = "none";
  }
  function closeadd()
  {
    document.getElementById("add_popup").style.display = "none";
  }
  function myFunction(x,y) {
	    if (y.checked)
	        x.style.backgroundColor = '#2A5368';
	    else
	        x.style.backgroundColor = 'transparent';
	  }
  function success() {
		 if(document.getElementById("customer_name").value==="" || document.getElementById("duedate").value==="" || document.getElementById("customer_no").value==="" || document.getElementById("invoice_no").value==="" || document.getElementById("invoice_amount").value==="" || document.getElementById("notes").value==="" ) { 
	            document.getElementById('addbtn').disabled = true; 
	            document.getElementById('addbtn').style.backgroundColor ="#97A1A9";
	            document.getElementById('addbtn').style.cursor ="default";
	        } else { 
	            document.getElementById('addbtn').disabled = false;
	            document.getElementById('addbtn').style.backgroundColor ="#14AFF1";
	            document.getElementById('addbtn').style.cursor ="pointer";
	        }
	    }
  
  function editform()
  {
	  document.getElementById('formvalidation').submit();
  }
  function addformm()
  {
	  document.getElementById("formvalidation").action = 'add';
      document.getElementById("formvalidation").submit();
      alert("Added Invoice Successfully");
	  
  }
  function deleteform()
  {
	  document.getElementById("formvalidation").action = 'delete';
      document.getElementById("formvalidation").submit();
      alert("Successfully deleted")
	  
  }
  function clearform()
  {
	  document.getElementById("customer_name").value =""; 
	  document.getElementById("duedate").value =""; 
	  document.getElementById("customer_no").value="";
	  document.getElementById("invoice_no").value="" ;
	  document.getElementById("invoice_amount").value="" ;
	  document.getElementById("notes").value="" ;
      	  
  }
  function home()
  {
	  window.location.replace("http://localhost:8080/Highradiu/index.jsp");
  }
  function savechanges()
  {
	  document.getElementById("editedinvoicedetail").action ='update';
      document.getElementById("editedinvoicedetail").submit();
      alert("Invoice amount and notes successfully edited");
  }
 