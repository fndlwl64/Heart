//팝업 위치를 지정(화면의 가운데 정렬)
var width = 500; //팝업의 너비
var height = 600; //팝업의 높이
var themeObj = {
    bgColor: "#ECECEC", //바탕 배경색
    searchBgColor: "#FFFFFF", //검색창 배경색
    contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    pageBgColor: "#FAFAFA", //페이지 배경색
    textColor: "#333333", //기본 글자색
    queryTextColor: "#222222", //검색창 글자색
    postcodeTextColor: "#FA4256", //우편번호 글자색
    emphTextColor: "#008BD3", //강조 글자색
    outlineColor: "#E0E0E0" //테두리
};

// 회원가입 다음 주소 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            width: width //생성자에 크기 값을 명시적으로 지정해야 합니다.
            height: height
            popupTitle : '우편주소 검색'
            autoClose: false

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();

        }
    }).open({
        left: (window.screen.width / 2) - (width / 2),
        top: (window.screen.height / 2) - (height / 2)
    });
}




$(function() {
	// 카카오 api 사용
	Kakao.init('b6f75c3aa40a005f012dbe14f5ac031e');
	Kakao.isInitialized();
	console.log(Kakao.isInitialized());
	
	// 카카오 로그인 api
	Kakao.Auth.createLoginButton({
	    container: '#kakao-login-btn',
	    success: function(authObj) {
	        Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(result) {
	                id = "K"+result.id
	                nickname = result.properties.nickname
	                kakao_account = result.kakao_account
	               
	                console.log('아이디 :'+id, '이름 :'+nickname);
	
	                $.ajax({
	                    type: "POST",
	                    contentType:  "application/x-www-form-urlencoded;charset=UTF-8",
	                    url: "/project/kakao_login",
	                    data: {
	                        paramId : id,
	                        paramName : nickname
	                    },
	                    dataType: "text",
	                    success: function(data) {
	                    	if(data != null) {
	                    		console.log("카카오 로그인 성공");
	                        	alert('로그인 되었습니다!');
	                        	window.location.reload();
	                    		
	                    	}else {
	                    		alert('로그인 실패ㅠ');
	                    	}
	                    },
	                    error: function(e) {
	                        console.log("ajax fail", e);
	                    }
	                });
	
	            },
	            fail: function(error) {
	                alert(
	                    'login success, but failed to request user information: ' +
	                    JSON.stringify(error)
	                );
	            }
	        });
	    },
	    fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err));
	    }
	});
  	
});

	var naver_id_login = new naver_id_login("fw7rzSQL46p95xisWWtm", "http://localhost:8081/project/naver_login");
	var state = naver_id_login.getUniqState();

	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("http://localhost:8081/project/");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();


