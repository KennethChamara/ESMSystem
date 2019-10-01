$().ready(function() {
    // menu button for top nav
    $('.menu-button a').click(function(e) {
      e.preventDefault();
      $('nav ul.main-nav').toggleClass('active');
    });
    // # links
    $('a[href="#"]').click(function(e) {
        $('html, body').animate({scrollTop:0}, 'slow');
    });
});




//date piker
$(document).ready(function(){
	var date_input=$('input[name="date"]'); //our date input has the name "date"
	var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	date_input.datepicker({
		format: 'mm/dd/yyyy',
		container: container,
		todayHighlight: true,
		autoclose: true,
	});
});

// salary form validation
function validateForm() {
	  var name = document.forms["myForm"]["usr"].value;
	  var  month= document.forms["myForm"]["month"].value;
	  var date = document.forms["myForm"]["date"].value;
	  var amount = document.forms["myForm"]["amount"].value;
	  if (name == "") {
	    alert("Name must be filled out");
	    return false;
	  }else if(month==""){
		  
		  alert("month must be filled out");
		  return false;
	  }else if(date==""){
		  
		  alert("date must be filled out");
		  return false;
	}else if(amount==""){
		  
		  alert("amount must be filled out");
		  return false;
	}else{ 
	  
	  var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
	  var regAmount =/^\d{1,6}(?:\.\d{0,2})?$/;
	  
	    if(!regName.test(name)){
	        alert('Please enter full name (first & last name).');
	        document.getElementById('usr').focus();
	        return false;
	    }else{
	    	
	    	  if(!regAmount.test(amount)){
	  	        alert('Amount fotmat ###.## no more than 6 digits and two decimals.');
	  	        document.getElementById('amount').focus();
	  	        return false;
	  	        
	  	        
	  	    }else{
	  	    	
	  	    	if(!isValidDate(date)){
	  	    		alert('date is in valid');
	  	    		return false;
	  	    	}
	  	    	
	  	   
	  	    }
	    	
	    	
	    	
	        return true;
	    }
	    
	   
	  
	    
	    
	}
}

function isValidDate(dateString)
{
    // First check for the pattern
    if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
        return false;

    // Parse the date parts to integers
    var parts = dateString.split("/");
    var day = parseInt(parts[1], 10);
    var month = parseInt(parts[0], 10);
    var year = parseInt(parts[2], 10);

    // Check the ranges of month and year
    if(year < 1000 || year > 3000 || month == 0 || month > 12)
        return false;

    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

    // Adjust for leap years
    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
        monthLength[1] = 29;

    // Check the range of the day
    return day > 0 && day <= monthLength[month - 1];
}




