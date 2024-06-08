$(function(){
	$("#nameBook_error").hide();
	$("#amountBook_error").hide();
	$("#descriptionBook_error").hide();
	$("#imageBook_error").hide();
	
	
	var nameBook_error = false;
	var amountBook_error = false;
	var imageBook_error = false;
	var descriptionBook_error = false ;
	
	$("#nameBook").focusout(function(){
		checkNameBook();
		toggleSubmitButton();
	});
	$("#imageBook").focusout(function(){
		checkImageBook();
		toggleSubmitButton();
	});
	$("#amountBook").focusout(function(){
		checkAmountBook();
		toggleSubmitButton();
	});
	$("#descriptionBook").focusout(function(){
		checkDescriptionBook();
		toggleSubmitButton();
	});
	
	function checkNameBook(){
		if($("#nameBook").val().length == 0){
			$("#nameBook_error").html("Vui lòng nhập vào tên đầu sách");
			nameBook_error = true;
			$("#nameBook_error").show();     
		}
		else{
			nameBook_error = false;
			$("#nameBook_error").hide();
		}
	}
	
	function checkAmountBook(){
		if($("#amountBook").val().length == 0){
			$("#amountBook_error").html("Vui lòng nhập vào số lượng sách");
			amountBook_error = true;
			$("#amountBook_error").show();     
		}
		else{
			amountBook_error = false;
			$("#amountBook_error").hide();
		}
	}
	function checkImageBook(){
		if($("#imageBook").val().length == 0){
			$("#imageBook_error").html("Vui lòng chọn ảnh bìa sách");
			imageBook_error = true;
			$("#imageBook_error").show();     
		}
		else{
			imageBook_error = false;
			$("#imageBook_error").hide();
		}
	}
	function checkDescriptionBook(){
		if($("#descriptionBook").val().length == 0){
			$("#descriptionBook_error").html("Vui lòng nhập vào mô tả cuốn sách.");
			descriptionBook_error = true;
			$("#descriptionBook_error").show();     
		}
		else{
			descriptionBook_error = false;
			$("#descriptionBook_error").hide();
		}
	}
	function toggleSubmitButton() {
	    if (!nameBook_error && !amountBook_error &&!imageBook_error && !descriptionBook_error) {
	        $("#book_form").prop("disabled", false);
	    } else {
	        $("#book_form").prop("disabled", true);
	    }
	}
	$("#book_form").submit(function() {
		checkNameBook();
		checkAmountBook
		checkImageBook();
		checkDescriptionBook();
		if(nameBook_error || amountBook_error || imageBook_error || descriptionBook_error){
			return false;
		}
		else{
			return true;
		}
	});
});