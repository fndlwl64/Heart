<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

</main>
<!-- main end -->

    <%-- footer --%>
    <footer class="footer">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 footer-info">
                <h4>고객센터</h4>
                <p>운영시간: 10:00 ~ 18:00<small>(점심시간: 12:30 ~ 13:30)</small></p>
                <ul>
                    <li><a href="${path}/user_qna_list">1:1문의</a></li>
                    <li><a href="#">입점 문의</a></li>
                    <li><a href="#">제휴 문의</a></li>
                    <c:if test="${!empty session_admin_id }">
                    	<li><a href="${path}/user_list">관리자</a></li>
                    </c:if>
                </ul>
                <span>상호명 : (주)하트펫</span>
                <span><strong>KH Final 2조</strong></span>
                <span>서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</span>
                <span>TEL : 1670-0000</span>
                <span>EMAIL : help@heartpet.com</span><br />
                <span>사업자등록번호 : 000-00-12345</span>
                <span>통신판매업신고 : 제2022-서울중구-0000호</span>
                <span>동물판매등록번호 : 제0000000-022-2020-0022호</span>
                <div class="copyright">Copyright &copy; 2022 All rights reserved.<c:if test="${login_type == 'admin'}"> &nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/" target="_blank">관리자</a></c:if></div>
                <div class="col-3 header-space"></div>
            </div>
        </div>
    </footer>
</body>
