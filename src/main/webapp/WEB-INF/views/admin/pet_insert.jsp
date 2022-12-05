<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<jsp:include page="../include/admin_header.jsp" />
<link rel="stylesheet" href="css/admin_include.css">
<script src="/js/admin.js"></script>
<body>
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">종류</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">성별</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">중성화여부</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">예방접종여부</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">나이</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">발견장소</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">크기</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">무게</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">유의사항</span></th>
				<td><textarea rows="2" cols="22"></textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양상태</span></th>
				<td><input class ="input1" type="text"></td>
			</tr>
		</table>
		<br>
		<div class="div2">
			<div>
				<input type="file" onchange="readURL1(this);">
				<input type="file" onchange="readURL2(this);">
				<input type="file" onchange="readURL3(this);">
			</div>
			<div>
				<img class="preview" id="preview1"/>
				<img class="preview" id="preview2"/>
				<img class="preview" id="preview3"/>
			</div>
		</div>
		<br><br>
		<input id="update_btn" type="submit" value="등록" align="center">
	</form>
</div>
</body>
</html>