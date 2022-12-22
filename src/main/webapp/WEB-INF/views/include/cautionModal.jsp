<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 버튼 예시 -->
	<!-- <input type="submit" class="btn btn-primary " value="입양하기" data-bs-toggle="modal" data-bs-target="#cautionModal"
			onclick="return submitOption();"> -->
			
			
    <!-- Modal -->
	<div class="modal fade" id="cautionModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="cautionModalLabel">Caution</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 자바스크립트 예시 -->
	<!-- function submitOption() {
		if (!$('#user_grade').val()) {
			$('.modal-body').empty();
			$('.modal-body').append('로그인을 해주세요');
			return false;
		}
	} -->