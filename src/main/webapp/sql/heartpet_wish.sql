create table heartpet_wish (
    wish_no number(5) primary key,
    wish_petno number(5),
    wish_userno number(5)
);
insert into heartpet_wish values (1, 1, 1);
insert into heartpet_wish values (2, 1, 2);
insert into heartpet_wish values (3, 1, 3);
insert into heartpet_wish values (4, 2, 1);
insert into heartpet_wish values (5, 2, 2);
insert into heartpet_wish values (6, 3, 1);
insert into heartpet_wish values (7, 4, 3);