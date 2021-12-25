jQuery('#selectBox').change(function() {
	var state = jQuery('#selectBox option:selected').val();
	console.log('state : ' + state);
	if (state == 'option1') {
		jQuery('#layer1').show();
	} else if (state == 'option2') {
		jQuery('#layer2').show();
	}
	else {
		/*jQuery('#layer1').hide();
		jQuery('#layer2').hide();*/
	}
});