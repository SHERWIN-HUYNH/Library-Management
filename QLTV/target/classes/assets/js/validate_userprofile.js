$(function(){
	$("#nameUser_error").hide();
	$("#usernameUser_error").hide();
	$("#emailUser_error").hide();
	
	var nameUser_error = false;
	var usernameUser_error = false;
	var emailUser_error = false ;
	
	$("#nameUser").focusout(function(){
		checkNameUser();
		toggleSubmitButton();
	});
	$("#usernameUser").focusout(function(){
		checkUsernameUser();
		toggleSubmitButton();
	});
	$("#emailUser").focusout(function(){
		checkEmailUser();
		toggleSubmitButton();
	});
	
	function checkNameUser(){
		if($("#nameUser").val().length == 0){
			$("#nameUser_error").html("Vui lòng nhập vào tên user");
			nameUser_error = true;
			$("#nameUser_error").show();     
		}
		else{
			nameUser_error = false;
			$("#nameUser_error").hide();
		}
	}
	function checkUsernameUser(){
		if($("#usernameUser").val().length == 0){
			$("#usernameUser_error").html("Vui lòng nhập username");
			usernameUser_error = true;
			$("#usernameUser_error").show();     
		}
		else{
			usernameUser_error = false;
			$("#usernameUser_error").hide();
		}
	}
	function checkEmailUser(){
		if($("#emailUser").val().length == 0){
			$("#emailUser_error").html("Vui lòng nhập email người dùng.");
			descriptionAuthor_error = true;
			$("#emailUser_error").show();     
		}
		else{
			emailUser_error = false;
			$("#emailUser_error").hide();
		}
	}
	function toggleSubmitButton() {
	    if (!nameUser_error && !usernameUser_error && !emailUser_error) {
	        $("#userProfile_form").prop("disabled", false);
	    } else {
	        $("#userProfile_form").prop("disabled", true);
	    }
	}
	$("#userProfile_form").submit(function() {
		checkNameUser();
		checkUsernameUser();
		checkEmailUser();
		if(nameUser_error || usernameUser_error || emailUser_error){
			return false;
		}
		else{
			return true;
		}
	});
});