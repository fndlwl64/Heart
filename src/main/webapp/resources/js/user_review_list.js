<!-- hidden value change -->
function animalChange(value) {
	console.log("여기"+value);
	$('input[type=hidden][name=animal_tag]').val(value);
	console.log($('input[type=hidden][name=animal_tag]').val());
    return true;
}