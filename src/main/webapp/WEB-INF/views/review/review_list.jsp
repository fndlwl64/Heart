<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/user_header.jsp" />
<link rel="stylesheet" href="resources/css/user_review.css" />
<link rel="short icon" href="#" />

<%-- 리뷰 --%>
<%-- review list --%>
<div id="review-contents" class="review-contents">
    <div class="review-section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">
                <h2>하트펫 family</h2>
                <h6>하트펫을 통해 반려동물을 만나 가족이 된 이야기를 들어보세요.</h6>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <div class="review_section">
        <div class="row">
            <div class="col-8 space"></div>
            <div class="col-1 review_order d-flex">
                <select class="form-select form-select-sm w-75" name="review_order" id="">
                    <option selected="selected" value="date_desc">최신순</option>
                    <option value="hit_desc">조회수순</option>
                    <option value="no_desc">번호순</option>
                </select>
            </div>
            <div class="col-3 space"></div>
        </div>
    </div>

    <div class="review-section">
       <div class="row">
           <div class="col-3 space"></div>
           <div class="col-6 review-card">
               <%-- 입양동물 --%>


               <div class="row row-cols-1 row-cols-md-3 g-4">
                   <div class="col">
                       <div class="card h-100">
                           <a href="/user_review_content">
                               <div class="card-image" style="background-image: url('/image/heartpet_logo.png');"></div>
                               <div class="card-body">
                                   <%-- title replace 예정 -> 서블릿에서... 아마도 --%>
                                   <div class="title-body">
                                       <h5 class="card-title">제니 입양후기</h5>
                                   </div>
                                   <h7>2022-12-02 조회 100</h7>
                               </div>
                           </a>
                       </div>
                   </div>
                   <div class="col">
                       <div class="card h-100">
                           <a href="/user_review_content">
                               <div class="card-image" style="background-image: url('/image/dog.png');"></div>
                               <div class="card-body">
                                   <div class="title-body">
                                       <h5 class="card-title">강아지 포터를 입양한 후기 길이 테스트용 만약 이것보다 길이가 더 길어지면 어떻게 될간아러나어라넝라</h5>
                                   </div>
                                   <h7>2022-12-02 조회 100</h7>
                               </div>
                           </a>
                       </div>
                   </div>
                   <div class="col">
                       <div class="card h-100">
                           <a href="/user_review_content">
                               <div class="card-image" style="background-image: url('/image/dog.png');"></div>
                               <div class="card-body">
                                   <div class="title-body">
                                       <h5 class="card-title">강아지 포터를 입양한 후기 길이 테스트용 만약 이것보다 길이가 더 길어지면 어떻게 될간아러나어라넝라</h5>
                                   </div>
                                   <h7>2022-12-02 조회 100</h7>
                               </div>
                           </a>
                       </div>
                   </div>
                   <div class="col">
                       <div class="card h-100">
                           <a href="/user_review_content">
                               <div class="card-image" style="background-image: url('/image/potter.jpg');"></div>
                               <div class="card-body">
                                   <div class="title-body">
                                       <h5 class="card-title">울애긔 포터</h5>
                                   </div>
                                   <h7>2022-12-02 조회 100</h7>
                               </div>
                           </a>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>

    <div class="space-add"></div>

    <%-- search --%>
    <div class="review-section">
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

</div>

<jsp:include page="../include/user_footer.jsp" />
