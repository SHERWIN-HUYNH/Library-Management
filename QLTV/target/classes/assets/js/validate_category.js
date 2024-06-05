$(function(){
	$("#nameCategory_error").hide();

	var nameCategory_error = false;
	
	$("#nameCategory").focusout(function() {
		checkNameCategory();
		toggleThemButton();
	});
	function checkNameCategory(){
		if($("#nameCategory").val().length == 0){
			$("#nameCategory_error").html("Vui lòng nhập vào tên thể loại");
			nameCategory_error = true;
			$("#nameCategory_error").show();     
		}
		else{
			nameCategory_error = false;
			$("#nameCategory_error").hide();
		}
	}
	
	function toggleThemButton() {
	    if (!nameCategory_error ) {
	        $("#register_form").prop("disabled", false);
	    } else {
	        $("#register_form").prop("disabled", true);
	    }
	}
	
	$("#register_form").submit(function() {
		checkNameCategory();

		if(nameCategory_error){
			return false;
		}
		else{
			return true;
		}
	});
});