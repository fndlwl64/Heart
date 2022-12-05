
create table heartpet_cat (
    cat_no number(5) primary key,
    cat_name varchar2(30),
    cat_species varchar2(1000),
    cat_gender varchar2(1000),
    cat_neutered varchar2(1),
    cat_vaccination varchar2(1),
    cat_age number(5),
    cat_place varchar2(2000),
    cat_size varchar2(1000),
    cat_weight number(5),
    cat_caution varchar2(4000),
    cat_img1 varchar2(4000),
    cat_img2 varchar2(4000),
    cat_img3 varchar2(4000),
    cat_status varchar2(20)
);

insert into heartpet_cat values (1,'냥이1', '먼치킨', '암컷', 'Y', 'Y', 5, '서울시 중구 남대문로', '중형견', 5, '', '1.jpg', '2.jpg', '3.jpg','입양 대기');
insert into heartpet_cat values (2,'냥이2', '스코티시폴드', '수컷', 'Y', 'N', 4, '인천 연수구 능허대로', '소형견', 3, '', '1.jpg', '2.jpg', '3.jpg','입양 전');
insert into heartpet_cat values (3,'냥이3' ,'러시안블루', '수컷', 'Y', 'Y', 6, '서울시 용산구 원효로', '대형견', 10, '', '1.jpg', '2.jpg', '3.jpg','입양 완료');