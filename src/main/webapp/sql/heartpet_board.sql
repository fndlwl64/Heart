create table heartpet_board (
    board_no number(5) primary key,
    board_category varchar2(20) not null,
    board_id varchar2(1000),
    board_hit number(5),
    board_title varchar2(1000),
    board_content varchar2(2000),
    board_secret varchar2(1),
    board_regdate date,
    board_update date,
    board_img1 varchar2(1000),
    board_img2 varchar2(1000)
);

insert into heartpet_board values(1, '입양', 'user', 0, '게시판 제목 1', '게시판 1내용입니다', 'N', sysdate, null, null, null);
insert into heartpet_board values(2, '입양', 'user1', 0, '게시판 제목 2', '게시판 2내용입니다', 'N', sysdate, null, null, null);
insert into heartpet_board values(3, '입양', 'user1', 0, '게시판 제목 3', '게시판 3내용입니다', 'N', sysdate, null, null, null);

commit;

drop table heartpet_board purge;