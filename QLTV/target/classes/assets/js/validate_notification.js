$(function(){
	$("#title_error").hide();
	$("#image_error").hide();
	$("#content_error").hide();

	
	var title_error =false;
	var image_error = false;
	var content_error = false ;
	
	$("#title").focusout(function(){
		checkTitle();
		toggleSubmitButton();
	});
	$("#image").focusout(function(){
		checkImage();
		toggleSubmitButton();
	});
	$("#content").focusout(function(){
		checkContent();
		toggleSubmitButton();
	});
	
	function checkTitle(){
		if($("#title").val().length == 0){
			$("#title_error").html("Vui lòng nhập vào tiêu đề");
			title_error = true;
			$("#title_error").show();     
		}
		else{
			title_error = false;
			$("#title_error").hide();
		}
	}
	function checkContent(){
		if($("#content").val().length == 0){
			$("#content_error").html("Vui lòng nhập vào nội dung");
			content_error = true;
			$("#content_error").show();     
		}
		else{
			content_error = false;
			$("#content_error").hide();
		}
	}
	function checkImage(){
		if($("#image").val().length == 0){
			$("#image_error").html("Vui lòng chọn anh");
			image_error = true;
			$("#image_error").show();     
		}
		else{
			image_error = false;
			$("#image_error").hide();
		}
	}
	
	function toggleSubmitButton() {
	    if (!title_error && !content_error && !image_error) {
	        $("#register_form").prop("disabled", false);
	    } else if (title_error && content_error && image_error) {
	        $("#register_form").prop("disabled", true);
	    }
	}
	
});