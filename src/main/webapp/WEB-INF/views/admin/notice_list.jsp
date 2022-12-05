<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/admin_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeartPet</title>
    <link rel="stylesheet" href="css/list_view.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="/js/main.js"></script>
</head>
<body>
    <br>
    <div class="container">

        <%-- 검색 폼 --%>
        <form class="search_form" method="post" action="">
            <div class="form_box">
                <select name="field">
                    <option value="title">글제목</option>
                    <option value="cont">내용</option>
                </select>

                <input name="keyword">

                <input class="btn btn-secondary searchbtn" type="submit" value="검색">
            </div>
        </form>

        <br>

        <button class="btn btn-success insertbtn" onclick="location.href='/notice_insert'">등록</button>

        <br><br>

        <%-- 검색 결과 테이블 --%>
        <div class="lists">

            <table class="table searched_list">
                <tr>
                    <th class="table-secondary">글번호</th>
                    <th class="table-secondary">글제목</th>
                    <th class="table-secondary">조회수</th>
                    <th class="table-secondary">수정/삭제</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td><a href="/notice_view">공지1</a></td>
                    <td>1</td>
                    <td>
                        <button class="btn btn-primary" onclick="location.href='/notice_update'">수정</button>
                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
                    </td>
                </tr>
            </table>

        </div>

        <br>
        <%-- 페이징처리 --%>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>

        <%-- 삭제 모달 --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div id="myInput" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">데이터 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        해당 데이터를 삭제하시겠습니까?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" onclick="location.href=''">삭제</button>
                    </div>
                </div>
            </div>
        </div>

    </div>


</body>
</html>