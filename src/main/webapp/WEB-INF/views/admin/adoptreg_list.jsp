<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="../include/admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeartPet</title>
<link rel="stylesheet" href="${path }/resources/css/list_view.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

</head>
<c:set var="qList" value="${ qnaList }" />
<c:set var="total" value="${ total }" />
<c:set var="paging" value="${ paging }" />
<c:set var="field" value="${ field }" />
<c:set var="keyword" value="${ keyword }" />
<c:set var="list" value="${adoptRegList }"></c:set>
<c:set var="map" value="${animalMap }"></c:set><!-- 쿼리 조인을 피하기 위한 key, value를 통한 animal테이블 데이터 참조 -->
<body>
	<div class="container">

		<%-- <br>
		검색 폼
		<form class="search_form" method="post"
			action="${path }/admin_adoptreg_search">
			<div class="form_box row">
				<div class="col">
					<label> 입소등록일 : <input type="date" name="searchSdate"
						title="입양등록일"> <label> 입양등록일 : <input type="date"
							name="searchSdate" title="입양등록일">
					</label> <label> 입양예정일 : <input type="date" name="searchSdate"
							title="입양등록일">
					</label> <label> 입양완료일 : <input type="date" name="searchSdate"
							title="입양등록일">
					</label>
				</div>

				<div class="col form_box_div search">
					<input class="btn btn-secondary searchbtn" type="submit" value="검색">
				</div>

			</div>
		</form>

		<br>

		<button class="btn btn-success insertbtn"
			onclick="location.href='${path }/adoptreg_insert'">등록</button>

		<br> <br>
 --%>
		<%-- 검색 결과 테이블 --%>
		<div class="lists">
			<table class="table searched_list">
				<tr>
					<th class="table-secondary">회원 아이디</th>
					<th class="table-secondary">동물 이름</th>
					<th class="table-secondary">입소 신청일</th>
					<th class="table-secondary">입양 등록일</th>
					<th class="table-secondary">입양 예정일</th>
					<th class="table-secondary">입양 완료일</th>
					<th class="table-secondary">입양 상태</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.adopt_reg_userid }</td>
						<td>${map.get(dto.adopt_reg_animalno).get(0) }</td>
						<td>${dto.adopt_reg_appdate }</td>
						<td>${dto.adopt_reg_regdate }</td>
						<td>${dto.adopt_reg_duedate }</td>
						<td>${dto.adopt_reg_adoptdate }</td>
						<td><a href="<%=request.getContextPath() %>/adoptreg_update?adopt_reg_regno=${dto.getAdopt_reg_regno() }" onclick="return onclickOption(this);" class="status" data-value="${dto.adopt_reg_animalno }">${map.get(dto.adopt_reg_animalno).get(1) }</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>

		<br>
		<%-- 페이징처리 --%>
		
		<jsp:include page="../include/pagination.jsp" />

		<%-- 삭제 모달 --%>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div id="myInput" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">해당 데이터를 삭제하시겠습니까?</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger"
							onclick="location.href='${path}/admin_adoptreg_delete'">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	function onclickOption(th) {
		console.log($(th).text());
		if($(th).text() == '입양 가능' || $(th).text() == '입양 완료'){
			alert('관리할 사항이 없습니다.');
			return false;
		}
		if($(th).text() == '입소 신청' && window.confirm("입소 신청을 입양 상태로 바꾸시겠습니까?")){
			location.href = getContextPath()+'/adoptreg_admission?animal_no='+$(th).data('value');
			return false;
			
		}
	}
</script>
</html>