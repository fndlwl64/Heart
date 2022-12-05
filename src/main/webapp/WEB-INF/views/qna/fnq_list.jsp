<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/user_header.jsp" />
<link rel="stylesheet" href="/css/user_qna.css" />
<link rel="short icon" href="#" />

<%-- fnq list --%>
<div id="qna-contents" class="qna-contents">
    <div class="qna_section">
        <div class="row">
            <div class="col-3 space"></div>
            <div class="col-6 title">FAQ</div>
            <div class="col-3 space"></div>
        </div>
    </div>


    <%-- 아코디언 --%>
    <!-- FAQ -->
    <div class="accordion accordion-flush" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                    Q. 예약 후 방문할 수 있나요?
                </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 '방문예약' 서비스를 진행하고 있습니다.
                    연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                    Q. 예약 후 방문할 수 있나요?
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 '방문예약' 서비스를 진행하고 있습니다.
                    연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                    Q. 예약 후 방문할 수 있나요?
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 '방문예약' 서비스를 진행하고 있습니다.
                    연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                    Q. 예약 후 방문할 수 있나요?
                </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 '방문예약' 서비스를 진행하고 있습니다.
                    연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                    Q. 예약 후 방문할 수 있나요?
                </button>
            </h2>
            <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 '방문예약' 서비스를 진행하고 있습니다.
                    연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.
                </div>
            </div>
        </div>
    </div>
    <br>

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
                    <button type="submit" class="btn btn-dark align-middle d-inline"><i class="bi bi-search"></i> 검색</button>
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