<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<jsp:include page="../include/admin_header.jsp" />
<script src="/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<body>
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">종류</span></th>
				<td><input class ="input1" type="text" value="푸들"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">성별</span></th>
				<td><input class ="input1" type="text" value="암컷"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">중성화여부</span></th>
				<td><input class ="input1" type="text" value="Y"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">예방접종여부</span></th>
				<td><input class ="input1" type="text" value="N"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">나이</span></th>
				<td><input class ="input1" type="text" value="4"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">발견장소</span></th>
				<td><input class ="input1" type="text" value="인천 연수구 능허대로"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">크기</span></th>
				<td><input class ="input1" type="text" value="소형견"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">무게</span></th>
				<td><input class ="input1" type="text" value="3"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">유의사항</span></th>
				<td><textarea rows="2" cols="22">어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 </textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">입양상태</span></th>
				<td><input class ="input1" type="text" value="Y"></td>
			</tr>
		</table>
		<br>
		<div class="div2">
			<div class="image-upload">
				<label for="file-input1">
					<img id="file_change1" class="logo" src="image/heartpet_logo.png"/>
				</label>
				<input class="file_input" id="file-input1" type="file" onchange="readURL4(this);"/>
			</div>
			<div class="image-upload">
				<label for="file-input2">
					<img id="file_change2" class="logo" src="image/heartpet_logo.png"/>
				</label>
				<input class="file_input" id="file-input2" type="file" onchange="readURL5(this);"/>
			</div>
			<div class="image-upload">
				<label for="file-input3">
					<img id="file_change3" class="logo" src="image/heartpet_logo.png"/>
				</label>
				<input class="file_input" id="file-input3" type="file" onchange="readURL6(this);"/>
			</div>
		</div>
		<input id="update_btn" type="submit" value="변경" align="center">
	</form>
</div>
</body>
</html>