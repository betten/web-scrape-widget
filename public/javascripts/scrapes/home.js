var validateForm = function() {
	$('#wsw-url, #wsw-selector').removeClass('wsw-error');
	if(!$('#wsw-url').val().length) {
		$('#wsw-url').addClass('wsw-error');
		return false;
	}
	if(!$('#wsw-selector').val().length) {
		$('#wsw-selector').addClass('wsw-error');
		return false;
	}
	return true;
};
$(document).ready(function() {
	$('#wsw-update').click(function() {
		if(!validateForm()) return false;
		var url = $('#wsw-url').val();
		var selector = $('#wsw-selector').val();
		$('#wsw-code').text('loading...');
		$.post('/scrapes/test', {
			'url': url,
			'selector': selector
		}, function(data) {
			$('#wsw-code').text(data.result);
			var params = 'width=400,height=200';
			var preview = window.open('', 'preview', params);
			preview.document.write('<title>web scrape widget - preview</title>' + data.result);
			preview.focus();
		}, 'json');
		return false;
	});
	$('#wsw-url, #wsw-selector').keypress(function(e) {
		if(e.keyCode == 13) {
			$('#wsw-update').click();
			return false;
		}
	});
	$('#wsw-help-link').click(function() {
		$('#wsw-help').slideToggle();
		return false;
	});
	$('#wsw-for-real-link').click(function() {
		$('#wsw-for-real').slideToggle();
		return false;
	});
	$('#wsw-widget-form').submit(function() {
		if(!validateForm()) return false;	
	});
});
