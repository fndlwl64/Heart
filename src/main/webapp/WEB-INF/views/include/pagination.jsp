<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">

            <!-- 처음으로 -->
            <c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
            <c:if test="${ paging.page gt 1 }"><li class="page-item"></c:if>
                <a class="page-link" href="${link_address}?page=1&field=${ field }&keyword=${ keyword }" aria-label="First">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <!-- 이전으로 -->
            <c:if test="${ paging.page eq 1 }"><li class="page-item disabled"></c:if>
            <c:if test="${ paging.page gt paging.block }"><li class="page-item"></c:if>
                <a class="page-link" href="${link_address}?page=${ paging.page - 1 }&field=${ field }&keyword=${ keyword }" aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                </a>
            </li>

            <!-- 페이지 중간 -->
            <c:forEach begin="${ paging.startBlock }" end="${ paging.endBlock }" var="i">
                <c:if test="${ i == paging.page }">
                    <li class="page-item active"><a class="page-link" href="${link_address}?page=${ i }&field=${ field }&keyword=${ keyword }">${ i }</a></li>
                </c:if>
                <c:if test="${ i != paging.page }">
                    <li class="page-item"><a class="page-link" href="${link_address}?page=${ i }&field=${ field }&keyword=${ keyword }">${ i }</a></li>
                </c:if>
            </c:forEach>

            <!-- 다음으로 -->
            <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
            <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
                <a class="page-link" href="${link_address}?page=${ paging.page + 1 }&field=${ field }&keyword=${ keyword }" aria-label="Next">
                    <span aria-hidden="true">&rsaquo;</span>
                </a>
            </li>

            <!-- 마지막으로 -->
            <c:if test="${ paging.endBlock lt paging.allPage }"><li class="page-item"></c:if>
            <c:if test="${ paging.endBlock eq paging.allPage }"><li class="page-item disabled"></c:if>
                <a class="page-link" href="${link_address}?page=${ paging.allPage }&field=${ field }&keyword=${ keyword }" aria-label="Last">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>