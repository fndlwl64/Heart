/*파일 전송 수 제한*/
function fileOption(num, name) {
	let fileNum = $("input[type='file'][name='"+name+"']");
	console.log("fileNum"+fileNum);
	console.log("files "+fileNum[0].files.length);
	if (fileNum[0].files.length > num) {
		alert("이미지 파일은 "+num+"개 까지만 가능합니다.");
		$("input[type='file'][name='"+name+"']").val("");
		return;
	}
}