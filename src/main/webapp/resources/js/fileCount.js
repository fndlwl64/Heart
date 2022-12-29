/* parameter id 값으로 */
function fileOption(num, id) {
    let fileNum = $("input[type='file'][id='"+id+"']");
    if (fileNum[0].files.length > num) {
        alert("이미지 파일은 "+num+"개 까지만 가능합니다.");
        $("input[type='file'][id='"+id+"']").val("");
        return;
    }
}