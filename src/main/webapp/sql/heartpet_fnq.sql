create table heartpet_fnq (
    fnq_no number(5) primary key,
    fnq_category varchar2(10),
    fnq_question varchar2(1000),
    fnq_answer varchar2(2000)
);

insert into heartpet_fnq values(1, '입양', '질문1', '답변1');
insert into heartpet_fnq values(2, '입소', '질문2', '답변2');
insert into heartpet_fnq values(3, '후원', 'Q. 예약 후 방문할 수 있나요?', 'A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 방문예약 서비스를 진행하고 있습니다.연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.');
insert into heartpet_fnq values(4, '기타', 'Q. 예약 후 방문할 수 있을까요??', 'A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 방문예약 서비스를 진행하고 있습니다.연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.');
insert into heartpet_fnq values(5, '입양', 'Q. 예약 후 방문할 수 있었나요??', 'A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 방문예약 서비스를 진행하고 있습니다.연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.');
insert into heartpet_fnq values(6, '입소', 'Q. 예약 후 방문할 수 있었다구요?', 'A. 하트펫에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해 방문예약 서비스를 진행하고 있습니다.연락 후 방문예약 가능하며 사전 방문예약자에 한하여 여러 해택을 제공해 드립니다.');
commit;

drop table heartpet_fnq purge;