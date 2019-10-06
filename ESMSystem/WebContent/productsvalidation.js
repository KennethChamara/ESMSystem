function productsvalidationform(){
	
	  var productname= document.getElementById("productname").value;
	  var unitprice=document.getElementById("unitprice").value;
	  var quantity = document.getElementById("quantity").value;
	  var discount = document.getElementById("discount").value;
	  
	  var error_message1 = document.getElementById("error_message1");
	 var error_message2 = document.getElementById("error_message2");
	 var error_message3 = document.getElementById("error_message3");
	 var error_message4 = document.getElementById("error_message4");
	

	  
	  error_message1.style.padding = "5px";
	   error_message2.style.padding = "5px";
	  error_message3.style.padding = "5px";
	  error_message4.style.padding = "5px";
	 
	  
	  var text;
	  var regx;
	  if(!(isNaN(productname))|| !(productname.length<20) || !(productname.length>5) )
	  { 
		  
		 
			  	text="**Invalid-";
			    error_message1.innerHTML = text;
			  	 error_message1.style.color="red";
			    document.getElementById("productname").style.border="solid 3px red";
			    return false;
			 
	   }
	  
	  
	  		
		  error_message1.innerHTML ="**Valid-";
		  document.getElementById("productname").style.border = "solid 3px green";
		  error_message1.style.color = "green";
		  
	  
		  if(isNaN(unitprice) || !(unitprice.length <20))
		   {
					text = "**Invalid-";
					error_message2.innerHTML = text;
					 error_message2.style.color="red";
					 document.getElementById("unitprice").style.border="solid 3px red";
					return false;
			}
		   		
		  
		  	error_message2.innerHTML ="**Valid-";
		  	document.getElementById("unitprice").style.border = "solid 3px green";
		 	error_message2.style.color = "green";
	   
				regx = /(?<=\s|^)\d+(?=\s|$)/;
			
			if (!(quantity.length <10) || !(regx.test(quantity))) {
				text = "**Invalid-";
			
				error_message3.innerHTML = text;
				error_message3.style.color="red";
				document.getElementById("quantity").style.border= "solid 3px red";
				return false;
			}
			
			
			error_message3.innerHTML ="**Valid--";
		  	document.getElementById("quantity").style.border = "solid 3px green";
		  	error_message3.style.color ="green";
			
			
		  	 if(isNaN(discount) || (discount.length >5))
			   {
						text = "**Invalid-";
						error_message4.innerHTML = text;
						 error_message4.style.color="red";
						 document.getElementById("discount").style.border="solid 3px red";
						return false;
				}
			   		
		  	error_message4.innerHTML ="**Valid-";
		  	document.getElementById("discount").style.border = "solid 3px green";
		  	error_message4.style.color ="green";
		  	
		 	alert("Form Submitted Successfully!");
		 	
			return true;
			
			
		}

