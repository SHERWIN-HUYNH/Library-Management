$(function(){

	$("#ngayMuon_error").hide();

	var ngayMuon_error = false;

	$("#ngayMuon").focusout(function() {
		checkNgayMuon();
		toggleSubmitButton();
	});
	
	function checkNgayMuon(){
		if($("#ngayMuon").val().length == 0){
			$("#ngayMuon_error").html("Vui lòng chọn ngày mượn");
			ngayMuon_error = true;
			$("#ngayMuon_error").show();
		}
		else{
			ngayMuon_error = false;
			$("#ngayMuon_error").hide();
		}
	}
	
	
	function toggleSubmitButton() {
	    if (!ngayMuon_error) { // đúng 
	        $("#register_form").prop("disabled", false);
	    } else {
	        $("#register_form").prop("disabled", true);
	    }
	}
	
});