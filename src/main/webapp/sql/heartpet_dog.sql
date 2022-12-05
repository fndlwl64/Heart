
create table heartpet_dog (
    dog_no number(5) primary key,
    dog_name varchar2(30),
    dog_species varchar2(1000),
    dog_gender varchar2(1000),
    dog_neutered varchar2(1),
    dog_vaccination varchar2(1),
    dog_age number(5),
    dog_place varchar2(2000),
    dog_size varchar2(1000),
    dog_weight number(5),
    dog_caution varchar2(4000),
    dog_img1 varchar2(4000),
    dog_img2 varchar2(4000),
    dog_img3 varchar2(4000),
    dog_status varchar2(20),
    dog_regdate
);


insert into heartpet_dog values (1, '제니', '믹스견', '암컷', 'Y', 'Y', 5, '서울시 중구 남대문로', '중형견', 5, '', '1.jpg', '2.jpg', '3.jpg','입양 대기');
insert into heartpet_dog values (2, '포터', '푸들', '수컷', 'Y', 'N', 4, '인천 연수구 능허대로', '소형견', 3, '', '1.jpg', '2.jpg', '3.jpg','상의 중');
insert into heartpet_dog values (3, '앨리스', '허스키', '수컷', 'Y', 'Y', 6, '서울시 용산구 원효로', '대형견', 10, '', '1.jpg', '2.jpg', '3.jpg','입양 완료');

drop table heartpet_dog purge;