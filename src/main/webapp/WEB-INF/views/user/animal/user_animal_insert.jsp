<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/animal.css" />

<jsp:include page="../../include/user_header.jsp"/>

<body>
<div class="div1">
    <div class="title">
    	<h3>HeartPet 입소 신청</h3>
    	<span>유기동물이 가족을 만날 수 있도록 정확한 정보를 기입해주세요.</span>
    </div>
    
    <div class="insert-form">
	    <form action="<%=request.getContextPath() %>/user_animal_insert" method="post" enctype="multipart/form-data" onsubmit="return submitOption();">
	    	<input type="hidden" value="${sessionScope.session_id }" id="user_id" name="user_id"/>
	    	<input type="hidden" value="${sessionScope.session_admin_id }" id="user_admin_id" name="user_admin_id"/>
	    	
	    	<input type="hidden" value="${sessionScope.session_grade }" id="user_grade"/>
	        <input type="hidden" value="${sessionScope.session_admin_grade }" id="user_admin_grade"/>
	      
	        <table class="table caption-top">
                <caption><span class="must-write">*</span> 표시는 필수 입력 사항입니다.</caption>
				<thead class="table-light">
					<tr>
		                <th colspan="6">입소 신청 양식</th>
		            </tr>
				</thead>
				<tbody>
	            <tr>
	                <th width="15%">종류 <span class="must-write">*</span></th>
	                <td width="35%">
	                    <select name="animal_tag" class="form-select" id="tag" onchange="optionChange();">
	                    	<option value=""></option>
	                        <option value="dog">강아지</option>
	                        <option value="cat">고양이</option>
	                    </select>
	                </td>
	                <td width="50%" colspan="4"><select name="animal_species" class="form-control" id="species"></select></td>
	            </tr>
	            <tr>
	                <th>추정 이름</th>
	                <td><input type="text" name="animal_name" class="form-control" id="name" placeholder="모를 시 '알 수 없음' 기재해주세요."></td>
	                <th width="15%">추정 나이</th>
	                <td width="30%" colspan="3">
	                   <input type="number" name="animal_age" min="0" max="20" class="form-control" id="age">
	                </td>
	            </tr>
	            <tr>
	                <th>성별 <span class="must-write">*</span></th>
	                <td>
	                    <select name="animal_gender" class="form-select" id="gender">
	                        <option value=""></option>
	                        <option value="male">수컷</option>
	                        <option value="female">암컷</option>
	                    </select>
	                </td>
	                <th>중성화 유무 <span class="must-write">*</span></th>
	                <td width="10%">
	                    <select name="animal_neutered" class="form-select" id="neutered">
	                        <option value=""></option>
	                        <option value="Y">C</option>
	                        <option value="N">NO</option>
	                    </select>
	                </td>
	                <th width="15%">접종 유무 <span class="must-write">*</span></th>
	                <td width="10%">
	                    <select name="animal_vaccination" class="form-select" id="vaccination">
	                        <option value=""></option>
	                        <option value="Y">YES</option>
	                        <option value="N">NO</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th>발견 장소 <span class="must-write">*</span></th>
	                <td colspan="5">
	                    <input type="text" name="animal_place" class="form-control" placeholder="최대한 구체적으로 적어주세요." id="place">
	                </td>
	            </tr>
	            <tr>
	                <th>사이즈 <span class="must-write">*</span></th>
	                <td>
	                    <select name="animal_size" class="form-select" id="size" onclick="optionChangeSize();">
	                    	<option value=""></option>
	                        <option value="소형">소형</option>
	                        <option value="중형">중형</option>
	                        <option value="대형">대형</option>
	                    </select>
	                </td>
	                <th>무게 <span class="must-write">*</span></th>
	                <td colspan="3">
	                    <div class="d-flex align-items-center">
		                    <input type="number" name="animal_weight" class="form-control" id="weight" min="0" max="40" placeholder="무게를 모르면 공백으로 해주세요">
		                    <span class="ms-2"><b>kg</b></span>
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <th>상세 내용</th>
	                <td colspan="5">
	                    <textarea name="animal_caution" class="form-control" id="content" placeholder="유기동물의 특징을 자세히 적어주세요. ex) 아이가 짖는 편입니다." rows="10"></textarea>
	                </td>
	            </tr>
	            <tr>
	                <th>첨부 이미지 <span class="must-write">*</span></th>
	                <td colspan="5">
	                   <input type="text" class="form-control-plaintext" value="※ 사진 등록은 필수입니다(최소 1장 ~ 최대 3장)." />
	                   <input type="file" name="files" id="files" class="form-control" accept="image/gif, image/jpeg, image/png"
	                           onchange="fileOption();" multiple>
	                </td>
	            </tr>
	            </tbody>
	        </table>
	        <div class="buttons">
	            <button type="submit" class="btn btn-primary"><i class="bi bi-arrow-up-square"></i> 등록</button>        
	        </div> 
       </form>
    </div>
</div>
<script>

		function optionChangeSize(){
			if($('#size').val() === '소형'){
				$('#weight').prop("min" , '1');
				$('#weight').prop("max" , '4');
			}
			if($('#size').val() === '중형'){
				$('#weight').prop("min" , '4');
				$('#weight').prop("max" , '10');
			}
			if($('#size').val() === '대형'){
				$('#weight').prop("min" , '10');
				$('#weight').prop("max" , '40');
			}
			console.log($('#weight').val());
		}

        /*동적 동물 선택 태그*/
        function optionChange(){
            const dog = ["말티즈","푸들","포메라니안","믹스견","치와와","시츄","골든리트리버","진돗개","기타"];
            const cat = ["스코티시 폴드","샴","페르시안","터키시 앙고라","러시안 블루","벵갈","먼치킨","아비시니안","기타"];
            let result;
            let tag = $('#tag').val();
            if (tag === 'cat'){
                result = cat;
            }else if(tag === 'dog'){
                result = dog;
            }
            $('#species').empty();
            $('#species').append('<option></option>');
            for (let i=0;i<result.length ; i++){
                $('#species').append('<option value='+result[i]+'>'+ result[i] + '</option>');
            }
        }
        /*파일 전송 수 제한*/
        function fileOption(){
            let files = document.getElementById("files");
            if (files.files.length>3){
                alert("이미지 파일은 3개 까지만 가능합니다.");
                document.getElementById("files").value = "";
                return;
            }
        }
        
        function  submitOption(){
        	/* 회원 정보 */
        	
        	if ($('#user_admin_id').val() == ''){
        		if ($('#user_id').val() == ''){
                    alert("로그인을 해주세요");
                    return false;
                }
            	if ($('#user_grade').val() > 2){
                    alert("회원의 등급이 낮아 입소 자격이 없습니다.");
                    return false;
                }
        	}
        	if ($('#tag').val() == ''){
                alert("동물 종류를 골라주세요");
                return false;
            }
        	if ($('#species').val() == ''){
                alert("품종을 골라주세요");
                return false;
            }
        	if ($('#name').val() == ''){
                alert("이름을 적어주세요");
                return false;
            }
        	if ($('#gender').val() == ''){
                alert("성별을 골라주세요");
                return false;
            }
        	if ($('#neutered').val() == ''){
                alert("중성화 여부를 골라주세요");
                return false;
            }
        	if ($('#vaccination').val() == ''){
                alert("백신 여부를 골라주세요");
                return false;
            }
        	if ($('#age').val() == ''){
                alert("나이를 적어주세요");
                return false;
            }
        	if ($('#place').val() == ''){
                alert("발견한 장소를 적어주세요");
                return false;
            }
        	if ($('#size').val() == ''){
                alert("크기를 골라주세요");
                return false;
            }
        	if ($('#weight').val() == ''){
                $('#weight').attr("value",0);
            }
        	if ($('#content').val() == ''){
                alert("내용을 적어주세요");
                return false;
            }
        	
        	
        	/*파일 최소 1개 이상 전송 경고*/	
        	let files = document.getElementById("files");
            if (files.files.length<1){
                alert("최소 1개 이상의 이미지를 보내주세요");
                return false;
            }
            
            
        }
       
</script>
</body>


<jsp:include page="../../include/user_footer.jsp"/>

