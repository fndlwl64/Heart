<!-- insert에서 누락되어있는 항목 경고문 -->
function submitOption() {
	if ($('#sup_user').val() == '') {
		alert("후원회원을 입력해주세요");
		return false;
	}
	if ($('#sup_price').val() == '') {
		alert("후원금액을 입력해주세요");
		return false;
	}
	if ($('#sup_date').val() == '') {
		alert("후원일자를 입력해주세요");
		return false;
	}
}

function popup(path){
	  let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=900, height=900, top=100,left=400";
	  window.open(path+"/user_support_insert","_blank", options);
}
