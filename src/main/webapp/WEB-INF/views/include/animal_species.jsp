 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
       <c:if test="${(animalDTO.animal_tag eq 'dog') or (tag eq 'dog')}">

                <option value=""></option>
                <option value="말티즈" <c:if test="${animalDTO.animal_species eq '말티즈'}">selected</c:if>>말티즈</option>
                <option value="푸들" <c:if test="${animalDTO.animal_species eq '푸들'}">selected</c:if>>푸들</option>
                <option value="포메라니안" <c:if test="${animalDTO.animal_species eq '포메라니안'}">selected</c:if>>포메라니안</option>
                <option value="시바견" <c:if test="${animalDTO.animal_species eq '시바견'}">selected</c:if>>시바견</option>
                <option value="믹스견" <c:if test="${animalDTO.animal_species eq '믹스견'}">selected</c:if>>믹스견</option>
                <option value="치와와" <c:if test="${animalDTO.animal_species eq '치와와'}">selected</c:if>>치와와</option>
                <option value="닥스훈트" <c:if test="${animalDTO.animal_species eq '닥스훈트'}">selected</c:if>>닥스훈트</option>
                <option value="카이 켄" <c:if test="${animalDTO.animal_species eq '카이 켄'}">selected</c:if>>카이 켄</option>
                <option value="시츄" <c:if test="${animalDTO.animal_species eq '시츄'}">selected</c:if>>시츄</option>
                <option value="비숑 프리제" <c:if test="${animalDTO.animal_species eq '비숑 프리제'}">selected</c:if>>비숑 프리제</option>
                <option value="아메리칸 에스키모 도그" <c:if test="${animalDTO.animal_species eq '아메리칸 에스키모 도그'}">selected</c:if>>아메리칸 에스키모 도그</option>
                <option value="볼롱카" <c:if test="${animalDTO.animal_species eq '볼롱카'}">selected</c:if>>볼롱카</option>
                <option value="골든리트리버" <c:if test="${animalDTO.animal_species eq '골든리트리버'}">selected</c:if>>골든리트리버</option>
                <option value="진돗개" <c:if test="${animalDTO.animal_species eq '진돗개'}">selected</c:if>>진돗개</option>
                <option value="프렌치 불도그" <c:if test="${animalDTO.animal_species eq '프렌치 불도그'}">selected</c:if>>프렌치 불도그</option>
                <option value="보스턴 테리어" <c:if test="${animalDTO.animal_species eq '보스턴 테리어'}">selected</c:if>>보스턴 테리어</option>
                <option value="웰시 코기" <c:if test="${animalDTO.animal_species eq '웰시 코기'}">selected</c:if>>웰시 코기</option>
                <option value="기타" <c:if test="${animalDTO.animal_species eq '기타'}">selected</c:if>>기타</option>

        </c:if>
        <c:if test="${(animalDTO.animal_tag eq 'cat') or (tag eq 'cat')}">

                <option value=""></option>
                <option value="얼룩 고양이" <c:if test="${animalDTO.animal_species eq '얼룩 고양이'}">selected</c:if>>얼룩 고양이</option>
                <option value="다지증 고양이" <c:if test="${animalDTO.animal_species eq '다지증 고양이'}">selected</c:if>>다지증 고양이</option>
                <option value="삼색털 고양이" <c:if test="${animalDTO.animal_species eq '삼색털 고양이'}">selected</c:if>>삼색털 고양이</option>
                <option value="카오스 고양이" <c:if test="${animalDTO.animal_species eq '카오스 고양이'}">selected</c:if>>카오스 고양이</option>
                <option value="스코티시" <c:if test="${animalDTO.animal_species eq '스코티시'}">selected</c:if>>스코티시</option>
                <option value="폴드" <c:if test="${animalDTO.animal_species eq '폴드'}">selected</c:if>>폴드</option>
                <option value="시베리안 고양이" <c:if test="${animalDTO.animal_species eq '시베리안 고양이'}">selected</c:if>>시베리안 고양이</option>
                <option value="샴" <c:if test="${animalDTO.animal_species eq '샴'}">selected</c:if>>샴</option>
                <option value="페르시안" <c:if test="${animalDTO.animal_species eq '페르시안'}">selected</c:if>>페르시안</option>
                <option value="터키시" <c:if test="${animalDTO.animal_species eq '터키시'}">selected</c:if>>터키시</option>
                <option value="브리티시 쇼트헤어" <c:if test="${animalDTO.animal_species eq '브리티시 쇼트헤어'}">selected</c:if>>브리티시 쇼트헤어</option>
                <option value="앙고라" <c:if test="${animalDTO.animal_species eq '앙고라'}">selected</c:if>>앙고라</option>
                <option value="러시안 블루" <c:if test="${animalDTO.animal_species eq '러시안 블루'}">selected</c:if>>러시안 블루</option>
                <option value="벵갈" <c:if test="${animalDTO.animal_species eq '벵갈'}">selected</c:if>>벵갈</option>
                <option value="먼치킨" <c:if test="${animalDTO.animal_species eq '먼치킨'}">selected</c:if>>먼치킨</option>
                <option value="아비시니안" <c:if test="${animalDTO.animal_species eq '아비시니안'}">selected</c:if>>아비시니안</option>
                <option value="셀커크 렉스" <c:if test="${animalDTO.animal_species eq '셀커크 렉스'}">selected</c:if>>셀커크 렉스</option>
                <option value="아메리칸 컬" <c:if test="${animalDTO.animal_species eq '아메리칸 컬'}">selected</c:if>>아메리칸 컬</option>
                <option value="이집션 마우" <c:if test="${animalDTO.animal_species eq '이집션 마우'}">selected</c:if>>이집션 마우</option>
                <option value="아메리칸 쇼트헤어" <c:if test="${animalDTO.animal_species eq '아메리칸 쇼트헤어'}">selected</c:if>>아메리칸 쇼트헤어</option>
                <option value="스핑크스" <c:if test="${animalDTO.animal_species eq '스핑크스'}">selected</c:if>>스핑크스</option>
                <option value="도메스틱 쇼트헤어" <c:if test="${animalDTO.animal_species eq '도메스틱 쇼트헤어'}">selected</c:if>>도메스틱 쇼트헤어</option>
                <option value="이그저틱 숏헤어" <c:if test="${animalDTO.animal_species eq '이그저틱 숏헤어'}">selected</c:if>>이그저틱 숏헤어</option>
                <option value="랙돌" <c:if test="${animalDTO.animal_species eq '랙돌'}">selected</c:if>>랙돌</option>
                <option value="카오 마니" <c:if test="${animalDTO.animal_species eq '카오 마니'}">selected</c:if>>카오 마니</option>
                <option value="기타" <c:if test="${animalDTO.animal_species eq '기타'}">selected</c:if>>기타</option>

        </c:if>
        
        
        