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
       
    // 부모글 비밀글 시
    if($('input[type=checkbox][name=board_secret]').attr('disabled')) {
		$('input[type=hidden][name=board_secret]').attr('disabled', false);	
		$('input[type=hidden][name=board_secret]').val('Y');
	}
	
	
});