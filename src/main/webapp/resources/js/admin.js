/*input type="file" 에서 이미지 첨부했을때 미리보기 기능*/
function readURL1(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview1').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview1').src = "";
    }
}
/*input type="file" 에서 이미지 첨부했을때 미리보기 기능*/
function readURL2(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview2').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview2').src = "";
    }
}
/*input type="file" 에서 이미지 첨부했을때 미리보기 기능*/
function readURL3(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview3').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview3').src = "";
    }
}

///////////////////////////////////////////////////////////////////////////
/*board_update에서 이미 이미지 들어가있을때 변경할 이미지로 이미지 변경되는 기능*/
function readURL4(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('file_change1').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('file_change1').src = "";
    }
}
/*board_update에서 이미 이미지 들어가있을때 변경할 이미지로 이미지 변경되는 기능*/
function readURL5(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('file_change2').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('file_change2').src = "";
    }
}
/*board_update에서 이미 이미지 들어가있을때 변경할 이미지로 이미지 변경되는 기능*/
function readURL6(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('file_change3').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('file_change3').src = "";
    }
}
/*board_update에서 이미 동영상 들어가있을때 변경할 동영상으로 변경되는 기능*/
function readURL7(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('file_change4').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);

    } else {
        document.getElementById('file_change4').src = "";
    }
}