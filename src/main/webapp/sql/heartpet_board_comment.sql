create table heartpet_board_comment (
    comment_commentno number(5) primary key,
    comment_boardno number(5) not null,
    comment_id varchar2(1000),
    comment_content varchar2(2000) not null,
    comment_regdate date default sysdate
);


insert into heartpet_board_comment values(1, 1, 'user', '게시판답글제목1', sysdate);
insert into heartpet_board_comment values(2, 2, 'user1', '게시판답글제목2', sysdate);

commit;

drop table heartpet_board_comment purge;
