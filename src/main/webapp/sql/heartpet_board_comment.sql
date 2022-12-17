create table heartpet_board_comment (
    board_comment_commentno number(5) primary key,
    board_comment_boardno number(5) not null,
    board_comment_id varchar2(1000),
    board_comment_content varchar2(2000) not null,
    board_comment_pwd varchar2(20),
    board_comment_regdate date default sysdate not null
);


insert into heartpet_board_comment values(1, 1, 'user', '게시판답글제목1', '1234', sysdate);
insert into heartpet_board_comment values(2, 2, 'user1', '게시판답글제목2', '1234', sysdate);

commit;

drop table heartpet_board_comment purge;