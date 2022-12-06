<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/user_header.jsp"/>

<body>
<div class="d-flex justify-content-center">
    <form action="<%=request.getContextPath() %>/user_animal_insert" method="post" enctype="multipart/form-data" onsubmit="return submitOption();">
        <table class="table">
            <tr>
                <th>종류</th>
                <td>
                    <select name="tag" class="form-select" id="tag" onchange="optionChange();">
                        <option value="dog" selected>강아지</option>
                        <option value="cat">고양이</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>품종</th>
                <td><select name="animal_species" class="form-control" id="species"></select></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <select name="animal_gender" class="form-select">
                        <option value=""></option>
                        <option value="male">수컷</option>
                        <option value="female">암컷</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>중성화</th>
                <td>
                    <select name="animal_neutered" class="form-select">
                        <option value=""></option>
                        <option value="Y">O</option>
                        <option value="N">X</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>예방 접종</th>
                <td>
                    <select name="animal_vaccination" class="form-select">
                        <option value=""></option>
                        <option value="Y">O</option>
                        <option value="N">X</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>나이</th>
                <td><input type="test" name="animal_age" class="form-control"></td>
            </tr>
            <tr>
                <th>발견 장소</th>
                <td><input type="test" name="animal_place" class="form-control"></td>
            </tr>
            <tr>
                <th>크기</th>
                <td><input type="number" name="animal_size" class="form-control"></td>
            </tr>
            <tr>
                <th>무게</th>
                <td><input type="number" name="animal_weight" class="form-control"></td>
            </tr>
            <tr>
                <th>상세 내용</th>
                <td><textarea name="animal_caution" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>첨부 이미지</th>
                <td><input type="file" name="files" id="files" class="form-control" accept="image/gif, image/jpeg, image/png"
                           onchange="fileOption();" multiple></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center"><input type="submit" value="입양 등록" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
</div>
<script>
        /*동적 동물 선택 태그*/
        function optionChange(){
            const dog = ["말티즈","푸들","포메라니안","믹스견","치와와","시츄","골든리트리버","진돗개"];
            const cat = ["스코티시 폴드","샴","페르시안","터키시 앙고라","러시안 블루","벵갈","먼치킨","아비시니안"];
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
        /*파일 최소 1개 이상 전송 경고*/
        function  submitOption(){
            let files = document.getElementById("files");
            if (files.files.length<1){
                alert("최소 1개 이상의 이미지를 보내주세요");
                return false;
            }
        }
        /*document.getElementById('submit').addEventListener('submit',function (event){
           if(document.getElementById("files").files.length<1){
               alert("최소 1개 이상의 이미지를 보내주세요");
               event.preventDefault();
           }
        });*/
</script>
</body>

<jsp:include page="../include/user_footer.jsp"/>