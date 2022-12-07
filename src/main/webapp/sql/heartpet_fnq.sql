create table heartpet_fnq (
    fnq_no number(5) primary key,
    fnq_question varchar2(1000),
    fnq_answer varchar2(2000)
);

insert into heartpet_fnq values(1, '질문1', '답변1');
insert into heartpet_fnq values(2, '질문2', '답변2');

commit;

drop table heartpet_fnq purge;