function validation() {
	var supname = document.getElementById("supname").value;
	var compnyname = document.getElementById("compnyname").value;
	var address = document.getElementById("address").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;

	var error_message1 = document.getElementById("error_message1");
	var error_message2 = document.getElementById("error_message2");
	var error_message3 = document.getElementById("error_message3");
	var error_message4 = document.getElementById("error_message4");
	var error_message5 = document.getElementById("error_message5");

	error_message1.style.padding = "5px";
	error_message2.style.padding = "5px";
	error_message3.style.padding = "5px";
	error_message4.style.padding = "5px";
	error_message5.style.padding = "5px";

	var text;
	var regx;
	if (!(isNaN(supname)) || !(supname.length < 20) || !(supname.length > 5)) {
		text = "**Invalid-";
		error_message1.innerHTML = text;
		error_message1.style.color = "red";
		document.getElementById("supname").style.border = "solid 3px red";
		return false;

	}

	error_message1.innerHTML = "**Valid--";
	document.getElementById("supname").style.border = "solid 3px green";
	error_message1.style.color = "green";

	if (!(compnyname.length < 20) || !(compnyname.length > 5)
			|| !(isNaN(compnyname))) {

		text = "**Invalid-";
		error_message2.innerHTML = text;
		error_message2.style.color = "red";
		document.getElementById("compnyname").style.border = "solid 3px red";
		return false;
	}

	error_message2.innerHTML = "**Valid--";
	document.getElementById("compnyname").style.border = "solid 3px green";
	error_message2.style.color = "green";

	if (!(address.length < 20) || !(address.length > 5)) {

		text = " **Invalid-";
		error_message3.innerHTML = text;
		error_message3.style.color = "red";
		document.getElementById("address").style.border = "solid 3px red";

		return false;
	}

	error_message3.innerHTML = "**Valid--";
	document.getElementById("address").style.border = "solid 3px green";
	error_message3.style.color = "green";

	regx = /^0[17][0-9]{8}$/;

	if (phone.length != 10 || !(regx.test(phone))) {
		text = "**Invalid-";
		error_message4.innerHTML = text;
		error_message4.style.color = "red";
		document.getElementById("phone").style.border = "solid 3px red";
		return false;
	}

	error_message4.innerHTML = "**Valid--";
	document.getElementById("phone").style.border = "solid 3px green";
	error_message4.style.color = "green";

	regx = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,20})$/;

	if (!(regx.test(email))) {

		text = "**Invalid-";
		error_message5.innerHTML = text;
		error_message5.style.color = "red";
		document.getElementById("email").style.border = "solid 3px red";
		return false;
	}

	error_message5.innerHTML = "**Valid--";
	document.getElementById("email").style.border = "solid 3px green";
	error_message5.style.color = "green";

	alert("Form Submitted Successfully!");

	return true;

}
