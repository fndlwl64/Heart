$(document).ready(function() {
	
	$('select[name=field]').change(function() {
	let categorySelected = $('select[name=field] option:selected').val();
		if(categorySelected == 'category') {
			$('.search input[type=text]').removeClass('d-inline').addClass('d-none');	
	    	$('.search select.w-50').removeClass('d-none').addClass('d-inline');
	    	$('.search input[type=text]').attr("name", "");
	    	$('.search select.w-50').attr("name", "keyword");
		}else {
			$('.search input[type=text]').removeClass('d-none').addClass('d-inline');
	    	$('.search select.w-50').removeClass('d-inline').addClass('d-none');
	    	$('.search input[type=text]').attr("name", "keyword");
	    	$('.search select.w-50').attr("name", "");	    	
		}
	});
});

