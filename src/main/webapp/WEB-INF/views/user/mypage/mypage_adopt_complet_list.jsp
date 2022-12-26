<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../include/user_header.jsp" />
<script src="resources/js/mypage.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
<c:set var="sendCheck" value="${sendCheck }"/>
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
	    <div id="my_cont3" class="mypage_cont">
	        <div align="center">
	        	<c:if test="${!empty aList }">
					<h3>입양완료목록</h3>
					<table class="wish_table">
						<tr>
						<c:forEach items="${aList }" var="dto" varStatus="status">
						<c:set var="count" value="${count + 1 }"/>
							<td>
								<a class="animal_cont" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><img class="my_cont_img" src="${path}${dto.getAnimal_img1()}"></a>
							</td>
							<td>
								<div class="animal_detail">
									<label>이름</label><a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><span> ${dto.getAnimal_name()}</span></a><br />
									<label>종</label><a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><span> 
										<c:if test="${dto.getAnimal_species().length() > 5}">
											${dto.getAnimal_species().substring(0,4)} ..
										</c:if>
										
										<c:if test="${dto.getAnimal_species().length() < 5}">
											${dto.getAnimal_species()}
										</c:if></span></a><br />
				                	<label>성별</label><a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><span> 
				                		<c:if test="${dto.getAnimal_gender() eq 'female'}">
											암컷 (♀)
										</c:if>
										
										<c:if test="${dto.getAnimal_gender() eq 'male'}">
											수컷 (♂)
										</c:if></span></a><br />
				                	<label>나이</label><a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><span> ${dto.getAnimal_age()}살</span></a><br />
				                	<label>입양예정일</label><a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><span> 
				                		<c:if test="${empty dto.getAdopt_reg_duedate()}">
											미정
										</c:if>
										
										<c:if test="${!empty dto.getAdopt_reg_duedate() }">
											${dto.getAdopt_reg_duedate().substring(0, 10)}
										</c:if></span></a><br />
								</div>
								
								<c:if test="${ empty sendCheck[status.index].count }">
		                			<button class="btn btn-dark review_write" onclick="location.href='${path }/user_review_insert?animal_no=${dto.getAnimal_no()}'"><i class="bi bi-pencil-fill"></i> 후기작성</button>
			                	</c:if>
			                	<c:if test="${ sendCheck[status.index].count gt 0  }">
			                		<button class="btn btn-dark review_write" onclick="location.href='${path }/user_review_content?review_no=${ sendCheck[status.index].review_no }'"><i class="bi bi-pencil-fill"></i> 내가 쓴 후기</button>
			                	</c:if>
							</td>
							<c:if test="${count % 2 == 0 }">
								<tr>
								</tr>
							</c:if>
						</c:forEach>
						</tr>
					</table>
				</c:if>
	            <c:if test="${empty aList }">
	            	<h1>입양완료 목록이 없습니다!</h1>
	            </c:if>
	        </div>
	    </div>
    </div>
    <%@ include file="../../include/pagination_update.jsp" %>
    <!-- mypage-body end 부분  -->
    <div class="mypage_bottom">
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />

