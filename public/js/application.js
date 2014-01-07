
$(function(){
	$(window).on('scroll', function(){
		var scrollIndex = $(window).scrollTop();
		if(scrollIndex > 50) {
			$('#menu_header').trigger('navbar-shrink');
		}else if(scrollIndex <= 50){
			$('#menu_header').trigger('navbar-grow');
		} 
	});

	$('#menu_header').on('navbar-shrink', function(){
		$('#header_title').hide();
		$(this).addClass('shrink').removeClass('grow');
		$('#menu_header_vert').addClass('shrink').removeClass('grow');
	});
	$('#menu_header').on('navbar-grow', function(){
		$('#header_title').show();
		$(this).addClass('grow').removeClass('shrink');
		$('#menu_header_vert').addClass('grow').removeClass('shrink');
	});
});
