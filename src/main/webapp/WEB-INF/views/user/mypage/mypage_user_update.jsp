<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../include/user_header.jsp" />
<script src="resources/js/mypage.js"></script>
<script src="resources/js/signin_up.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<link rel="stylesheet" href="resources/css/mypage.css"/>
<%-- 여기서부터 작성 --%>

<%-- <div class="mypage_header">
    <div>
        <br><h1 class="mypage"><a id="mypage_a" href="${path }/user_mypage_wish_list">My Page</a><a class="adopt_a" href="${path }/user_mypage_adoptreg_list"><span id="adopt_span">입양대기목록<button id="adopt_btn"><span id="adopt_span2">${Count }</span></button></span></a></h1>
    </div>
    <br>
     <div class="mypage_header_mid">
        <div class="profile_img">
            <img id="profile_dog" src="${path }/resources/image/user_img/${dto.getUser_image()}">
        </div>
        <div class="profile_text">
            <h1>${dto.getUser_name() }<span class="sp1"><a href="${path }/user_mypage_user_update">회원정보변경</a></span></h1>
        </div>
        <div class="profile_text2">
            <table id="mypage_table">
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list"><img class="mypage_img" src="${path }/resources/image/level.png"></a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list"><img class="mypage_img" src="${path }/resources/image/support.png"></a></td>
                    <td><a class="table_a" href="${path }/user_review_list"><img class="mypage_img" src="${path }/resources/image/review.png"></a></td>
                </tr>
                <tr>
                    <td><a class="table_a" href="${path }/user_mypage_grade_list">등급</a></td>
                    <td><a class="table_a" href="${path }/user_mypage_support_list">후원금</a></td>
                    <td><a class="table_a" href="${path }/user_review_list">후기</a></td>
                </tr>
                <tr>
                    <td><a class="table_b" href="${path }/user_mypage_grade_list">${dto.getUser_grade()}등급</a></td>
                    <td><a class="table_b" href="${path }/user_mypage_support_list">${Sum }</a></td>
                    <td><a class="table_b" href="${path }/user_review_list">${review_Count }</a></td>
                </tr>
            </table>
        </div>
    </div>
</div> --%>
<%@ include file="mypage_top.jsp" %>
<div class="mypage_middle">
    <div class="mypage_top"></div>
<%--     <div class="mypage_menu">
        <ul class="middle_ul">
            <li><a href="${path }/user_mypage_wish_list" class="my_a">관심목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptreg_list" class="my_a">입양대기목록</a></li><br><br>
            <li><a href="${path }/user_mypage_adoptcomplet_list" class="my_a">입양완료목록</a></li><br><br>
            <li><a href="${path }/user_mypage_user_update" class="my_a">회원정보변경</a></li><br><br>
            <li><a href="${path }/user_mypage_user_delete" class="my_a">회원탈퇴</a></li>
        </ul>
    </div> --%>
    <%@ include file="mypage_menu.jsp" %>
	    <div id="my_cont4" class="mypage_cont">
	        <div align="center">
	            <form method="post" action="${path }/user_mypage_user_update2">
	                <h3>회원정보변경</h3>
	                <c:if test="${empty dto.getUser_email() || empty dto.getUser_phone() || empty dto.getUser_addr()}">
	                <br>
	                <span class="not_email">회원 이메일, 연락처, 주소를 등록해야 추후에 비밀번호찾기, 회원탈퇴, 후원하기 등이 가능합니다. </span>
	                </c:if>
	                <table class="table searched_list">
	                    <tr>
	                        <th>아이디</th>
	                        <td><input name="user_id" class="form-control" type="text" value="${dto.getUser_id()}" readonly></td>
	                    </tr>
	                    <tr>
	                        <th><span class="sp2">이름</span></th>
	                        <td><input name="user_name" class="form-control" type="text" value="${dto.getUser_name()}"></td>
	                    </tr>
	                    <tr>
	                        <th><span class="sp2">이메일</span></th>
	                        <td><input name="user_email" class="form-control" type="text" value="${dto.getUser_email()}"></td>
	                    </tr>
	                    <tr>
	                        <th><span class="sp2">연락처</span></th>
	                        <td><input name="user_phone" class="form-control" type="text" value="${dto.getUser_phone()}"></td>
	                    </tr>
	                    <tr>
	                        <th><span class="sp2">주소</span></th>
	                        <c:set var="addr" value="${dto.user_addr }"/>
                        	<c:if test="${empty addr }">
				                <td class="addr_info">
					                <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_postcode" placeholder="우편번호">
				                    <input id="zipcode_search" class="search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_address" placeholder="주소"><br>
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_detailAddress" placeholder="상세주소">
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_extraAddress" placeholder="참고항목">
				                </td>
				            </c:if>
				                
				            <c:if test="${!empty addr }">
				                <td class="addr_info">
					                <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_postcode" value="${fn:split(addr,',')[0]}"  >
				                    <input id="zipcode_search" class="btn search_zipcode" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_address" value="${fn:split(addr,',')[1]}"  ><br>
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_detailAddress" value="${fn:split(addr,',')[2]}"  >
				                    <input class="form-control-sm addr" name="user_addr" type="text" id="sample6_extraAddress" value="${fn:split(addr,',')[3]}"  >
				                </td>
				        	</c:if>
	                    </tr>
	                    <tr>
	                        <th><span class="sp2">반려동물경험</span></th>
	                        <td align="left" class="ps-3">
	                        	<c:if test="${dto.getUser_animalexp() == 'Y' }">
	                        	<%-- <input name="user_animalexp" class="form-control" type="text" value="${dto.getUser_animalexp()}"> --%>
	                  			<label><input type="radio" name="user_animalexp" value="Y" checked="checked"/> 있음</label>
	                  			<label><input type="radio" name="user_animalexp" value="N" /> 없음</label>
	                  			</c:if>
	                        	
	                        	<c:if test="${dto.getUser_animalexp() == 'N' }">
	                        	<%-- <input name="user_animalexp" class="form-control" type="text" value="${dto.getUser_animalexp()}"> --%>
	                  			<label><input type="radio" name="user_animalexp" value="Y" /> 있음</label>
	                  			<label><input type="radio" name="user_animalexp" value="N" checked="checked"/> 없음</label>
	                  			</c:if>
	                        	
	                        	<c:if test="${empty dto.getUser_animalexp()}">
	                        	<%-- <input name="user_animalexp" class="form-control" type="text" value="${dto.getUser_animalexp()}"> --%>
	                  			<label><input type="radio" name="user_animalexp" value="Y" /> 있음</label>
	                  			<label><input type="radio" name="user_animalexp" value="N" /> 없음</label>
	                        	</c:if>
	                        </td>
	                    </tr>
	                </table>
	                <div class="btn_position">
	                	<button class="btn btn-warning btn_update" id="update_btn" type="reset"><i class="bi bi-pencil"></i> 리셋</button>
	                	<button class="btn btn-success" type="submit"><i class="bi bi-eraser"></i> 수정</button>
	                </div>
	            </form>
	        </div>
	    </div>
    </div>
    <!-- mypage-body end 부분  -->
    <div class="mypage_bottom">
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />

