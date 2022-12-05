<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../include/user_header.jsp"/>

<body>
<div class="d-flex justify-content-center">
    <form action="/user_dog
    _insert" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <th>종류</th>
                <td>
                    <select name="tag" class="form-select">
                        <option value="dog" selected>강아지</option>
                        <option value="cat">고양이</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>품종</th>
                <td><input type="test" name="dog
                _species" class="form-control"></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <select name="dog
                    _gender" class="form-select">
                        <option value=""></option>
                        <option value="male">수컷</option>
                        <option value="female">암컷</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>중성화</th>
                <td>
                    <select name="dog
                    _neutered" class="form-select">
                        <option value=""></option>
                        <option value="Y">O</option>
                        <option value="N">X</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>예방 접종</th>
                <td>
                    <select name="dog
                    _vaccination" class="form-select">
                        <option value=""></option>
                        <option value="Y">O</option>
                        <option value="N">X</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>나이</th>
                <td><input type="test" name="dog
                _age" class="form-control"></td>
            </tr>
            <tr>
                <th>발견 장소</th>
                <td><input type="test" name="dog
                _place" class="form-control"></td>
            </tr>
            <tr>
                <th>크기</th>
                <td><input type="number" name="dog
                _size" class="form-control"></td>
            </tr>
            <tr>
                <th>무게</th>
                <td><input type="number" name="dog
                _weight" class="form-control"></td>
            </tr>
            <tr>
                <th>상세 내용</th>
                <td><textarea name="dog
                _caution" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>첨부 이미지</th>
                <td><input type="file" name="files" class="form-control" accept="image/gif, image/jpeg, image/png"
                           multiple></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center"><input type="submit" value="입양 등록" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
</div>
</body>

<jsp:include page="../../include/user_footer.jsp"/>