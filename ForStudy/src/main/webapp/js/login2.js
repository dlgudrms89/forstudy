jQuery(document).ready(function($){
	//if you change this breakpoint in the style.css file (or _layout.scss if you use SASS), don't forget to update this value as well
	var $L = 1200,
		$menu_navigation2 = $('#main-nav'),
		$cart_trigger2 = $('#cd-cart-trigger2'),
		$hamburger_icon2 = $('#cd-hamburger-menu2'),
		$lateral_cart2 = $('#cd-cart2'),
		$shadow_layer2 = $('#cd-shadow-layer2');

	//open lateral menu on mobile
	$hamburger_icon2.on('click', function(event){
		event.preventDefault();
		//close cart panel (if it's open)
		$lateral_cart2.removeClass('speed-in');
		toggle_panel_visibility2($menu_navigation2, $shadow_layer2, $('body'));
	});

	//open cart
	$cart_trigger2.on('click', function(event){
		event.preventDefault();
		//close lateral menu (if it's open)
		$menu_navigation2.removeClass('speed-in');
		toggle_panel_visibility2($lateral_cart2, $shadow_layer2, $('body'));
	});

	//close lateral cart or lateral menu
	$shadow_layer2.on('click', function(){
		$lateral_cart2.removeClass('speed-in');
		$menu_navigation2.removeClass('speed-in');
		$shadow_layer2.removeClass('is-visible');
		$('body').removeClass('overflow-hidden');
	});

	//move #main-navigation inside header on laptop
	//insert #main-navigation after header on mobile
	move_navigation2( $menu_navigation2, $L);
	$(window).on('resize', function(){
		move_navigation2( $menu_navigation2, $L);
		
		if( $(window).width() >= $L && $menu_navigation2.hasClass('speed-in')) {
			$menu_navigation2.removeClass('speed-in');
			$shadow_layer2.removeClass('is-visible');
			$('body').removeClass('overflow-hidden');
		}

	});
});

function toggle_panel_visibility2 ($lateral_panel, $background_layer, $body) {
	if( $lateral_panel.hasClass('speed-in') ) {
		$lateral_panel.removeClass('speed-in');
		$background_layer.removeClass('is-visible');
		$body.removeClass('overflow-hidden');
	} else {
		$lateral_panel.addClass('speed-in');
		$background_layer.addClass('is-visible');
		$body.addClass('overflow-hidden');
	}
}

function move_navigation2( $navigation, $MQ) {
	if ( $(window).width() >= $MQ ) {
		$navigation.detach();
		$navigation.appendTo('header');
	} else {
		$navigation.detach();
		$navigation.insertAfter('header');
	}
}