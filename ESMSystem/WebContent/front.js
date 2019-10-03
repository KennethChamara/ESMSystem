$().ready(function() {
	// menu button for top nav
	$('.menu-button a').click(function(e) {
		e.preventDefault();
		$('nav ul.main-nav').toggleClass('active');
	});
	// # links
	$('a[href="#"]').click(function(e) {
		$('html, body').animate({
			scrollTop : 0
		}, 'slow');
	});
});

// date piker
$(document).ready(
		function() {
			var date_input = $('input[name="date"]'); // our date input has
														// the name "date"
			var container = $('.bootstrap-iso form').length > 0 ? $(
					'.bootstrap-iso form').parent() : "body";
			date_input.datepicker({
				format : 'mm/dd/yyyy',
				container : container,
				todayHighlight : true,
				autoclose : true,
			});
		});

// salary form validation
function validateForm() {
	var name = document.forms["myForm"]["usr"].value;
	var month = document.forms["myForm"]["month"].value;
	var date = document.forms["myForm"]["date"].value;
	var amount = document.forms["myForm"]["amount"].value;
	var x;
	if (name == "") {
		document.getElementById("msgEmp").innerHTML = "Name must be filled out";
		x=document.getElementById("msgEmp");
		 if(x.style.visibility !='visible'){
			
			 x.style.visibility = 'visible';
		 
		 }else{
			 x.style.visibility = 'hidden';
		 }
		 
		return false;
	} else if (month == "") {
		
		alert("month must be filled out");
		return false;
	} else if (date == "") {
		x=document.getElementById("msgDate");
		
		 if(x.style.visibility !='visible'){
			 x.style.visibility = 'visible';
			 }else{
				 x.style.visibility = 'hidden';
			 }
		 x.innerHTML = "date must be filled out";
		return false;
	} else if (amount == "") {
		x=document.getElementById("msgSal");
		
		 if(x.style.visibility !='visible'){
			 x.style.visibility = 'visible';
			 }else{
				 x.style.visibility = 'hidden';
			 }
		 x.innerHTML = "amount must be filled out";
		return false;
	} else {

		var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
		var regAmount = /^\d{1,6}(?:\.\d{0,2})?$/;

		if (!regName.test(name)) {
			x=document.getElementById("msgEmp");
			x.style.visibility = 'visible';
			
			document.getElementById('usr').focus();
			x.innerHTML = 'Please enter full name (first & last name).';
			return false;
		} else {
			document.getElementById("msgEmp").style.visibility="hidden";

			if (!regAmount.test(amount)) {
				x=document.getElementById("msgSal");
				x.innerHTML = 'Amount fotmat ###.## no more than 6 digits and two decimals.';
					
				 if(x.style.visibility !='visible'){
					 x.style.visibility = 'visible';
					 }else{
						 x.style.visibility = 'hidden';
					 }
				 x.innerHTML = 'Amount fotmat ###.## no more than 6 digits and two decimals.';
				document.getElementById('amount').focus();
				return false;

			} else {

				if (!isValidDate(date)) {
					alert('date is in valid');
					return false;
				}

			}

			return true;
		}

	}
}

function deleteConfrometion() {

	if (confirm("Do you want to DELETE this record")) {
		txt = "yes!";
		return true;
	} else {
		txt = "No";
		return false;
	}

}

function isValidDate(dateString) {
	// First check for the pattern
	if (!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
		return false;

	// Parse the date parts to integers
	var parts = dateString.split("/");
	var day = parseInt(parts[1], 10);
	var month = parseInt(parts[0], 10);
	var year = parseInt(parts[2], 10);

	// Check the ranges of month and year
	if (year < 1000 || year > 3000 || month == 0 || month > 12)
		return false;

	var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	// Adjust for leap years
	if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
		monthLength[1] = 29;

	// Check the range of the day
	return day > 0 && day <= monthLength[month - 1];
}
