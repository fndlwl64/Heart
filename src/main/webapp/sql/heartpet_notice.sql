create table heartpet_notice (
    notice_no number(5) primary key,
    notice_title varchar2(1000),
    notice_content varchar2(2000),
    notice_hit number(5),
	notice_img1 varchar2(1000),
	notice_img2 varchar2(1000)
);
insert into heartpet_notice values(1, 'notice1 제목1', 'notice1 내용1', 0, '이미지1', '이미지2');
insert into heartpet_notice values(2, 'notice1 제목2', 'notice1 내용2', 0, '이미지1', '이미지2');
commit;