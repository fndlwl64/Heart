
create table heartpet_animal (
                              animal_no number(5) primary key,
                              animal_name varchar2(30),
                              animal_species varchar2(1000),
                              animal_gender varchar2(1000),
                              animal_neutered varchar2(1),
                              animal_vaccination varchar2(1),
                              animal_age number(5),
                              animal_place varchar2(2000),
                              animal_size varchar2(1000),
                              animal_weight number(5),
                              animal_caution varchar2(4000),
                              animal_img1 varchar2(4000),
                              animal_img2 varchar2(4000),
                              animal_img3 varchar2(4000),
                              animal_status varchar2(20),
		     animal_tag varchar(20),
                              animal_regdate date,
		     animal_update date
);


insert into heartpet_animal values (1, '제니', '믹스견', '암컷', 'Y', 'Y', 5, '서울시 중구 남대문로', '중형견', 5, '', '1.jpg', '2.jpg', '3.jpg','입양 대기','dog',sysdate,'');
insert into heartpet_animal values (2, '포터', '푸들', '수컷', 'Y', 'N', 4, '인천 연수구 능허대로', '소형견', 3, '', '1.jpg', '2.jpg', '3.jpg','상의 중','dog',sysdate,'');
insert into heartpet_animal values (3, '앨리스', '허스키', '수컷', 'Y', 'Y', 6, '서울시 용산구 원효로', '대형견', 10, '', '1.jpg', '2.jpg', '3.jpg','입양 완료','dog',sysdate,'');

insert into heartpet_animal values (4,'냥이1', '먼치킨', '암컷', 'Y', 'Y', 5, '서울시 중구 남대문로', '중형견', 5, '', '1.jpg', '2.jpg', '3.jpg','입양 대기','cat',sysdate,'');
insert into heartpet_animal values (5,'냥이2', '스코티시폴드', '수컷', 'Y', 'N', 4, '인천 연수구 능허대로', '소형견', 3, '', '1.jpg', '2.jpg', '3.jpg','입양 전','cat',sysdate,'');
insert into heartpet_animal values (6,'냥이3' ,'러시안블루', '수컷', 'Y', 'Y', 6, '서울시 용산구 원효로', '대형견', 10, '', '1.jpg', '2.jpg', '3.jpg','입양 완료','cat',sysdate,'');

drop table heartpet_animal purge;