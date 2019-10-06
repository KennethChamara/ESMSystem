//Date picker 
$(document).ready(function(){
      var date_input=$('input[name="date"]');
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'dd/mm/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })

//Income form validation
function IncomeValidate(){
		var name = document.incForm.incName.value;
  		var num = document.incForm.amount.value;
  		var date = document.incForm.date.value;
  		
  		if(name==""||name==null){
  			document.getElementById("nameloc").innerHTML="*Plese enter the income name";
  			return false;
  		}else{
  			if(num==""||num==null){
  	  			document.getElementById("numloc").innerHTML="*Plese enter the income amount";
  	  			return false;
  	  		}
  	  		else{
  	  			if(isNaN(num)){
  	  	  			document.getElementById("numloc").innerHTML="*Enter numeric value only";
  	  	  			return false;
  	  	  		}else{
  	  	  			if(date==""||date==null){
  	  	  				document.getElementById("dateloc").innerHTML="*Plese enter the date";
  	  	  				return false;
  	  	  			}else{
  	  	  				return true;
  	  	  			}
  	  	  		}
  	  		}
  		}	
  	}

//Income edit form validation
function incomeEditValidate(){
		var name = document.incEditForm.name.value;
		var num = document.incEditForm.amount.value;
		var date = document.incEditForm.date.value;
		
		if(name==""||name==null){
			document.getElementById("nameloc").innerHTML="*Plese enter the income name";
			return false;
		}else{
			if(num==""||num==null){
	  			document.getElementById("numloc").innerHTML="*Plese enter the income amount";
	  			return false;
	  		}
	  		else{
	  			if(isNaN(num)){
	  	  			document.getElementById("numloc").innerHTML="*Enter numeric value only";
	  	  			return false;
	  	  		}else{
	  	  			if(date==""||date==null){
	  	  				document.getElementById("dateloc").innerHTML="*Plese enter the date";
	  	  				return false;
	  	  			}else{
	  	  				return true;
	  	  			}
	  	  		}
	  		}
		}	
} 
