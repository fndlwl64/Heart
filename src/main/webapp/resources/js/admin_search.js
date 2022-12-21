$(document).ready(function() {	
	
   if($('select[name=field] option:selected').val() == 'category') {
        $('.search input[type=text]').removeClass('d-inline').addClass('d-none');   
        $('.search select.search-select').removeClass('d-none').addClass('d-inline');
    }else {
        $('.search input[type=text]').removeClass('d-none').addClass('d-inline');
        $('.search select.search-select').removeClass('d-inline').addClass('d-none');      
    }
                
	$('select[name=field]').change(function() {
	let categorySelected = $('select[name=field] option:selected').val();
		if(categorySelected == 'category') {
			$('.search input[type=text]').removeClass('d-inline').addClass('d-none');	
	    	$('.search select.search-select').removeClass('d-none').addClass('d-inline');
	    	$('.search input[type=text]').attr("name", "");
	    	$('.search select.search-select').attr("name", "keyword");
		}else {
			$('.search input[type=text]').removeClass('d-none').addClass('d-inline');
	    	$('.search select.search-select').removeClass('d-inline').addClass('d-none');
	    	$('.search input[type=text]').attr("name", "keyword");
	    	$('.search select.search-select').attr("name", "");	    	
		}
		$('.search input[type=text]').val('');
	});
});

