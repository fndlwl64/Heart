create table heartpet_board (
    board_no number(5) primary key,
    board_parentNo number default 0,
    board_category varchar2(20) not null,
    board_id varchar2(1000),
    board_hit number(5) default 0,
    board_title varchar2(1000),
    board_content varchar2(2000),
    board_secret varchar2(2) default 'N',
    board_pwd varchar2(20),
    board_regdate date,
    board_update date,
    board_state varchar2(20) default 'abled',
    board_img1 varchar2(1000),
    board_img2 varchar2(1000)
);

insert into heartpet_board values(1, default, '입양', 'user', 0, '게시판 제목 1', '게시판 1내용입니다', 'N', '1234', sysdate, null, default, null, null);
insert into heartpet_board values(2, default, '입양', 'user1', 0, '게시판 제목 2', '게시판 2내용입니다', 'N', '1234', sysdate, null, default, null, null);
insert into heartpet_board values(3, default, '입양', 'user1', 0, '게시판 제목 3', '게시판 3내용입니다', 'N', '1234', sysdate, null, default, null, null);

commit;

drop table heartpet_board purge;


SELECT LEVEL, 
       board_no, 
       board_parentNo, 
       board_title as title,
       board_content,
       board_id,
       board_hit,
       board_secret,
       board_pwd, 
       board_regdate,
       board_update,
       board_state,
       board_img1,
       board_img2
       FROM heartpet_board
       START WITH board_parentNo = 0
       CONNECT BY PRIOR board_no = board_parentNo
       ORDER SIBLINGS BY board_no desc;
       