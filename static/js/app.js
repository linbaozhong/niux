$(function () {
	snow.main = $('#main');
	snow.footer = $('#footer');

	snow.win.resize(function () {
		
		if (snow.main.height() + snow.main.offset().top + snow.footer.outerHeight() > snow.win.height()) {
			snow.footer.removeClass('fixed-bottom');
		} else {
			snow.footer.addClass('fixed-bottom');
		}
	}).resize();
});