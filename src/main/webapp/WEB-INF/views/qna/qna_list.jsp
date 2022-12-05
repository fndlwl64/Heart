<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="qList" value="${ qnaList }" />
<jsp:include page="../include/user_header.jsp" />
<link rel="stylesheet" href="resources/css/user_qna.css" />
<link rel="short icon" href="#" />


<%-- qna list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna_section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">QnA</div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- 정렬 --%>
    <div class="qna_section">
        <div class="row">
            <div class="col-8 space"></div>
            <div class="col-1 qna_order d-flex">
                <select class="form-select form-select-sm w-75" name="qna_order" id="">
                    <option selected="selected" value="date_desc">최신순</option>
                    <option value="hit_desc">조회수순</option>
                    <option value="no_desc">번호순</option>
                </select>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- 아코디언 --%>
    <!-- 문의하기 -->

    <div class="qna-board">
        <table class="table table-bordered">
            <thead>
            <tr class="table-light">
                <th scope="col" class="col-1">No</th>
                <th scope="col" class="col-2">카테고리</th>
                <th scope="col" class="col-4">제목</th>
                <th scope="col" class="col-2">글쓴이</th>
                <th scope="col" class="col-2">작성시간</th>
                <th scope="col" class="col-1">Hit</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${ not empty qList }">
                <c:forEach var="list" items="${ qList }">
                <tr>
                    <td>${ list.board_no }</td>
                    <td>${ list.board_category }</td>
                    <td class="left-align"><a class="d-block qna-a-link" href="/user_qna_content">${ list.board_title }</a></td>
                    <td>${ list.board_id }</td>
                    <td>${ list.board_title }</td>
                    <td>${ list.board_hit }</td>
                </tr>
                </c:forEach>
            </c:if>
            <c:if test="${ empty qList }">
                <tr>
                    <td colspan="6">No data</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <div class="qna_section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title btn-insert">
                <button type="button" class="btn btn-primary" onclick="location.href='/user_qna_insert'">
                    <i class="bi bi-pencil"></i> 작성하기</button>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <%-- search --%>
    <div class="qna_section">
        <div class="row">
            <div class="col-4 space"></div>
            <div class="col-4 search">
                <form method="post" action="/search">
                    <input type="hidden" name="page" value="${ paging.page }" />
                    <select name="field" class="form-select d-inline align-middle w-25">
                        <option value="allSearch"<c:if test="${ field eq 'allSearch' }">selected="selected"</c:if>>전체</option>
                        <option value="adoption"<c:if test="${ field eq 'adoption' }">selected="selected"</c:if>>입양</option>
                        <option value="process"<c:if test="${ field eq 'process' }">selected="selected"</c:if>>절차</option>
                        <option value="support"<c:if test="${ field eq 'support' }">selected="selected"</c:if>>후원</option>
                    </select>
                    <input type="text" class="form-control d-inline align-middle w-50" name="keyword" value="${ keyword }" />
                    <button type="submit" class="btn btn-dark d-inline align-middle"><i class="bi bi-search"></i> 검색</button>
                </form>
            </div>
        </div>
    </div>

    <div class="space-add"></div>

    <!-- 페이징 처리 부분 -->
    <%-- 페이지 링크 처리 예정 --%>
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">

            <!-- 처음으로 -->
            <c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
            <c:if test="${ paging.page gt 1 }"><li class="page-item"></c:if>
                <a class="page-link" href="${ addr }?page=1${ faddr }${ field }${ kaddr }${ keyword }" aria-label="First">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <!-- 이전으로 -->
            <c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
            <c:if test="${ paging.page gt paging.block }"><li class="page-item"></c:if>
                <a class="page-link" href="${ addr }?page=${ paging.page - 1 }${ faddr }${ field }${ kaddr }${ keyword }" aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                </a>
            </li>

            <!-- 페이지 중간 -->
            <c:forEach begin="${ paging.startBlock }" end="${ paging.endBlock }" var="i">
                <c:if test="${ i == paging.page }">
                    <li class="page-item active"><a class="page-link" href="${ addr }?page=${ i }${ faddr }${ field }${ kaddr }${ keyword }">${ i }</a></li>
                </c:if>
                <c:if test="${ i != paging.page }">
                    <li class="page-item"><a class="page-link" href="${ addr }?page=${ i }${ faddr }${ field }${ kaddr }${ keyword }">${ i }</a></li>
                </c:if>
            </c:forEach>

            <!-- 다음으로 -->
            <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
            <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
                <a class="page-link" href="${ addr }?page=${ paging.page + 1 }${ faddr }${ field }${ kaddr }${ keyword }" aria-label="Next">
                    <span aria-hidden="true">&rsaquo;</span>
                </a>
            </li>

            <!-- 마지막으로 -->
            <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
            <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
                <a class="page-link" href="${ addr }?page=${ paging.allPage }${ faddr }${ field }${ kaddr }${ keyword }" aria-label="Last">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="space-add"></div>

</div>

<jsp:include page="../include/user_footer.jsp" />