<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../include/user_header.jsp"/>
<head>
</head>
<%--검색--%>
<div class="d-flex justify-content-center" style="font-size: 14px">
    <form action="content" class="validation-form" method="post">
        <div class="row row-cols-auto form-select-sm">
            <div class="col">
                <div class="input-group">
                    <select name="dog_place" class="form-select">
                        <option value="all"></option>
                        <option value="서울">서울특별시</option>
                        <option value="울산">울산광역시</option>
                        <option value="인천">인천광역시</option>
                        <option value="부산">부산광역시</option>
                        <option value="대전">대전광역시</option>
                        <option value="광주">광주광역시</option>
                        <option value="대구">대구광역시</option>
                        <option value="세종">세종특별자치시</option>
                        <option value="제주">제주도</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">장소</span>
                </div>
            </div>

            <div class="col-sm">
                <div class="input-group">
                    <input type="text" name="dog_place_detail" placeholder="상세주소 입력" class="form-control">
                </div>
            </div>
            <div class="col">
                <div class="input-group">
                    <select name="dog_status" class="form-select">
                        <option value="all"></option>
                        <option value="입양 대기">입양 대기</option>
                        <option value="상의 중">상의 중</option>
                        <option value="입양 완료">입양 완료</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">입양</span>
                </div>
            </div>

        </div>
        <div class="row row-cols-auto form-select-sm">

            <div class="col">
                <div class="input-group">
                    <select name="dog_gender" class="form-select">
                        <option value="all"></option>
                        <option value="수컷">수컷</option>
                        <option value="암컷">암컷</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">성별</span>
                </div>
            </div>
            <div class="col">
                <div class="input-group">
                    <select name="dog_age" class="form-select">
                        <option value="all"></option>
                        <option value="zero">0~1</option>
                        <option value="one">1~2</option>
                        <option value="two">2~3</option>
                        <option value="three">3~4</option>
                        <option value="five">4~5</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">나이</span>
                </div>
            </div>

            <div class="col">
                <div class="input-group">
                    <select name="dog_species" class="form-select">
                        <option value="all"></option>
                        <option value="말티즈">말티즈</option>
                        <option value="푸들">푸들</option>
                        <option value="포메라니안">포메라니안</option>
                        <option value="믹스견">믹스견</option>
                        <option value="치와와">치와와</option>
                        <option value="시츄">시츄</option>
                        <option value="골든리트리버">시츄</option>
                        <option value="진돗개">진돗개</option>
                        <option value="기타">기타</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">품종</span>
                </div>
            </div>

            <div class="col">
                <div class="input-group">
                    <select name="dog_size" class="form-select">
                        <option value="all"></option>
                        <option value="소형견">소형견</option>
                        <option value="중형견">중형견</option>
                        <option value="대형견">대형견</option>
                    </select>
                    <span class="btn btn-sm btn-secondary position-relative">크기</span>
                </div>
            </div>
            <div class="col">
                <div class="input-group">
                    <input type="number" value="0" min="0" name="dog_weight" class="form-control"
                           style="width: 70px">
                    <span class="btn btn-sm btn-secondary position-relative">무게</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6"></div>
            <div class="col-4"></div>
            <div class="col-1">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </div>
    </form>
</div>

<%--정렬--%>
<div class="d-flex justify-content-end my-2">
    <form class="validation-form mx-2" action="" method="post">
        <select class="form-select form-select-sm" name="sort">
            <option>정렬</option>
            <option value="size">사이즈</option>
            <option value="weight">무게</option>
            <option value="age">나이</option>
        </select>
    </form>
    <form class="validation-form mx-2" action="" method="post">
        <select class="form-select form-select-sm " name="sort">
            <option value="des">내림차순</option>
            <option value="asc">오름차순</option>
        </select>
    </form>
</div>

<%--메인 페이지--%>
<div class="d-flex justify-content-center">
    <%--강아지 정보 폼--%>
    <form action="/user_dog_content" method="post">
        <div class="row row-cols-4">
            <div class="col">
                <div class="d-inline-block text-center">
                    <input class="img-fluid" type="image" src="/upload/Copied.jpg">
                    <div>정보</div>
                </div>
            </div>
            <div class="col">
                <div class="d-inline-block">
                    <input class="img-fluid" type="image" src="https://cdn.pixabay.com/photo/2018/05/13/16/57/dog-3397110_960_720.jpg">
                    <div style="text-align: center">정보</div>
                </div>
            </div>
            <div class="col">
                <div class="d-inline-block">
                    <input class="img-fluid" type="image" src="https://cdn.pixabay.com/photo/2018/05/13/16/57/dog-3397110_960_720.jpg">
                    <div style="text-align: center">정보</div>
                </div>
            </div>
            <div class="col">
                <div class="d-inline-block">
                    <input class="img-fluid" type="image" src="https://cdn.pixabay.com/photo/2018/05/13/16/57/dog-3397110_960_720.jpg">
                    <div style="text-align: center">정보</div>
                </div>
            </div>
            <div class="col">
                <div class="d-inline-block">
                    <input class="img-fluid" type="image" src="https://cdn.pixabay.com/photo/2018/05/13/16/57/dog-3397110_960_720.jpg">
                    <div style="text-align: center">정보</div>
                </div>
            </div>

        </div>
    </form>
</div>
<%--페이징--%>
<form class="validation-form my-2" action="" method="post">
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
</form>


<jsp:include page="../../include/user_footer.jsp"/>