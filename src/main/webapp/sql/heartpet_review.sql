create table heartpet_review (
     review_no number(5) primary key,
     review_id varchar2(100),
     review_animal_id number,
     review_animal_tag varchar2(20),
     review_hit number(5) default 0,
     review_title varchar2(1000),
     review_content varchar2(2000),
     review_regdate date,
     review_img1 varchar2(1000),
     review_img2 varchar2(1000),
     review_img3 varchar2(1000),
     review_video varchar2(1000)
);

select * from heartpet_review;

insert into heartpet_review values (1, 'user1', 1, 'dog', default, '입양후기 제목 1', '입양후기1내용입니다.', sysdate, '사진1', '사진2', '사진3', '동영상1');
insert into heartpet_review values (2, 'user1', 2, 'cat', default, '입양후기 제목 2', '입양후기2내용입니다.', sysdate, '사진1', '사진2', '사진3', '동영상2');
insert into heartpet_review values (3, 'user1', 3, 'dog', default, '입양후기 제목 3', '입양후기3내용입니다.', sysdate, '사진1', '사진2', '사진3', '동영상3');

commit;

drop table heartpet_review purge;