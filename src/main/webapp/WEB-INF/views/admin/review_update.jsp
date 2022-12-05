<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script src="resources/js/admin.js"></script>
<link rel="stylesheet" href="resources/css/admin_include.css">
<body>
<jsp:include page="../include/admin_header.jsp" />
<br><br>
<div class="div1" align="center">
	<form>
		<table class="table">
			<tr>
				<th class="table-secondary"><span class="sp2">아이디</span></th>
				<td><input class ="input1" type="text" value="user"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">글제목</span></th>
				<td><input class ="input1" type="text" value="0"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">글내용</span></th>
				<td><textarea rows="2" cols="22">어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고</textarea> </td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">조회수</span></th>
				<td><input class ="input1" type="text" value="0"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">비밀글여부</span></th>
				<td><input class ="input1" type="text" value="Y"></td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지1</span></th>
				<td>
					<div class="image-upload">
						<label for="file-input1">
							<img id="file_change1" class="logo" src="image/heartpet_logo.png"/>
						</label>
						<input class="file_input" id="file-input1" type="file"onchange="readURL4(this);"/>
					</div>
				</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지2</span></th>
				<td>
					<div class="image-upload">
						<label for="file-input2">
							<img id="file_change2" class="logo" src="image/heartpet_logo.png"/>
						</label>
						<input class="file_input" id="file-input2" type="file"onchange="readURL5(this);"/>
					</div>
				</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">이미지3</span></th>
				<td>
					<div class="image-upload">
						<label for="file-input3">
							<img id="file_change3" class="logo" src="image/heartpet_logo.png"/>
						</label>
						<input class="file_input" id="file-input3" type="file" onchange="readURL6(this);"/>
					</div>
				</td>
			</tr>
			<tr>
				<th class="table-secondary"><span class="sp2">동영상1</span></th>
				<td>
					<div class="image-upload">
						<label for="file-input4">
							<video id="file_change4" src="video/test.mp4" class="logo" controls autoplay />
						</label>
						<input id="file-input4" type="file" onchange="readURL7(this);"/>
					</div>
				</td>
			</tr>
		</table>
		<br>
		<input id="update_btn" type="submit" value="변경" align="center">
	</form>
</div>
</body>
</html>