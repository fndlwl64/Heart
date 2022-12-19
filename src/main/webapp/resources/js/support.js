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