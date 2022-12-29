<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${Cont }"/>

<jsp:include page="../../include/user_header.jsp" />
<%-- <link rel="stylesheet" href="${path}/resources/css/notice.css"> --%>
<link rel="stylesheet" href="${path}/resources/css/user_qna.css" />
<!-- <style>
	.table-light{
		vertical-align: middle;
	}
</style> -->

<%-- 문의글 상세 보기 --%>
<div id="qna-contents" class="qna-contents">
        <div class="border qna-content">
            <div class="content-header">
                <div><h3>${dto.getNotice_title()}</h3></div>
                <div class="header-info">
                    <ul>
                        <li class="d-inline"><img src="${path}/resources/image/user_img/0.png" alt="admin_image"></li>
                        <li class="d-inline">관리자</li>
                        <li class="d-block">${dto.getNotice_date().substring(0, 10) } 조회 ${dto.getNotice_hit()}</li>
                    </ul>
                </div>
                <hr>
            </div>
            <div class="content" data-bs-spy="scroll" data-bs-target="#content-scroll">
                <div id="content-scroll">
                    <div class="content-body">
						<div class="qna-text mb-3">
						    ${dto.getNotice_content()}
						</div>
                        <c:if test="${ !empty dto.getNotice_img1() }">
                            <div class="qna-image my-2 bg-body rounded">
                                 <p class="mt-2"><img src="resources/upload/${dto.getNotice_img1() }" class="rounded d-block" style="max-height: 400px;" alt="board_img" /></p>      
                            </div>
                        </c:if>  
                        <c:if test="${ !empty dto.getNotice_img2() }">
                            <div class="qna-image shadow-sm my-2 bg-body rounded">
                                 <p class="mt-2"><img src="resources/upload/${dto.getNotice_img2() }" class="rounded d-block" style="max-height: 400px;" alt="board_img" /></p>      
                            </div>
                        </c:if> 
                    </div>
                </div>
            </div>
            <div style="display: flex;">
					<button style="margin-top:3%; margin-bottom:3%; margin-left: auto;" type="button" id="btn_content" class="btn btn-dark btn_list" onclick="location.href='${path}/user_notice'"><i class="bi bi-card-list"></i> 목록</button>
			</div>
		</div>
</div>
<%-- <div class="container">

	<div class="sub-title"><h4>공지사항</h4></div>
    <table class="table noticeinfo mt-4">
        <tr>
            <th class="table-light col-1">제목</th>
            <td colspan="6" class="col-6">${dto.getNotice_title()}</td>
        </tr>
        <tr>
            <th class="table-light">작성자</th>
            <td class="user col-1">관리자</td>
            <th class="table-light col-1">조회수</th>
            <td class="col-1">${dto.getNotice_hit()}</td>
            <th class="table-light col-1">등록일시</th>
            <td colspan="2" class="col-2">${dto.getNotice_date().substring(0, 10) }</td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td colspan="6" class="col-6">
            	<div class="notice_content_mid"> 
					<c:if test="${!empty dto.getNotice_img1() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img1() }">
					</c:if>
					<c:if test="${!empty dto.getNotice_img2() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img2() }">
					</c:if>
				</div>
        		<c:if test="${!empty dto.notice_content }">
					<textarea class="sp_content3" cols="100" readonly>${dto.getNotice_content()}</textarea>
				</c:if>
				<script>
					$(document).ready(function() {
						$('.noticeinfo').on( 'keyup', 'textarea', function (e){
							$(this).css('height', 'auto' );
							$(this).height( this.scrollHeight );
						});
						$('.noticeinfo').find( 'textarea' ).keyup();
					});
				</script>
            </td>
        </tr>
    </table>
    <div style="display: flex;">
		<button style="margin-top:3%; margin-bottom:3%; margin-left: auto;" type="button" id="btn_content" class="btn btn-dark btn_list" onclick="location.href='${path}/user_notice'"><i class="bi bi-card-list"></i> 목록</button>
	</div>
</div> --%>


<%-- <div class="notice-board">
	<div align="center">
		<h2>공지사항</h2>
		<div class="notice_content" >
			
			<div>
				<div class="notice_title">
					<span class="sp_content1">${dto.getNotice_title()}</span>
					<span class="sp_content2"><small>게시일 : ${dto.getNotice_date().substring(0,10) }</small></span><br />
				</div>
				<hr width="95%">
				<div class="notice_content_mid"> 
					<c:if test="${!empty dto.getNotice_img1() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img1() }">
					</c:if>
					<c:if test="${!empty dto.getNotice_img2() }">
						<img class="notice_img" alt="" src="resources/upload/${dto.getNotice_img2() }">
					</c:if>
				</div>
				
				<c:if test="${!empty dto.notice_content }">
					<textarea class="sp_content3" cols="100" readonly>${dto.getNotice_content()}</textarea>
				</c:if>
				
				<script>
					$(document).ready(function() {
						$('.notice_content').on( 'keyup', 'textarea', function (e){
							$(this).css('height', 'auto' );
							$(this).height( this.scrollHeight );
						});
						$('.notice_content').find( 'textarea' ).keyup();
					});
				</script>

			</div>
		</div>
	</div>
	<div style="display: flex;">
		<button style="margin-top:3%; margin-bottom:3%; margin-left: 81%;" type="button" id="btn_content" class="btn btn-dark btn_list" onclick="location.href='${path}/user_notice'"><i class="bi bi-card-list"></i> 목록</button>
	</div>
	
</div> --%>
	
<jsp:include page="../../include/user_footer.jsp" />