/* checkbox */	
$(document).ready(function() {

	let secretCheck = $('input[type=checkbox][name=board_secret]').is(':checked');

	// checkbox가 unchecked -> value 값이 없을 때
	if(secretCheck == false) {
		$('input[type=hidden][name=board_secret]').attr('disabled', false);	
		console.log("checkbox : checked - "+secretCheck);	
		console.log("hidden : val() - "+$('input[type=hidden][name=board_secret]').val());	
		console.log("hidden : disabled - "+$('input[type=hidden][name=board_secret]').is('disabled'));	
	}

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
    
    console.log($('input[type=checkbox][name=board_secret]').is(':disabled'));
       
    // 부모글 비밀글 시
    if($('input[type=checkbox][name=board_secret]').is(':disabled')) {
		$('input[type=hidden][name=board_secret]').attr('disabled', false);	
		$('input[type=hidden][name=board_secret]').val('Y');
		console.log("hidden : val() - "+$('input[type=hidden][name=board_secret]').val());
		console.log("hidden : disabled - "+$('input[type=hidden][name=board_secret]').attr('disabled'));
		console.log("checkbox : val() - "+$('input[type=checkbox][name=board_secret]').val());
		console.log("checkbox : disabled - "+$('input[type=checkbox][name=board_secret]').attr('disabled'));		
	}
	
	
	
});