<!-- 파일 전송 수 제한 -->
function fileOption() {
	let files = document.getElementById("files");
	if (files.files.length > 2) {
		alert("이미지 파일은 2개 까지만 가능합니다.");
		document.getElementById("files").value = "";
		return;
	}
}

<!-- insert에서 누락되어있는 항목 경고문 -->
function submitOption() {
	if ($('#notice_title').val() == '') {
		alert("공지제목을 입력해주세요");
		return false;
	}
	if ($('#notice_content').val() == '') {
		alert("공지 내용을 입력해주세요");
		return false;
	}
	if ($('#notice_hit').val() == '') {
		alert("조회수를 입력해주세요");
		return false;
	}
	<!-- 파일 최소 1개 이상 전송 경고 -->
	let files = document.getElementById("files");
	if (files.files.length < 1) {
		alert("최소 1개 이상의 이미지를 보내주세요");
		return false;
	}
}