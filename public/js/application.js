function shrinkNavbar(){
	$('#header_title').hide();
	$('#menu_header').addClass('shrink').removeClass('grow');
	$('#menu_header_vert').addClass('shrink').removeClass('grow');
	$('#menu_img').removeClass('grow').addClass('shrink');
	$('.log-button').slideUp(300);
};
function growNavbar(){
	$('#header_title').show();
	$('#menu_header').addClass('grow').removeClass('shrink');
	$('#menu_header_vert').addClass('grow').removeClass('shrink');
	$('#menu_img').removeClass('shrink').addClass('grow');
	$('.log-button').slideDown(300);
};

function fieldEmpty(field){
	return field.val() === "";
}

function passwordsMatch(){
	return $('#inputPassword3').val() === $('#inputPasswordC3').val();
}

function checkPasswords(){
	if(passwordsMatch()){
		$('#password-error').slideUp(300);
		$('#modal-sign-up').prop('disabled', false);
	}else{
		$('#password-error').slideDown(300);
		$('#modal-sign-up').prop('disabled', true);
	}
}

function checkInputs(emptyInputs){
	if ($('#sign-up-form input').val() !== "" && emptyInputs.length === 0){
		var timeoutTimer = setTimeout(function(){checkPasswords()}, 700);
		$('#sign-up-form input').on('keyup', function() {clearTimeout(timeoutTimer)});
	}else{
		$('#modal-sign-up').prop('disabled', true);
	}
}

function checkOnKeystroke(emptyInputs){
	$('#sign-up-form input').on('keyup', function() {
		emptyInputs = $('#sign-up-form input').filter(function() { return $(this).val() == ""; });
		checkInputs(emptyInputs);
	});
}

function clearInputs(){
	$('#sign-up-form input').each(function(){
		$(this).val("");
	});
}

$(function(){
	clearInputs();

	var lastScrollTop = 0;
	$(window).on('scroll', function(event){
		var scrollIndex = $(window).scrollTop();

		if(scrollIndex > 50) {
			shrinkNavbar();
		}else if(scrollIndex <= 50){
			growNavbar();
		}
	});

	$('#x-close').on('click', function(){
		clearInputs();
	});
	$("#modal-close").on('click', function(){
		clearInputs();
	});

	$('#sign-up-form input').on('change', function() {
		var empties = $('#sign-up-form input').filter(function() { return $(this).val() == ""; });
		if(empties > 1) {
			$('#modal-sign-up').prop('disabled', true);
		}else if(empties.length === 1) {
			checkOnKeystroke(empties);
		}
	})

});
