<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../include/user_header.jsp" />
<script src="resources/js/mypage.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${uList }"/>
<c:set var="total" value="${ total }"/>
<c:set var="paging" value="${ paging }"/>
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
	    <div id="my_cont2" class="mypage_cont">
	        <div>
	            <c:if test="${!empty aList }">
					<h3>입양대기목록</h3>
					<table class="wish_table">
						<tr>
						<c:forEach items="${aList }" var="dto">
						<c:set var="count" value="${count + 1 }"/>
							<td>
                                <div class="animal_detail"
                                <c:if test="${ fn:length(aList) == 1 }">style="max-width: 50%"</c:if>>
								    <div>
								        <a class="animal_cont" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><img class="my_cont_img"src="${path}${dto.getAnimal_img1()}"></a>
									</div>
									<div class="animal-detail-cont">
									    <a class="animal_cont2" href="${path }/user_animal_content?no=${dto.getAnimal_no()}">
										<label>이름</label><span> ${dto.getAnimal_name()}</span><br />
										<label>종</label><span> 
											<c:if test="${dto.getAnimal_species().length() > 5}">
												${dto.getAnimal_species().substring(0,4)} ..
											</c:if>										
											<c:if test="${dto.getAnimal_species().length() <= 5}">
												${dto.getAnimal_species()}
											</c:if></span><br />
					                	<label>성별</label><span> 
					                		<c:if test="${dto.getAnimal_gender() eq 'female'}">
												암컷 (♀)
											</c:if>											
											<c:if test="${dto.getAnimal_gender() eq 'male'}">
												수컷 (♂)
											</c:if></span><br />
					                	<label>나이</label><span> ${dto.getAnimal_age()}살</span><br />
					                	<label>입양예정일</label><span> 
					                		<c:if test="${empty dto.getAdopt_reg_duedate()}">
												미정
											</c:if>											
											<c:if test="${!empty dto.getAdopt_reg_duedate() }">
												${dto.getAdopt_reg_duedate().substring(0, 10)}
											</c:if></span><br />
											</a>
									</div>
								</div>
							</td>
							<c:if test="${count % 2 == 0 }">
								<tr>
								</tr>
							</c:if>
						</c:forEach>
						</tr>			
					</table>
					
					<%-- <div class="wrapper row">
						<c:forEach items="${aList }" var="dto">
						<c:set var="count" value="${count + 1 }"/>
						
						<div class="cont col">
							<div class="cont_1 col">
								<a class="animal_cont" href="${path }/user_animal_content?no=${dto.getAnimal_no()}"><img class="my_cont_img"src="${path}${dto.getAnimal_img1()}"></a>
							</div>
							<div class="cont_2 col">
								<div class="cont_detail">
									<label>이름</label>
									<span>${dto.getAnimal_name()}</span><br />
									
									<label>종</label>
									<span> 
										<c:if test="${dto.getAnimal_species().length() > 5}">
											${dto.getAnimal_species().substring(0,4)} ..
										</c:if>
										
										<c:if test="${dto.getAnimal_species().length() < 5}">
											${dto.getAnimal_species()}
										</c:if>
									</span><br />
									
									<label>성별</label>
									<span>
										<c:if test="${dto.getAnimal_gender() eq 'female'}">
											암컷 (♀)
										</c:if>
										
										<c:if test="${dto.getAnimal_gender() eq 'male'}">
											수컷 (♂)
										</c:if>
									</span><br />
									
									<label>나이</label>
									<span>${dto.getAnimal_age()}살</span><br />
									
									<label>입양예정일</label>
									<span>
										<c:if test="${empty dto.getAdopt_reg_duedate()}">
											미정
										</c:if>
										
										<c:if test="${!empty dto.getAdopt_reg_duedate() }">
											${dto.getAdopt_reg_duedate().substring(0, 10)}
										</c:if>
									</span><br />
									
								</div>
							</div>
						</div>
						
						</c:forEach>
						
						<c:if test="${count % 2 == 1 }">
							<div class="cont"></div>
						</c:if>
					</div> --%>
					
				</c:if>
	            <c:if test="${empty aList }">
	            	<div class="empty_list">
	            		<img class="null_image" src="resources/image/null.png" alt="에러 이미지" />
	            		<p>입양 신청한 동물이 없습니다.</p>
	            	</div>
	            </c:if>
	        </div>
	    <c:if test="${!empty aList }">
        <%@ include file="../../include/pagination_update.jsp" %>
        </c:if>
	    </div>
    </div>
    <!-- mypage-body end 부분  -->
    <div class="mypage_bottom">
    </div>
</div>

<jsp:include page="../../include/user_footer.jsp" />

