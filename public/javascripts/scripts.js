$(document).ready(function(){
	// Form Validation
	$passwordInput = $("#user_password");
	$passwordError = $("#user_password_error");
	$passwordInput.on("keyup", function(e){
		var password = $(this).val();
		if (isValidPassword(password)) {
			$passwordError.css('visibility', 'hidden');
		} else {
			$passwordError.css('visibility', 'visible');
		}
	})

	$form = $("#user_signup_data");
	$form.on("submit", function(e){
		if (isValidPassword($passwordInput.val())){
			return true;
		} else {
			e.preventDefault();
		}
	})

});




function isValidPassword(password) {
	var passRegex = /^[a-zA-Z0-9~!$%^&*_=+}{\'?]{6,100}$/;
	if (passRegex.test(password)) {
		return true;
	} else {
		return false;
	}
}