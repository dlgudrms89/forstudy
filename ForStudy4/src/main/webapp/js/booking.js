$(document).ready(function() {
	$('.btn').click(function() {
		var $btn = $('.btn');
		$btn.toggleClass('booked');
		$('.diamond').toggleClass('windup');
		$('form').slideToggle(300);
		
		$('.linkbox').toggle(200);
		if ($btn.text() == "Sign Up") {
	      $btn.text("Thank You");
	    } else {
	      self.close();
	    }
	});
});