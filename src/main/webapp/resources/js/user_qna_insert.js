/* checkbox */	
$(document).ready(function() {
    $('input[type=checkbox][name=board_secret]').change(function() {
        if (this.checked) {
        	$('input[type=hidden][name=board_secret]').attr('disabled', true);
            console.log(this);
        	console.log(typeof this.value);
        }else {
        	$('input[type=hidden][name=board_secret]').attr('disabled', false);
            console.log(this);
        	console.log(typeof this.value);
        }
    });
}) 