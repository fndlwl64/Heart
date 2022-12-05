/*mypage에서 메뉴 클릭시 화면 전환*/
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

function my_wish() {
    document.getElementById('my_cont1').style.display='block';
    document.getElementById('my_cont2').style.display='none';
    document.getElementById('my_cont3').style.display='none';
    document.getElementById('my_cont4').style.display='none';
    document.getElementById('my_cont5').style.display='none';

}

function my_adopt_reg() {
    document.getElementById('my_cont1').style.display='none';
    document.getElementById('my_cont2').style.display='block';
    document.getElementById('my_cont3').style.display='none';
    document.getElementById('my_cont4').style.display='none';
    document.getElementById('my_cont5').style.display='none';
}

function my_adopt_complet() {
    document.getElementById('my_cont1').style.display='none';
    document.getElementById('my_cont2').style.display='none';
    document.getElementById('my_cont3').style.display='block';
    document.getElementById('my_cont4').style.display='none';
    document.getElementById('my_cont5').style.display='none';
}

function profile_update() {
    document.getElementById('my_cont1').style.display='none';
    document.getElementById('my_cont2').style.display='none';
    document.getElementById('my_cont3').style.display='none';
    document.getElementById('my_cont4').style.display='block';
    document.getElementById('my_cont5').style.display='none';
}

function profile_delete() {
    document.getElementById('my_cont1').style.display='none';
    document.getElementById('my_cont2').style.display='none';
    document.getElementById('my_cont3').style.display='none';
    document.getElementById('my_cont4').style.display='none';
    document.getElementById('my_cont5').style.display='block';
}