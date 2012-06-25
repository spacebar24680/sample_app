function updateCountdown() {
	// 140 is the maximum message length
	var remaining = 140 - jQuery('#micropost_content').val().length;
	if(remaining < 0){
		jQuery('.countdown').text('Exceeded limit!');
	}
	else
		jQuery('.countdown').text(remaining + ' characters remaining');
}

function changeCountdownColor() {
	document.getElementById('charCounter').className = 'countdownExceed';
}

jQuery(document).ready(function($) {
	updateCountdown();
	$('#micropost_content').change(updateCountdown);
	$('#micropost_content').keyup(updateCountdown);
});